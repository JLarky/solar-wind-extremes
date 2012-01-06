/* Author: JLarky <jlarky@gmail.com>
v 7

*/

// Check if a new cache is available on page load.
window.addEventListener('load', function(e) {

  window.applicationCache.addEventListener('updateready', function(e) {
    if (window.applicationCache.status == window.applicationCache.UPDATEREADY) {
      // Browser downloaded a new app cache.
      // Swap it in and reload the page to get the new hotness.
      window.applicationCache.swapCache();
      if (confirm('A new version of this site is available. Load it?')) {
        window.location.reload();
      }
    } else {
      // Manifest didn't changed. Nothing new to server.
    }
  }, false);

}, false);

jQuery(document).ready(function($) {
	$(".gallery").each(function() {
		var $this = $(this);

		if (!$this.hasClass('working')) {
			var click = function() {
				var $this = $(this);
				var $li = $this.parents("li");
				var $panel = $this.parents(".gallery").find(".panel");

				$li.parent().find("li").removeClass("selected");
				$li.addClass("selected");
				$panel.find(".info").html($li.find(".info").html())
				$panel.find("img").attr('src', $li.find("img").attr('src')
								  .replace("-thumb.png", ".png"));
			}
			$this.addClass('working');
			$this.prepend('<div class="panel"><img /><div class="info"></div></div>');
			$this.find("li").addClass('small').find("img")
			.each(function() {
				var $this = $(this);

				var src = $this.attr('src').replace(".png", "-thumb.png");
				$this.parent().prepend($this.clone().attr('src', src).addClass('no-print').click(click));
				$this.addClass('only-print')
			});

			$this.find("li:first img").click();
		}
	});

	$(".meta-gallery").each(function() {
	    var $mg = $(this)
	    $mg.find("nav a").click(function() {
		$mg.find(".gallery, h3[id]").addClass('only-print');
		var $this = $(this);
		var id = $this.attr('href');
		$(id).next().removeClass('only-print');
		$this.parent().parent().find("a").removeClass('active');
		$this.addClass('active');
		return false;
	    }).first().click()
	})

	$("table").tablesorter()

	// link table and lines
	var $table = $("#datatable");
	var $final_gallery = $("#final_gallery");
	$final_gallery.find("img.no-print").each(function() {
		var $img = $(this);
		var src = $img.attr('src').split("/");
		var case_name = src[src.length-2];
		var $tr = $table.find("."+case_name).click(function() {
			$tr.parent().find("tr").removeClass('selected');
			$tr.addClass('selected');
		});
		$tr.click(function(e, s) {if (e.originalEvent || s) {$img.click()};})
		$img.click(function(e, s) {if (e.originalEvent || s) {$tr.click()};})
	})

});
function select(src) {
	$(src).trigger("click", ["select"])
}
