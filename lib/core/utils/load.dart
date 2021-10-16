import 'dart:math';

String loadBalance({required List<String> ipList}) {
  final _random = Random();
  return ipList[_random.nextInt(ipList.length)];
}
