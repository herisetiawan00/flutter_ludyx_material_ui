import 'package:flutter_ludyx_material_ui/src/components/components.dart';
import 'package:material_ui/material_ui.dart';

class ImageComponent extends StatelessWidget implements BaseComponent {
  const ImageComponent({super.key, required this.data});

  @override
  final Map<String, dynamic> data;

  @override
  String get component => Component.image.name;

  @override
  Widget build(BuildContext context) {
    final String src = data['src']?.toString() ?? '';
    final bool isNetwork = data['isNetwork'] == true || src.startsWith('http');
    final double? width = (data['width'] as Object?).toDoubleOrNull();
    final double? height = (data['height'] as Object?).toDoubleOrNull();
    final BoxFit? fit = (data['fit'] as Object?).toBoxFit();
    final key = switch (data['key']) {
      String k => Key(k),
      _ => null,
    };

    if (isNetwork) {
      return Image.network(
        src,
        key: key,
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (_, _, _) => const Icon(Icons.broken_image),
      );
    }

    return Image.asset(src, key: key, width: width, height: height, fit: fit);
  }
}
