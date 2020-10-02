const str = "ethan michael gustafson";

function stringToLetterCountObject(string, object = {}) {
    // In this case, the spread operator (`...`) is copying all enumerables from the passed in object
    // argument, which won't mutate the original object passed in.
    const newObj = {...object};
    // If the string is not empty AND the string has the key of the letter, increment its count,
    // then begin a recursive call. The string will slice the rest of the string off without the first
    // letter, and the new object values will be passed through as the beginning argument in each recursive
    // call.
    if (string !== "") {
        if (hasKey(string[0], newObj)) {
            newObj[`${string[0]}`] += 1;
            return stringToLetterCountObject(string.slice(1), newObj);
        } else {
    // If the string doesn't have the key of that letter, then set a new key with the letter and initialize
    // its value with a value of 1, and begin a new recursive call
            newObj[`${string[0]}`] = 1;
            return stringToLetterCountObject(string.slice(1), newObj);
        }
    // If the string is empty, just return the object containing the letter count values.
    } else {
    // In recursion, each recursive call adds a call to the call stack, which is the stack data structure.
    // The stack data structure follows the FILO order (First-in, Last-out), which means the first item
    // will be the last item to be removed from the stack.

    // This also means the return value of these nested recursive calls will be this final return value
    // of newObj. That is why when the recursive calls are removed from the stack, they carry this final
    // value with them until all of the calls from the stack are removed. The true return value of each
    // recursive call is this newObj.
        return newObj;
    }
}

// hasKey is generating an array of keys from the passed in object, and returning whether or not
// the key argument is in that object.
function hasKey(key, object = {}) {
    let objectKeys = Object.keys(object);
    return !!objectKeys.includes(key);
}

// Another way to do it is this:

// function stringToLetterCountObject(string){

//     var object = new Object();
    
//         for (let i = 0; i < string.length; i++){
//             if (hasKey(string[i], object)){
//                 object[`${string[i]}`] += 1;
//             } else {
//                 object[`${string[i]}`] = 1;
//             }
//         }
//     return object;
// }