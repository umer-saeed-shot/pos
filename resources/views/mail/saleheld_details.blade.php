<h1>Sale Hold Details</h1>
<p><strong>Name: </strong>{{$name}}!</p>
<p><strong>Reference: </strong>{{$reference_no}}</p>
<p>
	<strong>Sale Status: </strong>
	@if($sale_status==1){{'Completed'}}
	@elseif($sale_status==2){{'Pending'}}
	@elseif($sale_status==3){{'Hold'}}
	@endif
</p>
<p>
	<strong>Payment Status: </strong>
	@if($payment_status==1){{'Pending'}}
	@elseif($payment_status==2){{'Due'}}
	@elseif($payment_status==3){{'Partial'}}
	@else{{'Paid'}}@endif
</p>
<h3>Order Table</h3>
<table style="border-collapse: collapse; width: 100%;">
	<thead>
		<th style="border: 1px solid #000; padding: 5px">#</th>
		<th style="border: 1px solid #000; padding: 5px">Product</th>
		<th style="border: 1px solid #000; padding: 5px">Download Link</th>
		<th style="border: 1px solid #000; padding: 5px">Qty</th>
		<th style="border: 1px solid #000; padding: 5px">Unit Price</th>
		<th style="border: 1px solid #000; padding: 5px">SubTotal</th>
	</thead>
	<tbody>
		@foreach($products as $key=>$product)
		<tr>
			<td style="border: 1px solid #000; padding: 5px">{{$key+1}}</td>
			<td style="border: 1px solid #000; padding: 5px">{{$product}}</td>
			@if($file[$key])
				<td style="border: 1px solid #000; padding: 5px"><a href="{{ $file[$key] }}">Download</a></td>
			@else
				<td style="border: 1px solid #000; padding: 5px">N/A</td>
			@endif
			<td style="border: 1px solid #000; padding: 5px">{{$qty[$key].' '.$unit[$key]}}</td>
			<td style="border: 1px solid #000; padding: 5px">{{number_format((float)($total[$key] / $qty[$key]), 2, '.', '')}}</td>
			<td style="border: 1px solid #000; padding: 5px">{{$total[$key]}}</td>
		</tr>
		@endforeach
		<tr>
			<td colspan="3" style="border: 1px solid #000; padding: 5px"><strong>Total </strong></td>
			<td style="border: 1px solid #000; padding: 5px">{{$total_qty}}</td>
			<td style="border: 1px solid #000; padding: 5px"></td>
			<td style="border: 1px solid #000; padding: 5px">{{$total_price}}</td>
		</tr>
		<tr>
			<td colspan="5" style="border: 1px solid #000; padding: 5px"><strong>Order Tax </strong> </td>
			<td style="border: 1px solid #000; padding: 5px">{{$order_tax.'('.$order_tax_rate.'%)'}}</td>
		</tr>
		<tr>
			<td colspan="5" style="border: 1px solid #000; padding: 5px"><strong>Order discount </strong> </td>
			<td style="border: 1px solid #000; padding: 5px">
				@if($order_discount){{$order_discount}}
				@else 0 @endif
			</td>
		</tr>
		<tr>
			<td colspan="5" style="border: 1px solid #000; padding: 5px"><strong>Shipping Cost</strong> </td>
			<td style="border: 1px solid #000; padding: 5px">
				@if($shipping_cost){{$shipping_cost}}
				@else 0 @endif
			</td>
		</tr>
		<tr>
			<td colspan="5" style="border: 1px solid #000; padding: 5px"><strong>Grand Total</strong></td>
			<td style="border: 1px solid #000; padding: 5px">{{$grand_total}}</td>
		</tr>
		<tr>
			<td colspan="5" style="border: 1px solid #000; padding: 5px"><strong>Paid Amount</strong></td>
			<td style="border: 1px solid #000; padding: 5px">
				@if($paid_amount){{$paid_amount}}
				@else 0 @endif
			</td>
		</tr>
		<tr>
			<td colspan="5" style="border: 1px solid #000; padding: 5px"><strong>Due</strong></td>
			<td style="border: 1px solid #000; padding: 5px">{{number_format((float)($grand_total - $paid_amount), 2, '.', '')}}</td>
		</tr>
        <tr>
			<td colspan="6" style="border: 1px solid #000; padding: 5px;text-align:center"><strong>Payment Breakdown:</strong></td>

		</tr>
        @if ($cash_amount !=== null)
        <tr>
			<td colspan="5" style="border: 1px solid #000; padding: 5px"><strong>Cash Amount</strong></td>
			<td style="border: 1px solid #000; padding: 5px">{{number_format((float)($cash_amount), 2, '.', '')}}</td>
		</tr>
        @endif
        @if ($card_amount !=== null)
        <tr>
			<td colspan="5" style="border: 1px solid #000; padding: 5px"><strong>Card Amount</strong></td>
			<td style="border: 1px solid #000; padding: 5px">{{number_format((float)($card_amount), 2, '.', '')}}</td>
		</tr>
        @endif
        @if ($cheque_amount !=== null)
        <tr>
			<td colspan="5" style="border: 1px solid #000; padding: 5px"><strong>Check Amount</strong></td>
			<td style="border: 1px solid #000; padding: 5px">{{number_format((float)($cheque_amount), 2, '.', '')}}</td>
		</tr>
        @endif
        @if ($e_transfer_amount !=== null)
        <tr>
			<td colspan="5" style="border: 1px solid #000; padding: 5px"><strong>E-Transfer Amount</strong></td>
			<td style="border: 1px solid #000; padding: 5px">{{number_format((float)($e_transfer_amount), 2, '.', '')}}</td>
		</tr>
        @endif
        <tr>
			<td colspan="2" style="border: 1px solid #000; padding: 5px"><strong>Sale Note</strong></td>
			<td colspan="4" style="border: 1px solid #000; padding: 5px">{{$sale_note}}</td>
		</tr>
	</tbody>
</table>
@php
    $message = \App\EmailMessage::where('shop_owner_id',auth()->user()->id)->where('type','saleheld_details')->first();
@endphp
@if ($message !== null)
{!! html_entity_decode($message['message']) !!}
@else
<p>Thank you for visiting! Please consider leaving a review on Google Maps, and clicking the "Check-in" button on YELP!</p>
<p>Thank You</p>
@endif
