<h1>Delivery Details</h1>
<h3>Dear {{$customer}},</h3>
@if($status == 2)
	<p>Your Product is Delivering.</p>
@else
	<p>Your Product is Delivered.</p>
@endif
<p><strong>Sale Reference: </strong>{{$sale_reference}}</p>
<p><strong>Delivery Reference: </strong>{{$delivery_reference}}</p>
<p><strong>Destination: </strong>{{$address}}</p>
@if($delivered_by)
<p><strong>Delivered By: </strong>{{$delivered_by}}</p>
@endif
@php
    $message = \App\EmailMessage::where('shop_owner_id',auth()->user()->id)->where('type','delivery_details')->first();
@endphp
@if ($message !== null)
{!! html_entity_decode($message['message']) !!}
@else
<p>Thank You</p>
@endif
