import 'dart:io';

import 'package:dio/dio.dart';

class CloudinaryService {
  final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );

  final String cloudName = 'diarnrr93';
  final String uploadPreset = 'uptodo_images';

  Future<String> uploadImage(
    File file, {
    required void Function(double)? onProgress,
  }) async {
    try {
      final url = 'https://api.cloudinary.com/v1_1/$cloudName/image/upload';

      final formData = FormData.fromMap({
        'upload_preset': uploadPreset,
        'file': await MultipartFile.fromFile(
          file.path,
          filename: file.path.split('/').last,
        ),
      });

      final response = await _dio.post<Map<String, dynamic>>(
        url,
        data: formData,
        onSendProgress: (sent, total) {
          if (onProgress != null && total != 0) {
            onProgress(sent / total);
          }
        },
      );

      if (response.statusCode == 200) {
        final data = response.data!;
        return data['secure_url'] as String;
      } else {
        throw Exception('Upload failed');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
