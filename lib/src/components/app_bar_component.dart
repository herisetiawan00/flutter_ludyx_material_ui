import 'package:flutter_ludyx_material_ui/src/components/components.dart';
import 'package:material_ui/material_ui.dart';

class AppBarComponent extends StatelessWidget
    implements PreferredSizeWidget, BaseComponent {
  const AppBarComponent({super.key, required this.data});

  @override
  final Map<String, dynamic> data;

  @override
  String get component => Component.appBar.name;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      key: switch (data['key']) {
        String k => Key(k),
        _ => null,
      },
      title: Component.buildChild(data['title']),
      leading: Component.buildChild(data['leading']),
      actions: Component.buildChildren(data['actions']),
      backgroundColor: switch (data['backgroundColor']) {
        String color => color.toColor(),
        _ => null,
      },
      elevation: (data['elevation'] as Object?).toDoubleOrNull(),
    );
  }
}
