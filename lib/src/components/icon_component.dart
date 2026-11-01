import 'package:flutter_ludyx_material_ui/src/components/components.dart';
import 'package:material_ui/material_ui.dart';

class IconComponent extends StatelessWidget implements BaseComponent {
  const IconComponent({super.key, required this.data});

  @override
  final Map<String, dynamic> data;

  @override
  String get component => Component.icon.name;

  @override
  Widget build(BuildContext context) {
    return Icon(
      (data['icon'] as Object?).toMaterialIcon(),
      key: switch (data['key']) {
        String k => Key(k),
        _ => null,
      },
      size: (data['size'] as Object?).toDoubleOrNull(),
      color: switch (data['color']) {
        String color => color.toColor(),
        _ => null,
      },
    );
  }
}
