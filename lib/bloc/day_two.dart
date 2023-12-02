part of 'main_bloc.dart';

int _getAmount(String color) =>
    switch (color) { 'red' => 12, 'green' => 13, 'blue' => 14, _ => 0 };

Future<String> _task21(List<String> fileContent) async {
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
