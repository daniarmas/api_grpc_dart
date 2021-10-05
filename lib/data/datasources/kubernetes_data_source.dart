import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../environment.dart';

// ignore: one_member_abstracts
abstract class KubernetesDataSource {
  Future<List<String>> listNodes();
}

@Injectable(as: KubernetesDataSource)
class KubernetesDataSourceImpl implements KubernetesDataSource {
  static final EnvironmentApp _environment = GetIt.I<EnvironmentApp>();
  static final options = BaseOptions(
      baseUrl: 'https://${_environment.kubernetesApiService}',
      connectTimeout: 5000,
      receiveTimeout: 3000,
      headers: {'Authorization': 'Bearer ${_environment.kubernetesApiToken}'});
  static final Dio dio = Dio(options);

  @override
  Future<List<String>> listNodes() async {
    try {
      List<String> response = [];
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };
      final kubernetesResponse = await dio.request(
        '/v1/nodes',
        options: Options(method: 'GET'),
      );
      for (var item in kubernetesResponse.data['items']) {
        response.add(item['metadata']['annotations']
            ['flannel.alpha.coreos.com/public-ip']);
      }
      return response;
    } catch (error) {
      rethrow;
    }
  }
}
