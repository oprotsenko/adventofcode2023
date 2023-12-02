part of 'main_bloc.dart';

int _getAmount(String color) =>
    switch (color) { 'red' => 12, 'green' => 13, 'blue' => 14, _ => 0 };

Future<String> _task1Day2(List<String> fileContent) async {
  var res = 0;
  for (final line in fileContent) {
    final splitId = line.split(':');
    final parts = splitId[1].split(';');
    final isPossible = [];
    for (final part in parts) {
      final cubes = part.split(',');
      for (final cube in cubes) {
        final splitCube = cube.split(' ');
        final amount = int.parse(splitCube[1].trim());
        final color = splitCube[2].trim();
        final maxAmount = _getAmount(color);
        isPossible.add(amount <= maxAmount);
      }
    }
    if (isPossible.every((element) => element == true)) {
      final id = splitId[0].split(' ')[1];
      res += int.parse(id);
    }
  }
  return res.toString();
}

Future<String> _task2Day2(List<String> fileContent) async {
  var res = 0;
  final power = <int>[];
  for (final line in fileContent) {
    final splitId = line.split(':');
    final parts = splitId[1].split(';');
    var minGameSet = const GameSet();
    for (final part in parts) {
      final cubes = part.split(',');
      for (final cube in cubes) {
        final splitCube = cube.split(' ');
        final amount = int.parse(splitCube[1].trim());
        final color = splitCube[2].trim();
        if (color.contains('red')) {
          if (minGameSet.red == 0 || minGameSet.red < amount) {
            minGameSet = minGameSet.copyWith(red: amount);
          }
        } else if (color.contains('green')) {
          if (minGameSet.green == 0 || minGameSet.green < amount) {
            minGameSet = minGameSet.copyWith(green: amount);
          }
        } else if (color.contains('blue')) {
          if (minGameSet.blue == 0 || minGameSet.blue < amount) {
            minGameSet = minGameSet.copyWith(blue: amount);
          }
        }
      }
    }
    var setPower = minGameSet.red * minGameSet.green * minGameSet.blue;
    power.add(setPower);
  }
  for (var element in power) {
    res += element;
  }
  return res.toString();
}

class GameSet {
  const GameSet({
    this.red = 0,
    this.green = 0,
    this.blue = 0,
  });

  final int red;
  final int green;
  final int blue;

  GameSet copyWith({
    int? red,
    int? green,
    int? blue,
  }) {
    return GameSet(
      red: red ?? this.red,
      green: green ?? this.green,
      blue: blue ?? this.blue,
    );
  }
}
