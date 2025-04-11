import 'dart:io';
import 'package:dio/dio.dart';

class EditProfileParam {

  final String name;
  final File? imageFile;

  EditProfileParam({
    required this.name,
    this.imageFile
  });

  FormData toFormData() {

    Map<String, dynamic> map = {
      'user_name': name
    };

    if (imageFile != null) {
      map.addAll({
        'picture': MultipartFile.fromFileSync(
          imageFile!.path, 
          filename: (imageFile!.path).split('/').last
        )
      });
    }

    return FormData.fromMap(map);
  }
}