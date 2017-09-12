$(document).ready(function() {
		var check;
		
		$("#joinModalClick").click(function() {
			$("#provisionModalStart").click();
		})
		$("#searchModalClick").click(function() {
			$("#searchModalStart").click();
		})
		$("#searchZipClick").click(function() {
			$("#searchZipStart").click();
		})
		$('#signUpModal').on('show.bs.modal', function(e) {
			check = false;
			$("body").css("padding-right", "0px");
			$("body").css("overflow-y", "hidden");
		})
		$('#searchIdPasswordModal').on('show.bs.modal', function(e) {
			check = true;
			$("body").css("padding-right", "0px");
			$("body").css("overflow-y", "hidden");
		})
		$('#provisionModal').on('show.bs.modal', function(e) {
			check = true;
			$("body").css("padding-right", "0px");
			$("body").css("overflow-y", "hidden");
		})
		$('#memberJoinModal').on('show.bs.modal', function(e) {
			check = false;
			$("body").css("padding-right", "0px");
			$("body").css("overflow-y", "hidden");
		})
		$('#searchZipModal').on('show.bs.modal', function(e) {
			check = false;
			$("body").css("padding-right", "0px");
			$("body").css("overflow-y", "hidden");
		})
	
		$('#signUpModal').on('hidden.bs.modal', function(e) {
			if (check) {
				$("body").css("overflow-y", "hidden");
			} else {
				$("body").css("overflow-y", "auto");
			}
		})
		$('#searchIdPasswordModal').on('hidden.bs.modal', function(e) {
			$("body").css("overflow-y", "auto");
		})
		$('#provisionModal').on('hidden.bs.modal', function(e) {
			if (!check) {
				$("body").css("overflow-y", "hidden");
			} else {
				$("body").css("overflow-y", "auto");
			}
			$("#agree1").attr("checked", false);
			$("#agree2").attr("checked", false);
		})
		$('#memberJoinModal').on('hidden.bs.modal', function(e) {
			$("body").css("overflow-y", "auto");
		})
		$('#searchZipModal').on('hidden.bs.modal', function(e) {
			$("body").css("overflow-y", "auto");
		})
//		//Date picker
//		$('#datepicker').datepicker({ autoclose : true });
	})