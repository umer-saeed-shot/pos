<h1>Congratulation {{$name}}!</h1>
@php
    $message = \App\EmailMessage::where('shop_owner_id',auth()->user()->id)->where('type','holiday_approve')->first();
@endphp
@if ($message !== null)
{!! html_entity_decode($message['message']) !!}
@else
<h3>Your requested holiday has just approved.</h3>
<p>Thank you</p>
@endif

