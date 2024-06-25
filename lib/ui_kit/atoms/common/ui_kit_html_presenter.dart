import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html_iframe/flutter_html_iframe.dart';
import 'package:flutter_html_svg/flutter_html_svg.dart';
import 'package:flutter_html_table_extension/flutter_html_table_extension.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:url_launcher/url_launcher_string.dart';

class UiKitHtmlPresenter extends StatelessWidget {
  final String htmlString;

  const UiKitHtmlPresenter({super.key, required this.htmlString});

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final textColor = theme?.colorScheme.inversePrimary;
    final tableBackgroundColor = theme?.colorScheme.surface;
    final cellBackgroundColor = theme?.colorScheme.surface1;
    final regularTextTheme = theme?.regularTextTheme;

    return SafeArea(
      top: false,
      child: Html(
        data: utf8.decoder.convert(htmlString.codeUnits).replaceAll('padding: 2em', 'padding: 0'),
        onLinkTap: (link, atr, element) => launchUrlString(link ?? ''),
        extensions: [
          const SvgHtmlExtension(),
          const IframeHtmlExtension(),
          HtmlTableExtension(
              tableBorder: TableBorder.all(width: 1, color: textColor ?? Colors.white),
              headerStyle: regularTextTheme?.caption4Regular,
              cellStyle: regularTextTheme?.caption4Regular),
        ],
        style: {
          'tbody': Style(
            backgroundColor: tableBackgroundColor,
          ),
          'li': Style(
              display: Display.listItem,
              listStyleType: ListStyleType.disc,
              listStylePosition: ListStylePosition.inside,
              margin: Margins(left: Margin(0.5, Unit.em))
          ),
          'table': Style(
            backgroundColor: tableBackgroundColor,
          ),
          'tr': Style(
            border: Border(
              bottom: BorderSide(color: textColor ?? Colors.white, width: 0.800),
            ),
          ),
          'th': Style(
            // padding: const EdgeInsets.all(4),
            backgroundColor: cellBackgroundColor,
            border: Border(
              left: BorderSide(color: textColor ?? Colors.white, width: 0.800),
            ),
          ),
          'td': Style(
            // padding: const EdgeInsets.all(8),
            alignment: Alignment.topLeft,
          ),
          if (regularTextTheme != null) 'h1': regularTextTheme.caption1
              .copyWith(fontWeight: FontWeight.bold)
              .htmlStyle,
          if (regularTextTheme != null) 'h2': regularTextTheme.caption2
              .copyWith(fontWeight: FontWeight.bold)
              .htmlStyle,
          if (regularTextTheme != null) 'h3': regularTextTheme.caption3
              .copyWith(fontWeight: FontWeight.bold)
              .htmlStyle,
          if (regularTextTheme != null) 'body': regularTextTheme.caption4Regular.htmlStyle
        },
        doNotRenderTheseTags: const {'head', 'noscript', 'header'},
      ),
    );
  }
}

extension ConvertToHtmlStyle on TextStyle {
  Style get htmlStyle {
    return Style(
        color: color,
        fontFamily: fontFamily,
        fontSize: fontSize?.htmlFontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
        textDecoration: decoration);
  }
}

extension CalculateFontSize on double {
  FontSize get htmlFontSize {
    return FontSize(this);
  }
}
