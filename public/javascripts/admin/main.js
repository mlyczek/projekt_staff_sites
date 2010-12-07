jQuery(document).ready(function() {
	$unsupportedDialog = jQuery("<div></div>")
								.attr("title", "Operacja niedostępna")
								.html("<p>Operacja jest niedostępna</p>")
								.dialog({
									autoOpen: false,
									modal: true,
									buttons: {
										Ok: function() {
											jQuery(this).dialog("close");
										}
									}
								});

	jQuery(".unsupported").click(function(e) {
		$unsupportedDialog.dialog("open");

		e.preventDefault();
		return false;
	});
});