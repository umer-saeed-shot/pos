<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Sale;
use App\Returns;
use App\ReturnPurchase;
use App\Purchase;
use App\Expense;
use App\Payroll;
use App\Quotation;
use App\Payment;
use App\Account;
use App\Category;
use App\Product_Sale;
use App\Customer;
use App\Type;
use DB;
use Auth;

class HomeController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function dashboard()
    {
        return view('home');
    }

    public function index()
    {
        if(Auth::user()->role_id == 5) {
            $customer = Customer::select('id')->where('user_id', Auth::id())->first();
            $lims_sale_data = Sale::with('warehouse')->where('customer_id', $customer->id)->orderBy('created_at', 'desc')->get();
            return view('customer_index', compact('lims_sale_data'));
        }

        $start_date = date("Y").'-'.date("m").'-'.'01';
        $end_date = date("Y").'-'.date("m").'-'.date('t', mktime(0, 0, 0, date("m"), 1, date("Y")));
        $yearly_sale_amount = [];
        $categories= Category::where('is_active',true)->get();
        $types= Type::where('is_active',true)->get();

        $general_setting = DB::table('general_settings')->latest()->first();
        if(Auth::user()->role_id > 2 && $general_setting->staff_access == 'own') {
            $revenue = Sale::whereDate('created_at', '>=' , $start_date)->where('user_id', Auth::id())->where('sale_status',1)->whereDate('created_at', '<=' , $end_date)->sum('grand_total');
            $return = Returns::whereDate('created_at', '>=' , $start_date)->where('user_id', Auth::id())->whereDate('created_at', '<=' , $end_date)->sum('grand_total');
            $purchase_return = ReturnPurchase::whereDate('created_at', '>=' , $start_date)->where('user_id', Auth::id())->whereDate('created_at', '<=' , $end_date)->sum('grand_total');
            $revenue = $revenue - $return;
            $purchase = Purchase::whereDate('created_at', '>=' , $start_date)->where('user_id', Auth::id())->whereDate('created_at', '<=' , $end_date)->sum('grand_total');
            $profit = $revenue + $purchase_return - $purchase;
            $expense = Expense::whereDate('created_at', '>=' , $start_date)->where('user_id', Auth::id())->whereDate('created_at', '<=' , $end_date)->sum('amount');
            $recent_sale = Sale::orderBy('id', 'desc')->where('sale_status',1)->where('user_id', Auth::id())->take(5)->get();
            $recent_purchase = Purchase::orderBy('id', 'desc')->where('user_id', Auth::id())->take(5)->get();
            $recent_quotation = Quotation::orderBy('id', 'desc')->where('user_id', Auth::id())->take(5)->get();
            $recent_payment = Payment::orderBy('id', 'desc')->where('user_id', Auth::id())->take(5)->get();
        }
        else {
            $revenue = Sale::whereDate('created_at', '>=' , $start_date)->where('sale_status',1)->whereDate('created_at', '<=' , $end_date)->sum('grand_total');
            $return = Returns::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->sum('grand_total');
            $purchase_return = ReturnPurchase::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->sum('grand_total');
            $revenue = $revenue - $return;
            $purchase = Purchase::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->sum('grand_total');
            $profit = $revenue + $purchase_return - $purchase;
            $expense = Expense::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->sum('amount');
            $recent_sale = Sale::orderBy('id', 'desc')->where('sale_status',1)->take(5)->get();
            $recent_purchase = Purchase::orderBy('id', 'desc')->take(5)->get();
            $recent_quotation = Quotation::orderBy('id', 'desc')->take(5)->get();
            $recent_payment = Payment::orderBy('id', 'desc')->take(5)->get();
        }

        $best_selling_qty = Product_Sale::select(DB::raw('product_id, sum(qty) as sold_qty'))->join('sales','product_sales.sale_id','sales.id')->where('sales.sale_status',1)->whereDate('product_sales.created_at', '>=' , $start_date)->whereDate('product_sales.created_at', '<=' , $end_date)->groupBy('product_sales.product_id')->orderBy('sold_qty', 'desc')->take(5)->get();

        $yearly_best_selling_qty = Product_Sale::select(DB::raw('product_id, sum(qty) as sold_qty'))->join('sales','product_sales.sale_id','sales.id')->where('sales.sale_status',1)->whereDate('product_sales.created_at', '>=' , date("Y").'-01-01')->whereDate('product_sales.created_at', '<=' , date("Y").'-12-31')->groupBy('product_sales.product_id')->orderBy('sold_qty', 'desc')->take(5)->get();

        $yearly_best_selling_price = Product_Sale::select(DB::raw('product_id, sum(total) as total_price'))->join('sales','product_sales.sale_id','sales.id')->where('sales.sale_status',1)->whereDate('product_sales.created_at', '>=' , date("Y").'-01-01')->whereDate('product_sales.created_at', '<=' , date("Y").'-12-31')->groupBy('product_sales.product_id')->orderBy('total_price', 'desc')->take(5)->get();

        //cash flow of last 6 months
        $start = strtotime(date('Y-m-01', strtotime('-6 month', strtotime(date('Y-m-d') ))));
        $end = strtotime(date('Y-m-'.date('t', mktime(0, 0, 0, date("m"), 1, date("Y")))));

        while($start < $end)
        {
            $start_date = date("Y-m", $start).'-'.'01';
            $end_date = date("Y-m", $start).'-'.'31';

            if(Auth::user()->role_id > 2 && $general_setting->staff_access == 'own') {
                $recieved_amount = DB::table('payments')->whereNotNull('sale_id')->whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->where('user_id', Auth::id())->sum('amount');
                $sent_amount = DB::table('payments')->whereNotNull('purchase_id')->whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->where('user_id', Auth::id())->sum('amount');
                $return_amount = Returns::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->where('user_id', Auth::id())->sum('grand_total');
                $purchase_return_amount = ReturnPurchase::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->where('user_id', Auth::id())->sum('grand_total');
                $expense_amount = Expense::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->where('user_id', Auth::id())->sum('amount');
                $payroll_amount = Payroll::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->where('user_id', Auth::id())->sum('amount');
            }
            else {
                $recieved_amount = DB::table('payments')->whereNotNull('sale_id')->whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->sum('amount');
                $sent_amount = DB::table('payments')->whereNotNull('purchase_id')->whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->sum('amount');
                $return_amount = Returns::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->sum('grand_total');
                $purchase_return_amount = ReturnPurchase::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->sum('grand_total');
                $expense_amount = Expense::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->sum('amount');
                $payroll_amount = Payroll::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->sum('amount');
            }
            $sent_amount = $sent_amount + $return_amount + $expense_amount + $payroll_amount;

            $payment_recieved[] = number_format((float)($recieved_amount + $purchase_return_amount), 2, '.', '');
            $payment_sent[] = number_format((float)$sent_amount, 2, '.', '');
            $month[] = date("F", strtotime($start_date));
            $start = strtotime("+1 month", $start);
        }
        // yearly report
        $start = strtotime(date("Y") .'-01-01');
        $end = strtotime(date("Y") .'-12-31');
        while($start < $end)
        {
            $start_date = date("Y").'-'.date('m', $start).'-'.'01';
            $end_date = date("Y").'-'.date('m', $start).'-'.'31';
            if(Auth::user()->role_id > 2 && $general_setting->staff_access == 'own') {
                $sale_amount = Sale::whereDate('created_at', '>=' , $start_date)->where('sale_status',1)->whereDate('created_at', '<=' , $end_date)->where('user_id', Auth::id())->sum('grand_total');
                $purchase_amount = Purchase::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->where('user_id', Auth::id())->sum('grand_total');
            }
            else{
                $sale_amount = Sale::whereDate('created_at', '>=' , $start_date)->where('sale_status',1)->whereDate('created_at', '<=' , $end_date)->sum('grand_total');
                $purchase_amount = Purchase::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->sum('grand_total');
            }
            $yearly_sale_amount[] = number_format((float)$sale_amount, 2, '.', '');
            $yearly_purchase_amount[] = number_format((float)$purchase_amount, 2, '.', '');
            $start = strtotime("+1 month", $start);
        }
        //return $month;
        return view('index', compact('revenue', 'purchase','types','categories', 'expense', 'return', 'purchase_return', 'profit', 'payment_recieved', 'payment_sent', 'month', 'yearly_sale_amount', 'yearly_purchase_amount', 'recent_sale', 'recent_purchase', 'recent_quotation', 'recent_payment', 'best_selling_qty', 'yearly_best_selling_qty', 'yearly_best_selling_price'));
    }

    public function cashFlowFilter($cat_id,$type)
    {
        //cash flow of last 6 months
        $start = strtotime(date('Y-m-01', strtotime('-6 month', strtotime(date('Y-m-d') ))));
        $end = strtotime(date('Y-m-'.date('t', mktime(0, 0, 0, date("m"), 1, date("Y")))));

        while($start < $end)
        {
            $start_date = date("Y-m", $start).'-'.'01';
            $end_date = date("Y-m", $start).'-'.'31';

            if(Auth::user()->role_id > 2 && $general_setting->staff_access == 'own') {

                if ($cat_id !== 0 && $type == 0) {
                    $recieved_amount = Payment::whereNotNull('payments.sale_id')->join('sales', 'sales.id', 'payments.sale_id')->join('product_sales', 'product_sales.sale_id', 'sales.id')->join('products', 'products.id', 'product_sales.product_id')->where('sales.sale_status',1)->where('products.category_id', $cat_id)->whereDate('payments.created_at', '>=', $start_date)->whereDate('payments.created_at', '<=', $end_date)->where('payments.user_id', Auth::id())->sum('payments.amount');
                    $sent_amount = Payment::whereNotNull('payments.purchase_id')->join('purchases', 'purchases.id', 'payments.purchase_id')->join('product_purchases', 'product_purchases.purchase_id', 'purchases.id')->join('products', 'products.id', 'product_purchases.product_id')->where('products.category_id', $cat_id)->whereDate('payments.created_at', '>=', $start_date)->whereDate('payments.created_at', '<=', $end_date)->where('payments.user_id', Auth::id())->sum('payments.amount');
                    $return_amount = Returns::join('product_returns', 'returns.id', 'product_returns.return_id')->join('products', 'product_returns.product_id', 'products.id')->where('products.category_id', $cat_id)->whereDate('returns.created_at', '>=', $start_date)->whereDate('returns.created_at', '<=', $end_date)->where('returns.user_id', Auth::id())->sum('returns.grand_total');
                    $purchase_return_amount = ReturnPurchase::join('purchase_product_return', 'return_purchases.id', 'purchase_product_return.return_id')->join('products', 'purchase_product_return.product_id', 'products.id')->where('products.category_id', $cat_id)->whereDate('return_purchases.created_at', '>=', $start_date)->whereDate('return_purchases.created_at', '<=', $end_date)->where('return_purchases.user_id', Auth::id())->sum('return_purchases.grand_total');
                    $expense_amount = Expense::whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->where('user_id', Auth::id())->sum('amount');
                    $payroll_amount = Payroll::whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->where('user_id', Auth::id())->sum('amount');
                }elseif ($cat_id == 0 && $type !== 0) {
                    $recieved_amount = Payment::whereNotNull('payments.sale_id')->join('sales', 'sales.id', 'payments.sale_id')->join('product_sales', 'product_sales.sale_id', 'sales.id')->join('products', 'products.id', 'product_sales.product_id')->where('sales.sale_status',1)->where('products.type', $type)->whereDate('payments.created_at', '>=', $start_date)->whereDate('payments.created_at', '<=', $end_date)->where('payments.user_id', Auth::id())->sum('payments.amount');
                    $sent_amount = Payment::whereNotNull('payments.purchase_id')->join('purchases', 'purchases.id', 'payments.purchase_id')->join('product_purchases', 'product_purchases.purchase_id', 'purchases.id')->join('products', 'products.id', 'product_purchases.product_id')->where('products.type', $type)->whereDate('payments.created_at', '>=', $start_date)->whereDate('payments.created_at', '<=', $end_date)->where('payments.user_id', Auth::id())->sum('payments.amount');
                    $return_amount = Returns::join('product_returns', 'returns.id', 'product_returns.return_id')->join('products', 'product_returns.product_id', 'products.id')->where('products.type', $type)->whereDate('returns.created_at', '>=', $start_date)->whereDate('returns.created_at', '<=', $end_date)->where('returns.user_id', Auth::id())->sum('returns.grand_total');
                    $purchase_return_amount = ReturnPurchase::join('purchase_product_return', 'return_purchases.id', 'purchase_product_return.return_id')->join('products', 'purchase_product_return.product_id', 'products.id')->where('products.category_id', $cat_id)->whereDate('return_purchases.created_at', '>=', $start_date)->whereDate('return_purchases.created_at', '<=', $end_date)->where('return_purchases.user_id', Auth::id())->sum('return_purchases.grand_total');
                    $expense_amount = Expense::whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->where('user_id', Auth::id())->sum('amount');
                    $payroll_amount = Payroll::whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->where('user_id', Auth::id())->sum('amount');
                } elseif ($cat_id !== 0 && $type !== 0) {
                    $recieved_amount = Payment::whereNotNull('payments.sale_id')->join('sales', 'sales.id', 'payments.sale_id')->join('product_sales', 'product_sales.sale_id', 'sales.id')->join('products', 'products.id', 'product_sales.product_id')->where('sales.sale_status',1)->where('products.category_id', $cat_id)->where('products.type', $type)->whereDate('payments.created_at', '>=', $start_date)->whereDate('payments.created_at', '<=', $end_date)->where('payments.user_id', Auth::id())->sum('payments.amount');
                    $sent_amount = Payment::whereNotNull('payments.purchase_id')->join('purchases', 'purchases.id', 'payments.purchase_id')->join('product_purchases', 'product_purchases.purchase_id', 'purchases.id')->join('products', 'products.id', 'product_purchases.product_id')->where('products.category_id', $cat_id)->where('products.type', $type)->whereDate('payments.created_at', '>=', $start_date)->whereDate('payments.created_at', '<=', $end_date)->where('payments.user_id', Auth::id())->sum('payments.amount');
                    $return_amount = Returns::join('product_returns', 'returns.id', 'product_returns.return_id')->join('products', 'product_returns.product_id', 'products.id')->where('products.category_id', $cat_id)->where('products.type', $type)->whereDate('returns.created_at', '>=', $start_date)->whereDate('returns.created_at', '<=', $end_date)->where('returns.user_id', Auth::id())->sum('returns.grand_total');
                    $purchase_return_amount = ReturnPurchase::join('purchase_product_return', 'return_purchases.id', 'purchase_product_return.return_id')->join('products', 'purchase_product_return.product_id', 'products.id')->where('products.category_id', $cat_id)->whereDate('return_purchases.created_at', '>=', $start_date)->whereDate('return_purchases.created_at', '<=', $end_date)->where('return_purchases.user_id', Auth::id())->sum('return_purchases.grand_total');
                    $expense_amount = Expense::whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->where('user_id', Auth::id())->sum('amount');
                    $payroll_amount = Payroll::whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->where('user_id', Auth::id())->sum('amount');
                }
            }
            else {
                if ($cat_id !== 0 && $type == 0) {
                    $recieved_amount = Payment::whereNotNull('payments.sale_id')->join('sales', 'sales.id', 'payments.sale_id')->join('product_sales', 'product_sales.sale_id', 'sales.id')->join('products', 'products.id', 'product_sales.product_id')->where('sales.sale_status',1)->where('products.category_id', $cat_id)->whereDate('payments.created_at', '>=', $start_date)->whereDate('payments.created_at', '<=', $end_date)->sum('payments.amount');
                    $sent_amount = Payment::whereNotNull('payments.purchase_id')->join('purchases', 'purchases.id', 'payments.purchase_id')->join('product_purchases', 'product_purchases.purchase_id', 'purchases.id')->join('products', 'products.id', 'product_purchases.product_id')->where('products.category_id', $cat_id)->whereDate('payments.created_at', '>=', $start_date)->whereDate('payments.created_at', '<=', $end_date)->sum('payments.amount');
                    $return_amount = Returns::join('product_returns', 'returns.id', 'product_returns.return_id')->join('products', 'product_returns.product_id', 'products.id')->where('products.category_id', $cat_id)->whereDate('returns.created_at', '>=', $start_date)->whereDate('returns.created_at', '<=', $end_date)->sum('returns.grand_total');
                    $purchase_return_amount = ReturnPurchase::join('purchase_product_return', 'return_purchases.id', 'purchase_product_return.return_id')->join('products', 'purchase_product_return.product_id', 'products.id')->where('products.category_id', $cat_id)->whereDate('return_purchases.created_at', '>=', $start_date)->whereDate('return_purchases.created_at', '<=', $end_date)->sum('return_purchases.grand_total');
                    $expense_amount = Expense::whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->where('user_id', Auth::id())->sum('amount');
                    $payroll_amount = Payroll::whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->where('user_id', Auth::id())->sum('amount');
                }elseif ($cat_id == 0 && $type !== 0) {
                    $recieved_amount = Payment::whereNotNull('payments.sale_id')->join('sales', 'sales.id', 'payments.sale_id')->join('product_sales', 'product_sales.sale_id', 'sales.id')->join('products', 'products.id', 'product_sales.product_id')->where('sales.sale_status',1)->where('products.type', $type)->whereDate('payments.created_at', '>=', $start_date)->whereDate('payments.created_at', '<=', $end_date)->sum('payments.amount');
                    $sent_amount = Payment::whereNotNull('payments.purchase_id')->join('purchases', 'purchases.id', 'payments.purchase_id')->join('product_purchases', 'product_purchases.purchase_id', 'purchases.id')->join('products', 'products.id', 'product_purchases.product_id')->where('products.type', $type)->whereDate('payments.created_at', '>=', $start_date)->whereDate('payments.created_at', '<=', $end_date)->sum('payments.amount');
                    $return_amount = Returns::join('product_returns', 'returns.id', 'product_returns.return_id')->join('products', 'product_returns.product_id', 'products.id')->where('products.type', $type)->whereDate('returns.created_at', '>=', $start_date)->whereDate('returns.created_at', '<=', $end_date)->sum('returns.grand_total');
                    $purchase_return_amount = ReturnPurchase::join('purchase_product_return', 'return_purchases.id', 'purchase_product_return.return_id')->join('products', 'purchase_product_return.product_id', 'products.id')->where('products.category_id', $cat_id)->whereDate('return_purchases.created_at', '>=', $start_date)->whereDate('return_purchases.created_at', '<=', $end_date)->sum('return_purchases.grand_total');
                    $expense_amount = Expense::whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->where('user_id', Auth::id())->sum('amount');
                    $payroll_amount = Payroll::whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->where('user_id', Auth::id())->sum('amount');
                } elseif ($cat_id !== 0 && $type !== 0) {
                    $recieved_amount = Payment::whereNotNull('payments.sale_id')->join('sales', 'sales.id', 'payments.sale_id')->join('product_sales', 'product_sales.sale_id', 'sales.id')->join('products', 'products.id', 'product_sales.product_id')->where('sales.sale_status',1)->where('products.category_id', $cat_id)->where('products.type', $type)->whereDate('payments.created_at', '>=', $start_date)->whereDate('payments.created_at', '<=', $end_date)->sum('payments.amount');
                    $sent_amount = Payment::whereNotNull('payments.purchase_id')->join('purchases', 'purchases.id', 'payments.purchase_id')->join('product_purchases', 'product_purchases.purchase_id', 'purchases.id')->join('products', 'products.id', 'product_purchases.product_id')->where('products.category_id', $cat_id)->where('products.type', $type)->whereDate('payments.created_at', '>=', $start_date)->whereDate('payments.created_at', '<=', $end_date)->sum('payments.amount');
                    $return_amount = Returns::join('product_returns', 'returns.id', 'product_returns.return_id')->join('products', 'product_returns.product_id', 'products.id')->where('products.category_id', $cat_id)->where('products.type', $type)->whereDate('returns.created_at', '>=', $start_date)->whereDate('returns.created_at', '<=', $end_date)->sum('returns.grand_total');
                    $purchase_return_amount = ReturnPurchase::join('purchase_product_return', 'return_purchases.id', 'purchase_product_return.return_id')->join('products', 'purchase_product_return.product_id', 'products.id')->where('products.category_id', $cat_id)->whereDate('return_purchases.created_at', '>=', $start_date)->whereDate('return_purchases.created_at', '<=', $end_date)->sum('return_purchases.grand_total');
                    $expense_amount = Expense::whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->where('user_id', Auth::id())->sum('amount');
                    $payroll_amount = Payroll::whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->where('user_id', Auth::id())->sum('amount');
                }
            }
            $sent_amount = $sent_amount + $return_amount + $expense_amount + $payroll_amount;

            $payment_recieved[] = number_format((float)($recieved_amount + $purchase_return_amount), 2, '.', '');
            $payment_sent[] = number_format((float)$sent_amount, 2, '.', '');
            $month[] = date("F", strtotime($start_date));
            $start = strtotime("+1 month", $start);
        }
        return [$month,$payment_recieved,$payment_sent];
    }

    public function pieChartFilter($cat_id,$type)
    {
        $start_date = date("Y").'-'.date("m").'-'.'01';
        $end_date = date("Y").'-'.date("m").'-'.date('t', mktime(0, 0, 0, date("m"), 1, date("Y")));


        $general_setting = DB::table('general_settings')->latest()->first();
        try {
            if (Auth::user()->role_id > 2 && $general_setting->staff_access == 'own') {
                if ($cat_id !== 0 && $type == 0) {
                    $revenue = Sale::join('product_sales', 'sales.id', 'product_sales.sale_id')->join('products', 'product_sales.product_id', 'products.id')->where('products.category_id', $cat_id)->whereDate('sales.created_at', '>=', $start_date)->where('sales.sale_status',1)->where('sales.user_id', Auth::id())->whereDate('sales.created_at', '<=', $end_date)->sum('sales.grand_total');
                    $return = Returns::join('product_returns', 'returns.id', 'product_returns.return_id')->join('products', 'product_returns.product_id', 'products.id')->where('products.category_id', $cat_id)->whereDate('returns.created_at', '>=', $start_date)->where('returns.user_id', Auth::id())->whereDate('returns.created_at', '<=', $end_date)->sum('returns.grand_total');
                    $revenue = $revenue - $return;
                    $purchase = Purchase::join('product_purchases', 'purchases.id', 'product_purchases.purchase_id')->join('products', 'product_purchases.product_id', 'products.id')->where('products.category_id', $cat_id)->whereDate('purchases.created_at', '>=', $start_date)->where('purchases.user_id', Auth::id())->whereDate('purchases.created_at', '<=', $end_date)->sum('purchases.grand_total');
                    $expense = Expense::whereDate('created_at', '>=', $start_date)->where('user_id', Auth::id())->whereDate('created_at', '<=', $end_date)->sum('amount');
                } elseif ($cat_id == 0 && $type !== 0) {
                    $revenue = Sale::join('product_sales', 'sales.id', 'product_sales.sale_id')->join('products', 'product_sales.product_id', 'products.id')->where('products.type', $type)->where('sales.sale_status',1)->whereDate('sales.created_at', '>=', $start_date)->where('sales.user_id', Auth::id())->whereDate('sales.created_at', '<=', $end_date)->sum('sales.grand_total');
                    $return = Returns::join('product_returns', 'returns.id', 'product_returns.return_id')->join('products', 'product_returns.product_id', 'products.id')->where('products.type', $type)->whereDate('returns.created_at', '>=', $start_date)->where('returns.user_id', Auth::id())->whereDate('returns.created_at', '<=', $end_date)->sum('returns.grand_total');
                    $revenue = $revenue - $return;
                    $purchase = Purchase::join('product_purchases', 'purchases.id', 'product_purchases.purchase_id')->join('products', 'product_purchases.product_id', 'products.id')->where('products.type', $type)->whereDate('purchases.created_at', '>=', $start_date)->where('purchases.user_id', Auth::id())->whereDate('purchases.created_at', '<=', $end_date)->sum('purchases.grand_total');
                    $expense = Expense::whereDate('created_at', '>=', $start_date)->where('user_id', Auth::id())->whereDate('created_at', '<=', $end_date)->sum('amount');
                } elseif ($cat_id !== 0 && $type !== 0) {
                    $revenue = Sale::join('product_sales', 'sales.id', 'product_sales.sale_id')->join('products', 'product_sales.product_id', 'products.id')->where('products.category_id', $cat_id)->where('products.type', $type)->where('sales.sale_status',1)->whereDate('sales.created_at', '>=', $start_date)->where('sales.user_id', Auth::id())->whereDate('sales.created_at', '<=', $end_date)->sum('sales.grand_total');
                    $return = Returns::join('product_returns', 'returns.id', 'product_returns.return_id')->join('products', 'product_returns.product_id', 'products.id')->where('products.category_id', $cat_id)->where('products.type', $type)->whereDate('returns.created_at', '>=', $start_date)->where('returns.user_id', Auth::id())->whereDate('returns.created_at', '<=', $end_date)->sum('returns.grand_total');
                    $revenue = $revenue - $return;
                    $purchase = Purchase::join('product_purchases', 'purchases.id', 'product_purchases.purchase_id')->join('products', 'product_purchases.product_id', 'products.id')->where('products.category_id', $cat_id)->where('products.type', $type)->whereDate('purchases.created_at', '>=', $start_date)->where('purchases.user_id', Auth::id())->whereDate('purchases.created_at', '<=', $end_date)->sum('purchases.grand_total');
                    $expense = Expense::whereDate('created_at', '>=', $start_date)->where('user_id', Auth::id())->whereDate('created_at', '<=', $end_date)->sum('amount');
                }
            } else {
                if ($cat_id !== 0 && $type == 0) {
                    $revenue = Sale::join('product_sales', 'sales.id', 'product_sales.sale_id')->join('products', 'product_sales.product_id', 'products.id')->where('products.category_id', $cat_id)->where('sales.sale_status',1)->whereDate('sales.created_at', '>=', $start_date)->whereDate('sales.created_at', '<=', $end_date)->sum('sales.grand_total');
                    $return = Returns::join('product_returns', 'returns.id', 'product_returns.return_id')->join('products', 'product_returns.product_id', 'products.id')->where('products.category_id', $cat_id)->whereDate('returns.created_at', '>=', $start_date)->whereDate('returns.created_at', '<=', $end_date)->sum('returns.grand_total');
                    $revenue = $revenue - $return;
                    $purchase = Purchase::join('product_purchases', 'purchases.id', 'product_purchases.purchase_id')->join('products', 'product_purchases.product_id', 'products.id')->where('products.category_id', $cat_id)->whereDate('purchases.created_at', '>=', $start_date)->whereDate('purchases.created_at', '<=', $end_date)->sum('purchases.grand_total');
                    $expense = Expense::whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->sum('amount');
                } elseif ($cat_id == 0 && $type !== 0) {
                    $revenue = Sale::join('product_sales', 'sales.id', 'product_sales.sale_id')->join('products', 'product_sales.product_id', 'products.id')->where('products.type', $type)->where('sales.sale_status',1)->whereDate('sales.created_at', '>=', $start_date)->whereDate('sales.created_at', '<=', $end_date)->sum('sales.grand_total');
                    $return = Returns::join('product_returns', 'returns.id', 'product_returns.return_id')->join('products', 'product_returns.product_id', 'products.id')->where('products.type', $type)->whereDate('returns.created_at', '>=', $start_date)->whereDate('returns.created_at', '<=', $end_date)->sum('returns.grand_total');
                    $revenue = $revenue - $return;
                    $purchase = Purchase::join('product_purchases', 'purchases.id', 'product_purchases.purchase_id')->join('products', 'product_purchases.product_id', 'products.id')->where('products.type', $type)->whereDate('purchases.created_at', '>=', $start_date)->whereDate('purchases.created_at', '<=', $end_date)->sum('purchases.grand_total');
                    $expense = Expense::whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->sum('amount');
                } elseif ($cat_id !== 0 && $type !== 0) {
                    $revenue = Sale::join('product_sales', 'sales.id', 'product_sales.sale_id')->join('products', 'product_sales.product_id', 'products.id')->where('sales.sale_status',1)->where('products.category_id', $cat_id)->where('products.type', $type)->whereDate('sales.created_at', '>=', $start_date)->whereDate('sales.created_at', '<=', $end_date)->sum('sales.grand_total');
                    $return = Returns::join('product_returns', 'returns.id', 'product_returns.return_id')->join('products', 'product_returns.product_id', 'products.id')->where('products.category_id', $cat_id)->where('products.type', $type)->whereDate('returns.created_at', '>=', $start_date)->whereDate('returns.created_at', '<=', $end_date)->sum('returns.grand_total');
                    $revenue = $revenue - $return;
                    $purchase = Purchase::join('product_purchases', 'purchases.id', 'product_purchases.purchase_id')->join('products', 'product_purchases.product_id', 'products.id')->where('products.category_id', $cat_id)->where('products.type', $type)->whereDate('purchases.created_at', '>=', $start_date)->whereDate('purchases.created_at', '<=', $end_date)->sum('purchases.grand_total');
                    $expense = Expense::whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->sum('amount');
                }
            }
            return [$revenue,$purchase,$expense];
        }catch(\Exception $e){
            return $e->getMessage();
        }
    }

    public function dashboardFilter($start_date, $end_date)
    {
        $general_setting = DB::table('general_settings')->latest()->first();
        if(Auth::user()->role_id > 2 && $general_setting->staff_access == 'own') {
            $revenue = Sale::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->where('sale_status',1)->where('user_id', Auth::id())->sum('grand_total');
            $return = Returns::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->where('user_id', Auth::id())->sum('grand_total');
            $purchase_return = ReturnPurchase::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->where('user_id', Auth::id())->sum('grand_total');
            $revenue -= $return;
            $purchase = Purchase::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->where('user_id', Auth::id())->sum('grand_total');
            $profit = $revenue + $purchase_return - $purchase;

            $data[0] = $revenue;
            $data[1] = $return;
            $data[2] = $profit;
            $data[3] = $purchase_return;
        }
        else{
            $revenue = Sale::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->where('sale_status',1)->sum('grand_total');
            $return = Returns::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->sum('grand_total');
            $purchase_return = ReturnPurchase::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->sum('grand_total');
            $revenue -= $return;
            $purchase = Purchase::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->sum('grand_total');
            $profit = $revenue + $purchase_return - $purchase;

            $data[0] = $revenue;
            $data[1] = $return;
            $data[2] = $profit;
            $data[3] = $purchase_return;
        }

        return $data;
    }

    public function myTransaction($year, $month)
    {
        $start = 1;
        $number_of_day = date('t', mktime(0, 0, 0, $month, 1, $year));
        while($start <= $number_of_day)
        {
            if($start < 10)
                $date = $year.'-'.$month.'-0'.$start;
            else
                $date = $year.'-'.$month.'-'.$start;
            $sale_generated[$start] = Sale::whereDate('created_at', $date)->where('user_id', Auth::id())->count();
            $sale_grand_total[$start] = Sale::whereDate('created_at', $date)->where('user_id', Auth::id())->sum('grand_total');
            $purchase_generated[$start] = Purchase::whereDate('created_at', $date)->where('user_id', Auth::id())->count();
            $purchase_grand_total[$start] = Purchase::whereDate('created_at', $date)->where('user_id', Auth::id())->sum('grand_total');
            $quotation_generated[$start] = Quotation::whereDate('created_at', $date)->where('user_id', Auth::id())->count();
            $quotation_grand_total[$start] = Quotation::whereDate('created_at', $date)->where('user_id', Auth::id())->sum('grand_total');
            $start++;
        }
        $start_day = date('w', strtotime($year.'-'.$month.'-01')) + 1;
        $prev_year = date('Y', strtotime('-1 month', strtotime($year.'-'.$month.'-01')));
        $prev_month = date('m', strtotime('-1 month', strtotime($year.'-'.$month.'-01')));
        $next_year = date('Y', strtotime('+1 month', strtotime($year.'-'.$month.'-01')));
        $next_month = date('m', strtotime('+1 month', strtotime($year.'-'.$month.'-01')));
        return view('user.my_transaction', compact('start_day', 'year', 'month', 'number_of_day', 'prev_year', 'prev_month', 'next_year', 'next_month', 'sale_generated', 'sale_grand_total','purchase_generated', 'purchase_grand_total','quotation_generated', 'quotation_grand_total'));
    }
}
