import 'package:image_picker/image_picker.dart';

abstract class IImagePickerService{
  Future<XFile?> getImg();

  Future<List<XFile>?> getImages();
}