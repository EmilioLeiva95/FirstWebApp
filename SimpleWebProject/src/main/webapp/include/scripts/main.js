//Para ubicar lista de valores cuando se desplega

function lov(url,name)
 {
   lovWindow = window.open (url,name,'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,copyhistory=no,width=350,height=400');
   lovWindow.moveTo(300,200);
 } 

function showInfo(id){
	element = document.getElementById(id);
	if(element.style.display == 'none'){
		element.style.display = '';
	}else{
		element.style.display = 'none';
	}
}
 
 //en lastObject se guarda el ultimo objeto que pidio el cambio de seleccion
var lastObject;
//en lastObjectClass se guarda la clase de stylesheet que poseia el objeto antes de modificarlo
var lastObjectClass;
/**
 * tableRow fila que es seleccionada
 * newClass nueva clase de stylesheet que se le asignara a tableRow
 */
function selectDeSelectObject(tableRow,newClass) {
    /**
     * si el objeto no es nulo reasignara el antiguo valor que tenia su clase
     * antes de modificarlo
     */
    if (lastObject != null)
        lastObject.className = lastObjectClass;
    /**
     * guarda en lastObject el objeto que invoco la funcion
     */
    lastObject = tableRow;
    /**
     * guarda en lastObjectClass la clase actual del objeto que invoco la funcion
     */
    lastObjectClass = tableRow.className;
    /**
     * modifica finalmete el valor de la clase de la tableRow por el otro parametro
     */
    tableRow.className = newClass;
}

/**
 * objeto que es seleccionada
 * newClass nueva clase de stylesheet que se le asignara al objeto
 */
function changeCssFromObject(object,newClass) {
    /**
     * si el objeto no es nulo reasignara el antiguo valor que tenia su clase
     * antes de modificarlo
     */
    if (lastObject != null)
        lastObject.className = lastObjectClass;
    /**
     * guarda en lastObject el objeto que invoco la funcion
     */
    lastObject = object;
    /**
     * guarda en lastObjectClass la clase actual del objeto que invoco la funcion
     */
    lastObjectClass = object.className;
    /**
     * modifica finalmete el valor de la clase de la tableRow por el otro parametro
     */
    object.className = newClass;
}

function objToString(o) {
    var s = '{\n';
    for (var p in o)
        s += '    "' + p + '": "' + o[p] + '"\n';
    return s + '}';
}

// helper
function elementToString(n, useRefs) {
    var attr = "", nest = "", a = n.attributes;
    for (var i=0; a && i < a.length; i++)
        attr += ' ' + a[i].nodeName + '="' + a[i].nodeValue + '"';

    if (n.hasChildNodes == false)
        return "<" + n.nodeName + "\/>";

    for (var i=0; i < n.childNodes.length; i++) {
        var c = n.childNodes.item(i);
        if (c.nodeType == 1)       nest += elementToString(c);
        else if (c.nodeType == 2)  attr += " " + c.nodeName + "=\"" + c.nodeValue + "\" ";
        else if (c.nodeType == 3)  nest += c.nodeValue;
    }
    var s = "<" + n.nodeName + attr + ">" + nest + "<\/" + n.nodeName + ">";
    return useRefs ? s.replace(/</g,'&lt;').replace(/>/g,'&gt;') : s;
}