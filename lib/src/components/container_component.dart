import 'package:flutter_ludyx_material_ui/src/components/components.dart';
import 'package:material_ui/material_ui.dart';

class ContainerComponent extends StatelessWidget implements BaseComponent {
  const ContainerComponent({super.key, required this.data});

  @override
  final Map<String, dynamic> data;

  @override
  String get component => Component.container.name;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: switch (data['key']) {
        String k => Key(k),
        _ => null,
      },
      width: (data['width'] as Object?).toDoubleOrNull(),
      height: (data['height'] as Object?).toDoubleOrNull(),
      color: switch (data['color']) {
        String value => value.toColor(),
        _ => null,
      },
      padding: (data['padding'] as Object?).toEdgeInsets(),
      margin: (data['margin'] as Object?).toEdgeInsets(),
      alignment: (data['alignment'] as Object?).toAlignment(),
      child: Component.buildChild(data['child']),
    );
  }
}
