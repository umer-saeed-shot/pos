<h1>Welcome to POS System</h1>
<h3>You are added to our system by {{ auth()->user()->name }}</h3>
@php
    $message = \App\EmailMessage::where('shop_owner_id',auth()->user()->id)->where('type','welcome_customer')->first();
@endphp
@if ($message !== null)
{!! html_entity_decode($message['message']) !!}
@else
<p>Thank you</p>
@endif

