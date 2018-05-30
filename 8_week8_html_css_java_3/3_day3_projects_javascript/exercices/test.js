
// Define the function to find the max value of an array
function my_max(array){
    var a_length = array.length, maxNumber = array[0];
    for (var iter = 1; iter < a_length; iter++){
        if (array[iter] > maxNumber) {maxNumber = array[iter];}
    }
    alert(maxNumber)
}

//Define the function to count the number of vowels of a stirng
function vowel_count(string) {
    var vowels_dic = ["a","e","i","o","u","y"], numberVowels = 0, split_string = string.toLowerCase().split(""), split_string_length = split_string.length ;

    for (var iter = 0; iter < split_string_length; iter++){
        if (vowels_dic.includes(split_string[iter])) {numberVowels++;}
    }
    alert (numberVowels)
}

//Define a function that reverse totally a string
function reverse(string){
    var reversed_string = "", split_string = string.split(""), split_string_length = split_string.length;
    for (var iter = (split_string_length-1); iter >= 0; iter--){
        reversed_string += split_string[iter];
    };
    alert(reversed_string);
}

// Test the 3 functions
my_max([4,2,3,6]);
vowel_count("Il etait une fois ");
reverse("Coucou toi!");