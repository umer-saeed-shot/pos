<h1>Your Username : {{$name}}</h1>
<h1>Your Password : {{$password}}</h1>

@php
    $message = \App\EmailMessage::where('shop_owner_id',auth()->user()->id)->where('type','user_details')->first();
@endphp
@if ($message !== null)
{!! html_entity_decode($message['message']) !!}

@endif
