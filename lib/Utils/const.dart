Iterable<String> generateAList(int start, int end) sync* {
  for (int i = start; i <= end; i++) yield String.fromCharCode(i);
}

final alphabetListLowerCase =
    generateAList("a".codeUnitAt(0), "z".codeUnitAt(0));
const symbols = [
  "[",
  "=",
  "]",
  ";",
  "_",
  "-",
  ")",
  ":",
  "?",
  "|",
  "\\",
  "@",
  ">",
  "}",
  "'",
  "&",
  "#",
  ".",
  "+",
  "/",
  "<",
  "^",
  "`",
  "*",
  "%",
  "{",
  "!",
  "\$",
  "(",
  "~"
];

final alphabetListUpperCase =
    generateAList("A".codeUnitAt(0), "Z".codeUnitAt(0));
