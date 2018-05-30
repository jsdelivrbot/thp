//Define the eventlistener for onclick
    
    //Define all the buttons
    var buttons = document.querySelectorAll("div.button");
    var screen = document.getElementById('screen');
    
    //Add event listener for each button
    buttons.forEach(function(elem) {
        elem.addEventListener('click', function(e){
            valueClick = e.target.innerText;
            updateString(valueClick);
        });
    });

//Define the global variables that will be used 
    let displayScreen= "";
    let calculalorString ="";
    let op = ["+","-","/","*"]
    let numbers = ["0","1","2","3","4","5","6","7","8","9"]

//Define the function that will interact with the calculator
    //Reset the strings, for instance when AC is pushed
    function resetStrings(){
        displayScreen= "";
        calculalorString ="";
    }

    //Function to update the display 
    function updateDisplay(){
        screen.innerText = displayScreen
    }

    //Cut the last part of the string if CE is pushed
    function ceStrings(){
        if (calculalorString.length >0) {
            if (op.includes(calculalorString.slice(-1))){;
            displayScreen= "";
            calculalorString = calculalorString.slice(0, -1);
            } else {
            displayScreen = displayScreen.slice(0, -1);
            calculalorString = calculalorString.slice(0, -1);
            }
        } else {alert("CE works only if you have typed on an element previously")}
    }
    //function updateString
    function updateString(element){
        switch(element){
            case "+":
                 if (op.includes(calculalorString.slice(-1))) {alert("You can't use two mathematical operations in a row")
                } else { calculalorString += element;}
                 break;
            case "-":
                if (op.includes(calculalorString.slice(-1))) {alert("You can't use two mathematical operations in a row")
                } else { calculalorString += element;}
                 ;
                 break;
             case "*":
                 if (calculalorString.length===0) {alert("You need to enter one number before applying the multiplication operator")
                    } else if (op.includes(calculalorString.slice(-1))) {alert("You can't use two mathematical operations in a row")
                    } else { calculalorString += element;}
                 break;
            case "/":
                 if (calculalorString.length===0) {alert("You need to enter one number before applying the division operator")
                    } else if (op.includes(calculalorString.slice(-1))) {alert("You can't use two mathematical operations in a row")
                    } else { 
                        calculalorString += element;}
                 break;
            //Special cases ac et ce
            case "CE":
                ceStrings();
                updateDisplay();
                 break;
            case "AC":
                resetStrings();
                updateDisplay();
                 break;
            // Special case "equals"
             case "=":
                 resultEquation = eval(calculalorString);
                 displayScreen = resultEquation + "";
                 calculalorString = resultEquation + "";
                 updateDisplay();
                 break;
            //Special case dot
            case ".":
                if (numbers.includes(calculalorString.slice(-1)) && calculalorString.length > 0) {
                    calculalorString += element;
                    displayScreen += element;
                    updateDisplay();
                } else if (element === calculalorString.slice(-1)) { 
                    alert("You can't have two dots in a row");
                } else if (op.includes(calculalorString.slice(-1))) {
                    calculalorString += "0" + element;
                    displayScreen =  element;
                    updateDisplay();
                } else {
                    calculalorString += "0" + element;
                    displayScreen +=  element;
                    updateDisplay();
                };
                 break;
            //If it is a number
            default:
                if (calculalorString != "") {
                        if (op.includes(calculalorString.slice(-1))) {
                            displayScreen = element;
                        } else {
                            displayScreen += element;
                        }
                } else {displayScreen += element;}
                calculalorString += element;
                updateDisplay();
        }

        //Make sure the display is done correctly
        var x = + "displayScreen"
        if (displayScreen > 999999999999) {
            alert ("You have exceeded the display potential of the calculator. All values are reset.");
            displayScreen = ""
            calculalorString =""
            updateDisplay();
        } else if (displayScreen.length > 12){
            displayScreen = displayScreen.slice(0,(12-displayScreen.length));
            updateDisplay();
        }
    }
