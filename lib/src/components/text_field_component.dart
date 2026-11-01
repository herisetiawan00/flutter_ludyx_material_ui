import 'package:flutter_ludyx_material_ui/src/components/components.dart';
import 'package:material_ui/material_ui.dart';

class TextFieldComponent extends StatelessWidget implements BaseComponent {
  const TextFieldComponent({super.key, required this.data});

  @override
  final Map<String, dynamic> data;

  @override
  String get component => Component.textField.name;

  @override
  Widget build(BuildContext context) {
    final onChanged = data['onChanged'];
    final onSubmitted = data['onSubmitted'];

    return TextField(
      key: switch (data['key']) {
        String k => Key(k),
        _ => null,
      },
      controller: data['value'] != null
          ? TextEditingController(text: data['value'].toString())
          : null,
      obscureText: data['obscureText'] == true,
      decoration: InputDecoration(hintText: data['placeholder']?.toString()),
      onChanged: onChanged is Function ? (val) => onChanged([val]) : null,
      onSubmitted: onSubmitted is Function ? (val) => onSubmitted([val]) : null,
    );
  }
}
