import 'package:flutter_ludyx_material_ui/src/components/app_bar_component.dart';
import 'package:flutter_ludyx_material_ui/src/components/card_component.dart';
import 'package:flutter_ludyx_material_ui/src/components/center_component.dart';
import 'package:flutter_ludyx_material_ui/src/components/circular_progress_indicator_component.dart';
import 'package:flutter_ludyx_material_ui/src/components/column_component.dart';
import 'package:flutter_ludyx_material_ui/src/components/container_component.dart';
import 'package:flutter_ludyx_material_ui/src/components/elevated_button_component.dart';
import 'package:flutter_ludyx_material_ui/src/components/expanded_component.dart';
import 'package:flutter_ludyx_material_ui/src/components/icon_button_component.dart';
import 'package:flutter_ludyx_material_ui/src/components/icon_component.dart';
import 'package:flutter_ludyx_material_ui/src/components/image_component.dart';
import 'package:flutter_ludyx_material_ui/src/components/list_view_component.dart';
import 'package:flutter_ludyx_material_ui/src/components/outlined_button_component.dart';
import 'package:flutter_ludyx_material_ui/src/components/padding_component.dart';
import 'package:flutter_ludyx_material_ui/src/components/row_component.dart';
import 'package:flutter_ludyx_material_ui/src/components/scaffold_component.dart';
import 'package:flutter_ludyx_material_ui/src/components/sizedbox_component.dart';
import 'package:flutter_ludyx_material_ui/src/components/stack_component.dart';
import 'package:flutter_ludyx_material_ui/src/components/switch_component.dart';
import 'package:flutter_ludyx_material_ui/src/components/text_button_component.dart';
import 'package:flutter_ludyx_material_ui/src/components/text_component.dart';
import 'package:flutter_ludyx_material_ui/src/components/text_field_component.dart';
import 'package:material_ui/material_ui.dart';

abstract interface class BaseComponent {
  String get component;
  Map<String, dynamic> get data;
}

typedef ComponentBuilder = Widget Function({
  Key? key,
  required Map<String, dynamic> data,
});

/// Registry mapping Lua `component` string values to Dart widget constructors
enum Component(final String name, final ComponentBuilder builder) {
  container('container', ContainerComponent.new),
  sizedBox('sized_box', SizedBoxComponent.new),
  padding('padding', PaddingComponent.new),
  center('center', CenterComponent.new),
  column('column', ColumnComponent.new),
  row('row', RowComponent.new),
  stack('stack', StackComponent.new),
  expanded('expanded', ExpandedComponent.new),
  elevatedButton('elevated_button', ElevatedButtonComponent.new),
  textButton('text_button', TextButtonComponent.new),
  outlinedButton('outlined_button', OutlinedButtonComponent.new),
  iconButton('icon_button', IconButtonComponent.new),
  text('text', TextComponent.new),
  icon('icon', IconComponent.new),
  image('image', ImageComponent.new),
  appBar('app_bar', AppBarComponent.new),
  scaffold('scaffold', ScaffoldComponent.new),
  card('card', CardComponent.new),
  listView('list_view', ListViewComponent.new),
  textField('text_field', TextFieldComponent.new),
  switchComponent('switch', SwitchComponent.new),
  circularProgressIndicator(
    'circular_progress_indicator',
    CircularProgressIndicatorComponent.new,
  );

  static final Map<String, Component> _lookup = {
    for (final c in values) c.name: c,
  };

  static Component? byName(String? name) => name == null ? null : _lookup[name];

  /// Builds a child widget from a raw Lua dynamic map
  static Widget? buildChild(Object? raw) => switch (raw) {
    Map m => byName(m['component']?.toString())?.builder(data: m.cast()),
    _ => null,
  };

  /// Builds a list of children from a raw Lua list
  static List<Widget> buildChildren(Object? raw) => switch (raw) {
    List l => [for (final item in l) ?buildChild(item)],
    _ => const [],
  };
}

extension ComponentParsers on Object? {
  double? toDoubleOrNull() => switch (this) {
    num n => n.toDouble(),
    _ => null,
  };

  int? toIntOrNull() => switch (this) {
    num n => n.toInt(),
    _ => null,
  };

  EdgeInsetsGeometry? toEdgeInsets() => switch (this) {
    num value => .all(value.toDouble()),
    {'all': num v} => .all(v.toDouble()),
    {'horizontal': num? h, 'vertical': num? v} => .symmetric(
      horizontal: (h ?? 0).toDouble(),
      vertical: (v ?? 0).toDouble(),
    ),
    {'top': num? t, 'bottom': num? b, 'left': num? l, 'right': num? r} => .only(
      top: (t ?? 0).toDouble(),
      bottom: (b ?? 0).toDouble(),
      left: (l ?? 0).toDouble(),
      right: (r ?? 0).toDouble(),
    ),
    _ => null,
  };

  AlignmentGeometry? toAlignment() => switch (this) {
    'center' => .center,
    'topLeft' => .topLeft,
    'topRight' => .topRight,
    'bottomLeft' => .bottomLeft,
    'bottomRight' => .bottomRight,
    _ => null,
  };

  MainAxisAlignment toMainAxisAlignment() => switch (this) {
    'start' => .start,
    'end' => .end,
    'center' => .center,
    'spaceBetween' => .spaceBetween,
    'spaceAround' => .spaceAround,
    'spaceEvenly' => .spaceEvenly,
    _ => .start,
  };

  CrossAxisAlignment toCrossAxisAlignment() => switch (this) {
    'start' => .start,
    'end' => .end,
    'center' => .center,
    'stretch' => .stretch,
    'baseline' => .baseline,
    _ => .center,
  };

  MainAxisSize toMainAxisSize() => switch (this) {
    'min' => .min,
    'max' => .max,
    _ => .max,
  };

  BoxFit? toBoxFit() => switch (this) {
    'fill' => .fill,
    'contain' => .contain,
    'cover' => .cover,
    'fitWidth' => .fitWidth,
    'fitHeight' => .fitHeight,
    'none' => .none,
    'scaleDown' => .scaleDown,
    _ => null,
  };

  TextAlign? toTextAlign() => switch (this) {
    'left' => .left,
    'right' => .right,
    'center' => .center,
    'justify' => .justify,
    _ => null,
  };

  TextOverflow? toTextOverflow() => switch (this) {
    'clip' => .clip,
    'fade' => .fade,
    'ellipsis' => .ellipsis,
    _ => null,
  };

  TextStyle? toTextStyle() => switch (this) {
    Map m => TextStyle(
      color: switch (m['color']) {
        String hex => hex.toColor(),
        _ => null,
      },
      fontSize: (m['fontSize'] as Object?).toDoubleOrNull(),
      letterSpacing: (m['letterSpacing'] as Object?).toDoubleOrNull(),
      fontWeight: switch (m['fontWeight']) {
        'bold' => .bold,
        'w100' => .w100,
        'w200' => .w200,
        'w300' => .w300,
        'w400' => .w400,
        'w500' => .w500,
        'w600' => .w600,
        'w700' => .w700,
        'w800' => .w800,
        'w900' => .w900,
        _ => .normal,
      },
      fontStyle: switch (m['fontStyle']) {
        'italic' => .italic,
        _ => .normal,
      },
    ),
    _ => null,
  };

  IconData toMaterialIcon() => switch (this) {
    'settings' => Icons.settings,
    'favorite' => Icons.favorite,
    'arrow_back' => Icons.arrow_back,
    'home' => Icons.home,
    'person' => Icons.person,
    'add' => Icons.add,
    'search' => Icons.search,
    'check' => Icons.check,
    'close' => Icons.close,
    _ => Icons.help_outline,
  };
}

extension StringExtension on String {
  Color toColor() {
    String hexColor = replaceAll('#', '').toUpperCase();
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return Color(int.parse(hexColor, radix: 16));
  }
}
