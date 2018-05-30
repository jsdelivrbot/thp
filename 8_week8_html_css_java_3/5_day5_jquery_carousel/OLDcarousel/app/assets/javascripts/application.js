// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require rails-ujs
//= require_tree .


$(document).ready(function() {

//Set the variables on page load
            let dotss = document.querySelectorAll("li.dot");
            let images = document.querySelectorAll(".image-style");
            let numberImages = images.length
            let next = $("#next");
            let prev = $("#prev");
            let activeImage = 0;

//Define the function that will slide, taking into account two parameters:
//The direction of the slide and the number of images to slide
        function nextOrPrev(direction,numberSlides){
            var nextImage = activeImage
            if (direction == 'next') {
                nextImage += numberSlides
                //Wrap to the first image if we push next for the last slide
                if (nextImage >= numberImages) {
                    nextImage = nextImage-numberImages;}

            } else {
                nextImage -= numberSlides
                //Wrap to the first image if we push previous for the first slide
                if (nextImage < 0) {
                    nextImage = numberImages+nextImage;}
            }
            return nextImage
        }

        function slideWhere(direction,numberSlides){
            var timeToTake = numberSlides * 800
            activeImage = nextOrPrev(direction,numberSlides)

            var slidesToPass = '-'+ (activeImage) +'00%';
            $('.wrapper').animate({'margin-left':slidesToPass},timeToTake);
            $('li.active').removeClass('active');
            dotss[activeImage].classList.add('active');

            clearInterval(interval);
            timer();
        }

//Define the actions on click

    // Define what happens when buttons right or left are clicked
    $(".arrows").on("click",function(event){
        slideWhere(event.target.id,1);
    })
    //Define what happens when you click on a dot
    $("li.dot").on("click",function(event){  

        $('li.active').removeClass('active');
        event.target.classList.add('active');
        let decalage = parseInt(event.target.id,10) -activeImage

        if  (decalage > 0) {
            slideWhere('next', decalage);
        } else if (decalage < 0) {
            slideWhere('prev', -decalage);
        } 
    })

    //Make the images slide if nothing happens 
    var interval;
    var timer = function(){
        interval = setInterval(function(){slideWhere('next',1)}
        ,5000);
    }
    //Set the automatic slide of photos
    timer();

    //See miniatures on hover of arrows
        //Identify which image to
    $(".arrows").hover(
        //Entering the zone
        function(e){
            if (e.target.id =='prev') {
                var imageNumToDisplay = nextOrPrev('prev',1);
                var urlImage = 'url('+ images[imageNumToDisplay].src + ')';
                $("#preview-prev").css('background-image', urlImage);
                        
            } else if (e.target.id =='next') {
                var imageNumToDisplay = nextOrPrev('next',1);
                var urlImage = 'url('+ images[imageNumToDisplay].src + ')';
                $("#preview-next").css('background-image', urlImage);
            }
        },
        //Leaving the zone
        function(e){
            if (e.target.id =='prev') {
                $("#preview-prev").css('background-image', 'none');
                        
            } else if (e.target.id =='next') {
                $("#preview-next").css('background-image', 'none');
            }
        }   
    );


})
