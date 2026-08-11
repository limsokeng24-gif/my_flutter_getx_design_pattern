
import '../../../cores/models/post/Content.dart';

abstract class PostRepository {
  Future<List<Content>> getAllPost();

  Future<Content?> getPostById(int id);

  Future<bool> createPost(Content post);

  Future<bool> updatePost(int id, Content post);

  Future<bool> deletePost(int id);
}
