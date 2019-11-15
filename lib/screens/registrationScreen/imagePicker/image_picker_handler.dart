import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:padelmatchv2/screens/registrationScreen/imagePicker/image_picker_dialog.dart';

class ImagePickerHandler {
  ImagePickerDialog imagePicker;
  AnimationController controller;
  ImagePickerListener listener;
  var image;

  ImagePickerHandler(this.listener, this.controller,);


  // getImage() async{
  //   return image.path;
  // }

  openCamera() async {
    imagePicker.dismissDialog();
    image = await ImagePicker.pickImage(source: ImageSource.camera);
    cropImage(image);
  }

  openGallery() async {
    imagePicker.dismissDialog();
    image = await ImagePicker.pickImage(source: ImageSource.gallery);
    cropImage(image);
  }

  void init() {
    imagePicker = new ImagePickerDialog(this, controller);
    imagePicker.initState();
  }

  Future cropImage(File image) async {
    File croppedFile = await ImageCropper.cropImage(
      sourcePath: image.path,
      ratioX: 1.0,
      ratioY: 1.0,
      maxWidth: 512,
      maxHeight: 512,
    );
    listener.userImage(croppedFile);
   
   
  }

  showDialog(BuildContext context) {
    imagePicker.getImage(context);
  }
}

abstract class ImagePickerListener {
  userImage(File _image);
}