import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_arch/features/auth/domain/entities/article.dart';
import 'package:flutter_clean_arch/features/auth/domain/usecases/get_saved_article.dart';
import 'package:flutter_clean_arch/features/auth/domain/usecases/remove_aticle.dart';
import 'package:flutter_clean_arch/features/auth/domain/usecases/save_article.dart';

part 'local_article_event.dart';
part 'local_article_state.dart';

class LocalArticleBloc extends Bloc<LocalArticleEvent, LocalArticleState> {
  final GetSavedArticleUseCase _getSavedArticleUseCase;
  final SavedArticleUseCase _savedArticleUseCase;
  final RemoveArticleUseCase _removeArticleUseCase;

  LocalArticleBloc(
    this._getSavedArticleUseCase,
    this._savedArticleUseCase,
    this._removeArticleUseCase,
  ) : super(const LocalArticleLoading()) {
    on<GetSavedArticles>(onGetSavedArticles);
    on<RemoveArticle>(onRemoveArticle);
    on<SavedArticle>(onSaveArticle);
  }

  void onGetSavedArticles(GetSavedArticles event, Emitter<LocalArticleState> emit) async {
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticleDone(articles));
  }

  void onRemoveArticle(RemoveArticle removeArticles, Emitter<LocalArticleState> emit) async {
    await _removeArticleUseCase(params: removeArticles.article);
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticleDone(articles));
  }

  void onSaveArticle(SavedArticle saveArticles, Emitter<LocalArticleState> emit) async {
    await _savedArticleUseCase(params: saveArticles.article);
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticleDone(articles));
  }
}
