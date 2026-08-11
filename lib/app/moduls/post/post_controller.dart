import 'package:get/get.dart';
import 'package:my_flutter_getx_design_pattern/app/moduls/post/repository/post_repository.dart';

import '../../cores/models/post/Content.dart';

class PostController extends GetxController {

  final postRepository = Get.find<PostRepository>();
  var loading = false.obs;
  var list = <Content>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    getAllPosts();
    super.onInit();
  }
  Future<void> getAllPosts()async{
    loading.value = true;
    var response = await postRepository.getAllPost();
    if(response.isNotEmpty){
      list.value = response;
    }
    loading.value = false;
  }
  Future<Content?> getPost(int id) async {
    return await postRepository.getPostById(id);
  }
  Future<void> createPost(Content post) async {

    loading.value = true;

    bool success = await postRepository.createPost(post);

    if(success){
      getAllPosts();
    }

    loading.value = false;
  }
  Future<void> updatePost(int id, Content post) async {

    loading.value = true;

    bool success = await postRepository.updatePost(id, post);

    if(success){
      getAllPosts();
    }

    loading.value = false;
  }
  Future<void> deletePost(int id) async {

    loading.value = true;

    bool success = await postRepository.deletePost(id);

    if(success){
      list.removeWhere((e)=>e.id==id);
    }

    loading.value = false;
  }
}