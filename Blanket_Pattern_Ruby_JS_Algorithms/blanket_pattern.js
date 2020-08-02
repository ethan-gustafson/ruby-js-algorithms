let string = "RRGGBBYYKK";

function blanketPattern(str){
    var newString = str.slice(); // we are slicing the original string
    
    for (let i = 0; i < 20; i++){ 
        let char = newString.slice(0, 1); // this slices off the first letter
        let slicedString = newString.slice(1); // this slices off the rest of the letters after the first letter
        let concatenatedString = slicedString.concat(char); // this adds the sliced off first letter to the end of the string.
        newString = concatenatedString.slice(); // we re-assign the newString copy into the newly concatenated string.
        console.log(concatenatedString); // Then we output the result.
    }
} // The original string argument was never destructively modified.

// ------------------------------------------------------------------------------- 

// Here is the code without the comments all together:

// function blanketPattern(str){
//     var newString = str.slice();
    
//     for (let i = 0; i < 20; i++){ 
//         let char = newString.slice(0, 1);
//         let slicedString = newString.slice(1);
//         let concatenatedString = slicedString.concat(char);
//         newString = concatenatedString.slice(); 
//         console.log(concatenatedString); 
//     }
// }