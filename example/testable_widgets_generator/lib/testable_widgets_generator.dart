String wrapWidgetsChild(String source) {
  var childKeywordIndex = 0;
  var twoDotsIndex = 0;
  var openingRoundBracketIndex = 0;
  var closingRoundBracketIndex = 0;
  var bracketBalance = 0;
  while (childKeywordIndex < source.length) {
    childKeywordIndex = source.indexOf('child:', childKeywordIndex + 20);
    if (childKeywordIndex == -1) {
      break;
    }
    final lastMenuWrapIndex = source.lastIndexOf('MenuWrap');
    if (childKeywordIndex < lastMenuWrapIndex) {
      childKeywordIndex += 10;
      continue;
    }

    twoDotsIndex = source.indexOf(':', childKeywordIndex);

    openingRoundBracketIndex = source.indexOf('(', childKeywordIndex);
    bracketBalance = 1;

    var i = openingRoundBracketIndex;
    while (bracketBalance > 0) {
      i++;
      if (source[i] == '(') {
        bracketBalance++;
      } else if (source[i] == ')') {
        bracketBalance--;
      }
    }

    closingRoundBracketIndex = i;

    source = source.replaceRange(
        closingRoundBracketIndex + 1, closingRoundBracketIndex + 1, ')');

    source = source.replaceRange(
        twoDotsIndex + 1, twoDotsIndex + 1, 'MenuWrap(child:');
    source = setClassNameIfNotChanged(source, twoDotsIndex);
  }

  return source;
}

String wrapWidgetsChildren(String source) {
  var childKeywordIndex = 0;
  var openingSquareBracketIndex = 0;
  var closingSquareBracketIndex = 0;
  var bracketBalance = 0;
  while (childKeywordIndex < source.length) {
    childKeywordIndex = source.indexOf('children:', childKeywordIndex + 10);
    if (childKeywordIndex == -1) {
      break;
    }
    final lastMenuWrapIndex = source.lastIndexOf('MenuWrap');
    if (childKeywordIndex < lastMenuWrapIndex) {
      childKeywordIndex += 10;
      continue;
    }

    openingSquareBracketIndex = source.indexOf('[', childKeywordIndex);
    bracketBalance = 1;

    var i = openingSquareBracketIndex;
    while (bracketBalance > 0) {
      i++;
      if (source[i] == '[') {
        bracketBalance++;
      } else if (source[i] == ']') {
        bracketBalance--;
      }
    }

    closingSquareBracketIndex = i;

    source = source.replaceRange(
        closingSquareBracketIndex + 1,
        closingSquareBracketIndex + 1,
        '.map((e) => MenuWrap(child: e)).toList()');
    source = setClassNameIfNotChanged(source, openingSquareBracketIndex);
  }

  source = source.replaceRange(0, 0,
      "import 'package:example/presentation/ui/widget_view/widget_menu_wrap.dart';\n");
  return source;
}

String setClassNameIfNotChanged(String source, int classNameIsBeforeThisIndex) {
  final classKeywordIndex =
      source.substring(0, classNameIsBeforeThisIndex).lastIndexOf('class ');
  final firstWhitespaceAfterClassNameIndex =
      source.indexOf(' ', classKeywordIndex + 6);
  final className = source.substring(
      classKeywordIndex + 6, firstWhitespaceAfterClassNameIndex);
  if (!className.endsWith('WrapForTesting')) {
    source = source.replaceAll(className, '${className}WrapForTesting');
  }
  print('|$className|');
  return source;
}
