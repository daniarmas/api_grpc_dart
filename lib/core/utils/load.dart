import 'dart:math';

List<String> list = [
  '192.168.1.1',
  '192.168.1.2',
  '192.168.1.3',
  '192.168.1.4',
  '192.168.1.5',
  '192.168.1.6',
  '192.168.1.7',
  '192.168.1.8',
  '192.168.1.9',
  '192.168.1.10'
];

String loadBalance({required List<String> ipList}) {
  final _random = Random();
  return list[_random.nextInt(ipList.length)];
}

void main(List<String> args) {
  print('1: ${loadBalance(ipList: list)}');
  print('2: ${loadBalance(ipList: list)}');
  print('3: ${loadBalance(ipList: list)}');
  print('4: ${loadBalance(ipList: list)}');
  print('5: ${loadBalance(ipList: list)}');
  print('6: ${loadBalance(ipList: list)}');
  print('7: ${loadBalance(ipList: list)}');
  print('8: ${loadBalance(ipList: list)}');
  print('9: ${loadBalance(ipList: list)}');
  print('10: ${loadBalance(ipList: list)}');
}
