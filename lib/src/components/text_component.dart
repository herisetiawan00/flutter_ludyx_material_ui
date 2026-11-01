import 'package:flutter_ludyx_material_ui/src/components/components.dart';
import 'package:material_ui/material_ui.dart';

class TextComponent extends StatelessWidget implements BaseComponent {
  const TextComponent({super.key, required this.data});

  @override
  final Map<String, dynamic> data;

  @override
  String get component => Component.text.name;

  @override
  Widget build(BuildContext context) {
    return Text(
      data['text']?.toString() ?? '',
      key: switch (data['key']) {
        String k => Key(k),
        _ => null,
      },
      style: (data['style'] as Object?).toTextStyle(),
      textAlign: (data['textAlign'] as Object?).toTextAlign(),
      maxLines: (data['maxLines'] as Object?).toIntOrNull(),
      overflow: (data['overflow'] as Object?).toTextOverflow(),
    );
  }
}
