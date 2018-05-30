
//Define the variables corresponding to the 4 colors of the board
	var $one = document.getElementById('circle-red');
	var $two =  document.getElementById('circle-green');
	var $three = document.getElementById('circle-yellow');
	var $four = document.getElementById('circle-blue');

//Define the variables that will be used in the game
	var actualSequence, playerSequence, playerTurn;

// Define the sequence that will be followed
	function firstSequence (){
		//Define the number of elements of the first sequence from 1 to 4
		var numberElements = Math.floor(Math.random()*3.99+1);
		//Define the sequence that will be returned
		var sequence = [];
		var i;
		for (i=1; i<= numberElements; i++){
			sequence.push(Math.floor(Math.random()*3.99+1));
		}
		return sequence;
	}

//Define the sequence that will be used for the round > #1
	function nextSequence (previousSequence) {
		var appendSequence = [Math.floor(Math.random()*3.99+1)];
		var newSequence = previousSequence.concat(appendSequence);
		return newSequence;
	}

//Show the sequence to follow on the board
	function animateSequence(sequence) {
		var i = 0;
	    var interval = setInterval(function() {
	        lightUp(sequence[i]);

	        i++;
	        if (i >= sequence.length) {
	            clearInterval(interval);
	        }
	   }, 600);
	}

//Function light-up
	function lightUp(element){
		switch(element){
				case 1:
					$one.className += 'light-up';
					window.setTimeout(function() {$one.classList.remove('light-up');}, 300);
					break;
				case 2:
					$two.className += 'light-up';
					window.setTimeout(function() {$two.classList.remove('light-up');}, 300);
					break;
				case 3:
					$three.className += 'light-up';
					window.setTimeout(function() {$three.classList.remove('light-up');}, 300);
					break;
				case 4:
					$four.className += 'light-up';
					window.setTimeout(function() {$four.classList.remove('light-up');}, 300);
					break;
			}
	}

//Function Clicked-on
	function clickedOn(e){
		e.target.className += 'clicked-on';
		window.setTimeout(function() {e.target.classList.remove('clicked-on');}, 100);
	}

//Define the events to add an element to the playerSequence chose by the player
	$one.addEventListener('click', function(e){
        playerClick(1);
        clickedOn(e);
        
    	});
    $two.addEventListener('click', function(e){
        playerClick(2);
        clickedOn(e);
    	});
    $three.addEventListener('click', function(e){
        playerClick(3);
        clickedOn(e);
        });
    $four.addEventListener('click', function(e){
       playerClick(4); 
       clickedOn(e);
    	});

//Define the function that launch the game
function gameOn(){
	if (confirm("Ready? Watch carefully what Simon says")) {
		actualSequence = firstSequence();
		animateSequence(actualSequence);
		playerTurn = 0;
		playerSequence = [];
	}
}

//Define the function that iterates the game when the first turn is completed
function gameNext(){
	if (confirm("Ready for this next round? Watch carefully what Simon says")) {
		actualSequence = nextSequence(actualSequence);
		animateSequence(actualSequence);
		playerTurn = 0;
		playerSequence = [];
	}
}
//Define what happens when a player clicks
	function playerClick(tileClicked) {
		playerSequence.push(tileClicked);
		if (tileClicked != actualSequence[playerTurn]) {
			alert("Wrong move. But nicely done. Let's start again");
			gameOn();
			
		} else { 
			playerTurn += 1;
			if (playerTurn == actualSequence.length) {
			gameNext();}
		}

	}


//Tests
	gameOn();





