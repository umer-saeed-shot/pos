<h1>Congratulation {{$name}}!</h1>.
@php
    $message = \App\EmailMessage::where('shop_owner_id',auth()->user()->id)->where('type','biller')->first();
@endphp
@if ($message !== null)
{!! html_entity_decode($message['message']) !!}
@else
    <h3>Hope that you will be dedicated and honest with your job</h3>
    <p>Thank you</p>
@endif
