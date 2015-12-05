'use strict';

var fs = require('fs');
var R = require('ramda');

fs.readFile('day-03.input', 'utf8', function (err, data) {
  if (err) {
    return console.log(data);
  }

  var list = data.split('');
  var coordinates = [0,0];
  var history = [];

  function move(direction) {
    if (direction == '^') {
      coordinates[1] = R.inc(coordinates[1]);
    } else if (direction == 'v') {
      coordinates[1] = R.dec(coordinates[1]);
    } else if (direction == '>') {
      coordinates[0] = R.inc(coordinates[0]);
    } else if (direction == '<') {
      coordinates[0] = R.dec(coordinates[0]);
    }

    history = R.append(R.clone(coordinates), history);
  }

  R.forEach(move, list);

  console.log('Part 1:')
  console.log(R.length(R.uniq(history))+1);

  function isEven(n) {
   return n % 2 == 0;
  }

  function isOdd(n) {
   return Math.abs(n % 2) == 1;
  }

  var santa_coordinates = [0,0];
  var robosanta_coordinates = [0,0];
  var history2 = [];

  for (var i = 0; i < list.length; i++) {
    var direction = list[i];
    if (i == 0 || isEven(i)) {
      if (direction == '^') {
        santa_coordinates[1] = R.inc(santa_coordinates[1]);
      } else if (direction == 'v') {
        santa_coordinates[1] = R.dec(santa_coordinates[1]);
      } else if (direction == '>') {
        santa_coordinates[0] = R.inc(santa_coordinates[0]);
      } else if (direction == '<') {
        santa_coordinates[0] = R.dec(santa_coordinates[0]);
      }
    }

    if (isOdd(i)) {
      if (direction == '^') {
        robosanta_coordinates[1] = R.inc(robosanta_coordinates[1]);
      } else if (direction == 'v') {
        robosanta_coordinates[1] = R.dec(robosanta_coordinates[1]);
      } else if (direction == '>') {
        robosanta_coordinates[0] = R.inc(robosanta_coordinates[0]);
      } else if (direction == '<') {
        robosanta_coordinates[0] = R.dec(robosanta_coordinates[0]);
      }
    }

    history2 = R.append(R.clone(santa_coordinates), history2);
    history2 = R.append(R.clone(robosanta_coordinates), history2);
  }

  console.log('Part 2:');
  console.log(R.length(R.uniq(history2)));
});
