import 'package:flutter_ludyx_material_ui/src/components/components.dart';
import 'package:material_ui/material_ui.dart';

class StackComponent extends StatelessWidget implements BaseComponent {
  const StackComponent({super.key, required this.data});

  @override
  final Map<String, dynamic> data;

  @override
  String get component => Component.stack.name;

  @override
  Widget build(BuildContext context) {
    return Stack(
      key: switch (data['key']) {
        String k => Key(k),
        _ => null,
      },
      alignment: (data['alignment'] as Object?).toAlignment() ?? .topLeft,
      children: Component.buildChildren(data['children']),
    );
  }
}
