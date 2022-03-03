import 'package:dio/dio.dart';

abstract class HttpService {
  ///
  ///Define network calls method, [Get], [Post],[Put],[Delete], etc
  Future<Response> handleGetRequest(String path);
}
