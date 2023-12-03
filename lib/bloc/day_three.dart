part of 'main_bloc.dart';

final _dotMatcher = String.fromCharCode(46);

Future<String> _task1Day3(List<String> fileContent) async {
  var res = 0;
  final symbols = <Symbol>[];
  final numbers = <PartNumber>[];
  var y = 0;
  for (final line in fileContent) {
    final characters = line.characters;
    for (var x = 0; x < characters.length; x++) {
      var char = characters.elementAt(x);
      if (char != _dotMatcher) {
        if (_digitsMatcher.any((element) => element == char)) {
          var part = PartNumber(number: char, x: [x], y: y);
          while (x + 1 < characters.length &&
              _digitsMatcher
                  .any((element) => element == characters.elementAt(x + 1))) {
            x++;
            part = part.copyWith(number: part.number + characters.elementAt(x));
            part.x.add(x);
          }
          numbers.add(part);
        } else {
          symbols.add(Symbol(x: x, y: y));
        }
      }
    }
    y++;
  }
  for (final symbol in symbols) {
    for (final num in numbers) {
      final symY = symbol.y;
      if (num.y == symY || num.y == symY - 1 || num.y == symY + 1) {
        final symX = symbol.x;
        if (num.x.any((element) => element == symX) ||
            num.x.any((element) => element == symX - 1) ||
            num.x.any((element) => element == symX + 1)) {
          res += int.parse(num.number);
        }
      }
    }
  }
  return res.toString();
}

Future<String> _task2Day3(List<String> fileContent) async {
  var res = 0;
  final symbols = <Symbol>[];
  final numbers = <PartNumber>[];
  var y = 0;
  for (final line in fileContent) {
    final characters = line.characters;
    for (var x = 0; x < characters.length; x++) {
      var char = characters.elementAt(x);
      if (char != _dotMatcher) {
        if (_digitsMatcher.any((element) => element == char)) {
          var part = PartNumber(number: char, x: [x], y: y);
          while (x + 1 < characters.length &&
              _digitsMatcher
                  .any((element) => element == characters.elementAt(x + 1))) {
            x++;
            part = part.copyWith(number: part.number + characters.elementAt(x));
            part.x.add(x);
          }
          numbers.add(part);
        } else if (char == '*') {
          symbols.add(Symbol(x: x, y: y));
        }
      }
    }
    y++;
  }
  var gears = <int>[];
  for (final symbol in symbols) {
    var gearRatio = <int>[];
    final symY = symbol.y;
    for (final num in numbers) {
      if (num.y == symY || num.y == symY - 1 || num.y == symY + 1) {
        final symX = symbol.x;
        if (num.x.any((element) => element == symX) ||
            num.x.any((element) => element == symX - 1) ||
            num.x.any((element) => element == symX + 1)) {
          gearRatio.add(int.parse(num.number));
        }
      }
    }
    if (gearRatio.length == 2) {
      gears.add(gearRatio[0] * gearRatio[1]);
    }
  }
  for (final gear in gears) {
    res += gear;
  }
  return res.toString();
}

class Symbol {
  Symbol({required this.x, required this.y});

  final int x;
  final int y;
}

class PartNumber {
  PartNumber({required this.number, required this.x, required this.y});

  final String number;
  final List<int> x;
  final int y;

  PartNumber copyWith({
    String? number,
    List<int>? x,
    int? y,
  }) {
    return PartNumber(
      number: number ?? this.number,
      x: List.from(x ?? this.x),
      y: y ?? this.y,
    );
  }
}
