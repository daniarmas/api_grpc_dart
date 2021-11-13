// Dart imports:
import 'dart:math';

String getRandomItem({required List<String> ipList}) {
  final _random = Random();
  return ipList[_random.nextInt(ipList.length)];
}
