import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class AllWidgetsStand extends StatefulWidget {
  const AllWidgetsStand({super.key});

  @override
  State<AllWidgetsStand> createState() => _AllWidgetsStandState();
}

class _AllWidgetsStandState extends State<AllWidgetsStand> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Shuffle UI Kit Showcase Stand',
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsetsFoundation.all16,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                UiKitInputFieldRightIcon(
                  controller: _controller,
                  hintText: 'PLACEHOLDER',
                ),
                SpacingFoundation.verticalSpace16,
                UiKitInputFieldRightIcon(
                  controller: _controller,
                  hintText: 'PLACEHOLDER',
                  enabled: false,
                ),
                SpacingFoundation.verticalSpace16,
                UiKitInputFieldRightIcon(
                  controller: _controller,
                  hintText: 'PLACEHOLDER',
                  enabled: true,
                  validator: (value) {
                    return 'Wrong symbols';
                  },
                ),
              ],
            ),
            SpacingFoundation.verticalSpace16,
            UiKitInputFieldLeftIcon(
              controller: _controller,
              hintText: 'PLACEHOLDER',
              enabled: true,
            ),
            SpacingFoundation.verticalSpace16,
            UiKitInputFieldLeftIcon(
              controller: _controller,
              hintText: 'PLACEHOLDER',
              enabled: false,
            ),
            SpacingFoundation.verticalSpace16,
            UiKitInputFieldLeftIcon(
              controller: _controller,
              hintText: 'PLACEHOLDER',
              enabled: true,
              validator: (value) {
                return 'Wrong symbols';
              },
            ),
            SpacingFoundation.verticalSpace16,
            UiKitInputFieldNoIcon(
              controller: _controller,
              hintText: 'PLACEHOLDER',
            ),
            SpacingFoundation.verticalSpace16,
            UiKitInputFieldNoIcon(
              controller: _controller,
              hintText: 'PLACEHOLDER',
              enabled: false,
            ),
            SpacingFoundation.verticalSpace16,
            UiKitInputFieldNoIcon(
              controller: _controller,
              hintText: 'PLACEHOLDER',
              validator: (value) {
                return 'Wrong symbols';
              },
            ),
            SpacingFoundation.verticalSpace16,
            UiKitInputFieldNoIconCompact(
              controller: _controller,
              hintText: 'PLACEHOLDER',
            ),
            SpacingFoundation.verticalSpace16,
            UiKitInputFieldNoIconCompact(
              controller: _controller,
              enabled: false,
              hintText: 'PLACEHOLDER',
            ),
            SpacingFoundation.verticalSpace16,
            UiKitInputFieldNoIconCompact(
              controller: _controller,
              hintText: 'PLACEHOLDER',
              validator: (value) {
                return 'Wrong symbols';
              },
            ),
            SpacingFoundation.verticalSpace16,
            UiKitInputFieldNoFill(
              label: 'Name',
              controller: _controller,
              hintText: 'PLACEHOLDER',
            ),
            SpacingFoundation.verticalSpace16,
            UiKitInputFieldNoFill(
              label: 'Name',
              controller: _controller,
              hintText: 'PLACEHOLDER',
              enabled: false,
            ),
            SpacingFoundation.verticalSpace16,
            UiKitInputFieldNoFill(
              label: 'Name',
              controller: _controller,
              hintText: 'PLACEHOLDER',
              validator: (value) {
                return 'Wrong symbols';
              },
            ),
            SpacingFoundation.verticalSpace16,
            GeneralPurposeButton(
              text: 'Get code',
              onPressed: () {},
            ),
            SpacingFoundation.verticalSpace16,
            const GeneralPurposeButton(
              text: 'Get code',
            ),
            SpacingFoundation.verticalSpace16,
            Builder(
              builder: (context) {
                final buttonTextStyle = Theme.of(context).extension<UiKitThemeData>()?.boldTextTheme.bodyUpperCase.copyWith(
                      color: Colors.black,
                    );
                return GeneralPurposeButtonWithChild(
                  overlayColor: Colors.white,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Loading'.toUpperCase(),
                        style: buttonTextStyle,
                      ),
                      SpacingFoundation.horizontalSpace4,
                      const SizedBox(
                        height: 20,
                        width: 20,
                        child: Center(child: CupertinoActivityIndicator()),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
