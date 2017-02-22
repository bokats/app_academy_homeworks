function madLib(verb, adj, noun) {
  return `We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}.`
}

// console.log(madLib('make', 'best', 'guac'));

function isSubstring(SearchString, SubString) {
  return SearchString.includes(SubString);
}

// console.log(isSubstring("time to program", "time"));
// // true
//
// console.log(isSubstring("Jump for joy", "joys"));
// // false


function fizzbuzz(array) {
  const result = [];
  array.forEach(num => {
    if (num % 3 === 0 || num % 5 === 0) {
      if (!(num % 3 === 0 && num % 5 === 0)) {
        result.push(num);
      }
    }
  });
  return result;
}

console.log(fizzbuzz([3,5,6,7]));

function isPrime(num) {
  let test = 2;
  while (test < num) {
    if (num % test === 0) {
      return false;
    }
    test ++;
  }
  return true;
}

function sumOfNPrimes(n) {
  let result = [];
  let start = 2;
  while (result.length < n) {
    if (isPrime(start)) {
      result.push(start);
    }
    start++;
  }
  return result;
}

console.log(sumOfNPrimes(10));
