import 'package:image_picker/image_picker.dart';

import 'i_image_picker_service.dart';

class ImagePickerService extends IImagePickerService  {
  final ImagePicker _picker;

  ImagePickerService(this._picker);

  @override
  Future<XFile?> getImg()async{
    return await _picker.pickImage(source: ImageSource.gallery,imageQuality: 50);
  }

  @override
  Future<List<XFile>?> getImages()async{
    return await _picker.pickMultiImage();
  }
}