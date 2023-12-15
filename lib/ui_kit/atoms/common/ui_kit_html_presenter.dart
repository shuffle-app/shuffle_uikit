import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html_iframe/flutter_html_iframe.dart';
import 'package:flutter_html_svg/flutter_html_svg.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:url_launcher/url_launcher_string.dart';

class UiKitHtmlPresenter extends StatelessWidget {
  final String htmlString;

  const UiKitHtmlPresenter({super.key, required this.htmlString});

  @override
  Widget build(BuildContext context) {
    final textColor = context.uiKitTheme?.colorScheme.inversePrimary;

    return SafeArea(
      top: false,
      child: Html(
        data: htmlString,
        onLinkTap: (link, atr, element) => launchUrlString(link ?? ''),
        extensions: const [
          SvgHtmlExtension(),
          IframeHtmlExtension(),
        ],
        style: {
          'h1': Style(
            color: textColor,
          ),
          'h2': Style(
            color: textColor,
          ),
          'body': Style(
            color: textColor,
          ),
        },
        doNotRenderTheseTags: const {'head', 'noscript', 'header'},
      ),
    );
  }
}
