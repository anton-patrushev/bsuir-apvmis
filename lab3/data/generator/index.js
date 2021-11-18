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

function getArrayLengthByNumber(numberLength) {
  return numberLength ** 2;
}

function main() {
  const numberLength = 5;

  const arrayLength = getArrayLengthByNumber(numberLength);
  const values = generateValues(arrayLength, numberLength);

  writeIntoFile(values, "../lab1.txt");
}

main();
