import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../utils/colors.dart';

Future<XFile?> showImagePicker(BuildContext context) async {
  XFile? image;
  image = await showModalBottomSheet(
    context: context,
    backgroundColor: KColors.kWhite,
    builder: (context) {
      return Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 80).then((value) {
                  Navigator.pop(context, value);
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Icon(Icons.image, color: Theme.of(context).textTheme.titleMedium!.color),
                    const SizedBox(width: 24),
                    Text('Select from Gallery', style: Theme.of(context).textTheme.titleSmall),
                  ],
                ),
              ),
            ),
            const Divider(height: 8),
            InkWell(
              onTap: () {
                ImagePicker().pickImage(source: ImageSource.camera, imageQuality: 80).then((value) {
                  Navigator.pop(context, value);
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Icon(Icons.camera_alt, color: Theme.of(context).textTheme.titleMedium!.color),
                    const SizedBox(width: 24),
                    Text('Capture from Camera', style: Theme.of(context).textTheme.titleSmall),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
  return image;
}
