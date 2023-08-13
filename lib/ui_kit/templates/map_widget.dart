import 'package:flutter/widgets.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

abstract class MapWidget extends Widget {}

class ExampleMap extends StatelessWidget implements MapWidget {
  const ExampleMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'MAP',
        style: context.uiKitTheme?.boldTextTheme.title1,
      ),
    );
  }
}
