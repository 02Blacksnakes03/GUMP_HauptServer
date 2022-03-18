$(document).ready(function(){
    window.addEventListener('message', function( event ) {      
      if (event.data.action == 'open') {

        var counting;
        var fuel = event.data.fuel;        
        var hasstarted = false;

        $('.tank-leiste-percent').text(Math.round(event.data.fuel) + '%');
        
        $('.tank-leiste-blue').css('width', ((Math.round(event.data.fuel) / 100) * 400) + 'px');

        $('.container').css('display', 'block');   

        /*if (counting) {
          $('.start_stop').text("■");
        } else {
          $('.start_stop').text("►")
        }*/

        var inv;

        function start() {
          inv = setInterval(increase, 1000);
        }

        function increase() {
          if (counting) {
            if (fuel < 100) {
              fuel++;
  
              $('.tank-leiste-percent').text(Math.round(fuel) + '%');  
              $('#total').attr("data-money", (Math.round(event.data.price * (fuel - event.data.fuel) * 1000) / 1000).toFixed(2))
              $('#total').text("$ " + (Math.round(event.data.price * (fuel - event.data.fuel) * 1000) / 1000).toFixed(2));     
              $('.tank-leiste-blue').animate({
                width: ((Math.round(fuel) / 100) * 400) + 'px'
              });
            }
          }
        }

        $( ".tank-botton-pay" ).click(function() {
          $.post('http://glmp_tankstelle/escape', JSON.stringify({}));  
          $('.container').css('display', 'none');

          var perc_new = $('.tank-leiste-percent').text();
          var perc_formatted = perc_new.replace("%", "");    
          
          clearInterval(inv);

          $.post('http://glmp_tankstelle/pay', JSON.stringify({
            new_perc: perc_formatted,
            money: $('#total').attr("data-money"),
            fuel: event.data.fuel
            
          }));
        });

        $(".tank-button-start-start").click(function() {
          counting = true;

          if (counting && !hasstarted) {
            
            hasstarted = true;
            fuel = event.data.fuel;
            start();
          }
        });
        
        $(".tank-button-start-stop").click(function() {
          counting = false
/*
          if (!counting && hasstarted) {
            $('.start_stop').text('►');
            hasstarted = false;
          }*/
        });
        


      } else {
        $('.container').css('display', 'none');
      }
    });

    $( ".close" ).click(function() {
      $('.container').css('display', 'none');
      $.post('http://glmp_tankstelle/escape', JSON.stringify({}));
    });
  });