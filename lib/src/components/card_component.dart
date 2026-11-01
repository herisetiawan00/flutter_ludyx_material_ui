import 'package:flutter_ludyx_material_ui/src/components/components.dart';
import 'package:material_ui/material_ui.dart';

class CardComponent extends StatelessWidget implements BaseComponent {
  const CardComponent({super.key, required this.data});

  @override
  final Map<String, dynamic> data;

  @override
  String get component => Component.card.name;

  @override
  Widget build(BuildContext context) {
    return Card(
      key: switch (data['key']) {
        String k => Key(k),
        _ => null,
      },
      color: switch (data['color']) {
        String color => color.toColor(),
        _ => null,
      },
      elevation: (data['elevation'] as Object?).toDoubleOrNull(),
      margin: (data['margin'] as Object?).toEdgeInsets(),
      child: Component.buildChild(data['child']),
    );
  }
}
