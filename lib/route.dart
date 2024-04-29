// import 'dart:js';

import 'package:clean_archi/application/pages/add_review/add_review_page.dart';
import 'package:clean_archi/application/pages/detail/bloc/detail_bloc.dart';
import 'package:clean_archi/application/pages/detail/detail_page.dart';
import 'package:clean_archi/application/pages/home/homepage.dart';
import 'package:clean_archi/application/pages/search/search_page.dart';
import 'package:clean_archi/domain/entities/resto_entity.dart';
import 'package:clean_archi/injection.dart';
// import 'package:clean_archi/application/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnGenerateRoute {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'home_page':
        return MaterialPageRoute(builder: (context) => HomePage());

      case 'detail_page':
        final RestoEntity restoEntity = settings.arguments as RestoEntity;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => DetailBloc(detailUseCase: sl()),
            child: DetailPage(restoEntity: restoEntity),
          ),
        );

      case 'search_page':
        return MaterialPageRoute(
          builder: (context) => SearchPage(),
        );

      case 'add_review_page':
        return MaterialPageRoute(
            builder: (context) => AddReviewPage(restoDetailEntity: sl()));

      default:
        return _errorRoute();
    }
  }

  Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('ERROR'),
          centerTitle: true,
        ),
        body: const Center(
          child: Text('Page not found!'),
        ),
      );
    });
  }
}
