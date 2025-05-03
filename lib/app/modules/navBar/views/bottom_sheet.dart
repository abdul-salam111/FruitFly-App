import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BottomSheetWidget extends StatelessWidget {
  final ImagePicker _picker = ImagePicker();

  BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // return LayoutBuilder(
    //   builder: (context, constraints) {
    //     bool isWide = constraints.maxWidth > 600;

    return SizedBox(
      height: 300,
      width: MediaQuery.of(context).size.width,
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildOption(
                context,
                icon: Icons.camera_alt,
                text: 'Camera',
                onTap: () => _pickImage(context, ImageSource.camera),
              ),
              _buildOption(
                context,
                icon: Icons.photo_library,
                text: 'Gallery',
                onTap: () => _pickImage(context, ImageSource.gallery),
              ),
            ],
          )),
    );
    //   },
    // );
  }

  Widget _buildOption(BuildContext context,
      {required IconData icon,
      required String text,
      required VoidCallback onTap}) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        onTap();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 30.0),
            const SizedBox(height: 8.0),
            Text(text),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage(BuildContext context, ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Picked: ${pickedFile.path}')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No image selected')),
      );
    }
  }
}
