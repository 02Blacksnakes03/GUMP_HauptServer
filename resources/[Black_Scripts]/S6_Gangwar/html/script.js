$(document).ready(function() {
  window.addEventListener("message", function(e) {
    if (e.data.action == "display") {
      if (e.data.show) {
        $("body").show();
      } else {
        $("body").hide();
      }
    } else if (e.data.action == "setfraks") {
      var frak1 = document.getElementById('YAKUZA');
      var frak2 = document.getElementById('YAKUZA_m');

      frak1.innerHTML = e.data.fraktion1
      frak2.innerHTML = e.data.fraktion2
    } else if (e.data.action == "setpoints") {
      var frakpoints1 = document.getElementById('n_29_p');
      var frakpoints2 = document.getElementById('n_29');

      frakpoints1.innerHTML = e.data.fraktion1
      frakpoints2.innerHTML = e.data.fraktion2
    } else if (e.data.action == "timer") {
      abdi(e.data.time)
    }
  });
})

function secondPassed() {
    
  var minutes = Math.round((seconds - 30)/60),
  remainingSeconds = seconds % 60;

  if (minutes < 10) {
    minutes = "0" + minutes;  
  }

  if (remainingSeconds < 10) {
    remainingSeconds = "0" + remainingSeconds;  
  }
  
  document.getElementById('n_222').innerHTML = minutes + ":" + remainingSeconds;
  if (seconds == 0) {
    clearInterval(countdownTimer);
    document.getElementById('n_222').innerHTML = "00:00";
  } else {
    seconds--;
  }
}

function abdi(schwanz) {
  seconds = schwanz;

  countdownTimer = setInterval('secondPassed()', 1000);
}