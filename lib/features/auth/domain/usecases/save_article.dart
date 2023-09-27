import 'package:flutter_clean_arch/core/usecases/usecase.dart';
import 'package:flutter_clean_arch/features/auth/domain/entities/article.dart';
import 'package:flutter_clean_arch/features/auth/domain/repository/article_repo.dart';

class SavedArticleUseCase implements UseCase<void, ArticleEntity> {
  final ArticleRepository _articleRepository;

  SavedArticleUseCase(this._articleRepository);

  @override
  Future<void> call({ArticleEntity? params}) {
    return _articleRepository.saveArticle(params!);
  }
}
