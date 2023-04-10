import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class AllWidgetsStand extends StatefulWidget {
  const AllWidgetsStand({super.key});

  @override
  State<AllWidgetsStand> createState() => _AllWidgetsStandState();
}

class _AllWidgetsStandState extends State<AllWidgetsStand> {
  final TextEditingController _controller = TextEditingController();
  late bool isShuffleTheme;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final theme = Theme.of(context).extension<UiKitThemeData>();
      if (theme != null) setState(() => isShuffleTheme = true);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: isShuffleTheme ? UiKitThemeFoundation.defaultTheme : ThemeData(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Shuffle UI Kit Showcase Stand',
          centerTitle: true,
          action: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Shuffle Theme',
                style: Theme.of(context).extension<UiKitThemeData>()?.boldTextTheme.body.copyWith(
                      color: isShuffleTheme ? Colors.white : Colors.black,
                    ),
              ),
              SpacingFoundation.horizontalSpace8,
              Switch(
                value: isShuffleTheme,
                activeColor: Colors.white,
                inactiveTrackColor: ColorsFoundation.solidSurface,
                onChanged: (value) {
                  if (value) {}
                  setState(() {
                    isShuffleTheme = value;
                  });
                },
              ),
            ],
          ),
        ),
        body: GridView(
          padding: EdgeInsetsFoundation.all16,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.5,
          ),
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                UiKitInputFieldRightIcon(
                  controller: _controller,
                  hintText: 'PLACEHOLDER',
                ),
                UiKitInputFieldRightIcon(
                  controller: _controller,
                  hintText: 'PLACEHOLDER',
                  enabled: false,
                ),
              ],
            ),
            UiKitInputFieldLeftIcon(
              controller: _controller,
            ),
            UiKitInputFieldNoIcon(
              controller: _controller,
            ),
            UiKitInputFieldNoIconCompact(
              controller: _controller,
            ),
            UiKitInputFieldNoFill(
              controller: _controller,
            ),
          ],
        ),
      ),
    );
  }
}
