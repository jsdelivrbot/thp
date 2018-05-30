var i = 0;

var compliments = [['You are a great friend', 'Today is your birthday', 'I love you'],[' yellow',' red',' green']];

$(function() {

  var $list, $bouton, $fond;
  $list = $('#greetings');
  $bouton = $('#bouton');
  $fond=$('body');

// Faire intéragir le formulaire lors de clicks
  $bouton.on('click', function(e) {
    e.preventDefault();
    
    // Modifier le texte de toutes les boites par Happy Birthday lorsque toutes les boites sont affichées
    if (i==3) {
      $listcontent=$('#greetings div');
      $listcontent.each(function() {
      $(this).text('Happy birthday');

      // Lancer un audio disant Happy Birthday
      $.playSound('http://www.pacdv.com/sounds/applause-sounds/app-5.mp3');
      // Modifier le background de body par une image festive
      $fondpage=$('body');
      $fondpage.css("backgroundImage", "url(http://stuffpoint.com/darth-vader/image/390728-darth-vader-proud-darth-vader.jpg)");
      });
    }

    // Modifier les code html pour faire apparaitre des boites, chacune avec un message et une mise en forme différente
    else {
    $list.append('<div class="liste'+compliments[1][i]+'">' + compliments[0][i] + '</div>');
     i +=1;   
    }

  });


}); 


//DEFINIR FONCTION PLAYSOUND

(function ($) {
    $.extend({
        playSound: function () {
            return $(
                   '<audio class="sound-player" autoplay="autoplay" style="display:none;">'
                     + '<source src="' + arguments[0] + '" />'
                     + '<embed src="' + arguments[0] + '" hidden="true" autostart="true" loop="false"/>'
                   + '</audio>'
                 ).appendTo('body');
        },
        stopSound: function () {
            $(".sound-player").remove();
        }
    });
})(jQuery);