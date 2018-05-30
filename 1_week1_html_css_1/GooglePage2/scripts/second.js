
var boutonG = document.getElementById('boutonGrille');


//Boucle while pour vérifier des éléments basiques du format et retourner le nombre de carrés
var test = function (person){
	while (
		person.length !== 5 || person.substr(1,1) !== ' ' || 
		person.substr(2,1) !== 'x' || person.substr(3,1) !== ' '|| person.substr(0,1) !== person.substr(4,1))
			{
			alert('Your format : - '+person+' - is not valid');
			person = prompt("Mind the given format.Please enter the dimensions of the desired grid in the format '? x ?'. Max size = 9" , "5 x 5");
			};	
	return person.substr(0,1);
};




//Fonction de construction de la table à partir du prompt décrit dans la fonction 'test'
var gen_grille = function () {
	//Récupération du format rentré dans un promt
	let texte = prompt("Please enter the dimensions of the desired grid in the format '7 x 7'. Max size=9" , "5 x 5");
	let x = test(texte);

	//Construction de la grille avec une double boucle for, une pour les lignes et une seconde pour remplir les lignes
	let html= "<table class='tableau'><tbody>"; 

	for (i=0; i<x; i++)
			{
			html += "<tr>";
			for (j=0; j<x; j++)
				{
					html += "<td class='black_border'></td>"
				}
			html += "</tr>";
			}
	 html += "</tbody></table>";

	//Associer le code HTML construit à la div grille_solution
	document.getElementById("espacegrille").innerHTML = html;
	boutonG.style.display="block";

};


//Fonction d'initialisation à l'ouverture de la page
window.onload= gen_grille ();


//Relancer la génération d'une nouvelle grille
boutonG.onclick = function() {
gen_grille();
}

