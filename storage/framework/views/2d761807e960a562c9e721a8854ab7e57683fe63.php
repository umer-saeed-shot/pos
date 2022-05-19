<h1>Welcome <?php echo e($name); ?>!</h1>
<?php
    $message = \App\EmailMessage::where('shop_owner_id',auth()->user()->id)->where('type','customer')->first();
?>
<?php if($message !== null): ?>
<?php echo html_entity_decode($message['message']); ?>

<?php else: ?>
<p>You are now part of a nationwide family of repair stores! Visit <a href="911gadgets.com">911gadgets.com</a> to find a location nearby when you are away from your home store.</p>
<p>Thank you!</p>
<?php endif; ?>
<?php /**PATH C:\xampp\htdocs\POS\resources\views/mail/customer_create.blade.php ENDPATH**/ ?>