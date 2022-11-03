// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
import 'package:auto_route/auto_route.dart';
import 'package:fluttertask/pages/loginui.dart';
import 'package:fluttertask/pages/productdetail.dart';
import 'package:fluttertask/pages/productlist.dart';
import 'package:fluttertask/pages/search.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: LoginPage, initial: true),
    AutoRoute(page: ProductlistPage, path: '/productlist'),
    AutoRoute(page: ProductdetailPage),
    AutoRoute(page: SearchPage),
  ],
)
class $AppRouter {}
