import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class DialogTestingPage extends StatelessWidget {
  const DialogTestingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SafeArea(
      child: Column(
        children: [
          GeneralPurposeButton(
            text: 'Dialog bottom sheet fullscreen',
            onPressed: () => showUiKitGeneralFullScreenDialog(context,
                child: Column(
                  children: List.generate(10, (index) => Placeholder().paddingSymmetric(vertical: 8)),
                )),
          ),
          SpacingFoundation.verticalSpace16,
          GeneralPurposeButton(
            text: 'Dialog calendar picker',
            onPressed: () => showUiKitCalendarDialog(
              context,
            ),
          ),
          SpacingFoundation.verticalSpace16,
          //почему то работает только так отображение поповера, надо подумать
          Builder(
              builder: (c) => GeneralPurposeButton(
                    text: 'Dialog comment',
                    onPressed: () => showUiKitPopover(c,
                        title: Text('Premium account'),
                        buttonText: 'see more',
                        description: Text('Only premium account users can post reactions')),
                  )),
          SpacingFoundation.verticalSpace16,
          GeneralPurposeButton(
              text: 'Dialog alert',
              onPressed: () => showUiKitAlertDialog(
                    context,
                    buttonText: 'text',
                    title: Text('You sent an invitation to 2 people.'),
                    content: Text('Invitations can be viewed in private messages'),
                  )),
        ],
      ),
    )));
  }
}
