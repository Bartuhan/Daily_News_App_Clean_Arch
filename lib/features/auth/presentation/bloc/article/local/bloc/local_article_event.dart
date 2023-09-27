part of 'local_article_bloc.dart';

sealed class LocalArticleEvent extends Equatable {
  const LocalArticleEvent({this.article});

  final ArticleEntity? article;

  @override
  List<Object> get props => [article!];
}

class GetSavedArticles extends LocalArticleEvent {
  const GetSavedArticles();
}

class SavedArticle extends LocalArticleEvent {
  const SavedArticle(ArticleEntity article) : super(article: article);
}

class RemoveArticle extends LocalArticleEvent {
  const RemoveArticle(ArticleEntity article) : super(article: article);
}
