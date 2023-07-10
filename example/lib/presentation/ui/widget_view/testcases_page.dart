import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

import 'single_widget_view_page.dart';

class TestCasesPage extends StatefulWidget {
  const TestCasesPage({super.key, required this.prefix});
  final String prefix;

  @override
  State<TestCasesPage> createState() => _TestCasesPageState();
}

class _TestCasesPageState extends State<TestCasesPage> {
  String? masterImage;
  String? testImage;
  String? isolatedDiff;
  String? maskedDiff;

  @override
  void initState() {
    super.initState();

    masterImage = 'goldens/${widget.prefix}_master.png';
    testImage = 'goldens/${widget.prefix}_testImage.png';
    isolatedDiff = 'goldens/${widget.prefix}_isolatedDiff.png';
    maskedDiff = 'goldens/${widget.prefix}_maskedDiff.png';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _button(masterImage!),
        _button(testImage!),
        _button(isolatedDiff!),
        _button(maskedDiff!),
      ],
    ));
  }

  Widget _button(String s) {
    return GestureDetector(
      onTap: () {
        context.push(
          SingleWidgetViewPage(
            widget: Image.asset(s,
                errorBuilder: ((context, error, stackTrace) => const Text(
                      'no image',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ))),
          ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(s, style: TextStyle(color: Colors.white, fontSize: 30)),
          Image.asset(
            s,
            width: 100,
            height: 100,
            errorBuilder: (context, error, stackTrace) => const Text(
                  'no image',
                  style: TextStyle(color: Colors.redAccent, fontSize: 30),
                ),
          ),
        ],
      ),
    );
  }
}
