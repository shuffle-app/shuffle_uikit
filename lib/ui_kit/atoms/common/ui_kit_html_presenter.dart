import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html_iframe/flutter_html_iframe.dart';
import 'package:flutter_html_svg/flutter_html_svg.dart';
import 'package:url_launcher/url_launcher_string.dart';

class UiKitHtmlPresenter extends StatelessWidget {
  final String htmlString;

  const UiKitHtmlPresenter({super.key, required this.htmlString});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child:  Html(
                data: htmlString,
                onLinkTap: (link,atr,element)=>launchUrlString(link ?? ''),
                extensions: const [
                  SvgHtmlExtension(),
                  IframeHtmlExtension(),
                ],
                style: {
                  'h1': Style(
                    color: Colors.white
                  ),
                  'h2': Style(
                      color: Colors.white
                  ),
                  'body': Style(
                      color: Colors.white
                  ),
                },
                doNotRenderTheseTags: const {'head', 'noscript','header'}));
  }
}
