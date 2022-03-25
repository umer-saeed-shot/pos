<h1>Stock Alert Details</h1>

<h3>Following Products Are On Low Stock</h3>
<table style="border-collapse: collapse; width: 100%;">
	<thead>
		<th style="border: 1px solid #000; padding: 5px">#</th>
		<th style="border: 1px solid #000; padding: 5px">Product Name</th>
		<th style="border: 1px solid #000; padding: 5px">Code</th>
		<th style="border: 1px solid #000; padding: 5px">Qty</th>
		<th style="border: 1px solid #000; padding: 5px">Alert Qty</th>

	</thead>
	<tbody>
		@foreach($products as $key=>$product)
		<tr>
			<td style="border: 1px solid #000; padding: 5px">{{$key+1}}</td>
			<td style="border: 1px solid #000; padding: 5px">{{$product->name}}</td>
			<td style="border: 1px solid #000; padding: 5px">{{ $product->code }}</td>
		    <td style="border: 1px solid #000; padding: 5px">{{ $product->qty }}</td>
			<td style="border: 1px solid #000; padding: 5px">{{$product->alert_quantity}}</td>

		</tr>
		@endforeach

	</tbody>
</table>
<p>Thank you for visiting! Please consider leaving a review on Google Maps, and clicking the "Check-in" button on YELP!</p>
<p>Thank You</p>
