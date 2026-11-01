import 'package:flutter_ludyx/flutter_ludyx.dart';
import 'package:flutter_ludyx_material_ui/src/components/components.dart';
import 'package:material_ui/material_ui.dart';

class OutlinedButtonComponent extends StatelessWidget implements BaseComponent {
  const OutlinedButtonComponent({super.key, required this.data});

  @override
  final Map<String, dynamic> data;

  @override
  String get component => Component.outlinedButton.name;

  @override
  Widget build(BuildContext context) {
    final bool disabled = data['disabled'] == true;
    final callback = data['onPressed'];

    return OutlinedButton(
      key: switch (data['key']) {
        String k => Key(k),
        _ => null,
      },
      onPressed: switch (callback) {
        LudyxFn fun when !disabled => fun.call,
        _ => null,
      },
      child: Component.buildChild(data['child']),
    );
  }
}
