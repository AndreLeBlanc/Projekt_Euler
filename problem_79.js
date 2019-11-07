const performance = require('perf_hooks').performance;
function keyList () {
  var lines = require('fs').readFileSync('txtfiles/keylog.txt', 'utf-8')
    .split('\n')
    .filter(Boolean);
  return [...new Set(lines)];
}

function bef () {
  const keys = keyList();
  const start = performance.now();
  var befores = [[], [], [], [], [], [], [], [], [], []];
  const keySplit = keys.map(i => i.split('').map(Number));
  for (let i = 0; i < keySplit.length; i++) {
    befores[keySplit[i][2]].push(keySplit[i][1]);
    befores[keySplit[i][2]].push(keySplit[i][0]);
    befores[keySplit[i][1]].push(keySplit[i][0]);
  }
  befores = befores.map(x => [...new Set(x)]);
  befores.sort(function (a, b) {
    return a.length - b.length;
  })
  return { befores, start };
}

function problem_79 () {
  const { befores, start } = bef();
  var res = [];
  for (let i = 0; i < befores.length; i++) {
    if (befores[i].length > 0) {
      const digit = befores[i][0];
      res.push(digit);
      for (let j = i; j < befores.length; j++) {
        const index = befores[j].indexOf(digit);
        befores[j].splice(index, 1);
      }
    }
  }
  res.push(0);
  res = parseInt(res.join(''));
  const finish = performance.now();
  console.log(res);
  console.log(finish - start);
}

problem_79();
