const performance = require('perf_hooks').performance;
function readr() {
    var lines = require('fs').readFileSync('txtfiles/p059_cipher.txt', 'utf-8');
    return lines.split(',');
}

function isEnglish(outPut) {
    for(j = 0; j < outPut.length-2; j++) {
        if(outPut[j] === 116 && outPut[j+1] === 104 && outPut[j+2] === 101){
            for (let k = 0; k < outPut.length-3; k++) {
                if(outPut[k] === 109 && outPut[k+1] === 111 && outPut[k+2] === 115 && outPut[k+3] === 116){
                    return outPut.reduce((a, b) => a + b, 0);
                }
            }
        }
    }
    return -1;
 }

function correctKey(key, lines) {
    var output = [];
    for (let i = 0; i < lines.length; i++) {
        let x = lines[i] ^ key[i%3];
        output.push(x);
     }

    return isEnglish(output);
}

function problem_59() {
    var lines = readr();
    var start = performance.now();
    for (let i = 97; i <= 122; i++) {
        for (let j = 97; j <= 122; j++) {
            for (let k = 97; k <= 122; k++){
                let key = [i, j, k];
                ans = correctKey(key, lines);
                if (0 < ans) {
                    var end = performance.now();
                    console.log("The answer is:", ans, "and it took,", end-start, "to calculate");
                    return 0;
                }
            }
        }
    }
}

problem_59();
