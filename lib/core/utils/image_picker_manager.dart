import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImagePickerManager {

  static final _imagePicker = ImagePicker(); 


  static Future<File?> pickImage() async {
    
    var pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery, imageQuality: 25);
    return (pickedFile?.path ?? "").isEmpty ? null : File(pickedFile?.path ?? "");
  }

  static Future<File?> cameraPhoto() async {

    var pickedFile = await _imagePicker.pickImage(source: ImageSource.camera, imageQuality: 25);
    return (pickedFile?.path ?? "").isEmpty ? null : File(pickedFile?.path ?? "");
  }

  static void pickMultiImage({required Function(List<File> file) onSuccess, required Function(String error) onError}) {

    _imagePicker.pickMultiImage().asStream().listen((pickedFiles) {
      List<File> files = [];
      for (var pickedFile in pickedFiles) {
        files.add(File(pickedFile.path));
      }
      onSuccess.call(files);
    },
    cancelOnError: true,
    onError: (err) {
      onError.call(err.toString());
    });
  }

  static void cameraVideo({required Function(File? file) onSuccess, required Function(String error) onError}) {

    _imagePicker.pickVideo(source: ImageSource.camera).asStream().listen((pickedFile) {
     if ((pickedFile?.path ?? "").isEmpty) {
        onSuccess.call(null);
      } else {
        onSuccess.call(File(pickedFile?.path ?? ""));
      }
    },
    cancelOnError: true,
    onError: (err) {
      onError.call(err.toString());
    });
  }

  static void pickVideo({required Function(File? file) onSuccess, required Function(String error) onError}) {

    _imagePicker.pickVideo(source: ImageSource.gallery).asStream().listen((pickedFile) {
      if ((pickedFile?.path ?? "").isEmpty) {
        onSuccess.call(null);
      } else {
        onSuccess.call(File(pickedFile?.path ?? ""));
      }
    },
    cancelOnError: true,
    onError: (err) {
      onError.call(err.toString());
    });
  }

  void pickMedia({required Function(File? file) onSuccess, required Function(String error) onError}) {

    _imagePicker.pickMedia().asStream().listen((pickedFile) {
      if ((pickedFile?.path ?? "").isEmpty) {
        onSuccess.call(null);
      } else {
        onSuccess.call(File(pickedFile?.path ?? ""));
      }
    },
    cancelOnError: true,
    onError: (err) {
      onError.call(err.toString());
    });
  }

  static void pickMedias({required Function(List<File> file) onSuccess, required Function(String error) onError}) {

    _imagePicker.pickMultipleMedia().asStream().listen((pickedFiles) {
      List<File> files = [];
      for (var pickedFile in pickedFiles) {
        files.add(File(pickedFile.path));
      }
      onSuccess.call(files);
    },
    cancelOnError: true,
    onError: (err) {
      onError.call(err.toString());
    });
  }
}