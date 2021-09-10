$(document).ready(function() {
	
	$("#edit").click(function() {
		$("#contentForm").attr('action', '/recipelist/recipelist_edit');
		$("#contentForm").submit();
	});
	
	$("#del").click(function() {
		$("#contentForm").attr('action', '/recipelist/recipelist_delete');
		$("#contentForm").submit();
	});
	
	$("#reset").click(function() {
		$("#contentForm").attr('action', '/recipelist/recipelist_board');
		$("#contentForm").submit();
	});
	
	$("#list").click(function(){
		$("#contentForm").attr('action', '/recipelist/recipelist_board')
		$("#contentForm").submit();
	});
});