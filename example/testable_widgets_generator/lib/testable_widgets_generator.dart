String wrapWidgetsChild(String source) {
  var childKeywordIndex = 0;
  var twoDotsIndex = 0;
  var openingRoundBracketIndex = 0;
  var closingRoundBracketIndex = 0;
  var bracketBalance = 0;
  while (true) {
    childKeywordIndex = source.indexOf('child:', childKeywordIndex + 20);
    if (childKeywordIndex == -1) {
      break;
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

    print(childKeywordIndex);
    print(source[childKeywordIndex]);
    print(twoDotsIndex);
    print(source[twoDotsIndex]);
    print(openingRoundBracketIndex);
    print(source[openingRoundBracketIndex]);
    print(closingRoundBracketIndex);
    print(source[closingRoundBracketIndex]);

    source = source.replaceRange(
        closingRoundBracketIndex + 1, closingRoundBracketIndex + 1, ')');

    source = source.replaceRange(
        twoDotsIndex + 1, twoDotsIndex + 1, 'MenuWrap(child:');
  }

  return source;
}

String wrapWidgetsChildren(String source) {
  var childKeywordIndex = 0;
  var twoDotsIndex = 0;
  var openingSquareBracketIndex = 0;
  var closingSquareBracketIndex = 0;
  var bracketBalance = 0;
  while (true) {
    childKeywordIndex = source.indexOf('children:', childKeywordIndex + 20);
    if (childKeywordIndex == -1) {
      break;
    }

    twoDotsIndex = source.indexOf(':', childKeywordIndex);

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

    print(childKeywordIndex);
    print(source[childKeywordIndex]);
    print(twoDotsIndex);
    print(source[twoDotsIndex]);
    print(openingSquareBracketIndex);
    print(source[openingSquareBracketIndex]);
    print(closingSquareBracketIndex);
    print(source[closingSquareBracketIndex]);

    source = source.replaceRange(
        closingSquareBracketIndex + 1,
        closingSquareBracketIndex + 1,
        '.map((e) => MenuWrap(child: e)).toList()');
  }

  source = source.replaceRange(0, 0,
      "import 'package:example/presentation/ui/widget_view/widget_menu_wrap.dart';\n");
  return source;
}
