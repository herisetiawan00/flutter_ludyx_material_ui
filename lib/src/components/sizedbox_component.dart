import 'package:flutter_ludyx_material_ui/src/components/components.dart';
import 'package:material_ui/material_ui.dart';

class SizedBoxComponent extends StatelessWidget implements BaseComponent {
  const SizedBoxComponent({super.key, required this.data});

  @override
  final Map<String, dynamic> data;

  @override
  String get component => Component.sizedBox.name;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: switch (data['key']) {
        String k => Key(k),
        _ => null,
      },
      width: (data['width'] as Object?).toDoubleOrNull(),
      height: (data['height'] as Object?).toDoubleOrNull(),
      child: Component.buildChild(data['child']),
    );
  }
}
