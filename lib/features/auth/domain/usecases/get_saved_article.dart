import 'package:flutter_clean_arch/core/usecases/usecase.dart';
import 'package:flutter_clean_arch/features/auth/domain/entities/article.dart';
import 'package:flutter_clean_arch/features/auth/domain/repository/article_repo.dart';

class GetSavedArticleUseCase implements UseCase<List<ArticleEntity>, void> {
  final ArticleRepository _articleRepository;

  GetSavedArticleUseCase(this._articleRepository);

  @override
  Future<List<ArticleEntity>> call({void params}) {
    return _articleRepository.getSavedArticles();
  }
}
