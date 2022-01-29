import 'dart:io';

import 'package:image_picker/image_picker.dart';

class EventImages {
  List<File> images;

  EventImages({required this.images});

  EventImages.fromXFile(List<XFile> xfiles):
    images = xfiles.map((image) => File(image.path)).toList();

}