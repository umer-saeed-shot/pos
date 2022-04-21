 <?php $__env->startSection('content'); ?>
<?php if(session()->has('not_permitted')): ?>
  <div class="alert alert-danger alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><?php echo e(session()->get('not_permitted')); ?></div> 
<?php endif; ?>
<section class="forms">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header d-flex align-items-center">
                        <h4><?php echo e(trans('file.Update Customer')); ?></h4>
                    </div>
                    <div class="card-body">
                        <p class="italic"><small><?php echo e(trans('file.The field labels marked with * are required input fields')); ?>.</small></p>
                        <?php echo Form::open(['route' => ['customer.update',$lims_customer_data->id], 'method' => 'put', 'files' => true]); ?>

						<?php echo csrf_field(); ?>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="hidden" name="customer_group" value="<?php echo e($lims_customer_data->customer_group_id); ?>">
                                    <label><?php echo e(trans('file.Customer Group')); ?> *</strong> </label>
                                    <select required class="form-control selectpicker" name="customer_group_id">
                                        <?php $__currentLoopData = $lims_customer_group_all; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $customer_group): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                            <option value="<?php echo e($customer_group->id); ?>"><?php echo e($customer_group->name); ?></option>
                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label><?php echo e(trans('file.name')); ?>* </strong> </label>
                                    <input type="text" required name="customer_name" value="<?php echo e($lims_customer_data->name); ?>"  class="form-control">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label><?php echo e(trans('file.Company Name')); ?> </label>
                                    <input type="text" name="company_name" value="<?php echo e($lims_customer_data->company_name); ?>" class="form-control">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label><?php echo e(trans('file.Email')); ?></label>
                                    <input type="email" name="email" value="<?php echo e($lims_customer_data->email); ?>" class="form-control">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label><?php echo e(trans('file.Phone Number')); ?> *</label>
                                    <input type="text" name="phone_number" required value="<?php echo e($lims_customer_data->phone_number); ?>" class="form-control">
                                    <?php if($errors->has('phone_number')): ?>
                                   <span>
                                       <strong><?php echo e($errors->first('phone_number')); ?></strong>
                                    </span>
                                    <?php endif; ?>
                                </div>
                            </div>
                            <!--
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label><?php echo e(trans('file.Tax Number')); ?></label>
                                    <input type="text" name="tax_no" class="form-control" value="<?php echo e($lims_customer_data->tax_no); ?>">
                                </div>
                            </div>
                            -->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label><?php echo e(trans('file.Address')); ?> </label>
                                    <input type="text" name="address" value="<?php echo e($lims_customer_data->address); ?>" class="form-control">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label><?php echo e(trans('file.City')); ?> </label>
                                    <input type="text" name="city" value="<?php echo e($lims_customer_data->city); ?>" class="form-control">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label><?php echo e(trans('file.State')); ?></label>
                                    <input type="text" name="state" value="<?php echo e($lims_customer_data->state); ?>" class="form-control">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label><?php echo e(trans('file.Postal Code')); ?></label>
                                    <input type="text" name="postal_code" value="<?php echo e($lims_customer_data->postal_code); ?>" class="form-control">
                                </div>
                            </div>
							<!-------------------------------->
							<!--
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label><?php echo e(trans('file.dv_le_sph')); ?> </strong> </label>
                                    <input type="text"  name="dv_le_sph"  class="form-control" value="<?php echo e($lims_customer_data->dv_le_sph); ?>" >
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label><?php echo e(trans('file.dv_le_cyl')); ?> </strong> </label>
                                    <input type="text" name="dv_le_cyl"  class="form-control" value="<?php echo e($lims_customer_data->dv_le_cyl); ?>" >
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label><?php echo e(trans('file.dv_le_axis')); ?> </strong> </label>
                                    <input type="text"  name="dv_le_axis"  class="form-control" value="<?php echo e($lims_customer_data->dv_le_axis); ?>" >
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label><?php echo e(trans('file.dv_re_sph')); ?> </strong> </label>
                                    <input type="text" id="" name="dv_re_sph"  class="form-control" value="<?php echo e($lims_customer_data->dv_re_sph); ?>" >
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label><?php echo e(trans('file.dv_re_cyl')); ?> </strong> </label>
                                    <input type="text"  name="dv_re_cyl"  class="form-control" value="<?php echo e($lims_customer_data->dv_re_cyl); ?>" >
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label><?php echo e(trans('file.dv_re_axis')); ?> </strong> </label>
                                    <input type="text"  name="dv_re_axis"  class="form-control" value="<?php echo e($lims_customer_data->dv_re_axis); ?>" >
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label><?php echo e(trans('file.nv_le_sph')); ?> </strong> </label>
                                    <input type="text"  name="nv_le_sph"  class="form-control" value="<?php echo e($lims_customer_data->nv_le_sph); ?>" >
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label><?php echo e(trans('file.nv_le_cyl')); ?> </strong> </label>
                                    <input type="text" name="nv_le_cyl"  class="form-control" value="<?php echo e($lims_customer_data->nv_le_cyl); ?>" >
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label><?php echo e(trans('file.nv_le_axis')); ?> </strong> </label>
                                    <input type="text"  name="nv_le_axis"  class="form-control" value="<?php echo e($lims_customer_data->nv_le_axis); ?>" >
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label><?php echo e(trans('file.nv_re_sph')); ?> </strong> </label>
                                    <input type="text"  name="nv_re_sph"  class="form-control" value="<?php echo e($lims_customer_data->nv_re_sph); ?>" >
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label><?php echo e(trans('file.nv_re_cyl')); ?> </strong> </label>
                                    <input type="text"  name="nv_re_cyl"  class="form-control" value="<?php echo e($lims_customer_data->nv_re_cyl); ?>" >
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label><?php echo e(trans('file.nv_re_axis')); ?> </strong> </label>
                                    <input type="text" name="nv_re_axis"  class="form-control" value="<?php echo e($lims_customer_data->nv_re_axis); ?>" >
                                </div>
                            </div>
                            -->				
							<!-------------------------------->
                            <?php if(!$lims_customer_data->user_id): ?>
                            <div class="col-md-6 mt-3">
                                <div class="form-group">
                                    <label><?php echo e(trans('file.Add User')); ?></label>&nbsp;
                                    <input type="checkbox" name="user" value="1" />
                                </div>
                            </div>
                            <?php endif; ?>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label><?php echo e(trans('file.Country')); ?></label>
                                    <input type="text" name="country" value="<?php echo e($lims_customer_data->country); ?>" class="form-control">
                                </div>
                            </div>
                            <div class="col-md-6 user-input">
                                <div class="form-group">
                                    <label><?php echo e(trans('file.UserName')); ?> *</label>
                                    <input type="text" name="name" class="form-control">
                                    <?php if($errors->has('name')): ?>
                                   <span>
                                       <strong><?php echo e($errors->first('name')); ?></strong>
                                    </span>
                                    <?php endif; ?>
                                </div>
                            </div>
                            <div class="col-md-6 user-input">
                                <div class="form-group">
                                    <label><?php echo e(trans('file.Password')); ?> *</label>
                                    <input type="password" name="password" class="form-control">
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group mt-3">
                                    <input type="submit" value="<?php echo e(trans('file.submit')); ?>" class="btn btn-primary">
                                </div>
                            </div>
                        </div>
                        <?php echo Form::close(); ?>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script type="text/javascript">

    $("ul#people").siblings('a').attr('aria-expanded','true');
    $("ul#people").addClass("show");

    $(".user-input").hide();

    $('input[name="user"]').on('change', function() {
        if ($(this).is(':checked')) {
            $('.user-input').show(300);
            $('input[name="name"]').prop('required',true);
            $('input[name="password"]').prop('required',true);
        }
        else{
            $('.user-input').hide(300);
            $('input[name="name"]').prop('required',false);
            $('input[name="password"]').prop('required',false);
        }
    });
        
    var customer_group = $("input[name='customer_group']").val();
    $('select[name=customer_group_id]').val(customer_group);
</script>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layout.main', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/editingteam/public_html/pos/resources/views/customer/edit.blade.php ENDPATH**/ ?>