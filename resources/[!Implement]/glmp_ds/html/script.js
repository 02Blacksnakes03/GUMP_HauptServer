$(document).ready(function () {

    window.addEventListener("message", function (event) {
		if (event.data.action == "showDeathScreen") {

			$(".voice" + event.data.value).show();
			$("voice" + event.data.value).show();
        };

		if (event.data.action == "hideDeathScreen") {

			$(".voice" + event.data.value).hide();
			$("voice" + event.data.value).hide();
        };
        

    });
});


