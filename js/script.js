/* Author: JLarky <jlarky@gmail.com>
v 3

*/

jQuery(document).ready(function($) {
	$(".gallery").each(function() {
		var $this = $(this);

		if (!$this.hasClass('working')) {
			$this.addClass('working');
			$this.prepend('<div class="panel"><img /><div class="info"></div></div>');
			$this.find("li").addClass('small').find("img")
			.each(function() {
				var $this = $(this);
				var src = $this.attr('src').replace(".png", "-thumb.png");
				$this.attr('src', src)
				console.log(src)
			})
			.click(function() {
				var $this = $(this);
				var $li = $this.parents("li");
				var $panel = $this.parents(".gallery").find(".panel");

				$panel.find(".info").html($li.find(".info").html())
				$panel.find("img").attr('src', $li.find("img").attr('src').replace("-thumb.png", ".png"));
			});

			$this.find("li:first img").click();
		}
	});

	$(".meta-gallery nav a").click(function() {
		$(".meta-gallery .gallery, .meta-gallery h3[id]").addClass('only-print');
		var $this = $(this);
		var id = $this.attr('href');
		$(id).next().removeClass('only-print');
		$this.parent().parent().find("a").removeClass('active');
		$this.addClass('active');
		return false;
	}).first().click()

	$("table").tablesorter()
});

