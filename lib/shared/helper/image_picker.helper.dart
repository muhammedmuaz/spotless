/// [imagePickerHelper] is a helper fun for [ImagePicker] ,
/// It will retrieve the status and image from [ImagePicker]
/// [imagePickerHelper] also have [Permission] check from [permission_handler] plugin
/// using a [ImageCropper] crop the image comming from the [ImagePicker] and
/// using a [FlutterImageCompress] it will compress the image into smaller size

import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

Future<ImagePickerStatus> imagePickerHelper(BuildContext context,
    {String source = 'CAMERA'}) async {
  if (Platform.isAndroid) {
    if (source == 'CAMERA') {
      if (!await Permission.camera.request().isGranted) {
        return ImagePickerStatus.create(
            status: 'error', image: null, errorMessage: 'permission_denied');
      }
    } else {
      if (!await Permission.storage.request().isGranted) {
        return ImagePickerStatus.create(
            status: 'error', image: null, errorMessage: 'permission_denied');
      }
    }
  }
  if (Platform.isIOS) {
    if (source == 'CAMERA') {
      if (!await Permission.camera.request().isGranted) {
        return ImagePickerStatus.create(
            status: 'error', image: null, errorMessage: 'permission_denied');
      }
    } else {
      if (!await Permission.photos.request().isGranted) {
        return ImagePickerStatus.create(
            status: 'error', image: null, errorMessage: 'permission_denied');
      }
    }
  }
  File? _imageData;
  switch (source) {
    case 'CAMERA':
      XFile? _pickedFile =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (_pickedFile != null) {
        _imageData = File(_pickedFile.path);
      }
      break;
    case 'GALLERY':
      XFile? _pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (_pickedFile != null) {
        _imageData = File(_pickedFile.path);
      }
      break;
    default:
      return ImagePickerStatus.create(
          status: 'error', image: null, errorMessage: 'invalid_option');
  }

  if (_imageData == null) {
    return ImagePickerStatus.create(
        status: 'error', image: null, errorMessage: 'user_invoked');
  }

  Random _random = new Random();
  Directory _tempDir = await getTemporaryDirectory();

  File? result = await FlutterImageCompress.compressAndGetFile(
    _imageData.absolute.path,
    _tempDir.path + '/${_random.nextInt(4294967295)}.png',
    format: CompressFormat.png,
    quality: 20,
  );

  if (result!.existsSync()) {
    _imageData.deleteSync();
  }

  return ImagePickerStatus.create(
      status: 'success',
      image: result
      // ?? _imageData
      ,
      errorMessage: null);
}

class ImagePickerStatus {
  ImagePickerStatus({
    this.status,
    this.image,
    this.errorMessage,
  });

  factory ImagePickerStatus.create({
    String? status,
    File? image,
    String? errorMessage,
  }) {
    return ImagePickerStatus(
        image: image, status: status, errorMessage: errorMessage);
  }

  final String? status;
  final File? image;
  final String? errorMessage;
}
