<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="icon" type="image/png" href="<?php echo e(url('public/logo', $general_setting->site_logo)); ?>" />
    <title><?php echo e($general_setting->site_title); ?></title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">

    <style type="text/css">
    .btn-info {
        background-color: #cf2029;
        color: #FFF;
    }
    .btn-info:hover {
        background-color: transparent;
        border: 2px solid #cf2029;
        color: #cf2029;
    }
	.syedsons {
		border:1px solid; text-align:center; padding:0px; font-size:8px;
	}

        * {
            font-size: 14px;
            line-height: 24px;
            font-family: 'Ubuntu', sans-serif;
            text-transform: capitalize;
        }
        .btn {
            padding: 7px 10px;
            text-decoration: none;
            border: none;
            display: block;
            text-align: center;
            margin: 7px;
            cursor:pointer;
        }

        .btn-info {

        }

        .btn-primary {
            background-color: #6449e7;
            color: #FFF;
            width: 100%;
        }
        td,
        th,
        tr,
        table {
            border-collapse: collapse;
        }
        tr {border-bottom: 1px dotted #ddd;}
        td,th {padding: 7px 0;width: 50%;}

        table {width: 100%;}
        tfoot tr th:first-child {text-align: left;}

        .centered {
            text-align: center;
            align-content: center;
        }
        .greeting { text-transform: none; }
        small{font-size:11px;}

        @media  print {
            * {
                font-size:12px;
                line-height: 20px;
            }
            td,th {padding: 5px 0;}
            .hidden-print {
                display: none !important;
            }
            @page  { margin: 0; } body { margin: 0.5cm; margin-bottom:1.6cm; }
        }

		.syed td{width:14.289%;}
    </style>
  </head>
<body>
<?php //echo '<pre>'; print_r( $lims_sale_data); exit;?>
<div style="max-width:400px;margin:0 auto">
    <?php if(preg_match('~[0-9]~', url()->previous())): ?>
        <?php $url = '../../pos'; ?>
    <?php else: ?>
        <?php $url = url()->previous(); ?>
    <?php endif; ?>
    <div class="hidden-print">
        <table>
            <tr>
                <td><a href="<?php echo e($url); ?>" class="btn btn-info"><i class="fa fa-arrow-left"></i> <?php echo e(trans('file.Back')); ?></a> </td>
                <td><button onClick="window.print();" class="btn btn-primary"><i class="dripicons-print"></i> <?php echo e(trans('file.Print')); ?></button></td>
            </tr>
        </table>
        <br>
    </div>

    <div id="receipt-data">
        <div class="centered">
            <?php if($general_setting->site_logo): ?>
                <img src="<?php echo e(url('public/img/logo/', $logo)); ?>" height="60" width="60" style="margin:10px 0;">
            <?php endif; ?>

            <h2><?php echo e($lims_biller_data->company_name); ?></h2>

            <p>Address: <?php echo e($lims_warehouse_data->address); ?>


                <br>Phone Number: <?php echo e($lims_warehouse_data->phone); ?><br>
            </p>


        </div>
        <p>Date: <?php echo e($lims_sale_data->updated_at); ?><br>
            Reference: <?php echo e($lims_sale_data->reference_no); ?><br>
            Customer: <?php echo e($lims_customer_data->name); ?>

        </p>

        <table>
            <tbody>
                <?php $total_product_tax = 0; ?>
                <?php $__currentLoopData = $lims_product_sale_data; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product_sale_data): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <?php
                    $lims_product_data = \App\Product::find($product_sale_data->product_id);
                    if($product_sale_data->variant_id) {
                        $variant_data = \App\Variant::find($product_sale_data->variant_id);
                        $product_name = $lims_product_data->name.' ['.$variant_data->name.']';
                    }
                    else
                        $product_name = $lims_product_data->name;
                ?>
                <tr>
                    <td colspan="2">
                        <?php echo e($product_name); ?>

                        <br><?php echo e($product_sale_data->qty); ?> x <?php echo e(number_format((float)($product_sale_data->total / $product_sale_data->qty), 2, '.', '')); ?>


                        <?php if($product_sale_data->tax_rate): ?>
                            <?php $total_product_tax += $product_sale_data->tax ?>
                            [<?php echo e(trans('file.Tax')); ?> (<?php echo e($product_sale_data->tax_rate); ?>%): <?php echo e($product_sale_data->tax); ?>]
                        <?php endif; ?>
                    </td>
                    <td style="text-align:right;vertical-align:bottom"><?php echo e(number_format((float)$product_sale_data->total, 2, '.', '')); ?></td>
                </tr>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </tbody>
            <tfoot>
                <tr>
                    <th colspan="2"><?php echo e(trans('file.Total')); ?> (<?php echo e(auth()->user()->currency); ?>)</th>
                    <th style="text-align:right"><?php echo e(number_format((float)$lims_sale_data->total_price, 2, '.', '')); ?></th>
                </tr>
                <?php if($general_setting->invoice_format == 'gst' && $general_setting->state == 1): ?>
                <tr>
                    <td colspan="2">IGST (<?php echo e(auth()->user()->currency); ?>)</td>
                    <td style="text-align:right"><?php echo e(number_format((float)$total_product_tax, 2, '.', '')); ?></td>
                </tr>
                <?php elseif($general_setting->invoice_format == 'gst' && $general_setting->state == 2): ?>
                <tr>
                    <td colspan="2">SGST (<?php echo e(auth()->user()->currency); ?>)</td>
                    <td style="text-align:right"><?php echo e(number_format((float)($total_product_tax / 2), 2, '.', '')); ?></td>
                </tr>
                <tr>
                    <td colspan="2">CGST (<?php echo e(auth()->user()->currency); ?>)</td>
                    <td style="text-align:right"><?php echo e(number_format((float)($total_product_tax / 2), 2, '.', '')); ?></td>
                </tr>
                <?php endif; ?>
                <?php if($lims_sale_data->order_tax): ?>
                <tr>
                    <th colspan="2"><?php echo e(trans('file.Order Tax')); ?> (<?php echo e(auth()->user()->currency); ?>)</th>
                    <th style="text-align:right"><?php echo e(number_format((float)$lims_sale_data->order_tax, 2, '.', '')); ?></th>
                </tr>
                <?php endif; ?>
                <?php if($lims_sale_data->order_discount): ?>
                <tr>
                    <th colspan="2"><?php echo e(trans('file.Order Discount')); ?> (<?php echo e(auth()->user()->currency); ?>)</th>
                    <th style="text-align:right"><?php echo e(number_format((float)$lims_sale_data->order_discount, 2, '.', '')); ?></th>
                </tr>
                <?php endif; ?>
                <?php if($lims_sale_data->coupon_discount): ?>
                <tr>
                    <th colspan="2"><?php echo e(trans('file.Coupon Discount')); ?> (<?php echo e(auth()->user()->currency); ?>)</th>
                    <th style="text-align:right"><?php echo e(number_format((float)$lims_sale_data->coupon_discount, 2, '.', '')); ?></th>
                </tr>
                <?php endif; ?>
                <?php if($lims_sale_data->shipping_cost): ?>
                <tr>
                    <th colspan="2"><?php echo e(trans('file.Shipping Cost')); ?> (<?php echo e(auth()->user()->currency); ?>)</th>
                    <th style="text-align:right"><?php echo e(number_format((float)$lims_sale_data->shipping_cost, 2, '.', '')); ?></th>
                </tr>
                <?php endif; ?>
                <tr>
                    <th colspan="2"><?php echo e(trans('file.grand total')); ?> (<?php echo e(auth()->user()->currency); ?>)</th>
                    <th style="text-align:right"><?php echo e(number_format((float)$lims_sale_data->grand_total, 2, '.', '')); ?></th>
                </tr>
                <tr>
                    <th colspan="2">Dues (<?php echo e(auth()->user()->currency); ?>)</th>
                    <th style="text-align:right"><?php echo e(number_format((float)$lims_sale_data->grand_total - $lims_sale_data->paid_amount , 2, '.', '')); ?></th>
                </tr>
                <!--
                <tr>
                    <?php if($general_setting->currency_position == 'prefix'): ?>
                    <th class="centered" colspan="3"><?php echo e(trans('file.In Words')); ?>: <span><?php echo e($currency->code); ?></span> <span><?php echo e(str_replace("-"," ",$numberInWords)); ?></span></th>
                    <?php else: ?>
                    <th class="centered" colspan="3"><?php echo e(trans('file.In Words')); ?>: <span><?php echo e(str_replace("-"," ",$numberInWords)); ?></span> <span><?php echo e($currency->code); ?></span></th>
                    <?php endif; ?>
                </tr>-->
            </tfoot>
        </table>
        <table>
            <tbody>
                <h3>Payment Breakdown :</h3>
                <?php $__currentLoopData = $lims_payment_data; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $payment_data): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <tr style="background-color:#ddd;">
                    <td style="padding: 5px;width:30%"><?php echo e(trans('file.Paid By')); ?>: <?php echo e($payment_data->paying_method); ?></td>
                    <td style="padding: 5px;width:40%"><?php echo e(trans('file.Amount')); ?> (<?php echo e(auth()->user()->currency); ?>): <?php echo e(number_format((float)$payment_data->amount, 2, '.', '')); ?></td>
                    <td style="padding: 5px;width:30%"><?php echo e(trans('file.Change')); ?> (<?php echo e(auth()->user()->currency); ?>): <?php echo e(number_format((float)$payment_data->change, 2, '.', '')); ?></td>
                </tr>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                <tr><td><h3>Sale Note</h3></td></tr>
                <tr style="background-color:#ddd;"><td colspan="3" style="padding: 5px"><?php echo e($lims_sale_data->sale_note); ?></td></tr>
                <tr><td class="centered greeting" colspan="3"><?php echo e('Thank you for visiting! Please consider leaving a review on Google Maps, and clicking the "Check-in" button on YELP!'); ?></td></tr>
                <tr>
                    <td class="centered" colspan="3">
                    <?php echo '<img style="margin-top:10px;" src="data:image/png;base64,' . DNS1D::getBarcodePNG($lims_sale_data->reference_no, 'C128') . '" width="300" alt="barcode"   />';?>
                    <br>
                    <?php echo '<img style="margin-top:10px;" src="data:image/png;base64,' . DNS2D::getBarcodePNG($lims_sale_data->reference_no, 'QRCODE') . '" alt="barcode"   />';?>
                    </td>
                </tr>
            </tbody>
        </table>
        <!-- <div class="centered" style="margin:30px 0 50px">
            <small><?php echo e(trans('file.Invoice Generated By')); ?> <?php echo e($general_setting->site_title); ?>.
            <?php echo e(trans('file.Developed By')); ?> LionCoders</strong></small>
        </div> -->
    </div>
</div>



</body>
</html>
<?php /**PATH C:\xampp\htdocs\POS\resources\views/sale/invoice.blade.php ENDPATH**/ ?>