import 'package:flutter_ludyx_material_ui/src/components/components.dart';
import 'package:material_ui/material_ui.dart';

class CenterComponent extends StatelessWidget implements BaseComponent {
  const CenterComponent({super.key, required this.data});

  @override
  final Map<String, dynamic> data;

  @override
  String get component => Component.center.name;

  @override
  Widget build(BuildContext context) {
    return Center(
      key: switch (data['key']) {
        String k => Key(k),
        _ => null,
      },
      child: Component.buildChild(data['child']),
    );
  }
}
