import 'package:flutter_ludyx/flutter_ludyx.dart';
import 'package:flutter_ludyx_material_ui/src/components/components.dart';
import 'package:material_ui/material_ui.dart';

class TextButtonComponent extends StatelessWidget implements BaseComponent {
  const TextButtonComponent({super.key, required this.data});

  @override
  final Map<String, dynamic> data;

  @override
  String get component => Component.textButton.name;

  @override
  Widget build(BuildContext context) {
    final bool disabled = data['disabled'] == true;
    final callback = data['onPressed'];

    return TextButton(
      key: switch (data['key']) {
        String k => Key(k),
        _ => null,
      },
      onPressed: switch (callback) {
        LuaFn fun when !disabled => fun.call,
        _ => null,
      },
      child: Component.buildChild(data['child'])!,
    );
  }
}
