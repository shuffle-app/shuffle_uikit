import 'package:shuffle_uikit/shuffle_uikit.dart';

extension SocialMediaStringValidator on String {
  SvgGenImage get icon {
    if(contains('instagram')) return GraphicsFoundation.instance.svg.socialInstagram;
    //TODO add icons
    // if(contains('facebook')) return ShuffleUiKitIcons.facebook;
    if(contains('twitter')) return GraphicsFoundation.instance.svg.socialTwitter;
    if(contains('whatsapp')) return GraphicsFoundation.instance.svg.socialWhatsapp;
    // if(contains('youtube')) return ShuffleUiKitIcons.youtube;
    // if(contains('tiktok')) return ShuffleUiKitIcons.tiktok;
    // if(contains('pinterest')) return ShuffleUiKitIcons.pinterest;
    if(contains('tg')) return GraphicsFoundation.instance.svg.socialTelegram;

    return GraphicsFoundation.instance.svg.alertCircle;
  }
}