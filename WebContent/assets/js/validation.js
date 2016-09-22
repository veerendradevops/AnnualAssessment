function object() {
	var onet = 0;
	var one = 0;
	var two = 0;
	var total = 0;
	var three = 0;
	var total3 = 0;
	var total4 = 0;
	var four = 0;
	var five = 0;
	var total5 = 0;

	var total4 = 0;
	one = document.getElementById("1l").value;
	two = document.getElementById("2l").value;
	three = document.getElementById("3l").value;
	four = document.getElementById("4l").value;
	five = document.getElementById("5l").value;

	if (one == null || one.length == 0) {

		one = 0;
		one = parseInt(one);
	}

	if (two == null || two.length == 0) {

		two = 0;
		two = parseInt(two);
	}
	if (three == null || three.length == 0) {

		three = 0;
		three = parseInt(three);
	}
	if (four == null || four.length == 0) {

		four = 0;
		four = parseInt(four);
	}
	if (five == null || five.length == 0) {

		five = 0;
		five = parseInt(five);
	}

	if (one >= 100) {
		/*
		 * alert("You successfully gives 100% level so,Please go through the
		 * additional comments");
		 */
		// Disable for Objective achievement Textareas
		document.getElementById("2").disabled = true;
		document.getElementById("3").disabled = true;
		document.getElementById("4").disabled = true;
		document.getElementById("5").disabled = true;
		// Disable for Achievement Level Textareas
		document.getElementById("2l").disabled = true;
		document.getElementById("3l").disabled = true;
		document.getElementById("4l").disabled = true;
		document.getElementById("5l").disabled = true;

	}
	if (one < 100 || one.length == 0) {

		document.getElementById("2").disabled = false;
		document.getElementById("3").disabled = false;
		document.getElementById("4").disabled = false;
		document.getElementById("5").disabled = false;
		// Disable for Achievement Level Textareas
		document.getElementById("2l").disabled = false;
		document.getElementById("3l").disabled = false;
		document.getElementById("4l").disabled = false;
		document.getElementById("5l").disabled = false;

	}

	total = parseInt(one) + parseInt(two);

	if (total >= 100) {

		/*
		 * alert("You successfully gives 100% level so,Please go through the
		 * additional comments");
		 */
		document.getElementById("3").disabled = true;
		document.getElementById("4").disabled = true;
		document.getElementById("5").disabled = true;
		// Disable for Achevement Level Textareas
		document.getElementById("3l").disabled = true
		document.getElementById("4l").disabled = true;
		document.getElementById("5l").disabled = true;
	}
	if (total < 100 || two.length == 0) {

		// two=0;
		document.getElementById("3").disabled = false;
		document.getElementById("4").disabled = false;
		document.getElementById("5").disabled = false;
		// Disable for Achievement Level Textareas

		document.getElementById("3l").disabled = false;
		document.getElementById("4l").disabled = false;
		document.getElementById("5l").disabled = false;

	}

	total3 = parseInt(total) + parseInt(three);

	if (total3 >= 100) {
		/*
		 * alert("You successfully gives 100% level so,Please go through the
		 * additional comments");
		 */
		document.getElementById("4").disabled = true;
		document.getElementById("5").disabled = true;
		// Disable for Achevement Level Textareas
		document.getElementById("4l").disabled = true;
		document.getElementById("5l").disabled = true;
	}
	if (total3 < 100 || three.length == 0) {

		// three=0;
		document.getElementById("4").disabled = false;
		document.getElementById("5").disabled = false;
		// Disable for Achievement Level Textareas

		document.getElementById("4l").disabled = false;
		document.getElementById("5l").disabled = false;

	}

	total4 = parseInt(total3) + parseInt(four);
	if (total4 >= 100) {
		/*
		 * alert("You successfully gives 100% level so,Please go through the
		 * additional comments");
		 */
		document.getElementById("5").disabled = true;
		// Disable for Achement Level Textareas
		document.getElementById("5l").disabled = true;
	}
	if (total4 < 100) {

		document.getElementById("5").disabled = false;
		// Disable for Achievement Level Textareas

		document.getElementById("5l").disabled = false;

	}

	total5 = parseInt(total4) + parseInt(five);

	if (total5 > 100) {

		alert("Permissible range is between 0% to 100%");
		document.getElementById("sumofavg").innerHTML = total5;
		document.getElementById("sumofavg").style.color = "red";

		return false;
	} else {

		document.getElementById("hiddenavg").value = total5;

		document.getElementById("sumofavg").innerHTML = total5;
	}

}

function onlyNos(e, t) {
	try {
		if (window.event) {
			var charCode = window.event.keyCode;
		} else if (e) {
			var charCode = e.which;
		} else {
			return true;
		}
		if (charCode > 31 && (charCode < 48 || charCode > 57)) {
			return false;
		}
		return true;
	} catch (err) {
		alert(err.Description);
	}
}
