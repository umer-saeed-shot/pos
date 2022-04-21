<?php $__env->startSection('content'); ?>
<!-- this portion is for demo only -->
<!-- <style type="text/css">

  nav.navbar a.menu-btn {
    padding: 12 !important;
  }
  .color-switcher {
      background-color: #fff;
      border: 1px solid #e5e5e5;
      border-radius: 2px;
      padding: 10px;
      position: fixed;
      top: 150px;
      transition: all 0.4s ease 0s;
      width: 150px;
      z-index: 99999;
  }
  .hide-color-switcher {
      right: -150px;
  }
  .show-color-switcher {
      right: -1px;
  }
  .color-switcher a.switcher-button {
      background: #fff;
      border-top: #e5e5e5;
      border-right: #e5e5e5;
      border-bottom: #e5e5e5;
      border-left: #e5e5e5;
      border-style: solid solid solid solid;
      border-width: 1px 1px 1px 1px;
      border-radius: 2px;
      color: #161616;
      cursor: pointer;
      font-size: 22px;
      width: 45px;
      height: 45px;
      line-height: 43px;
      position: absolute;
      top: 24px;
      left: -44px;
      text-align: center;
  }
  .color-switcher a.switcher-button i {
    line-height: 40px
  }
  .color-switcher .color-switcher-title {
      color: #666;
      padding: 0px 0 8px;
  }
  .color-switcher .color-switcher-title:after {
      content: "";
      display: block;
      height: 1px;
      margin: 14px 0 0;
      position: relative;
      width: 20px;
  }
  .color-switcher .color-list a.color {
      cursor: pointer;
      display: inline-block;
      height: 30px;
      margin: 10px 0 0 1px;
      width: 28px;
  }
  .purple-theme {
      background-color: #7c5cc4;
  }
  .green-theme {
      background-color: #1abc9c;
  }
  .blue-theme {
      background-color: #3498db;
  }
  .dark-theme {
      background-color: #34495e;
  }
</style>
<div class="color-switcher hide-color-switcher">
    <a class="switcher-button"><i class="fa fa-cog fa-spin"></i></a>
    <h5><?php echo e(trans('file.Theme')); ?></h5>
    <div class="color-list">
        <a class="color purple-theme" title="purple" data-color="default.css"></a>
        <a class="color green-theme" title="green" data-color="green.css"></a>
        <a class="color blue-theme" title="blue" data-color="blue.css"></a>
        <a class="color dark-theme" title="dark" data-color="dark.css"></a>
    </div>
</div> -->
<?php if(session()->has('not_permitted')): ?>
  <div class="alert alert-danger alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><?php echo e(session()->get('not_permitted')); ?></div>
<?php endif; ?>
<?php if(session()->has('message')): ?>
  <div class="alert alert-success alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><?php echo e(session()->get('message')); ?></div>
<?php endif; ?>
      <div class="row">
        <div class="container-fluid">
          <div class="col-md-12">
            <div class="brand-text float-left mt-4">
                <h3><?php echo e(trans('file.welcome')); ?> <span><?php echo e(Auth::user()->name); ?></span> </h3>
            </div>
            <div class="filter-toggle btn-group">
              <button class="btn btn-secondary date-btn" data-start_date="<?php echo e(date('Y-m-d')); ?>" data-end_date="<?php echo e(date('Y-m-d')); ?>"><?php echo e(trans('file.Today')); ?></button>
              <button class="btn btn-secondary date-btn" data-start_date="<?php echo e(date('Y-m-d', strtotime(' -7 day'))); ?>" data-end_date="<?php echo e(date('Y-m-d')); ?>"><?php echo e(trans('file.Last 7 Days')); ?></button>
              <button class="btn btn-secondary date-btn active" data-start_date="<?php echo e(date('Y').'-'.date('m').'-'.'01'); ?>" data-end_date="<?php echo e(date('Y-m-d')); ?>"><?php echo e(trans('file.This Month')); ?></button>
              <button class="btn btn-secondary date-btn" data-start_date="<?php echo e(date('Y').'-01'.'-01'); ?>" data-end_date="<?php echo e(date('Y').'-12'.'-31'); ?>"><?php echo e(trans('file.This Year')); ?></button>
            </div>
          </div>
        </div>
      </div>
      <!-- Counts Section -->
      <section class="dashboard-counts">
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-12 form-group">
              <div class="row">
                <!-- Count item widget-->
                <div class="col-sm-3">
                  <div class="wrapper count-title text-center">
                    <div class="icon"><i class="dripicons-graph-bar" style="color: #733686"></i></div>
                    <div class="name"><strong style="color: #733686"><?php echo e(trans('file.revenue')); ?></strong></div>
                    <div class="count-number revenue-data"><i class="fa fa-usd" style="color: #733686"></i><?php echo e(number_format((float)$revenue, 2, '.', '')); ?></div>
                  </div>
                </div>
                <!-- Count item widget-->
                <div class="col-sm-3">
                  <div class="wrapper count-title text-center">
                    <div class="icon"><i class="dripicons-return" style="color: #ff8952"></i></div>
                    <div class="name"><strong style="color: #ff8952"><?php echo e(trans('file.Sale Return')); ?></strong></div>
                    <div class="count-number return-data"><i class="fa fa-usd" style="color: #ff8952"></i><?php echo e(number_format((float)$return, 2, '.', '')); ?></div>
                  </div>
                </div>
                <!-- Count item widget-->
                <div class="col-sm-3">
                  <div class="wrapper count-title text-center">
                    <div class="icon"><i class="dripicons-media-loop" style="color: #00c689"></i></div>
                    <div class="name"><strong style="color: #00c689"><?php echo e(trans('file.Purchase Return')); ?></strong></div>
                    <div class="count-number purchase_return-data"><i class="fa fa-usd" style="color: #00c689"></i><?php echo e(number_format((float)$purchase_return, 2, '.', '')); ?></div>
                  </div>
                </div>
                <!-- Count item widget-->
                <div class="col-sm-3">
                  <div class="wrapper count-title text-center">
                    <div class="icon"><i class="dripicons-trophy" style="color: #297ff9"></i></div>
                    <div class="name"><strong style="color: #297ff9"><?php echo e(trans('file.profit')); ?></strong></div>
                    <div class="count-number profit-data"><i class="fa fa-usd" style="color: #297ff9"></i><?php echo e(number_format((float)$profit, 2, '.', '')); ?></div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-7 mt-4">
              <div class="card line-chart-example">
                <div class="card-header d-flex align-items-center">
                  <h4><?php echo e(trans('file.Cash Flow')); ?></h4>
                  <div class="col-4 float-right">
                    <select name="category" id="cash_flow_category_id" class="form-control" onchange="cashFlowFilter()">
                        <option value="0">Search Category Wise</option>
                        <?php $__currentLoopData = $categories; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $category): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                              <option value="<?php echo e($category->id); ?>"><?php echo e($category->name); ?></option>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </select>
                  </div>
                  <div class="col-4 float-right">
                    <select name="type" id="type" class="cash_flow_form-control" onchange="cashFlowFilter()">
                        <option value="0">Search Type Wise</option>
                        <?php $__currentLoopData = $types; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $type): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <option value="<?php echo e($type->id); ?>"><?php echo e($type->name); ?></option>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                    </select>
                  </div>

                </div>
                <div class="card-body">
                  <?php
                    if($general_setting->theme == 'default.css'){
                      $color = '#733686';
                      $color_rgba = 'rgba(115, 54, 134, 0.8)';
                    }
                    elseif($general_setting->theme == 'green.css'){
                        $color = '#2ecc71';
                        $color_rgba = 'rgba(46, 204, 113, 0.8)';
                    }
                    elseif($general_setting->theme == 'blue.css'){
                        $color = '#3498db';
                        $color_rgba = 'rgba(52, 152, 219, 0.8)';
                    }
                    elseif($general_setting->theme == 'dark.css'){
                        $color = '#34495e';
                        $color_rgba = 'rgba(52, 73, 94, 0.8)';
                    }
                  ?>
                  <canvas id="cashFlow" data-color = "<?php echo e($color); ?>" data-color_rgba = "<?php echo e($color_rgba); ?>" data-recieved = "<?php echo e(json_encode($payment_recieved)); ?>" data-sent = "<?php echo e(json_encode($payment_sent)); ?>" data-month = "<?php echo e(json_encode($month)); ?>" data-label1="<?php echo e(trans('file.Payment Recieved')); ?>" data-label2="<?php echo e(trans('file.Payment Sent')); ?>"></canvas>
                </div>
              </div>
            </div>
            <div class="col-md-5 mt-4">
              <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                  <h4><?php echo e(date('F')); ?> <?php echo e(date('Y')); ?></h4>
                  <div class="col-4 float-right">
                    <select name="category" id="pie_chart_category_id" class="form-control" onchange="pieChartFilter()">
                        <option value="0">Search Category Wise</option>
                        <?php $__currentLoopData = $categories; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $category): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                              <option value="<?php echo e($category->id); ?>"><?php echo e($category->name); ?></option>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </select>
                  </div>
                  <div class="col-4 float-right">
                    <select name="type" id="pie_chart_type" class="form-control" onchange="pieChartFilter()">
                        <option value="0">Search Type Wise</option>
                        <?php $__currentLoopData = $types; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $type): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <option value="<?php echo e($type->id); ?>"><?php echo e($type->name); ?></option>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                    </select>
                  </div>
                </div>
                <div class="pie-chart mb-2">
                    <canvas id="transactionChart" data-color = "<?php echo e($color); ?>" data-color_rgba = "<?php echo e($color_rgba); ?>" data-revenue=<?php echo e($revenue); ?> data-purchase=<?php echo e($purchase); ?> data-expense=<?php echo e($expense); ?> data-label1="<?php echo e(trans('file.Purchase')); ?>" data-label2="<?php echo e(trans('file.revenue')); ?>" data-label3="<?php echo e(trans('file.Expense')); ?>" width="100" height="95"> </canvas>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="container-fluid">
          <div class="row">
            <div class="col-md-12">
              <div class="card">
                <div class="card-header d-flex align-items-center">
                  <h4><?php echo e(trans('file.yearly report')); ?></h4>
                </div>
                <div class="card-body">
                  <canvas id="saleChart" data-sale_chart_value = "<?php echo e(json_encode($yearly_sale_amount)); ?>" data-purchase_chart_value = "<?php echo e(json_encode($yearly_purchase_amount)); ?>" data-label1="<?php echo e(trans('file.Purchased Amount')); ?>" data-label2="<?php echo e(trans('file.Sold Amount')); ?>"></canvas>
                </div>
              </div>
            </div>
            <div class="col-md-7">
              <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                  <h4><?php echo e(trans('file.Recent Transaction')); ?></h4>
                  <div class="right-column">
                    <div class="badge badge-primary"><?php echo e(trans('file.latest')); ?> 5</div>
                  </div>
                </div>
                <ul class="nav nav-tabs" role="tablist">
                  <li class="nav-item">
                    <a class="nav-link active" href="#sale-latest" role="tab" data-toggle="tab"><?php echo e(trans('file.Sale')); ?></a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#purchase-latest" role="tab" data-toggle="tab"><?php echo e(trans('file.Purchase')); ?></a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#quotation-latest" role="tab" data-toggle="tab"><?php echo e(trans('file.Quotation')); ?></a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#payment-latest" role="tab" data-toggle="tab"><?php echo e(trans('file.Payment')); ?></a>
                  </li>
                </ul>

                <div class="tab-content">
                  <div role="tabpanel" class="tab-pane fade show active" id="sale-latest">
                      <div class="table-responsive">
                        <table class="table">
                          <thead>
                            <tr>
                              <th><?php echo e(trans('file.date')); ?></th>
                              <th><?php echo e(trans('file.reference')); ?></th>
                              <th><?php echo e(trans('file.customer')); ?></th>
                              <th><?php echo e(trans('file.status')); ?></th>
                              <th><?php echo e(trans('file.grand total')); ?></th>
                            </tr>
                          </thead>
                          <tbody>
                            <?php $__currentLoopData = $recent_sale; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $sale): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <?php $customer = DB::table('customers')->find($sale->customer_id); ?>
                            <tr>
                              <td><?php echo e(date($general_setting->date_format, strtotime($sale->created_at->toDateString()))); ?></td>
                              <td><?php echo e($sale->reference_no); ?></td>
                              <td><?php echo e($customer->name); ?></td>
                              <?php if($sale->sale_status == 1): ?>
                              <td><div class="badge badge-success"><?php echo e(trans('file.Completed')); ?></div></td>
                              <?php elseif($sale->sale_status == 2): ?>
                              <td><div class="badge badge-danger"><?php echo e(trans('file.Pending')); ?></div></td>
                              <?php else: ?>
                              <td><div class="badge badge-warning"><?php echo e(trans('file.Draft')); ?></div></td>
                              <?php endif; ?>
                              <td><?php echo e($sale->grand_total); ?></td>
                            </tr>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                          </tbody>
                        </table>
                      </div>
                  </div>
                  <div role="tabpanel" class="tab-pane fade" id="purchase-latest">
                      <div class="table-responsive">
                        <table class="table">
                          <thead>
                            <tr>
                              <th><?php echo e(trans('file.date')); ?></th>
                              <th><?php echo e(trans('file.reference')); ?></th>
                              <th><?php echo e(trans('file.Supplier')); ?></th>
                              <th><?php echo e(trans('file.status')); ?></th>
                              <th><?php echo e(trans('file.grand total')); ?></th>
                            </tr>
                          </thead>
                          <tbody>
                            <?php $__currentLoopData = $recent_purchase; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $purchase): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <?php $supplier = DB::table('suppliers')->find($purchase->supplier_id); ?>
                            <tr>
                              <td><?php echo e(date($general_setting->date_format, strtotime($purchase->created_at->toDateString()))); ?></td>
                              <td><?php echo e($purchase->reference_no); ?></td>
                              <?php if($supplier): ?>
                                <td><?php echo e($supplier->name); ?></td>
                              <?php else: ?>
                                <td>N/A</td>
                              <?php endif; ?>
                              <?php if($purchase->status == 1): ?>
                              <td><div class="badge badge-success">Recieved</div></td>
                              <?php elseif($purchase->status == 2): ?>
                              <td><div class="badge badge-success">Partial</div></td>
                              <?php elseif($purchase->status == 3): ?>
                              <td><div class="badge badge-danger">Pending</div></td>
                              <?php else: ?>
                              <td><div class="badge badge-danger">Ordered</div></td>
                              <?php endif; ?>
                              <td><?php echo e($purchase->grand_total); ?></td>
                            </tr>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                          </tbody>
                        </table>
                      </div>
                  </div>
                  <div role="tabpanel" class="tab-pane fade" id="quotation-latest">
                      <div class="table-responsive">
                        <table class="table">
                          <thead>
                            <tr>
                              <th><?php echo e(trans('file.date')); ?></th>
                              <th><?php echo e(trans('file.reference')); ?></th>
                              <th><?php echo e(trans('file.customer')); ?></th>
                              <th><?php echo e(trans('file.status')); ?></th>
                              <th><?php echo e(trans('file.grand total')); ?></th>
                            </tr>
                          </thead>
                          <tbody>
                            <?php $__currentLoopData = $recent_quotation; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $quotation): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <?php $customer = DB::table('customers')->find($quotation->customer_id); ?>
                            <tr>
                              <td><?php echo e(date($general_setting->date_format, strtotime($quotation->created_at->toDateString()))); ?></td>
                              <td><?php echo e($quotation->reference_no); ?></td>
                              <td><?php echo e($customer->name); ?></td>
                              <?php if($quotation->quotation_status == 1): ?>
                              <td><div class="badge badge-danger">Pending</div></td>
                              <?php else: ?>
                              <td><div class="badge badge-success">Sent</div></td>
                              <?php endif; ?>
                              <td><?php echo e($quotation->grand_total); ?></td>
                            </tr>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                          </tbody>
                        </table>
                      </div>
                  </div>
                  <div role="tabpanel" class="tab-pane fade" id="payment-latest">
                      <div class="table-responsive">
                        <table class="table">
                          <thead>
                            <tr>
                              <th><?php echo e(trans('file.date')); ?></th>
                              <th><?php echo e(trans('file.reference')); ?></th>
                              <th><?php echo e(trans('file.Amount')); ?></th>
                              <th><?php echo e(trans('file.Paid By')); ?></th>
                            </tr>
                          </thead>
                          <tbody>
                            <?php $__currentLoopData = $recent_payment; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $payment): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <tr>
                              <td><?php echo e(date($general_setting->date_format, strtotime($payment->created_at->toDateString()))); ?></td>
                              <td><?php echo e($payment->payment_reference); ?></td>
                              <td><?php echo e($payment->amount); ?></td>
                              <td><?php echo e($payment->paying_method); ?></td>
                            </tr>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                          </tbody>
                        </table>
                      </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-5">
              <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                  <h4><?php echo e(trans('file.Best Seller').' '.date('F')); ?></h4>
                  <div class="right-column">
                    <div class="badge badge-primary"><?php echo e(trans('file.top')); ?> 5</div>
                  </div>
                </div>
                <div class="table-responsive">
                    <table class="table">
                      <thead>
                        <tr>
                          <th>SL No</th>
                          <th><?php echo e(trans('file.Product Details')); ?></th>
                          <th><?php echo e(trans('file.qty')); ?></th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php $__currentLoopData = $best_selling_qty; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=>$sale): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <?php $product = DB::table('products')->find($sale->product_id); ?>
                        <tr>
                          <td><?php echo e($key + 1); ?></td>
                          <td><?php echo e($product->name); ?><br>[<?php echo e($product->code); ?>]</td>
                          <td><?php echo e($sale->sold_qty); ?></td>
                        </tr>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                      </tbody>
                    </table>
                  </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                  <h4><?php echo e(trans('file.Best Seller').' '.date('Y'). '('.trans('file.qty').')'); ?></h4>
                  <div class="right-column">
                    <div class="badge badge-primary"><?php echo e(trans('file.top')); ?> 5</div>
                  </div>
                </div>
                <div class="table-responsive">
                    <table class="table">
                      <thead>
                        <tr>
                          <th>SL No</th>
                          <th><?php echo e(trans('file.Product Details')); ?></th>
                          <th><?php echo e(trans('file.qty')); ?></th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php $__currentLoopData = $yearly_best_selling_qty; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $sale): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <?php $product = DB::table('products')->find($sale->product_id); ?>
                        <tr>
                          <td><?php echo e($key + 1); ?></td>
                          <td><?php echo e($product->name); ?><br>[<?php echo e($product->code); ?>]</td>
                          <td><?php echo e($sale->sold_qty); ?></td>
                        </tr>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                      </tbody>
                    </table>
                  </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                  <h4><?php echo e(trans('file.Best Seller').' '.date('Y') . '('.trans('file.price').')'); ?></h4>
                  <div class="right-column">
                    <div class="badge badge-primary"><?php echo e(trans('file.top')); ?> 5</div>
                  </div>
                </div>
                <div class="table-responsive">
                    <table class="table">
                      <thead>
                        <tr>
                          <th>SL No</th>
                          <th><?php echo e(trans('file.Product Details')); ?></th>
                          <th><?php echo e(trans('file.grand total')); ?></th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php $__currentLoopData = $yearly_best_selling_price; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $sale): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <?php $product = DB::table('products')->find($sale->product_id); ?>
                        <tr>
                          <td><?php echo e($key + 1); ?></td>
                          <td><?php echo e($product->name); ?><br>[<?php echo e($product->code); ?>]</td>
                          <td><?php echo e(number_format((float)$sale->total_price, 2, '.', '')); ?></td>
                        </tr>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                      </tbody>
                    </table>
                  </div>
              </div>
            </div>
          </div>
        </div>
      </section>

<script>

    function drawNewCashFlowGraph(month,payment_recieved,payment_sent){
        if(!(month||payment_recieved||payment_sent)){
            alert("No data available");
        }else{
            var brandPrimary;
            var brandPrimaryRgba;

            // ------------------------------------------------------- //
            // Line Chart
            // ------------------------------------------------------ //
            var CASHFLOW = $("#cashFlow");
            if (CASHFLOW.length > 0) {
                var recieved = payment_recieved;
                brandPrimary = CASHFLOW.data("color");
                brandPrimaryRgba = CASHFLOW.data("color_rgba");
                var sent = payment_sent;
                var month = month;
                var label1 = CASHFLOW.data("label1");
                var label2 = CASHFLOW.data("label2");
                var cashFlow_chart = new Chart(CASHFLOW, {
                    type: "line",
                    data: {
                        labels: [
                            month[0],
                            month[1],
                            month[2],
                            month[3],
                            month[4],
                            month[5],
                            month[6],
                        ],
                        datasets: [
                            {
                                label: label1,
                                fill: true,
                                lineTension: 0.3,
                                backgroundColor: "transparent",
                                borderColor: brandPrimary,
                                borderCapStyle: "butt",
                                borderDash: [],
                                borderDashOffset: 0.0,
                                borderJoinStyle: "miter",
                                borderWidth: 3,
                                pointBorderColor: brandPrimary,
                                pointBackgroundColor: "#fff",
                                pointBorderWidth: 5,
                                pointHoverRadius: 5,
                                pointHoverBackgroundColor: brandPrimary,
                                pointHoverBorderColor: "rgba(220,220,220,1)",
                                pointHoverBorderWidth: 2,
                                pointRadius: 1,
                                pointHitRadius: 10,
                                data: [
                                    recieved[0],
                                    recieved[1],
                                    recieved[2],
                                    recieved[3],
                                    recieved[4],
                                    recieved[5],
                                    recieved[6],
                                ],
                                spanGaps: false,
                            },
                            {
                                label: label2,
                                fill: true,
                                lineTension: 0.3,
                                backgroundColor: "transparent",
                                borderColor: "rgba(255, 137, 82, 1)",
                                borderCapStyle: "butt",
                                borderDash: [],
                                borderDashOffset: 0.0,
                                borderJoinStyle: "miter",
                                borderWidth: 3,
                                pointBorderColor: "#ff8952",
                                pointBackgroundColor: "#fff",
                                pointBorderWidth: 5,
                                pointHoverRadius: 5,
                                pointHoverBackgroundColor: "#ff8952",
                                pointHoverBorderColor: "rgba(220,220,220,1)",
                                pointHoverBorderWidth: 2,
                                pointRadius: 1,
                                pointHitRadius: 10,
                                data: [
                                    sent[0],
                                    sent[1],
                                    sent[2],
                                    sent[3],
                                    sent[4],
                                    sent[5],
                                    sent[6],
                                ],
                                spanGaps: false,
                            },
                        ],
                    },
                });
            }

        }
    }

    function drawNewPieChart(revenue,purchase,expense) {
        if(!(revenue||purchase||expense)){
            alert("No data available");
        }else{
          var brandPrimary;
          var brandPrimaryRgba;
          var TRANSACTIONCHART = $("#transactionChart");
          if (TRANSACTIONCHART.length > 0) {
              brandPrimary = TRANSACTIONCHART.data("color");
              brandPrimaryRgba = TRANSACTIONCHART.data("color_rgba");
              var revenue = revenue;
              var purchase = purchase;
              var expense = expense;
              var label1 = TRANSACTIONCHART.data("label1");
              var label2 = TRANSACTIONCHART.data("label2");
              var label3 = TRANSACTIONCHART.data("label3");
              var myTransactionChart = new Chart(TRANSACTIONCHART, {
                  type: "doughnut",
                  data: {
                      labels: [label1, label2, label3],
                      datasets: [
                          {
                              data: [purchase, revenue, expense],
                              borderWidth: [1, 1, 1],
                              backgroundColor: [brandPrimary, "#ff8952", "#858c85"],
                              hoverBackgroundColor: [
                                  brandPrimaryRgba,
                                  "rgba(255, 137, 82, 0.8)",
                                  "rgb(133, 140, 133, 0.8)",
                              ],
                              hoverBorderWidth: [4, 4, 4],
                              hoverBorderColor: [
                                  brandPrimaryRgba,
                                  "rgba(255, 137, 82, 0.8)",
                                  "rgb(133, 140, 133, 0.8)",
                              ],
                          },
                      ],
                  },
              });
          }
        }

    }
    function pieChartFilter(){
        var category_id = $('#pie_chart_category_id').val();
        var type = $('#pie_chart_type').val();

        $.ajax({
            type: "GET",
            url: "pie-chart-filter/"+category_id+"/"+type,
            data: "",
            success: function (response) {

                if(Array.isArray(response)){
                    drawNewPieChart(response[0],response[1],response[2]);
                }
            }
        });
    }
    function cashFlowFilter(){
        var category_id = $('#cash_flow_category_id').val();
        var type = $('#cash_flow_type').val();

        $.ajax({
            type: "GET",
            url: "cash-flow-filter/"+category_id+"/"+type,
            data: "",
            success: function (response) {

                if(Array.isArray(response)){
                    drawNewCashFlowGraph(response[0],response[1],response[2]);
                }
            }
        });

    }
</script>
<script type="text/javascript">
    // Show and hide color-switcher
    $(".color-switcher .switcher-button").on('click', function() {
        $(".color-switcher").toggleClass("show-color-switcher", "hide-color-switcher", 300);
    });

    // Color Skins
    $('a.color').on('click', function() {
        /*var title = $(this).attr('title');
        $('#style-colors').attr('href', 'css/skin-' + title + '.css');
        return false;*/
        $.get('setting/general_setting/change-theme/' + $(this).data('color'), function(data) {
        });
        var style_link= $('#custom-style').attr('href').replace(/([^-]*)$/, $(this).data('color') );
        $('#custom-style').attr('href', style_link);
    });

    $(".date-btn").on("click", function() {
        $(".date-btn").removeClass("active");
        $(this).addClass("active");
        var start_date = $(this).data('start_date');
        var end_date = $(this).data('end_date');
        $.get('dashboard-filter/' + start_date + '/' + end_date, function(data) {
            dashboardFilter(data);
        });
    });

    function dashboardFilter(data){
        $('.revenue-data').hide();
        $('.revenue-data').html(parseFloat(data[0]).toFixed(2));
        $('.revenue-data').show(500);

        $('.return-data').hide();
        $('.return-data').html(parseFloat(data[1]).toFixed(2));
        $('.return-data').show(500);

        $('.profit-data').hide();
        $('.profit-data').html(parseFloat(data[2]).toFixed(2));
        $('.profit-data').show(500);

        $('.purchase_return-data').hide();
        $('.purchase_return-data').html(parseFloat(data[3]).toFixed(2));
        $('.purchase_return-data').show(500);
    }
</script>
<?php $__env->stopSection(); ?>


<?php echo $__env->make('layout.main', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\xampp\htdocs\POS\resources\views/index.blade.php ENDPATH**/ ?>