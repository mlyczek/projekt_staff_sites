$(document).ready(function() {
	$unsupportedDialog = $("<div></div>")
								.attr("title", "Operacja niedostępna")
								.html("<p>Operacja jest niedostępna</p>")
								.dialog({
									autoOpen: false,
									modal: true,
									buttons: {
										Ok: function() {
											$(this).dialog("close");
										}
									}
								});

	$(".unsupported").click(function(e) {
		$unsupportedDialog.dialog("open");

		e.preventDefault();
		return false;
	});
});