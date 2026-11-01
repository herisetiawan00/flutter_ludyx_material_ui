import 'package:flutter_ludyx_material_ui/src/components/components.dart';
import 'package:material_ui/material_ui.dart';

class CircularProgressIndicatorComponent extends StatelessWidget
    implements BaseComponent {
  const CircularProgressIndicatorComponent({super.key, required this.data});

  @override
  final Map<String, dynamic> data;

  @override
  String get component => Component.circularProgressIndicator.name;

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      key: switch (data['key']) {
        String k => Key(k),
        _ => null,
      },
      value: (data['value'] as Object?).toDoubleOrNull(),
      valueColor: switch (data['color']) {
        String color => AlwaysStoppedAnimation<Color>(color.toColor()),
        _ => null,
      },
    );
  }
}
