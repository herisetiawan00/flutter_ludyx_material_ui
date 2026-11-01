import 'package:flutter_ludyx/flutter_ludyx.dart';
import 'package:flutter_ludyx_material_ui/src/components/components.dart';
import 'package:material_ui/material_ui.dart';

class IconButtonComponent extends StatelessWidget implements BaseComponent {
  const IconButtonComponent({super.key, required this.data});

  @override
  final Map<String, dynamic> data;

  @override
  String get component => Component.iconButton.name;

  @override
  Widget build(BuildContext context) {
    final callback = data['onPressed'];

    return IconButton(
      key: switch (data['key']) {
        String k => Key(k),
        _ => null,
      },
      iconSize: (data['iconSize'] as Object?).toDoubleOrNull(),
      color: switch (data['color']) {
        String color => color.toColor(),
        _ => null,
      },
      icon: Icon((data['icon'] as Object?).toMaterialIcon()),
      onPressed: switch (callback) {
        LuaFn fun => fun.call,
        _ => null,
      },
    );
  }
}
