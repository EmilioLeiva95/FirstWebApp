//Para ubicar lista de valores cuando se desplega

function lov(url,name)
 {
   lovWindow = window.open (url,name,'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,copyhistory=no,width=350,height=400');
   lovWindow.moveTo(300,200);
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