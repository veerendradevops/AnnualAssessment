function sum1() {

	var result;
	var responsibilityScore;
	var adaptabilityScore;
	var judgementScore;
	var writtenAndOralCommunicationScore;
	var punctualityAndCommitmentScore;

	responsibilityScore = document.getElementById('rscore').value;
	adaptabilityScore = document.getElementById('ascore').value;
	judgementScore = document.getElementById('jscore').value;
	writtenAndOralCommunicationScore = document.getElementById('wscore').value;
	punctualityAndCommitmentScore = document.getElementById('pscore').value;

	result = (parseInt(responsibilityScore) + parseInt(adaptabilityScore)
			+ parseInt(judgementScore)
			+ parseInt(writtenAndOralCommunicationScore) + parseInt(punctualityAndCommitmentScore)) / 5;
	if (!isNaN(result)) {
		document.getElementById('tscore').innerHTML = result;
		document.getElementById('totalscore').value = result;

	}
}

function avg() {
	var result;
	var safetyScore;
	var qualityScore;
	var productivityScore;
	var jobKnowledgeAndSkillsScore;

	safetyScore = document.getElementById('sscore').value;
	qualityScore = document.getElementById('qscore').value;
	productivityScore = document.getElementById('pscore').value;
	jobKnowledgeAndSkillsScore = document.getElementById('jkscore').value;
	result = (parseInt(safetyScore) + parseInt(qualityScore)
			+ parseInt(productivityScore) + parseInt(jobKnowledgeAndSkillsScore)) / 4;
	
	if (!isNaN(result)) {
		document.getElementById('ascore').innerHTML = result;
		document.getElementById('avgscore').value = result;
	}

}
function sumAvg(){
	
}