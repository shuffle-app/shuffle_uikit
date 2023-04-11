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
  GlobalKey<FormState> form1 = GlobalKey<FormState>();
  GlobalKey<FormState> form2 = GlobalKey<FormState>();
  GlobalKey<FormState> form3 = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final theme = Theme.of(context).extension<UiKitThemeData>();
      if (theme != null) setState(() => isShuffleTheme = true);
      Future.delayed(
        const Duration(milliseconds: 250),
        () {
          form1.currentState?.validate();
          form2.currentState?.validate();
          form3.currentState?.validate();
        },
      );
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
            childAspectRatio: 1.25,
          ),
          children: [
            Form(
              key: form1,
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
            ),
            Form(
              key: form2,
              child: Column(
                children: [
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
                ],
              ),
            ),
            Form(
              key: form3,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
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
                ],
              ),
            ),
            UiKitInputFieldNoIconCompact(
              controller: _controller,
            ),
            UiKitInputFieldNoFill(
              controller: _controller,
            ),
            Center(
              child: OrdinaryButtonWithChild(
                onPressed: () {},
                child: Container(
                  width: 25,
                  height: 25,
                  color: Colors.red,
                ),
              ),
            ),
            Center(
              child: GeneralPurposeButton(
                text: 'General Purpose Button',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
