function sum1() {

alert("Test");
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

	if (responsibilityScore == null) {

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
	var avg = result.toFixed(3);

	if (!isNaN(avg)) {
		document.getElementById('tscore').innerHTML = avg;
		document.getElementById('totalscore').value = avg;

	}

}

function avg() {
	alert("avg");
	var avgresult;
	var safetyScore;
	var qualityScore;
	var productivityScore;
	var jobKnowledgeAndSkillsScore;
	var interpersonalAvgScore;
	var avgScore;

	safetyScore = document.getElementById('sscore').value;

	qualityScore = document.getElementById('qscore').value;
	productivityScore = document.getElementById('pscore').value;
	jobKnowledgeAndSkillsScore = document.getElementById('jkscore').value;

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

	alert(avgresult);
	
	if (!isNaN(avgresult)) {
		avgScore = avgresult.toFixed(3)

		document.getElementById('ascore').innerHTML = avgScore;
		document.getElementById('avgscore').value = avgScore;

		interpersonalAvgScore = document.getElementById("interpersonalScore").value;

		if (interpersonalAvgScore == " ") {

			
			document.getElementById("summaryScore").innerHTML = avgScore;
			/* } */

		} else {

			avgScore = (parseFloat(interpersonalAvgScore) + parseFloat(avgScore)) / 2;

			var summaryAvgScore = avgScore.toFixed(3);

			if (!isNaN(summaryAvgScore)) {
				document.getElementById("summaryScore").innerHTML = summaryAvgScore;
			}

		}

	}

	/*
	 * var
	 * interpersonalAvgScore=document.getElementById('interpersonalAvgscore').value;
	 * 
	 * var
	 * summaryAvgScore=(parseFloat('interpersonalAvgScore')+parseFloat('avgScore'))/2;
	 * 
	 * if (!isNaN(summaryAvgScore)) {
	 * document.getElementById('ascore').innerHTML = summaryAvgScore;
	 * document.getElementById('avgscore').value = summaryAvgScore; }
	 */
}
function sumAvg() {

	sum1();
	var first = result;

	alert(first);

	avg();
	var second = avgresult;

	var result = (parseInt(first) + parseInt(second)) / 2;

	if (!isNaN(result)) {
		document.getElementById('finalscore').innerHTML = result;
		document.getElementById('finalavgscore').value = result;

	}

}
