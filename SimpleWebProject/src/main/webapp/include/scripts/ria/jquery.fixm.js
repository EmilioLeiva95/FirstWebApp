// Pequeno script para arreglar las alturas de los div que se encuentran
// dentro de otro div.  Se aplica asi:
//   $('#contenedor').fixm();
$.fn.fixm = function() {
	$(this).each(function(){			
		var currentTallest = $(this).height();
		$(this).children().each(function(i){
			if ($(this).height() > currentTallest) { currentTallest = $(this).height(); }
		});
		
		// for ie6, set height since min-height is not supported
		if ($.browser.msie && $.browser.version == 6.0) { $(this).children().css({'height': currentTallest}); }
		$(this).children().css({'min-height': currentTallest}); 
	});
	return this;
};