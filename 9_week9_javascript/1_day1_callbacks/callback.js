'use strict';

//Mainly taken from https://github.com/dotm/functionalJS/blob/master/callbacks/callbackExercises.js

// Warm-up
    Array.prototype.myEach = function(func) {
      for (let i = 0; i < this.length; i++) {
        console.log(this)
        /*function.call(thisArg, arg1, arg2, ...)
        func is under defined function passed to myEach as an arg */
        func.call(this, this[i])
      }
    };


    Array.prototype.myMap = function(func) {
      let results = [];
      for (let i = 0; i < this.length; i++) {
        results.push(func.call(this, this[i]));
      }
      console.log(results);
      return results;
    };

var test = function(item) {
    return item*4;
};


//TEST
[1,2,3,4].myMap(test);



//Bianca Gandolfo course exercices
    //Func Caller
    function funcCaller(callback,arg){
        return callback(arg);
    };
    //Func First Val aumented
    function firstVal(arr,callback){
        if (arr instanceof Array){
            return callback(arr[0], 0, arr);
        } else {
            for (var i in arr) {
            return callback(arr[i], i, arr);
            }
        }
    };
        //Func for test
        function anyFunction(value, index, array) {
          console.log("Value: " + value + " at Index: " + index + " From: " + array);
        };

        firstVal([5,4,3,2], anyFunction);
        firstVal({'one': 1, 'two': 2}, anyFunction); // Value: 1 at Index: one From: [object Object] 

        //Create function Once

        function once(func){
          var called;
          return function(args){
            if (typeof called === "undefined"){
              called = true;
              return func.apply(this,args);
            }else{
              console.log("This function has been called before");
              return false  ;
            }
          }
        }

            function print2 (arg2,arg3,arg1000){
              console.log(arg2);
              console.log(arg3);
              console.log(arg1000);
            }
            var print2once = once(print2);
            print2once([1,2,3]);
            print2once([1,2,3]);

