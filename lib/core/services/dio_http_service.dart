import 'package:dio/dio.dart';
import 'package:instagram_reels/core/services/http_service.dart';

class DioHttpService implements HttpService {
  final Dio _dio = Dio();

  @override
  Future<Response> handleGetRequest(String path) async {
    final res = await _dio.get(
      path,
      options: Options(
        headers: {},
      ),
    );
    return res;
  }
}
