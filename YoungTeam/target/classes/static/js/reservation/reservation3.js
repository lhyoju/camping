
	function rsChk() {
		var fr = document.fr;
		var phone = /^\d{3}-\d{3,4}-\d{4}$/;

		if (fr.resName.value == "") {
			alert("이름을 입력하세요.");
			fr.resname.focus();
			return false;
		}

		if (fr.resName.value.length < 2) {
			alert("이름을 똑바로 입력하세요.");
			return false;
		}

		
		if (fr.phone.value == "") {
			alert("핸드폰 번호를 입력하세요");
			fr.phone.focus();
			return false;
		}

		if (!phone.test(fr.phone.value)) {
			alert("핸드폰 번호를 규칙에 맞게 입력하세요.");
			fr.phone.value = "";
			fr.phone.focus();
			return false;
		}

		fr.submit();
	}