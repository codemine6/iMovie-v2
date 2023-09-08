import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imovie/core/constants/constants.dart';

final options = BaseOptions(
  baseUrl: baseUrl,
  queryParameters: {'api_key': apiKey},
);
final dioProvider = Provider((ref) => Dio(options));
