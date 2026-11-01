import 'package:flutter_ludyx_material_ui/src/components/components.dart';
import 'package:material_ui/material_ui.dart';

class PaddingComponent extends StatelessWidget implements BaseComponent {
  const PaddingComponent({super.key, required this.data});

  @override
  final Map<String, dynamic> data;

  @override
  String get component => Component.padding.name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: switch (data['key']) {
        String k => Key(k),
        _ => null,
      },
      padding: (data['padding'] as Object?).toEdgeInsets() ?? .zero,
      child: Component.buildChild(data['child']),
    );
  }
}
