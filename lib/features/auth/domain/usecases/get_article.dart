import 'package:flutter_clean_arch/core/resources/data_state.dart';
import 'package:flutter_clean_arch/core/usecases/usecase.dart';
import 'package:flutter_clean_arch/features/auth/domain/entities/article.dart';
import 'package:flutter_clean_arch/features/auth/domain/repository/article_repo.dart';

class GetArticleUseCase implements UseCase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArticles();
  }
}
