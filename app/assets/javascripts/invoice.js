$("#invoice_total").on('change', function(){
	var invoice_total = $('#invoice_total').val();
	$.(get "invoices", function(){
			alert("success");
	});
});