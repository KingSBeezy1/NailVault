import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  ImagePickerService();

  late final _imagePicker = ImagePicker();

  Future<XFile?> pickFromCamera() async {
    return _imagePicker.pickImage(source: ImageSource.camera);
  }

  Future<List<XFile>> pickFromGallery({int maxImages = 10}) async {
    return _imagePicker.pickMultiImage(limit: maxImages);
  }

  Future<XFile?> pickSingle({ImageSource source = ImageSource.gallery}) async {
    return _imagePicker.pickImage(source: source);
  }
}
