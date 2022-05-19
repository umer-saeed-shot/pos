<h1>Your Username : <?php echo e($name); ?></h1>
<h1>Your Password : <?php echo e($password); ?></h1>

<?php
    $message = \App\EmailMessage::where('shop_owner_id',auth()->user()->id)->where('type','user_details')->first();
?>
<?php if($message !== null): ?>
<?php echo html_entity_decode($message['message']); ?>


<?php endif; ?>
<?php /**PATH C:\xampp\htdocs\POS\resources\views/mail/user_details.blade.php ENDPATH**/ ?>