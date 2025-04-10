import 'dart:io';
import 'package:dio/dio.dart';

class EditProfileParam {

  final String name;
  final File imageFile;

  EditProfileParam({
    required this.name,
    required this.imageFile
  });

  FormData toFormData() {

    String filename = imageFile.path.split('/').last;

    return FormData.fromMap({
      'name': name,
      'picture': MultipartFile.fromFile(imageFile.path, filename: filename)
    });
  }
}