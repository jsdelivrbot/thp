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
//= require turbolinks
//= require_tree .


//Set global variables
   var mappy;
   var markersArray = [];
   var infowindow;
//Basic function to deisgn the map
    function myMap() {
        var myLatLng = new google.maps.LatLng(40.779502, -73.967857);
        var mapProp= {
            center: myLatLng,
            zoom: 1,
            panControl: true,
            zoomControl: true,
            mapTypeControl: false,
            scaleControl: true,
            streetViewControl: true,
            overviewMapControl: true,
            rotateControl: false
            };
        mappy=new google.maps.Map(document.getElementById("googleMap"),mapProp);
    }

//Load the rest of the functions when window is loaded to avoid asynchroneous problems
$(function(){
   $(window).load(function(){

        //Function to add a new marker to the list of markers
            function addMarkerToMap(lati,longi,name,map,list){
                //Create the marker
                var marker=new google.maps.Marker({
                    position: new google.maps.LatLng(lati,longi),
                    label: name,
                    map: map,
                    //Animation of marker
                    animation: google.maps.Animation.DROP
                });
                //Add it to the list
                list.push(marker);
                addEventsToMarker(marker,map);
            }
        //Function to put one marker on the map
            function addEventsToMarker(marker,map){
                
                //Add event listener to display marker information when mouseover
                var infowindow = new google.maps.InfoWindow();
                infowindow.setContent('<h3>Name:Mousaillon</h3>'+'<em>Click on marker for more details</em>');
                marker.addListener('mouseover', function() {
                        infowindow.open(map, this);
                    });
                marker.addListener('mouseout', function() {
                     infowindow.close(map, this);
                });

                //Add event listener to zoom on a click on a marker and display information
                var infowindow2 = new google.maps.InfoWindow();
                var content = '<div id="content">'+
                                '<div id="siteNotice">'+
                                '</div>'+
                                '<h2 id="firstHeading" class="firstHeading">Name Moussaillon</h2>'+
                                '<div id="bodyContent">'+
                                '<p>GitHub name: ABCDEFG</p>'+
                                '<p>Slack profile name: ABCDEFG</p>'+
                                '</div>'+
                                '<div id="siteNotice">'+
                                '<img src="https://upload.wikimedia.org/wikipedia/commons/f/f9/Phoenicopterus_ruber_in_S%C3%A3o_Paulo_Zoo.jpg" height="50" width="50"></img>'
                                '</div>'
                                '</div>'
                infowindow2.setContent(content);
                google.maps.event.addListener(marker,'click',function() {
                    map.setZoom(12);
                    map.setCenter(marker.getPosition());
                    infowindow2.open(map, this);
                        setTimeout(function(){
                            infowindow2.close(map, this);
                    }, 4000)
                })
            }

        //BONUS - not used
        //Function to do an action on all the markers on the map
            function funcOnMarkers (markersArr,map,timing,func){
                //Go through all the elements in markersArray
                var marker;
                for (var i = 0; i < markersArr.length; i++) {
                    marker = markersArr[i];
                    //Apply the specific function
                    setTimeout(function() {
                        func(marker,map);
                    }, i * timing);
                };
                //Center the map at the last added marker position
                map.setCenter(marker.getPosition());
                };         
        

        //Test newMarker

        addMarkerToMap(30,50,"AB",mappy,markersArray);
        
        addMarkerToMap(40,2.4,"C",mappy,markersArray);
        addMarkerToMap(48.8,2.3,"LJ",mappy,markersArray);
        alert(markersArray.length);
   });
});
