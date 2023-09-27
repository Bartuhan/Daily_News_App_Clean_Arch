import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arch/core/resources/data_state.dart';
import 'package:flutter_clean_arch/features/auth/domain/usecases/get_article.dart';
import 'package:flutter_clean_arch/features/auth/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:flutter_clean_arch/features/auth/presentation/bloc/article/remote/remote_article_state.dart';

class RemoteArticlesBloc extends Bloc<RemoteArticlesEvent, RemoteArticleState> {
  final GetArticleUseCase _getArticleUseCase;

  RemoteArticlesBloc(this._getArticleUseCase) : super(const RemoteArticleLoading()) {
    on<GetArticles>(onGetArticles);
  }

  void onGetArticles(GetArticles event, Emitter<RemoteArticleState> emit) async {
    final dataState = await _getArticleUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticlesDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      debugPrint('Data Failed');
      emit(RemoteArticlesErrors(dataState.error!));
    }
  }
}
