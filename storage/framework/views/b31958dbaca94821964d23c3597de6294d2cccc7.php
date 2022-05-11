<h1>Stock Alert Details</h1>

<h3>Following Products Are On Low Stock</h3>
<table style="border-collapse: collapse; width: 100%;">
	<thead>
		<th style="border: 1px solid #000; padding: 5px">#</th>
		<th style="border: 1px solid #000; padding: 5px">Product Name</th>
		<th style="border: 1px solid #000; padding: 5px">Code</th>
		<th style="border: 1px solid #000; padding: 5px">Qty</th>
		<th style="border: 1px solid #000; padding: 5px">Alert Qty</th>

	</thead>
	<tbody>
		<?php $__currentLoopData = $products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=>$product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
		<tr>
			<td style="border: 1px solid #000; padding: 5px"><?php echo e($key+1); ?></td>
			<td style="border: 1px solid #000; padding: 5px"><?php echo e($product->name); ?></td>
			<td style="border: 1px solid #000; padding: 5px"><?php echo e($product->code); ?></td>
		    <td style="border: 1px solid #000; padding: 5px"><?php echo e($product->qty); ?></td>
			<td style="border: 1px solid #000; padding: 5px"><?php echo e($product->alert_quantity); ?></td>

		</tr>
		<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

	</tbody>
</table>
<?php
    $message = \App\EmailMessage::where('shop_owner_id',auth()->user()->id)->where('type','stockalert')->first();
?>
<?php if($message !== null): ?>
<?php echo html_entity_decode($message['message']); ?>

<?php else: ?>
<p>Thank you for visiting! Please consider leaving a review on Google Maps, and clicking the "Check-in" button on YELP!</p>
<p>Thank You</p>
<?php endif; ?>
<?php /**PATH C:\xampp\htdocs\POS\resources\views/mail/stock_alert.blade.php ENDPATH**/ ?>