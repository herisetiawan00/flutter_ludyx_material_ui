import 'package:flutter_ludyx/flutter_ludyx.dart';
import 'package:flutter_ludyx_material_ui/src/components/components.dart';
import 'package:material_ui/material_ui.dart';

class SwitchComponent extends StatelessWidget implements BaseComponent {
  const SwitchComponent({super.key, required this.data});

  @override
  final Map<String, dynamic> data;

  @override
  String get component => Component.switchComponent.name;

  @override
  Widget build(BuildContext context) {
    final onChanged = data['onChanged'];
    final bool value = data['value'] == true;

    return Switch(
      key: switch (data['key']) {
        String k => Key(k),
        _ => null,
      },
      value: value,
      activeThumbColor: switch (data['activeColor']) {
        String color => color.toColor(),
        _ => null,
      },
      onChanged: onChanged is LudyxFn ? (val) => onChanged.call([val]) : null,
    );
  }
}
