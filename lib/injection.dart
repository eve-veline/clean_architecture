import 'package:clean_archi/application/pages/add_review/bloc/add_review_bloc.dart';
import 'package:clean_archi/application/pages/detail/bloc/detail_bloc.dart';
import 'package:clean_archi/application/pages/home/bloc/home_bloc.dart';
import 'package:clean_archi/application/pages/search/bloc/search_bloc.dart';
import 'package:clean_archi/data/datasources/apiservice.dart';
import 'package:clean_archi/data/repositories/add_review_repo_impl.dart';
import 'package:clean_archi/data/repositories/detail_repo_impl.dart';
import 'package:clean_archi/data/repositories/home_repo_impl.dart';
import 'package:clean_archi/data/repositories/search_repo_impl.dart';
import 'package:clean_archi/domain/repositories/add_review_repo.dart';
import 'package:clean_archi/domain/repositories/detail_repo.dart';
import 'package:clean_archi/domain/repositories/home_repo.dart';
import 'package:clean_archi/domain/repositories/search_repo.dart';
import 'package:clean_archi/domain/usecases/add_review_usecase.dart';
import 'package:clean_archi/domain/usecases/detail_usecase.dart';
import 'package:clean_archi/domain/usecases/home_usecase.dart';
import 'package:clean_archi/domain/usecases/search_usecase.dart';
import 'package:get_it/get_it.dart';
// import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.I;

Future<void> init() async {
  // ! application layer
  sl.registerFactory(() => HomeBloc(homeUseCases: sl()));
  sl.registerFactory(() => DetailBloc(detailUseCase: sl()));
  sl.registerFactory(() => SearchBloc(searchUseCases: sl()));
  sl.registerFactory(() => AddReviewBloc(addReviewUseCases: sl()));

  // ! domain layer
  sl.registerFactory(() => HomeUseCases(homeRepo: sl()));
  sl.registerFactory(() => DetailUseCases(detailRepo: sl()));
  sl.registerFactory(() => SearchUseCases(searchRepo: sl()));
  sl.registerFactory(() => AddReviewUseCases(addReviewRepo: sl()));

  // ! data layer
  sl.registerFactory<HomeRepo>(
      () => HomeRepoImpl(apiService: ApiService(client: sl())));
  sl.registerFactory<DetailRepo>(
      () => DetailRepoImpl(apiService: ApiService(client: sl())));
  sl.registerFactory<SearchRepo>(
      () => SearchRepoImpl(apiService: ApiService(client: sl())));
  sl.registerFactory<AddReviewRepo>(
      () => AddReviewRepoImpl(apiService: ApiService(client: sl())));
  // sl.registerFactory<DetailRepo>(() => DetailRepo(sl()));

  // ! externs
  sl.registerFactory(() => http.Client());
}
