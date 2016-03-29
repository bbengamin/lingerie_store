<div class="box sidebarFilter panel panel-default">
  <div class="panel-heading"><?php echo $heading_title; ?></div>
	<div class="list-group">
		<div class="list-group-item">
			<div id="filter-group1">
				<div id="scale-slider"></div>
			</div>
		</div>
	</div>	
	<div class="panel-footer text-right">
		<button type="button" id="button-price-filter" class="btn btn-primary"><?php echo $button_filter; ?></button>
	</div>
</div>

<script type="text/javascript">
$( document ).ready(function(){
	var min_pr = 0;
	var max_pr = 0;
	$('.<?php echo $product_class; ?>').each(function(){
		if( $(this).find( ".price span.price-new" ).length ) {
			var price = $(this).find( ".price span.price-new" ).html().replace('<?php echo $price_code; ?>','').replace(',','');
		} else {
			var text = $(this).find('.price').html().replace('<?php echo $price_code; ?>','');
			if( $(this).find( ".price span" ).length ) {
				var price = text.substring(0,text.indexOf('<span')).replace(',','');
			} else {
				var price = text.replace(',','');
			}
			
		}	
		
		price = parseInt(price);
		if(price > max_pr){
			max_pr = price+1;
		}
	});



	$("#scale-slider")
		.slider({ 
	        min: <?php echo round($price_range_min) ; ?>, 
	        max: max_pr, 
	        range: true, 
	        values: [<?php echo (isset($price_range[0])?$price_range[0]:0); ?>, max_pr] 
	    })
	                        
	    .slider("pips", {
	        rest: false,
			<?php if (!$right_code) { ?>
			prefix: "<?php echo $price_code; ?>"
			<?php } else { ?>
			suffix: "<?php echo $price_code; ?>"
			<?php } ?>
	    }).slider("float");
});


(function( $ ) {
  $(function() {
    $('#button-price-filter').on('click', function() {
		
		priceRange = [];
		$('#scale-slider .ui-slider-tip').each(function(){
			priceRange.push($(this).html());
		});
		
		$('.<?php echo $product_class; ?>').hide();
		$('.clearfix').remove();
		$('.<?php echo $product_class; ?>').each(function(){
			if( $(this).find( ".price span.price-new" ).length ) {
				var price = $(this).find( ".price span.price-new" ).html().replace('<?php echo $price_code; ?>','').replace(',','');
			} else {
				var text = $(this).find('.price').html().replace('<?php echo $price_code; ?>','');
				if( $(this).find( ".price span" ).length ) {
					var price = text.substring(0,text.indexOf('<span')).replace(',','');
				} else {
					var price = text.replace(',','');
				}
				
			}	
			
			price = parseInt(price);
			console.log(price);
			if( !isNaN(price) && (price > priceRange[0] && price < priceRange[1]) ){
				$(this).fadeIn("slow");
			}
		});
		
	});
  });
})(jQuery);

</script>
