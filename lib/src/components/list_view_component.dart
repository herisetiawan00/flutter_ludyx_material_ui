import 'package:flutter_ludyx_material_ui/src/components/components.dart';
import 'package:material_ui/material_ui.dart';

class ListViewComponent extends StatelessWidget implements BaseComponent {
  const ListViewComponent({super.key, required this.data});

  @override
  final Map<String, dynamic> data;

  @override
  String get component => Component.listView.name;

  @override
  Widget build(BuildContext context) {
    final Axis scrollDirection = switch (data['scrollDirection']) {
      'horizontal' => .horizontal,
      _ => .vertical,
    };

    return ListView(
      key: switch (data['key']) {
        String k => Key(k),
        _ => null,
      },
      scrollDirection: scrollDirection,
      padding: (data['padding'] as Object?).toEdgeInsets(),
      children: Component.buildChildren(data['children']),
    );
  }
}
