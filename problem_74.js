const performance = require('perf_hooks').performance;
const facs = [1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880, 362800];
const maxStartNum = 1000000;

function facSum (num) {
  return (num + '').split('').reduce((total, x) => total + facs[x.charCodeAt(0) - 48], 0);
}

function len60 (num) {
  var loop = [num];
  while (loop.indexOf(loop[loop.length - 1]) === loop.length - 1) {
    loop.push(facSum(loop[loop.length - 1]));
  }
  return loop.length === 61;
}

function problem_79 () {
  const start = performance.now();
  const ans = [...Array(maxStartNum).keys()].filter(len60).length;
  const end = performance.now();
  console.log('The answer is:', ans, ' and took ', end - start, 'to calculate');
}

problem_79();
