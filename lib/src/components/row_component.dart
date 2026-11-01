import 'package:flutter_ludyx_material_ui/src/components/components.dart';
import 'package:material_ui/material_ui.dart';

class RowComponent extends StatelessWidget implements BaseComponent {
  const RowComponent({super.key, required this.data});

  @override
  final Map<String, dynamic> data;

  @override
  String get component => Component.row.name;

  @override
  Widget build(BuildContext context) {
    return Row(
      key: switch (data['key']) {
        String k => Key(k),
        _ => null,
      },
      mainAxisAlignment: (data['mainAxisAlignment'] as Object?)
          .toMainAxisAlignment(),
      crossAxisAlignment: (data['crossAxisAlignment'] as Object?)
          .toCrossAxisAlignment(),
      mainAxisSize: (data['mainAxisSize'] as Object?).toMainAxisSize(),
      children: Component.buildChildren(data['children']),
    );
  }
}

