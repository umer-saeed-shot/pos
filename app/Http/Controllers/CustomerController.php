<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\CustomerGroup;
use App\Customer;
use App\Deposit;
use App\User;
use Illuminate\Validation\Rule;
use Auth;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use App\Mail\UserNotification;
use Illuminate\Support\Facades\Mail;


class CustomerController extends Controller
{
    public function index()
    {
	
        $role = Role::find(Auth::user()->role_id);
        if($role->hasPermissionTo('customers-index')){
            $permissions = Role::findByName($role->name)->permissions;
            foreach ($permissions as $permission)
                $all_permission[] = $permission->name;
            if(empty($all_permission))
                $all_permission[] = 'dummy text';
            $lims_customer_all = Customer::where('is_active', true)->get();
            return view('customer.index', compact('lims_customer_all', 'all_permission'));
        }
        else
            return redirect()->back()->with('not_permitted', 'Sorry! You are not allowed to access this module');
    }

    public function create()
    {

        $role = Role::find(Auth::user()->role_id);
        if($role->hasPermissionTo('customers-add')){

            $lims_customer_group_all = CustomerGroup::where('is_active',true)->get();
            return view('customer.create', compact('lims_customer_group_all'));
        }
        else
        {

            return redirect()->back()->with('not_permitted', 'Sorry! You are not allowed to access this module');
        }
    }

    public function store(Request $request)
    {
        
        $this->validate($request, [
            'phone_number' => [
                'max:255',
                    Rule::unique('customers')->where(function ($query) {
                    return $query->where('is_active', 1);
                }),
            ],
        ]);
        $lims_customer_data = $request->all();
        $lims_customer_data['is_active'] = true;

        if(isset($lims_customer_data['user'])) {

            $this->validate($request, [
                'name' => [
                    'max:255',
                        Rule::unique('users')->where(function ($query) {
                        return $query->where('is_deleted', false);
                    }),
                ],
                'email' => [
                    'email',
                    'max:255',
                        Rule::unique('users')->where(function ($query) {
                        return $query->where('is_deleted', false);
                    }),
                ],
            ]);
	
            $lims_customer_data['phone'] = $lims_customer_data['phone_number'];
            $lims_customer_data['role_id'] = 5;
            $lims_customer_data['is_deleted'] = false;
            $lims_customer_data['password'] = bcrypt($lims_customer_data['password']);
            $user = User::create($lims_customer_data);
            $lims_customer_data['user_id'] = $user->id;
            $message = 'Customer and user created successfully';
            return redirect('customer')->with('create_message', $message);
        }
        else {
            $message = 'Customer created successfully';
            //$lims_customer_data->save($lims_customer_data);
        }
        $lims_customer_data['name'] = $lims_customer_data['customer_name'];
        
        if($lims_customer_data['email'] && $lims_customer_data['email'] != '') {
            try{
                Mail::send( 'mail.customer_create', $lims_customer_data, function( $message ) use ($lims_customer_data)
                {
                    $message->to( $lims_customer_data['email'] )->subject( 'New Customer' );
                });
            }
            catch(\Exception $e){
                $message = 'Customer created successfully. Please setup your <a href="setting/mail_setting">mail setting</a> to send mail.';
            }   
        }
        Customer::create($lims_customer_data);
        if($lims_customer_data['pos'])
            return redirect('pos')->with('message', $message);
        else
            return redirect('customer')->with('create_message', $message);
    }

    public function edit($id)
    {
        $role = Role::find(Auth::user()->role_id);
        if($role->hasPermissionTo('customers-edit')){
            
            $lims_customer_data = Customer::find($id);
            $lims_customer_group_all = CustomerGroup::where('is_active',true)->get();
            return view('customer.edit', compact('lims_customer_data','lims_customer_group_all'));
        }
        else
            return redirect()->back()->with('not_permitted', 'Sorry! You are not allowed to access this module');
    }

    public function update(Request $request, $id)
    {
	$poscust = "";
		if(isset($request['poscust']))
		$poscust= $request['poscust'];
        $this->validate($request, [
            'phone_number' => [
                'max:255',
                    Rule::unique('customers')->ignore($id)->where(function ($query) {
                    return $query->where('is_active', 1);
                }),
            ],
        ]);

        $input = $request->all();
		//echo '<pre>'; print_r($input); exit; //poscust
		//return  Customer::find($id); exit;
        //$lims_customer_data = Customer::find($id);
		$data = Customer::find($id);

        if(isset($input['user'])) {
            $this->validate($request, [
                'name' => [
                    'max:255',
                        Rule::unique('users')->where(function ($query) {
                        return $query->where('is_deleted', false);
                    }),
                ],
                'email' => [
                    'email',
                    'max:255',
                        Rule::unique('users')->where(function ($query) {
                        return $query->where('is_deleted', false);
                    }),
                ],
            ]);

            $input['phone'] = $input['phone_number'];
            $input['role_id'] = 5;
            $input['is_active'] = true;
            $input['is_deleted'] = false;
            $input['password'] = bcrypt($input['password']);
            $user = User::create($input);
            $input['user_id'] = $user->id;
            $message = 'Customer updated and user created successfully';
        }
        else {
            $message = 'Customer updated successfully';
        }
        //echo '<pre>'; print_r($lims_customer_data); exit;
        //$lims_customer_data['name'] = $lims_customer_data['customer_name'];
		//echo '<pre>'; print_r($input); exit;
		$data['name'] = $input['customer_name'];
		$data['customer_group_id']=$input['customer_group_id'];
		$data['company_name']=$input['company_name'];
		$data['email']=$input['email'];
		$data['phone_number']=$input['phone_number'];
		//$data['tax_no']=$input['tax_no'];
		$data['address']=$input['address'];
		$data['city']=$input['city'];
		$data['state']=$input['state'];
		$data['postal_code']=$input['postal_code'];
		/*$data['dv_le_sph']=$input['dv_le_sph'];
		$data['dv_le_cyl']=$input['dv_le_cyl'];
		$data['dv_le_axis']=$input['dv_le_axis'];
		$data['dv_re_sph']=$input['dv_re_sph'];
		$data['dv_re_cyl']=$input['dv_re_cyl'];
		$data['dv_re_axis']=$input['dv_re_axis'];
		$data['nv_le_sph']=$input['nv_le_sph'];
		$data['nv_le_cyl']=$input['nv_le_cyl'];
		$data['nv_le_axis']=$input['nv_le_axis'];
		$data['nv_re_sph']=$input['nv_re_sph'];
		$data['nv_re_cyl']=$input['nv_re_cyl'];
		$data['nv_re_axis']=$input['nv_re_axis'];*/
		$data['country']=$input['country'];
		//echo $lims_customer_data['name']; exit;
		//echo '<pre>'; print_r($input); echo '----<br/>'; print_r($lims_customer_data); exit;
        $data->save($input);
		//echo $poscust; exit;
		if($poscust == "poss")
		return redirect('pos')->with('message', $message);
		else
		return redirect('customer')->with('edit_message', $message);
    }
	

    public function importCustomer(Request $request)
    {
        $role = Role::find(Auth::user()->role_id);
        if($role->hasPermissionTo('customers-add')){
            $upload=$request->file('file');
            $ext = pathinfo($upload->getClientOriginalName(), PATHINFO_EXTENSION);
            if($ext != 'csv')
                return redirect()->back()->with('not_permitted', 'Please upload a CSV file');
            $filename =  $upload->getClientOriginalName();
            $filePath=$upload->getRealPath();
            //open and read
            $file=fopen($filePath, 'r');
            $header= fgetcsv($file);
            $escapedHeader=[];
            //validate
            foreach ($header as $key => $value) {
                $lheader=strtolower($value);
                $escapedItem=preg_replace('/[^a-z]/', '', $lheader);
                array_push($escapedHeader, $escapedItem);
            }
            //looping through othe columns
            while($columns=fgetcsv($file))
            {
                if($columns[0]=="")
                    continue;
                foreach ($columns as $key => $value) {
                    $value=preg_replace('/\D/','',$value);
                }
               $data= array_combine($escapedHeader, $columns);
               $lims_customer_group_data = CustomerGroup::where('name', $data['customergroup'])->first();
               $customer = Customer::firstOrNew(['name'=>$data['name']]);
               $customer->customer_group_id = $lims_customer_group_data->id;
               $customer->name = $data['name'];
               $customer->company_name = $data['companyname'];
               $customer->email = $data['email'];
               $customer->phone_number = $data['phonenumber'];
               $customer->address = $data['address'];
               $customer->city = $data['city'];
               $customer->state = $data['state'];
               $customer->postal_code = $data['postalcode'];
               $customer->country = $data['country'];
               $customer->is_active = true;
               $customer->save();
               $message = 'Customer Imported Successfully';
               if($data['email']){
                    try{
                        Mail::send( 'mail.customer_create', $data, function( $message ) use ($data)
                        {
                            $message->to( $data['email'] )->subject( 'New Customer' );
                        });
                    }
                    catch(\Exception $e){
                        $message = 'Customer imported successfully. Please setup your <a href="setting/mail_setting">mail setting</a> to send mail.';
                    }
                }
            }
            return redirect('customer')->with('import_message', $message);
        }
        else
            return redirect()->back()->with('not_permitted', 'Sorry! You are not allowed to access this module');
    }

    public function getDeposit($id)
    {
        $lims_deposit_list = Deposit::where('customer_id', $id)->get();
        $deposit_id = [];
        $deposits = [];
        foreach ($lims_deposit_list as $deposit) {
            $deposit_id[] = $deposit->id;
            $date[] = $deposit->created_at->toDateString() . ' '. $deposit->created_at->toTimeString();
            $amount[] = $deposit->amount;
            $note[] = $deposit->note;
            $lims_user_data = User::find($deposit->user_id);
            $name[] = $lims_user_data->name;
            $email[] = $lims_user_data->email;
        }
        if(!empty($deposit_id)){
            $deposits[] = $deposit_id;
            $deposits[] = $date;
            $deposits[] = $amount;
            $deposits[] = $note;
            $deposits[] = $name;
            $deposits[] = $email;
        }
        return $deposits;
    }

    public function addDeposit(Request $request)
    {
        $data = $request->all();
        $data['user_id'] = Auth::id();
        $lims_customer_data = Customer::find($data['customer_id']);
        $lims_customer_data->deposit += $data['amount'];
        $lims_customer_data->save();
        Deposit::create($data);
        $message = 'Data inserted successfully';
        if($lims_customer_data->email){
            $data['name'] = $lims_customer_data->name;
            $data['email'] = $lims_customer_data->email;
            $data['balance'] = $lims_customer_data->deposit - $lims_customer_data->expense;
            try{
                Mail::send( 'mail.customer_deposit', $data, function( $message ) use ($data)
                {
                    $message->to( $data['email'] )->subject( 'Recharge Info' );
                });
            }
            catch(\Exception $e){
                $message = 'Data inserted successfully. Please setup your <a href="setting/mail_setting">mail setting</a> to send mail.';
            }
        }
        return redirect('customer')->with('create_message', $message);
    }

    public function updateDeposit(Request $request)
    {
        $data = $request->all();
        $lims_deposit_data = Deposit::find($data['deposit_id']);
        $lims_customer_data = Customer::find($lims_deposit_data->customer_id);
        $amount_dif = $data['amount'] - $lims_deposit_data->amount;
        $lims_customer_data->deposit += $amount_dif;
        $lims_customer_data->save();
        $lims_deposit_data->update($data);
        return redirect('customer')->with('create_message', 'Data updated successfully');
    }

    public function deleteDeposit(Request $request)
    {
        $data = $request->all();
        $lims_deposit_data = Deposit::find($data['id']);
        $lims_customer_data = Customer::find($lims_deposit_data->customer_id);
        $lims_customer_data->deposit -= $lims_deposit_data->amount;
        $lims_customer_data->save();
        $lims_deposit_data->delete();
        return redirect('customer')->with('not_permitted', 'Data deleted successfully');
    }

    public function deleteBySelection(Request $request)
    {
        $customer_id = $request['customerIdArray'];
        foreach ($customer_id as $id) {
            $lims_customer_data = Customer::find($id);
            $lims_customer_data->is_active = false;
            $lims_customer_data->save();
        }
        return 'Customer deleted successfully!';
    }

    public function destroy($id)
    {
        $lims_customer_data = Customer::find($id);
        $lims_customer_data->is_active = false;
        $lims_customer_data->save();
        return redirect('customer')->with('not_permitted','Data deleted Successfully');
    }
    public function updatecuspos()
    {
	    $lims_customer_data = Customer::find($request['id']);
		//echo '<pre>'; print_r($userData); exit;
		$lims_customer_data->name = $request['name'];
		$lims_customer_data->customer_group_id=$request['customer_group_id'];
		$lims_customer_data->company_name=$request['company_name'];
		$lims_customer_data->email=$request['email'];
		$lims_customer_data->phone_number=$request['phone_number'];
		$lims_customer_data->tax_no=$request['tax_no'];
		$lims_customer_data->address=$request['address'];
		$lims_customer_data->city=$request['city'];
		$lims_customer_data->state=$request['state'];
		$lims_customer_data->postal_code=$request['postal_code'];
		$lims_customer_data->dv_le_sph=$request['dv_le_sph'];
		$lims_customer_data->dv_le_cyl=$request['dv_le_cyl'];
		$lims_customer_data->dv_le_axis=$request['dv_le_axis'];
		$lims_customer_data->dv_re_sph=$request['dv_re_sph'];
		$lims_customer_data->dv_re_cyl=$request['dv_re_cyl'];
		$lims_customer_data->dv_re_axis=$request['dv_re_axis'];
		$lims_customer_data->nv_le_sph=$request['nv_le_sph'];
		$lims_customer_data->nv_le_cyl=$request['nv_le_cyl'];
		$lims_customer_data->nv_le_axis=$request['nv_le_axis'];
		$lims_customer_data->nv_re_sph=$request['nv_re_sph'];
		$lims_customer_data->nv_re_cyl=$request['nv_re_cyl'];
		$lims_customer_data->nv_re_axis=$request['nv_re_axis'];
		$lims_customer_data->country=$request['country'];
        $lims_customer_data->save();
		//return redirect('customer')->with('edit_message', $message);
    }
}
