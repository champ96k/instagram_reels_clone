import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:instagram_reels/core/app_configs/custom_error.dart';
import 'package:instagram_reels/core/constants/constants.dart';
import 'package:instagram_reels/core/model/reel_model.dart';
import 'package:instagram_reels/core/services/http_service.dart';

class ReelsRepository {
  final HttpService _httpService;
  ReelsRepository({
    required HttpService httpService,
  }) : _httpService = httpService;

  Future<List<ReelModel>> fetchReels({required int page}) async {
    try {
      final response =
          await _httpService.handleGetRequest("${Constants.reelsBaseURL}$page");
      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        final _result = json.decode(response.data);
        final List<dynamic> _reels = _result;
        final _models = _reels.map((data) => ReelModel.fromJson(data)).toList();
        return _models;
      } else {
        throw CustomError(
          code: "${response.statusCode}",
          message: response.statusMessage,
        );
      }
    } on DioError catch (e) {
      throw CustomError(
        message: e.message,
        code: e.response?.statusCode.toString(),
      );
    } on FormatException catch (e) {
      throw CustomError(
        message: "Format Exception: $e",
        code: '0',
      );
    } on Exception catch (e) {
      throw CustomError(
        message: "Error occured: $e",
        code: '0',
      );
    } catch (e) {
      throw CustomError(
        message: 'Something went wrong: $e',
        code: '0',
      );
    }
  }
}
