<h1>Welcome {{$name}}!</h1>
@php
    $message = \App\EmailMessage::where('shop_owner_id',auth()->user()->id)->where('type','customer')->first();
@endphp
@if ($message !== null)
{!! html_entity_decode($message['message']) !!}
@else
<p>You are now part of a nationwide family of repair stores! Visit <a href="911gadgets.com">911gadgets.com</a> to find a location nearby when you are away from your home store.</p>
<p>Thank you!</p>
@endif
