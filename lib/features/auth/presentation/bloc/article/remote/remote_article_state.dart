import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_arch/features/auth/domain/entities/article.dart';

abstract class RemoteArticleState extends Equatable {
  final List<ArticleEntity>? articles;
  final DioException? error;

  const RemoteArticleState({this.articles, this.error});

  @override
  List<Object?> get props => [articles!, error!];
}

class RemoteArticleLoading extends RemoteArticleState {
  const RemoteArticleLoading();
}

class RemoteArticlesDone extends RemoteArticleState {
  const RemoteArticlesDone(List<ArticleEntity> article) : super(articles: article);
}

class RemoteArticlesErrors extends RemoteArticleState {
  const RemoteArticlesErrors(DioException error) : super(error: error);
}
