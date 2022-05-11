<h1>Hey {{$name}}!</h1>
<h3>{{$amount}} {{$general_setting->currency}} has successfully recharged in your account.</h3>
<p>Your current balance is: {{$balance}}</p>
@php
    $message = \App\EmailMessage::where('shop_owner_id',auth()->user()->id)->where('type','customer_deposit')->first();
@endphp
@if ($message !== null)
{!! html_entity_decode($message['message']) !!}
@else
<p>Thank you</p>
@endif
