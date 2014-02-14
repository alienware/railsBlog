// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require bootstrap-wysihtml5
//= require_tree .

$(function() {
	$('#post_content').wysihtml5();
	$('#comment_content').wysihtml5();
})

//function toggleComments(post_id) {
//	var comment = document.getElementById(post_id);
//	if (comment.style.display == 'none') {
//		comment.style.display = 'block';
//	}
//	else {
//		comment.style.display = 'none';
//	}
//}

//$(document).on('click','.openCommentModal', function() {
//	var postId = $(this).data('id');
//	$("#comment_post_id").val(postId);
//})

function postSearch() {
	$("#search").keyup(function() {
		$.get($("#post_search").attr("action"), $("#search").serialize(), null, "script");
		return false;
	});
}

$(document).on('click', '.nav', function(e) {
	e.stopPropagation();
});


