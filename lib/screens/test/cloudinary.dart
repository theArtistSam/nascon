import 'dart:io';

import 'package:cloudinary/cloudinary.dart';
import 'package:cloudinary_flutter/image/cld_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:cloudinary_flutter/cloudinary_context.dart';
// import 'package:cloudinary_url_gen/cloudinary.dart';
// import 'package:cloudinary_flutter/image/cld_image.dart';

class CloudinarySDKUpload extends StatefulWidget {
  @override
  State<CloudinarySDKUpload> createState() => _CloudinarySDKUploadState();
}

class _CloudinarySDKUploadState extends State<CloudinarySDKUpload> {
  final ImagePicker _picker = ImagePicker();
  File? _image;
  String? _uploadedImageUrl;

  late Cloudinary _cloudinary;

  @override
  void initState() {
    super.initState();

    _cloudinary = Cloudinary.unsignedConfig(cloudName: 'dft4vja97');
    // CloudinaryContext.cloudinary = _cloudinary;
  }

  Future<void> _pickAndUploadImage() async {
    final picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked == null) return;

    final file = File(picked.path);
    setState(() {
      _image = file;
    });

    try {
      final response = await _cloudinary.upload(
        file: file.path,
        fileBytes: file.readAsBytesSync(),
        resourceType: CloudinaryResourceType.image,
        folder: 'cloudinaryCustomFolder',
        fileName: 'some-name',
        progressCallback: (count, total) {
          print('Uploading image from file with progress: $count/$total');
        },
      );

      if (response.isSuccessful) {
        print('Get your image from with ${response.secureUrl}');
      }
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cloudinary SDK Upload')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image != null
                ? Image.file(_image!, height: 150)
                : Text('Pick an image'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickAndUploadImage,
              child: Text('Pick & Upload Image'),
            ),
            if (_uploadedImageUrl != null) ...[
              SizedBox(height: 20),
              Text('Uploaded Image:'),
              CldImageWidget(publicId: _uploadedImageUrl!),
            ],
          ],
        ),
      ),
    );
  }
}
