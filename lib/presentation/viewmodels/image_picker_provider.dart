
import 'package:flutter_riverpod/legacy.dart';
import 'package:image_picker/image_picker.dart';

final imagePickerProvider =
    StateNotifierProvider<ImagePickerNotifier, XFile?>((ref) {
  return ImagePickerNotifier();
});

class ImagePickerNotifier extends StateNotifier<XFile?> {
  ImagePickerNotifier() : super(null);

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      state = image; 
    }
  }

  void clearImage() {
    state = null;
  }
}
