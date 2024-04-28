import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyImagePicker extends StatefulWidget {
  final Function(String) onImageSelected;
  const MyImagePicker({super.key, required this.onImageSelected});

  @override
  State<MyImagePicker> createState() => _MyImagePickerState();
}

class _MyImagePickerState extends State<MyImagePicker> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const Text(
              'Select Image From !',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () async {
                    final selectedImagePath = await selectImageFromGallery();
                    print('Image_Path:-');
                    print(selectedImagePath);
                    if (selectedImagePath != '') {
                      Navigator.pop(context);
                      widget.onImageSelected(selectedImagePath);
                      setState(() {});
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("No Image Selected !"),
                      ));
                    }
                  },
                  child: const Card(
                      elevation: 5,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Icon(
                              Icons.image,
                            ),
                            Text('Gallery'),
                          ],
                        ),
                      )),
                ),
                GestureDetector(
                  onTap: () async {
                    final selectedImagePath = await selectImageFromCamera();
                    print('Image_Path:-');
                    print(selectedImagePath);

                    if (selectedImagePath != '') {
                      Navigator.pop(context);
                      widget.onImageSelected(selectedImagePath);
                      setState(() {});
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("No Image Captured !"),
                      ));
                    }
                  },
                  child: const Card(
                      elevation: 5,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Icon(
                              Icons.camera,
                            ),
                            Text('Camera'),
                          ],
                        ),
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  selectImageFromGallery() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 10);
    if (file != null) {
      return file.path;
    } else {
      return '';
    }
  }

  //
  selectImageFromCamera() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 10);
    if (file != null) {
      return file.path;
    } else {
      return '';
    }
  }
}
