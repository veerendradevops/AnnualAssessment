function sum1() {

	var result;
	var responsibilityScore;
	var adaptabilityScore;
	var initiativeScore;
	var judgementScore;
	var writtenAndOralCommunicationScore;
	var punctualityAndCommitmentScore;

	responsibilityScore = document.getElementById('rscore').value;
	adaptabilityScore = document.getElementById('ascore').value;
	initiativeScore = document.getElementById('iscore').value;
	judgementScore = document.getElementById('jscore').value;
	writtenAndOralCommunicationScore = document.getElementById('wscore').value;
	punctualityAndCommitmentScore = document.getElementById('pscore').value;

	if (responsibilityScore > 3) {
		document.getElementById('rscore').style.color = "red";
		document.getElementById('rscore').style.fontWeight = "bold";
	} else {
		document.getElementById('rscore').style.color = "black";
		document.getElementById('rscore').style.fontWeight = "normal";
	}
	if (adaptabilityScore > 3) {
		document.getElementById('ascore').style.color = "red";
		document.getElementById('ascore').style.fontWeight = "bold";
	} else {
		document.getElementById('ascore').style.color = "black";
		document.getElementById('ascore').style.fontWeight = "normal";
	}
	if (initiativeScore > 3) {
		document.getElementById('iscore').style.color = "red";
		document.getElementById('iscore').style.fontWeight = "bold";
	} else {
		document.getElementById('iscore').style.color = "black";
		document.getElementById('iscore').style.fontWeight = "normal";
	}
	if (judgementScore > 3) {
		document.getElementById('jscore').style.color = "red";
		document.getElementById('jscore').style.fontWeight = "bold";
	} else {
		document.getElementById('jscore').style.color = "black";
		document.getElementById('jscore').style.fontWeight = "normal";
	}
	if (writtenAndOralCommunicationScore > 3) {
		document.getElementById('wscore').style.color = "red";
		document.getElementById('wscore').style.fontWeight = "bold";
	} else {
		document.getElementById('wscore').style.color = "black";
		document.getElementById('wscore').style.fontWeight = "normal";
	}
	if (punctualityAndCommitmentScore > 3) {
		document.getElementById('pscore').style.color = "red";
		document.getElementById('pscore').style.fontWeight = "bold";
	} else {
		document.getElementById('pscore').style.color = "black";
		document.getElementById('pscore').style.fontWeight = "normal";
	}

	if (responsibilityScore == null || responsibilityScore.length == 0) {

		responsibilityScore = 0;
	}
	if (adaptabilityScore == null || adaptabilityScore.length == 0) {

		adaptabilityScore = 0;
	}
	if (initiativeScore == null || initiativeScore.length == 0) {

		initiativeScore = 0;
	}
	if (judgementScore == null || judgementScore.length == 0) {

		judgementScore = 0;
	}
	if (writtenAndOralCommunicationScore == null
			|| writtenAndOralCommunicationScore.length == 0) {

		writtenAndOralCommunicationScore = 0;
	}
	if (punctualityAndCommitmentScore == null
			|| punctualityAndCommitmentScore.length == 0) {

		punctualityAndCommitmentScore = 0;
	}

	result = (parseFloat(responsibilityScore) + parseFloat(adaptabilityScore)
			+ parseFloat(initiativeScore) + parseFloat(judgementScore)
			+ parseFloat(writtenAndOralCommunicationScore) + parseFloat(punctualityAndCommitmentScore)) / 6;

	var roundavg = result.toFixed(1)

	var avg = roundedTwoTwo(roundavg);

	if (!isNaN(avg)) {

		document.getElementById('tscore').innerHTML = avg;
		if (avg > 100) {
			document.getElementById('tscore').style.color = "red";
			document.getElementById('tscore').style.fontWeight = "bold";
		} else {
			document.getElementById('tscore').style.color = "black";
			document.getElementById('tscore').style.fontWeight = "normal";
		}
		document.getElementById('totalscore').value = avg;
		if (avg > 100) {
			document.getElementById('totalscore').style.color = "red";
			document.getElementById('totalscore').style.fontWeight = "bold";
		} else {
			document.getElementById('totalscore').style.color = "black";
			document.getElementById('totalscore').style.fontWeight = "normal";
		}

	}

}

function avg() {
	var avgresult;
	var safetyScore;
	var qualityScore;
	var productivityScore;
	var jobKnowledgeAndSkillsScore;
	var interpersonalAvgScore;
	var avgScore;

	safetyScore = document.getElementById('sscore').value;
	
	alert(safetyScore);

	qualityScore = document.getElementById('qscore').value;
	
	alert(qualityScore);
	
	productivityScore = document.getElementById('pscore').value;
	
	alert(productivityScore);
	
	jobKnowledgeAndSkillsScore = document.getElementById('jkscore').value;
	
	alert(jobKnowledgeAndSkillsScore);

	if (safetyScore > 3) {
		document.getElementById('sscore').style.color = "red";
		document.getElementById('sscore').style.fontWeight = "bold";
	} else {
		document.getElementById('sscore').style.color = "black";
		document.getElementById('sscore').style.fontWeight = "normal";
	}
	if (qualityScore > 3) {
		document.getElementById('qscore').style.color = "red";
		document.getElementById('qscore').style.fontWeight = "bold";
	} else {
		document.getElementById('qscore').style.color = "black";
		document.getElementById('qscore').style.fontWeight = "normal";
	}
	if (productivityScore > 3) {
		document.getElementById('pscore').style.color = "red";
		document.getElementById('pscore').style.fontWeight = "bold";
	} else {
		document.getElementById('pscore').style.color = "black";
		document.getElementById('pscore').style.fontWeight = "normal";
	}
	if (jobKnowledgeAndSkillsScore > 3) {
		document.getElementById('jkscore').style.color = "red";
		document.getElementById('jkscore').style.fontWeight = "bold";
	} else {
		document.getElementById('jkscore').style.color = "black";
		document.getElementById('jkscore').style.fontWeight = "normal";
	}

	if (safetyScore == null || safetyScore.length == 0) {

		safetyScore = 0;

	}
	if (qualityScore == null || qualityScore.length == 0) {

		qualityScore = 0;

	}
	if (productivityScore == null || productivityScore.length == 0) {
		productivityScore = 0;
	}
	if (jobKnowledgeAndSkillsScore == null
			|| jobKnowledgeAndSkillsScore.length == 0) {
		jobKnowledgeAndSkillsScore = 0;
	}

	avgresult = (parseFloat(safetyScore) + parseFloat(qualityScore)
			+ parseFloat(productivityScore) + parseFloat(jobKnowledgeAndSkillsScore)) / 4;
      alert("avgscore::"+avgresult);
	if (!isNaN(avgresult)) {

		var roundavg = avgresult.toFixed(1)
		alert("roundavg::"+roundavg);

		var avgScore = roundedTwoTwo(roundavg);
		alert("roundedTwoTwo"+avgScore);

		document.getElementById('ascore').innerHTML = avgScore;

		if (avgScore > 100) {
			document.getElementById('ascore').style.color = "red";
			document.getElementById('ascore').style.fontWeight = "bold";
		} else {
			document.getElementById('ascore').style.color = "black";
			document.getElementById('ascore').style.fontWeight = "normal";
		}
		document.getElementById('avgscore').value = avgScore;

		interpersonalAvgScore = document.getElementById("interpersonalScore").value;

		if (interpersonalAvgScore == "") {

			
			
			 
			if (!isNaN(avgScore)) {
				var summaryavgScore = parseFloat(avgScore) / 2;
				var roundavg = summaryavgScore.toFixed(1)

				var getScore = roundedTwoTwo(roundavg);

				document.getElementById("summaryScore").innerHTML = getScore;
				if (getScore > 100) {
					document.getElementById('summaryScore').style.color = "red";
					document.getElementById('summaryScore').style.fontWeight = "bold";
				} else {
					document.getElementById('summaryScore').style.color = "black";
					document.getElementById('summaryScore').style.fontWeight = "normal";
				}

				document.getElementById("summaryPerformanceScore").value = getScore;

			}
		} else {

			avgScore = (parseFloat(interpersonalAvgScore) + parseFloat(avgScore)) / 2;
		
			var roundavg = avgScore.toFixed(1);

			var summaryAvgScore = roundedTwoTwo(roundavg);

			if (!isNaN(summaryAvgScore)) {

				document.getElementById('summaryScore').innerHTML = summaryAvgScore;
				if (summaryAvgScore > 100) {
					document.getElementById('summaryScore').style.color = "red";
					document.getElementById('summaryScore').style.fontWeight = "bold";
				} else {
					document.getElementById('summaryScore').style.color = "black";
					document.getElementById('summaryScore').style.fontWeight = "normal";
				}
				document.getElementById('summaryPerformanceScore').value = summaryAvgScore;

			}

		}

	}
}
function roundedTwoTwo(roundavg) {
	return +(Math.round(roundavg + "e+2") + "e-2");
}

function minmax(value, min, max) {
	

	if (parseFloat(value) < min || isNaN(value)) {
		
		return 0;
	} else if (parseFloat(value) > max || isNaN(value)) {
		
		return 3;
	}

	else
		return value;
}

/*
 * var
 * interpersonalAvgScore=document.getElementById('interpersonalAvgscore').value;
 * 
 * var
 * summaryAvgScore=(parseFloat('interpersonalAvgScore')+parseFloat('avgScore'))/2;
 * 
 * if (!isNaN(summaryAvgScore)) { document.getElementById('ascore').innerHTML =
 * summaryAvgScore; document.getElementById('avgscore').value = summaryAvgScore; }
 */

