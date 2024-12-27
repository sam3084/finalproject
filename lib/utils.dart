import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
pickImage(ImageSource Source) async{
final ImagePicker imagePicker=ImagePicker();
XFile? file = await imagePicker.pickImage(source: Source);
if(file != null){
  return await file.readAsBytes();
}
print('No image selected');
}