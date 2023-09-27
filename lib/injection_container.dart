import 'package:dio/dio.dart';
import 'package:flutter_clean_arch/features/auth/data/data_sources/local/app_database.dart';
import 'package:flutter_clean_arch/features/auth/data/data_sources/remote/news_api_service.dart';
import 'package:flutter_clean_arch/features/auth/data/repository/article_repository.dart';
import 'package:flutter_clean_arch/features/auth/domain/repository/article_repo.dart';
import 'package:flutter_clean_arch/features/auth/domain/usecases/get_article.dart';
import 'package:flutter_clean_arch/features/auth/domain/usecases/get_saved_article.dart';
import 'package:flutter_clean_arch/features/auth/domain/usecases/remove_aticle.dart';
import 'package:flutter_clean_arch/features/auth/domain/usecases/save_article.dart';
import 'package:flutter_clean_arch/features/auth/presentation/bloc/article/local/bloc/local_article_bloc.dart';
import 'package:flutter_clean_arch/features/auth/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //Local Database (Floor)
  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);

  //Dio
  sl.registerSingleton<Dio>(Dio());

  //Dependencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  //Repository
  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl(), sl()));

  //UseCases
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));

  sl.registerSingleton<GetSavedArticleUseCase>(GetSavedArticleUseCase(sl()));

  sl.registerSingleton<SavedArticleUseCase>(SavedArticleUseCase(sl()));

  sl.registerSingleton<RemoveArticleUseCase>(RemoveArticleUseCase(sl()));

  //Blocs
  sl.registerFactory<RemoteArticlesBloc>(
    () => RemoteArticlesBloc(sl()),
  );

  sl.registerFactory<LocalArticleBloc>(
    () => LocalArticleBloc(sl(), sl(), sl()),
  );
}
