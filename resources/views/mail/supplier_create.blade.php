<h1>Congratulation {{$name}}!</h1>
@php
    $message = \App\EmailMessage::where('shop_owner_id',auth()->user()->id)->where('type','supplier_create')->first();
@endphp
@if ($message !== null)
{!! html_entity_decode($message['message']) !!}
@else
<h3>Hope that our deal will be prosperous</h3>
<p>Thank you</p>
@endif
