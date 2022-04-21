<h1>Payment Details</h1>
<p><strong>Sale Reference: </strong>{{$sale_reference}}</p>
<p><strong>Payment Reference: </strong>{{$payment_reference}}</p>
<p><strong>Payment Method: </strong>{{$payment_method}}</p>
<p><strong>Grand Total: </strong>{{$grand_total}} {{$general_setting->currency}}</p>
<p><strong>Paid Amount: </strong>{{$paid_amount}} {{$general_setting->currency}}</p>
<p><strong>Due: </strong>{{number_format((float)($grand_total - $paid_amount), 2, '.', '')}} {{$general_setting->currency}}</p>
@php
    $message = \App\EmailMessage::where('shop_owner_id',auth()->user()->id)->where('type','payment_details')->first();
@endphp
@if ($message !== null)
{!! html_entity_decode($message['message']) !!}
@else
<p>Thank you</p>
@endif
