'use strict';

var fs = require('fs');
var R = require('ramda');

fs.readFile('day-12.input', 'utf8', function (err, data) {
  if (err) {
    return console.log(data);
  }

  var sum = 0;
  var data = JSON.parse(data);

  var sumit = x => {
    if (R.is(Object, x)) {
      loop(x);
    }
    else if (R.is(Number, x)) {
      sum += x;
    }
  };

  function loop(data) {
    R.forEach(sumit, R.values(data));
  }

  loop(data);
  console.log(sum);
});
