function createHidden(stgFormId, stgHiddenIdAndName, stgHiddenValue){
	emtHidden = document.createElement("input");
	emtHidden.setAttribute("type", "hidden");
	emtHidden.setAttribute("name", stgHiddenIdAndName);
	emtHidden.setAttribute("id", stgHiddenIdAndName);
	emtHidden.setAttribute("value", stgHiddenValue);
	emtForm = document.getElementById(stgFormId);
	emtForm.appendChild(emtHidden);
}

function updateElementValue(pstgDocumentId, pstgDocumentValue){
	document.getElementById(pstgDocumentId).value=pstgDocumentValue;
}
