$(function() {
			$("#testDatepicker").datepicker({
				dateFormat: "yy/mm/dd",
				dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
				monthNames: ["1월","2월","3월", "4월", "5월", "6월","7월","8월","9월","10월","11월","12월"],
				minDate: 0
			});
		});