import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

extension SocialMediaStringValidator on String {
  IconData get icon {
    if (contains('instagram')) return ShuffleUiKitIcons.socialinstagram;
    //TODO add icons
    // if(contains('facebook')) return ShuffleUiKitIcons.facebook;
    if (contains('twitter')) return ShuffleUiKitIcons.socialtwitter;
    if (contains('wa.me')) return ShuffleUiKitIcons.socialwhatsapp;
    // if(contains('youtube')) return ShuffleUiKitIcons.youtube;
    // if(contains('tiktok')) return ShuffleUiKitIcons.tiktok;
    // if(contains('pinterest')) return ShuffleUiKitIcons.pinterest;
    if (contains('t.me')) return ShuffleUiKitIcons.socialtelegram;

    return ShuffleUiKitIcons.alertcircle;
  }
}
