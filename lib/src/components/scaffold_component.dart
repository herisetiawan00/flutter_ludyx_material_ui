import 'package:flutter_ludyx_material_ui/src/components/components.dart';
import 'package:material_ui/material_ui.dart';

class ScaffoldComponent extends StatelessWidget implements BaseComponent {
  const ScaffoldComponent({super.key, required this.data});

  @override
  final Map<String, dynamic> data;

  @override
  String get component => Component.scaffold.name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: switch (data['key']) {
        String k => Key(k),
        _ => null,
      },
      backgroundColor: switch (data['backgroundColor']) {
        String color => color.toColor(),
        _ => null,
      },
      appBar: switch (Component.buildChild(data['appBar'])) {
        PreferredSizeWidget bar => bar,
        Widget w => PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: w,
        ),
        _ => null,
      },
      body: Component.buildChild(data['body']),
      floatingActionButton: Component.buildChild(data['floatingActionButton']),
    );
  }
}
