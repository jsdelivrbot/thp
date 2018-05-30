// Récupérer le nombre en chiffre auprès de l'utilisateur, relancer si l'intrant n'est pas un nombre
function getNumber() {
    do {
        var nombre = parseInt(prompt("Please enter your number","395"),10);
    }
    while (isNaN(nombre) === true)
    return nombre;
}
// Initialiser les dictionnaires permettant de composer en lettre les unités, dizaines, centaines
    /* valables pour les unites et les centaines*/ var dicoUnites = ['un','deux','trois','quatre','cinq','six','sept','huit','neuf'];
    /* dizaines*/ var dicoDizaines = ['dix','vingt','trente','quarante','cinquante','soixante','soixante-dix','quatre-vingt','quatre-vingt-dix'];
    /* entre dix et vingt */ var dicoExceptions = ['onze','douze','treize','quatorze','quinze','seize','dix-sept','dix-huit','dix-neuf'];

// Identifier les unités, dizaines, centaines dans le nombre avec le reste de la division euclidienne
function decomposeNumber(number){
    var unites = number % 10;
    var dizaines = (number % 100 - unites)/10;
    var centaines = (number - unites - dizaines*10)/100;
    return [centaines,dizaines,unites];
}

// Reconstituer la chaine de caracètre représentant le nombre
function buildString(arrayDecomposedNumber){
    var textNumber = ''
    if (arrayDecomposedNumber === [0,0,0]) {
        alert("zero")
    }
    else {
        // Gérer les centaines
        if (arrayDecomposedNumber[0]===1) {
            textNumber += 'cent-'
        } else if (arrayDecomposedNumber[0]!=0) {
            if (arrayDecomposedNumber[1]===0 && arrayDecomposedNumber[2]===0) {
                textNumber += dicoUnites[arrayDecomposedNumber[0]-1]+'-cents';
            } else {
                textNumber += dicoUnites[arrayDecomposedNumber[0]-1]+'-cent-';
            }
        }
        //Gérer les dizaines et les unités
            // Unités nulles, gérer les pluriel des dizaines
            if (arrayDecomposedNumber[2]===0 && arrayDecomposedNumber[1]!=0) {
                textNumber += dicoDizaines[arrayDecomposedNumber[1]-1] + '';
                if (arrayDecomposedNumber[1] === 2 || arrayDecomposedNumber[1] === 8) {textNumber += 's';}
            // Dizaines nulles, mettre les unités
            } else if (arrayDecomposedNumber[2]!=0 && arrayDecomposedNumber[1]===0) {
                textNumber += dicoUnites[arrayDecomposedNumber[2]-1] + '';
            // Dizaines et unités non nulles: gérer 1)les cas spécifiques 11-19,71-79 et 91-99 2)les exemples type vingt-"et"-un 
            } else if (arrayDecomposedNumber[2]!=0 && arrayDecomposedNumber[1]!=0){
                // Cas des dizaines égales à 1
                if (arrayDecomposedNumber[1]===1) {
                    // Ajout des dizaines
                    textNumber += dicoExceptions[arrayDecomposedNumber[2]-1] + '';
                // Cas des dizaines égales à 7 ou 9
                } else if (arrayDecomposedNumber[1]===7 || arrayDecomposedNumber[1]===9) {
                    textNumber += dicoDizaines[arrayDecomposedNumber[1]-2] + '-' + dicoExceptions[arrayDecomposedNumber[2]-1];
                // Autres cas des dizaines
                } else {
                    //Gérer le cas ou les unités sont égales à 1
                    textNumber += arrayDecomposedNumber[2]===1 ? dicoDizaines[arrayDecomposedNumber[1]-1] + '-et-' + dicoUnites[arrayDecomposedNumber[2]-1] :  dicoDizaines[arrayDecomposedNumber[1]-1] + '-' + dicoUnites[arrayDecomposedNumber[2]-1];
                }
            }
    // Affiche le nombre en lettres
    alert(textNumber);
    }
}
//Afficher le résultat final dans la console
buildString(decomposeNumber(getNumber()));

