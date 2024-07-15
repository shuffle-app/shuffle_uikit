import 'package:shuffle_uikit/shuffle_uikit.dart';

class PremiumAccountMark extends BaseAccountMark {
  PremiumAccountMark({super.key, super.color})
      : super(
          iconLink: GraphicsFoundation.instance.svg.premiumAccountMark.path,
        );
}
