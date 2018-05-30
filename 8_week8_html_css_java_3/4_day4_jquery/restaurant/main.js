//Define all the elements needed from the page
    presentation = $("#presentation");
    menu = $("#menu");
    lorem = $("#lorem");
    presentationContent = $("#presentation-content");
    menuContent = $("#menu-content");
    loremContent = $("#lorem-content");
    

//Function to use when loading the document

    $(document).ready(function(){
        presentationContent.show();
        menuContent.hide();
        loremContent.hide();
        presentation.addClass( "selected" );
    });


alert(menuContent.is(":hidden"));

//Add event listener for element needed
    $("#row1 div").hover(function(event){
        //Identify which element has been clicked
        var e = event.target, idElement = e.id;
        //Make the related content appear and the rest dissapear and change the style of the"titles"
        if ( idElement == "menu" && menuContent.is(":hidden") ) {
            
            if (!(presentationContent.is(":hidden"))) {
                presentationContent.slideUp();
                presentation.removeClass( "selected" );
            };
            if (!(loremContent.is(":hidden"))) {
                loremContent.slideUp();
                lorem.removeClass( "selected" );
            };
            menu.addClass( "selected" );
            menuContent.slideDown();

        } else if (idElement == "lorem" && loremContent.is(":hidden")) {
            
                if (!(presentationContent.is(":hidden"))) {
                    presentationContent.slideUp();
                    presentation.removeClass( "selected" );
                };
                if (!(menuContent.is(":hidden"))) {
                    menuContent.slideUp();
                    menu.removeClass( "selected" );
                };
                lorem.addClass( "selected" );
                loremContent.slideDown();

        } else if (idElement == "presentation" && presentationContent.is(":hidden")) {
            
                if (!(loremContent.is(":hidden"))) {
                    loremContent.slideUp();
                    lorem.removeClass( "selected" );
                };
                if (!(menuContent.is(":hidden"))) {
                    menuContent.slideUp();
                    menu.removeClass( "selected" );
                };
                presentation.addClass( "selected" );
                presentationContent.slideDown();
        }
    });