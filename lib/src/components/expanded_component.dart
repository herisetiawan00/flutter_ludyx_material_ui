import 'package:flutter_ludyx_material_ui/src/components/components.dart';
import 'package:material_ui/material_ui.dart';

class ExpandedComponent extends StatelessWidget implements BaseComponent {
  const ExpandedComponent({super.key, required this.data});

  @override
  final Map<String, dynamic> data;

  @override
  String get component => Component.expanded.name;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      key: switch (data['key']) {
        String k => Key(k),
        _ => null,
      },
      flex: (data['flex'] as Object?).toIntOrNull() ?? 1,
      child: Component.buildChild(data['child']) ?? const SizedBox.shrink(),
    );
  }
}
