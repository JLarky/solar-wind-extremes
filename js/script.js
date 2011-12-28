/* Author: JLarky <jlarky@gmail.com>

*/

jQuery(document).ready(function($) {
	$(".gallery").each(function() {
		var $this = $(this);

		if (!$this.hasClass('working')) {
			$this.addClass('working');
			$this.prepend('<div class="panel"><img /><div class="info"></div></div>');
			$this.find("li").addClass('small').find("img").click(function() {
				var $this = $(this);
				var $li = $this.parents("li");
				var $panel = $this.parents(".gallery").find(".panel");

				$panel.find(".info").html($li.find(".info").html())
				$panel.find("img").attr('src', $li.find("img").attr('src'));
			});

			$this.find("li:first img").click();
		}
	})
});


