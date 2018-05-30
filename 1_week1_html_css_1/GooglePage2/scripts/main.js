// Au click sur le bouton, afficher la barre de recherche

let div1=document.getElementById('work1');
let div2=document.getElementById('work2');
let div3=document.getElementById('BC');

div3.onclick= function() {
  div1.style.display="block";
  div2.style.display="none";
}




//Renvoyer vers une recherche google lorsque l'on appuie sur le bouton recherche

let boutonRecherche=document.getElementById('boutonR')

boutonRecherche.onclick= function(){
  let x = document.forms["barrederecherche"].elements["Rechercher"];
  let y= x.value;

  let arrayOfStrings = y.split(" ");
  
  let z=""
  for (var i in arrayOfStrings)
    z=z+"+"+arrayOfStrings[i];
    z=z.substring(1);

  window.location.href = 'https://www.google.fr/#q='+z;
}



// FAIRE UN POP UP QUI APPARAIT AU BOUT DE 10 SECONDE VERS UN SITE XXX - DougThePug <3


onLoad=setTimeout('popuper()',10000)

var popuper = function(){
pub = window.open('popup.html','Meilleur site ever',
'height=200, width=400, top=300, left=500, toolbar=no, menubar=no, location=no, resizable=yes, scrollbars=yes, status=no, directories=no');
}






/* SANS LIEN AVEC EXERCICE- CONSERVE A TITRE D'EXEMPLE POUR FUTUR CODE
 work1.style.display='none'
work2.style.display='block'

var basculeSection = function () {
  // définition des variables correspondant aux sections
  
 
 // Action conditionnelle, si div1 caché alors l'afficher et cacher div2
  if(work1.style.display='none') {
      work1.style.display="block";
      work2.style.display="none"; }
  }







/*
document.querySelector('h1').onclick = function() {
    alert('Aïe, arrêtez de cliquer !!');
}


let monImage = document.querySelector('img');

monImage.onclick = function() {
    let maSrc = monImage.getAttribute('src');
    if(maSrc === 'images/firefox-icon.png') {
      monImage.setAttribute ('src','images/firefox2.png');
    } else {
      monImage.setAttribute ('src','images/firefox-icon.png');
    }
}

let monBouton = document.querySelector('button');
let monTitre = document.querySelector('h1');

function définirNomUtilisateur() {
  let monNom = prompt('Veuillez saisir votre nom.');
  localStorage.setItem('nom', monNom);
  monTitre.textContent = 'Mozilla est cool, ' + monNom;
}

if(!localStorage.getItem('nom')) {
  définirNomUtilisateur();
} else {
  let nomEnregistré = localStorage.getItem('nom');
  monTitre.textContent = 'Mozilla est cool, ' + nomEnregistré;
}

monBouton.onclick = function() {
  définirNomUtilisateur(); 
}
*/