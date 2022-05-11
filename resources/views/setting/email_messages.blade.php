@extends('layout.main') @section('content')
@if(session()->has('message'))
  <div class="alert alert-success alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ session()->get('message') }}</div>
@endif
@if(session()->has('not_permitted'))
  <div class="alert alert-danger alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{!! session()->get('not_permitted') !!}</div>
@endif
<section class="forms">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header d-flex align-items-center">
                        <h4>Create Email Messages</h4>
                    </div>
                    <div class="card-body">
                        <p class="italic"><small>This message will be added at the end of the email.</small></p>
                        {!! Form::open(['route' => 'setting.email-messages', 'method' => 'post']) !!}
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <select name="type" class="form-control" onchange="getMessage(this.value)">
                                            <option value="null">Choose Email Type</option>
                                            <option value="biller">Biller Created</option>
                                            <option value="customer">Customer Created</option>
                                            <option value="customer_deposit">Customer Deposit</option>
                                            <option value="delivery_challan">Delivery Challan</option>
                                            <option value="delivery_details">Delivery Details</option>
                                            <option value="holiday_approve">Holiday Approved</option>
                                            <option value="payment_details">Payment Details</option>
                                            <option value="payroll_details">Payroll Details</option>
                                            <option value="quotation_details">Quotation Details</option>
                                            <option value="return_details">Return Details</option>
                                            <option value="sale_details">Sale Details</option>
                                            <option value="saleheld_details">Sale Held Details</option>
                                            <option value="stockalert">Stock Alert</option>
                                            <option value="supplier_create">Supplier Created</option>
                                            <option value="user_details">User Details</option>
                                            <option value="welcome_customer">Welcome Customer</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Write your message *</label>
                                        <textarea name="message" id='message' class="form-control" cols="30" rows="10"></textarea>
                                    </div>

                                    <div class="form-group">
                                        <button type="submit" class="btn btn-primary"><i class="fa fa-paper-plane"></i> Create/Edit</button>
                                    </div>
                                </div>
                            </div>
                        {!! Form::close() !!}
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header d-flex align-items-center">
                        <h4>Email Messages List</h4>
                    </div>
                    <div class="card-body">
                        <table class="table">
                            <thead>
                                <th>Type</th>
                                <th>Message</th>
                                <th>Delete</th>
                            </thead>
                            <tbody>
                                @foreach ($table as $message)
                                    <tr>
                                        <td>{{ $message->type }}</td>
                                        <td>{{ $message->message }}</td>
                                        <td><a href="{{ route('email-message.delete',$message->id) }}" onclick="return confirm('Are you sure?')" class="btn btn-danger btn-sm"><i class="dripicons-cross"></i></a></td>
                                    </tr>
                                @endforeach

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script>


    tinymce.init({
      selector: 'textarea',
      height: 130,
      plugins: [
        'advlist autolink lists link image charmap print preview anchor textcolor',
        'searchreplace visualblocks code fullscreen',
        'insertdatetime media table contextmenu paste code wordcount'
      ],
      toolbar: 'insert | undo redo |  formatselect | bold italic backcolor  | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | removeformat',
      branding:false
    });
</script>
@endsection
