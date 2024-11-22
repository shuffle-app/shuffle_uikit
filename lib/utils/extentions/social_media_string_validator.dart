import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

extension SocialMediaStringValidator on String {
  IconData? get icon {
    if (contains('instagram')) return ShuffleUiKitIcons.socialinstagram;
    if (contains('twitter')) return ShuffleUiKitIcons.socialtwitter;

    return null;
  }

  String? get iconSvg {
    final instanceSvg = GraphicsFoundation.instance.svg;

    if (contains('facebook')) return instanceSvg.socialFacebook.path;
    if (contains('wa.me')) return instanceSvg.socialWhatsapp.path;
    if (contains('t.me')) return instanceSvg.socialTelegram.path;

    return null;
  }
}
