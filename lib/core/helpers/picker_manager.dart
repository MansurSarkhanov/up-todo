import 'dart:io';

import 'package:image_picker/image_picker.dart';

class PickerManager {
  final ImagePicker _picker = ImagePicker();

  Future<File?> pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    return pickedFile != null ? File(pickedFile.path) : null;
  }

  Future<File?> pickImageFromCamera() async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
    );
    return pickedFile != null ? File(pickedFile.path) : null;
  }

  Future<File?> pickVideoFromGallery() async {
    final pickedFile = await _picker.pickVideo(
      source: ImageSource.gallery,
    );
    return pickedFile != null ? File(pickedFile.path) : null;
  }

  Future<File?> pickVideoFromCamera() async {
    final pickedFile = await _picker.pickVideo(
      source: ImageSource.camera,
    );
    return pickedFile != null ? File(pickedFile.path) : null;
  }
}
