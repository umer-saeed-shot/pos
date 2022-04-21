 <?php $__env->startSection('content'); ?>

<?php if(session()->has('message')): ?>
  <div class="alert alert-success alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><?php echo e(session()->get('message')); ?></div>
<?php endif; ?>
<?php if($errors->any()): ?>
<?php $__currentLoopData = $errors->all(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $error): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
<div class="alert alert-warning alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><?php echo e($error); ?></div>
<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
<?php endif; ?>


<?php if(session()->has('not_permitted')): ?>
  <div class="alert alert-danger alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><?php echo e(session()->get('not_permitted')); ?></div>
<?php endif; ?>
<section class="forms">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header d-flex align-items-center">
                        <h4>Shop Logo</h4>
                    </div>
                    <div class="card-body">

                            <div class="col-md-12">
                                <label for="">Current Logo :</label>
                            </div>
                            <div class="col-md-12">
                                <?php if($table == null): ?>
                                    <img src="<?php echo e(URL::asset('/public/img/logo/no-logo.png')); ?>" class="img-rounded" alt="Shop Logo" style="width:250px;height:300px">
                                <?php else: ?>
                                    <img src="<?php echo e(URL::asset('/public/img/logo/'.$table['image'])); ?>" class="img-rounded" alt="Shop Logo" style="width:250px;height:300px">
                                <?php endif; ?>
                            </div>

                        <?php echo Form::open(['route' => 'setting.uploadlogo', 'files' => true, 'method' => 'post']); ?>

                            <div class="row">

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Image*</label>
                                        <input type="file" name="image" id="image" class="form-control"  required />
                                    </div>
                                </div>
                                <div class="col-md-6 ">
                                    <button type="submit" class="btn btn-primary"><?php echo e(trans('file.submit')); ?></button>
                                </div>
                            </div>
                        <?php echo Form::close(); ?>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<?php $__env->stopSection(); ?>

<?php echo $__env->make('layout.main', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\xampp\htdocs\POS\resources\views/setting/logo_setting.blade.php ENDPATH**/ ?>