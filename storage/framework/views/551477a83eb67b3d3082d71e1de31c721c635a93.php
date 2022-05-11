<h1>Sale Hold Details</h1>
<p><strong>Name: </strong><?php echo e($name); ?>!</p>
<p><strong>Reference: </strong><?php echo e($reference_no); ?></p>
<p>
	<strong>Sale Status: </strong>
	<?php if($sale_status==1): ?><?php echo e('Completed'); ?>

	<?php elseif($sale_status==2): ?><?php echo e('Pending'); ?>

	<?php elseif($sale_status==3): ?><?php echo e('Hold'); ?>

	<?php endif; ?>
</p>
<p>
	<strong>Payment Status: </strong>
	<?php if($payment_status==1): ?><?php echo e('Pending'); ?>

	<?php elseif($payment_status==2): ?><?php echo e('Due'); ?>

	<?php elseif($payment_status==3): ?><?php echo e('Partial'); ?>

	<?php else: ?><?php echo e('Paid'); ?><?php endif; ?>
</p>
<h3>Order Table</h3>
<table style="border-collapse: collapse; width: 100%;">
	<thead>
		<th style="border: 1px solid #000; padding: 5px">#</th>
		<th style="border: 1px solid #000; padding: 5px">Product</th>
		<th style="border: 1px solid #000; padding: 5px">Download Link</th>
		<th style="border: 1px solid #000; padding: 5px">Qty</th>
		<th style="border: 1px solid #000; padding: 5px">Unit Price</th>
		<th style="border: 1px solid #000; padding: 5px">SubTotal</th>
	</thead>
	<tbody>
		<?php $__currentLoopData = $products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=>$product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
		<tr>
			<td style="border: 1px solid #000; padding: 5px"><?php echo e($key+1); ?></td>
			<td style="border: 1px solid #000; padding: 5px"><?php echo e($product); ?></td>
			<?php if($file[$key]): ?>
				<td style="border: 1px solid #000; padding: 5px"><a href="<?php echo e($file[$key]); ?>">Download</a></td>
			<?php else: ?>
				<td style="border: 1px solid #000; padding: 5px">N/A</td>
			<?php endif; ?>
			<td style="border: 1px solid #000; padding: 5px"><?php echo e($qty[$key].' '.$unit[$key]); ?></td>
			<td style="border: 1px solid #000; padding: 5px"><?php echo e(number_format((float)($total[$key] / $qty[$key]), 2, '.', '')); ?></td>
			<td style="border: 1px solid #000; padding: 5px"><?php echo e($total[$key]); ?></td>
		</tr>
		<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
		<tr>
			<td colspan="3" style="border: 1px solid #000; padding: 5px"><strong>Total </strong></td>
			<td style="border: 1px solid #000; padding: 5px"><?php echo e($total_qty); ?></td>
			<td style="border: 1px solid #000; padding: 5px"></td>
			<td style="border: 1px solid #000; padding: 5px"><?php echo e($total_price); ?></td>
		</tr>
		<tr>
			<td colspan="5" style="border: 1px solid #000; padding: 5px"><strong>Order Tax </strong> </td>
			<td style="border: 1px solid #000; padding: 5px"><?php echo e($order_tax.'('.$order_tax_rate.'%)'); ?></td>
		</tr>
		<tr>
			<td colspan="5" style="border: 1px solid #000; padding: 5px"><strong>Order discount </strong> </td>
			<td style="border: 1px solid #000; padding: 5px">
				<?php if($order_discount): ?><?php echo e($order_discount); ?>

				<?php else: ?> 0 <?php endif; ?>
			</td>
		</tr>
		<tr>
			<td colspan="5" style="border: 1px solid #000; padding: 5px"><strong>Shipping Cost</strong> </td>
			<td style="border: 1px solid #000; padding: 5px">
				<?php if($shipping_cost): ?><?php echo e($shipping_cost); ?>

				<?php else: ?> 0 <?php endif; ?>
			</td>
		</tr>
		<tr>
			<td colspan="5" style="border: 1px solid #000; padding: 5px"><strong>Grand Total</strong></td>
			<td style="border: 1px solid #000; padding: 5px"><?php echo e($grand_total); ?></td>
		</tr>
		<tr>
			<td colspan="5" style="border: 1px solid #000; padding: 5px"><strong>Paid Amount</strong></td>
			<td style="border: 1px solid #000; padding: 5px">
				<?php if($paid_amount): ?><?php echo e($paid_amount); ?>

				<?php else: ?> 0 <?php endif; ?>
			</td>
		</tr>
		<tr>
			<td colspan="5" style="border: 1px solid #000; padding: 5px"><strong>Due</strong></td>
			<td style="border: 1px solid #000; padding: 5px"><?php echo e(number_format((float)($grand_total - $paid_amount), 2, '.', '')); ?></td>
		</tr>
        <tr>
			<td colspan="6" style="border: 1px solid #000; padding: 5px;text-align:center"><strong>Payment Breakdown:</strong></td>

		</tr>
        <?php if($cash_amount !== null): ?>
        <tr>
			<td colspan="5" style="border: 1px solid #000; padding: 5px"><strong>Cash Amount</strong></td>
			<td style="border: 1px solid #000; padding: 5px"><?php echo e(number_format((float)($cash_amount), 2, '.', '')); ?></td>
		</tr>
        <?php endif; ?>
        <?php if($card_amount !== null): ?>
        <tr>
			<td colspan="5" style="border: 1px solid #000; padding: 5px"><strong>Card Amount</strong></td>
			<td style="border: 1px solid #000; padding: 5px"><?php echo e(number_format((float)($card_amount), 2, '.', '')); ?></td>
		</tr>
        <?php endif; ?>
        <?php if($cheque_amount !== null): ?>
        <tr>
			<td colspan="5" style="border: 1px solid #000; padding: 5px"><strong>Check Amount</strong></td>
			<td style="border: 1px solid #000; padding: 5px"><?php echo e(number_format((float)($cheque_amount), 2, '.', '')); ?></td>
		</tr>
        <?php endif; ?>
        <?php if($e_transfer_amount !== null): ?>
        <tr>
			<td colspan="5" style="border: 1px solid #000; padding: 5px"><strong>E-Transfer Amount</strong></td>
			<td style="border: 1px solid #000; padding: 5px"><?php echo e(number_format((float)($e_transfer_amount), 2, '.', '')); ?></td>
		</tr>
        <?php endif; ?>
        <tr>
			<td colspan="2" style="border: 1px solid #000; padding: 5px"><strong>Sale Note</strong></td>
			<td colspan="4" style="border: 1px solid #000; padding: 5px"><?php echo e($sale_note); ?></td>
		</tr>
	</tbody>
</table>
<?php
    $message = \App\EmailMessage::where('shop_owner_id',auth()->user()->id)->where('type','saleheld_details')->first();
?>
<?php if($message !== null): ?>
<?php echo html_entity_decode($message['message']); ?>

<?php else: ?>
<p>Thank you for visiting! Please consider leaving a review on Google Maps, and clicking the "Check-in" button on YELP!</p>
<p>Thank You</p>
<?php endif; ?>
<?php /**PATH C:\xampp\htdocs\POS\resources\views/mail/saleheld_details.blade.php ENDPATH**/ ?>