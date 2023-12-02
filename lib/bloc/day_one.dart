part of 'main_bloc.dart';

enum Digits { one, two, three, four, five, six, seven, eight, nine }

final _digitsMatcher = [for (var i = 48; i < 58; i++) String.fromCharCode(i)];

Future<String> _task1(List<String> fileContent) async {
  final List<int> numbers = [];
  for (final line in fileContent) {
    final Characters characters = line.characters;
    final first = characters.firstWhere((c) {
      return _digitsMatcher.any((element) => element == c);
    });
    final last = characters.lastWhere((c) {
      return _digitsMatcher.any((element) => element == c);
    });
    final parse = int.parse(first + last);
    numbers.add(parse);
  }
  var res = 0;
  for (var element in numbers) {
    res += element;
  }
  print('---> task1: $res');
  return res.toString();
}

Future<String> _task2(List<String> fileContent) async {
  final List<int> numbers = [];
  for (final line in fileContent) {
    String? firstDigit;
    String? lastDigit;

    for (var index = 0; index < line.length; index++) {
      firstDigit ??= _getFirstDigit(line.substring(index));
    }
    for (var index = line.length; index >= 0; index--) {
      lastDigit ??= _getLastDigit(line.substring(0, index));
    }
    var parse = int.parse(firstDigit! + lastDigit!);
    numbers.add(parse);
  }
  var res = 0;
  for (var element in numbers) {
    res += element;
  }
  print('---> task2: $res');
  return res.toString();
}

String? _getFirstDigit(String line) {
  String? firstDigit;

  _digitsMatcher.any((element) {
    final starts = line.startsWith(element);
    if (starts) firstDigit = element;

    return starts;
  });

  Digits.values.any((element) {
    final starts = line.startsWith(element.name);
    if (starts) firstDigit = _getReplacement(element);

    return starts;
  });
  return firstDigit;
}

String? _getLastDigit(String line) {
  String? lastDigit;

  _digitsMatcher.any((element) {
    final ends = line.endsWith(element);
    if (ends) lastDigit = element;

    return ends;
  });

  Digits.values.any((element) {
    final ends = line.endsWith(element.name);
    if (ends) lastDigit = _getReplacement(element);
    return ends;
  });
  return lastDigit;
}

String _getReplacement(Digits digits) => switch (digits) {
      Digits.one => '1',
      Digits.two => '2',
      Digits.three => '3',
      Digits.four => '4',
      Digits.five => '5',
      Digits.six => '6',
      Digits.seven => '7',
      Digits.eight => '8',
      Digits.nine => '9',
    };
