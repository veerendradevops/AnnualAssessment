function validate(frm)
{
frm.vflag.value="yes";
//read form data

var section2a1objective=frm.section2A1Objective.value;
var section2A1level=frm.Section2A1Level.value;
var section2A2objective=frm.section2A2Objective.value;
var section2A2level=frm.Section2A2level.value;

//read level fields data

var section2A1level=frm.Section2A1Level.value;
var section2A2level=frm.Section2A2Level.value;
var section2A3level=frm.Section2A3Level.value;
var section2A4level=frm.Section2A4Level.value;
var section2A5level=frm.Section2A5Level.value;

if(100 >= section2A1level)
	{
	
	return true;
	}
else{
	alert("Please enter less than or equals to 100%");
	frm.frm.Section2A1Level.focus();
	return false;
}
//perform validations

if(section2a1objective =="")//required rule
	{
	alert("First Text area is mandatory");
	frm.section2A1Objectiove.focus();
	return false;
	}//if
if(section2A1level=="")//required rule
	{
	alert("First level is mandatory");
	frm.Section2A1Level.focus();
	return false;
	}
if(section2A2Objective=="")//required rule
{
	alert("Second Text area is mandatory");
	frm.section2A2Objective.focus();
	return false;
}
if(section2A2level=="")
	{
	alert("Second level is mandatory");
	frm.Section2A2level.focus();
	}

else{
	if(isNaN(Section2A1Level))//checks weather level is numeric value or not
		{
		alert("First Level must be a numeric value");
		frm.Section2A1Level.focus();
		frm.Section2A1Level.value="";
		return false;
		
		}//if
}//else
}//function
function object(){	
	var one=document.getElementById("1l").value;
/*	var one=document.getElementById("1").value;*/
	//alert(one);
	if(one>=100){
		alert("You successfully gives 100% level so,Please go through the additional comments");
		//Disable for Objective achievement Textareas
		document.getElementById("2").disabled = true;
		document.getElementById("3").disabled = true;
		document.getElementById("4").disabled = true;
		document.getElementById("5").disabled = true;
		//Disable for Achievement Level Textareas
		document.getElementById("2l").disabled = true;
		document.getElementById("3l").disabled = true;
		document.getElementById("4l").disabled = true;
		document.getElementById("5l").disabled = true;
	
	}
	var two=document.getElementById("2l").value;
	var total=parseInt(one)+parseInt(two);
	
	if(total>=100){
		
		alert("You successfully gives 100% level so,Please go through the additional comments");
		document.getElementById("3").disabled = true;
		document.getElementById("4").disabled = true;
		document.getElementById("5").disabled = true;
		//Disable for Achevement Level Textareas
		document.getElementById("3l").disabled = true;
		document.getElementById("4l").disabled = true;
		document.getElementById("5l").disabled = true;
	}
	var three=document.getElementById("3l").value;
	var total3=parseInt(total)+parseInt(three);
	
	if(total3>=100){
		alert("You successfully gives 100% level so,Please go through the additional comments");
		document.getElementById("4").disabled = true;
		document.getElementById("5").disabled = true;
		//Disable for Achevement Level Textareas
		document.getElementById("4l").disabled = true;
		document.getElementById("5l").disabled = true;
	}
	var four=document.getElementById("4l").value;
	var total4=parseInt(total3)+parseInt(four);
	if(total4>=100)
		{
		alert("You successfully gives 100% level so,Please go through the additional comments");
		document.getElementById("5").disabled = true;
		//Disable for Achement Level Textareas
		document.getElementById("5l").disabled= true;
		}
	document.getElementById("sumofavg").innerHTML=total4;
	
/*	alert(il);*/
	
}
