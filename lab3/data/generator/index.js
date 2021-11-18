const fs = require("fs");

function normalizeValue(digitsCount, value) {
  const missingDigits = digitsCount - value.length;

  let zeroes = "";

  if (missingDigits == 0) {
    return value;
  }

  for (let index = 0; index < missingDigits; index++) {
    zeroes = `0${zeroes}`;
  }

  return `${zeroes}${value}`;
}

function getValue(length, index) {
  const value = index.toString(2);

  return normalizeValue(length, value);
}

function generateValues(arrayLength, digitsCount) {
  const values = new Array();

  for (let index = 0; index < arrayLength; index++) {
    values[index] = index;
  }

  return values.map((it) => getValue(digitsCount, it));
}

function writeIntoFile(values, fileName) {
  const data = values.reduce((acc, item) => {
    return `${acc}${item}\n`;
  }, "");

  fs.writeFileSync(fileName, data);
}

function multiplex(cba, d) {
  switch (cba) {
    case "000":
      return d[0];
    case "001":
      return d[1];
    case "010":
      return d[2];
    case "011":
      return d[3];
    case "100":
      return d[4];
    case "101":
      return d[5];
    case "110":
      return d[6];
    case "111":
      return d[7];
  }
}

function invert(digit) {
  return digit === "1" ? "0" : "1";
}

function getArrayLengthByNumber(numberLength) {
  return 2 ** numberLength;
}

function addExpectedValue(value) {
  // OE
  if (value[0] == 1) return `ZZ${value}`;

  const d = value.slice(1, 9).split("").reverse().join("");

  const cba = value.slice(9);

  const y = multiplex(cba, d);
  const w = invert(y);

  return `${y}${w}${value}`;
}

function modifyValues(values) {
  return values.map(addExpectedValue);
}

function main() {
  // OE, C, B, A, D(8) = 4 + 8 = 12
  const numberLength = 12; // DO NOT CHANGE

  const arrayLength = getArrayLengthByNumber(numberLength);

  const values = generateValues(arrayLength, numberLength);

  const withExpectedValues = modifyValues(values);

  writeIntoFile(withExpectedValues, "../lab1.txt");
}

main();
