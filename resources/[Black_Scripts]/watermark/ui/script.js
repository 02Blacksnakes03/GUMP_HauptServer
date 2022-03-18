$(function(){
	window.onload = function(e){
		window.addEventListener('message', function(event){

			var item = event.data;
			if (item !== undefined && item.type === "Discord") {

				if (item.display === true) {
					$('#Discord').delay(100).fadeIn( "slow" );
				} else if (item.display === false) {
					$('#Discord').fadeOut( "slow" );
				}
			}
		});
	};
});