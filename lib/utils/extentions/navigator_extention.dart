import 'package:flutter/material.dart';

extension NavigatorExtention on BuildContext {
  ///  just call this [canPop()] method and it would return true if this route can be popped and false if it’s not possible.
  bool canPop() => Navigator.canPop(this);

  /// performs a simple [Navigator.pop] action and returns given [result]
  void pop<T>({T? result}) => Navigator.pop(this, result);

  /// performs a simple [Navigator.push] action with given [route]
  Future<dynamic> push(
    Widget screen, {
    RouteSettings? settings,
    bool maintainState = true,
    bool nativeTransition = true,
    bool useRootNavigator = false,
    RoutePageBuilder? pageBuilder,
    Duration? transitionDuration,
    Duration? reverseTransitionDuration,
  }) async =>
      await Navigator.of(this, rootNavigator: useRootNavigator).push(
        nativeTransition
            ? MaterialPageRoute(
                builder: (_) => screen,
                settings: settings,
                maintainState: maintainState,
              )
            : PageRouteBuilder(
                transitionDuration: transitionDuration ?? const Duration(milliseconds: 300),
                reverseTransitionDuration: reverseTransitionDuration ?? const Duration(milliseconds: 300),
                pageBuilder: pageBuilder ??
                    (context, animation, _) => FadeTransition(
                          opacity: animation,
                          child: screen,
                        ),
                settings: settings,
                maintainState: maintainState,
              ),
      );

  /// performs a simple [Navigator.pushReplacement] action with given [route]
  Future<dynamic> pushReplacement(
    Widget screen, {
    RouteSettings? settings,
    bool maintainState = true,
    bool nativeTransition = true,
    RoutePageBuilder? pageBuilder,
  }) async =>
      await Navigator.of(this).pushReplacement(nativeTransition
          ? MaterialPageRoute(
              builder: (_) => screen,
              settings: settings,
              maintainState: maintainState,
            )
          : PageRouteBuilder(
              pageBuilder: pageBuilder ??
                  (context, animation, _) => FadeTransition(
                        opacity: animation,
                        child: screen,
                      ),
              settings: settings,
              maintainState: maintainState,
            ));

  /// perform push and remove route
  Future<dynamic> pushAndRemoveUntil(
    Widget screen, {
    RouteSettings? settings,
    bool maintainState = true,
    RoutePredicate? routePredicate,
    bool nativeTransition = true,
    RoutePageBuilder? pageBuilder,
  }) async =>
      await Navigator.of(this).pushAndRemoveUntil(
          nativeTransition
              ? MaterialPageRoute(
                  builder: (_) => screen,
                  settings: settings,
                  maintainState: maintainState,
                )
              : PageRouteBuilder(
                  pageBuilder: pageBuilder ??
                      (context, animation, _) => FadeTransition(
                            opacity: animation,
                            child: screen,
                          ),
                  settings: settings,
                  maintainState: maintainState,
                ),
          routePredicate ?? ((Route<dynamic> route) => false));

  /// perform push with routeName
  Future<dynamic> pushNamed(
    String screenName, {
    Object? arguments,
  }) async =>
      await Navigator.of(this).pushNamed(screenName, arguments: arguments);

  /// perform replash with routeName
  Future<dynamic> pushReplacementNamed(
    String screenName, {
    Object? arguments,
  }) =>
      Navigator.of(this).pushReplacementNamed(screenName, arguments: arguments);

  /// perform replash with routeName
  void popUntil(String screenName) =>
      // Navigator.of(this).popUntil((route)=>route.isFirst);
      Navigator.of(this).popUntil(ModalRoute.withName(screenName));

  /// perform push with routeName
  Future<dynamic> pushNamedAndRemoveUntil(
    String screenName, {
    Object? arguments,
    bool routes = false,
  }) async =>
      await Navigator.of(this)
          .pushNamedAndRemoveUntil(screenName, (Route<dynamic> route) => routes, arguments: arguments);
}
