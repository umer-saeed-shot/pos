<h1>Hey {{$name}}!</h1>
<p>Reference No: {{$reference_no}}</p>
<p>Your payroll is: {{$amount}} {{$general_setting->currency}}</p>
@php
    $message = \App\EmailMessage::where('shop_owner_id',auth()->user()->id)->where('type','payroll_details')->first();
@endphp
@if ($message !== null)
{!! html_entity_decode($message['message']) !!}
@else
<p>Thank you</p>
@endif
