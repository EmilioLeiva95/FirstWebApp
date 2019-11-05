
function updateElementValue(pstgDocumentId, pstgDocumentValue){
	document.getElementById(pstgDocumentId).value=pstgDocumentValue;
}

/* Funcion para validar el registro seleccionado */
/* Valores buscados por Id */
function isElementSelected(pstgDocumentId){
	var isSelected = true;
	var element = document.getElementById(pstgDocumentId).value;
	
	if (element == null || element == ""){
		isSelected = false;
	}
	
	if (isSelected){
		return true;
	}else{
		alert("Debe seleccionar un registro !");
		return false;
	}
}

function isElementSelected(pstgDocumentId){
	var isSelected = true;
	var element = document.getElementById(pstgDocumentId).value;
	
	if(confirm('esta seguro de eliminar este registro?')){
		if (element == null || element == ""){
			isSelected = false;
		}	
	}else{
		return false;
	}
	
	if (isSelected){
		return true;
	}else{
		alert("Debe seleccionar un registro !");
		return false;
	}
}
/* Funciones sin busqueda de elemento por Id */
function isValueSelected(pstgDocumentValue){
	var isSelected = true;
	if (pstgDocumentValue == null || pstgDocumentValue == ""){
		isSelected = false;
	}
	
	if (isSelected){
		return true;
	}else{
		alert("Debe seleccionar un registro !");
		return false;
	}
}

function isValueToDeleteSelected(pstgDocumentValue){
	var isSelected = true;
	if(confirm('Esta seguro de eliminar este registro?')){
		if (pstgDocumentValue == null || pstgDocumentValue == ""){
			isSelected = false;
		}	
	}else{
		return false;
	}
	
	if (isSelected){
		return true;
	}else{
		alert("Debe seleccionar un registro !");
		return false;
	}
}

function isValueToPrintSelected(pstgDocumentValue){
	var isSelected = true;
	if(confirm('Va a generarse el reporte �Desea proceder?')){
		if (pstgDocumentValue == null || pstgDocumentValue == ""){
			isSelected = false;
		}	
	}else{
		return false;
	}
	
	if (isSelected){
		return true;
	}else{
		alert("Debe seleccionar un registro !");
		return false;
	}
}
