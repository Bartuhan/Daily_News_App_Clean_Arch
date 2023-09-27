import 'package:floor/floor.dart';
import 'package:flutter_clean_arch/features/auth/data/models/article_model.dart';

@dao
abstract class ArticleDao {
  @Insert()
  Future<void> insertArticle(ArticleModel article);

  @delete
  Future<void> deleteArticle(ArticleModel article);

  @Query('Select * From article')
  Future<List<ArticleModel>> getArticle();
}
