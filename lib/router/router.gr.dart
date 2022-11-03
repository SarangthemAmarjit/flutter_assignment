// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../pages/loginui.dart' as _i1;
import '../pages/productdetail.dart' as _i3;
import '../pages/productlist.dart' as _i2;
import '../pages/search.dart' as _i4;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LoginPage(),
      );
    },
    ProductlistRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.ProductlistPage(),
      );
    },
    ProductdetailRoute.name: (routeData) {
      final args = routeData.argsAs<ProductdetailRouteArgs>();
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.ProductdetailPage(
          key: args.key,
          itemname: args.itemname,
          itemcategory: args.itemcategory,
          itemrating: args.itemrating,
          itemcount: args.itemcount,
          itemprice: args.itemprice,
          itemdescription: args.itemdescription,
          itemimage: args.itemimage,
        ),
      );
    },
    SearchRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.SearchPage(),
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          LoginRoute.name,
          path: '/',
        ),
        _i5.RouteConfig(
          ProductlistRoute.name,
          path: '/productlist',
        ),
        _i5.RouteConfig(
          ProductdetailRoute.name,
          path: '/productdetail-page',
        ),
        _i5.RouteConfig(
          SearchRoute.name,
          path: '/search-page',
        ),
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.ProductlistPage]
class ProductlistRoute extends _i5.PageRouteInfo<void> {
  const ProductlistRoute()
      : super(
          ProductlistRoute.name,
          path: '/productlist',
        );

  static const String name = 'ProductlistRoute';
}

/// generated route for
/// [_i3.ProductdetailPage]
class ProductdetailRoute extends _i5.PageRouteInfo<ProductdetailRouteArgs> {
  ProductdetailRoute({
    _i6.Key? key,
    required String itemname,
    required String itemcategory,
    required String itemrating,
    required String itemcount,
    required String itemprice,
    required String itemdescription,
    required String itemimage,
  }) : super(
          ProductdetailRoute.name,
          path: '/productdetail-page',
          args: ProductdetailRouteArgs(
            key: key,
            itemname: itemname,
            itemcategory: itemcategory,
            itemrating: itemrating,
            itemcount: itemcount,
            itemprice: itemprice,
            itemdescription: itemdescription,
            itemimage: itemimage,
          ),
        );

  static const String name = 'ProductdetailRoute';
}

class ProductdetailRouteArgs {
  const ProductdetailRouteArgs({
    this.key,
    required this.itemname,
    required this.itemcategory,
    required this.itemrating,
    required this.itemcount,
    required this.itemprice,
    required this.itemdescription,
    required this.itemimage,
  });

  final _i6.Key? key;

  final String itemname;

  final String itemcategory;

  final String itemrating;

  final String itemcount;

  final String itemprice;

  final String itemdescription;

  final String itemimage;

  @override
  String toString() {
    return 'ProductdetailRouteArgs{key: $key, itemname: $itemname, itemcategory: $itemcategory, itemrating: $itemrating, itemcount: $itemcount, itemprice: $itemprice, itemdescription: $itemdescription, itemimage: $itemimage}';
  }
}

/// generated route for
/// [_i4.SearchPage]
class SearchRoute extends _i5.PageRouteInfo<void> {
  const SearchRoute()
      : super(
          SearchRoute.name,
          path: '/search-page',
        );

  static const String name = 'SearchRoute';
}
