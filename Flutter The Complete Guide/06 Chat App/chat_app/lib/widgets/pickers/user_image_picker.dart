import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  const UserImagePicker({Key? key}) : super(key: key);

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? _pickedImage;
  final ImagePicker _picker = ImagePicker();

  void _pickImage() async {
    final userImage = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _pickedImage = File(userImage!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage:
              _pickedImage != null ? FileImage(_pickedImage!) : null,
        ),
        TextButton.icon(
          icon: const Icon(Icons.camera_alt),
          label: Text(
            'Take Photo',
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
          onPressed: _pickImage,
        ),
      ],
    );
  }
}
