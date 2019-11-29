const performance = require('perf_hooks').performance;

function readr () {
  var lines = require('fs').readFileSync('txtfiles/p099_base_exp.txt', 'utf-8');
  return lines.split('\n').map(x => x.split(','));
}

function arrayMax (arr) {
  var len = arr.length, max = -Infinity;
  while (len--) {
    if (arr[len] > max) {
      max = arr[len];
    }
  }
  return max;
};

function problem_99 () {
  const start = performance.now();
  const lines = readr();
  const sizes = lines.map(x => Math.log(x[0]) * x[1]);
  const largest = arrayMax(sizes);
  const ans = sizes.indexOf(largest) + 1;
  const end = performance.now();
  console.log("The answer is:", ans, "and it took,", end - start, "to calculate");
}

problem_99();
