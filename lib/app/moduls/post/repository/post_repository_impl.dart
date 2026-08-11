import 'dart:convert';

import 'package:get/get.dart';
import 'package:my_flutter_getx_design_pattern/app/moduls/post/repository/post_repository.dart';

import '../../../cores/constants/constant_uri.dart';
import '../../../cores/models/post/Content.dart';
import '../../../cores/models/post/PostResponse.dart';
import '../../../cores/network/api_network_service.dart';
class PostRepositoryImpl extends PostRepository {
  final apiNetworkService = Get.find<ApiNetworkService>();
  Future<List<Content>> getAllPost({
    String? page,
    String? limit,
    String? status,
  }) async {
    List<Content> list = [];
    var responseBody = await apiNetworkService.get(
      "${ConstantUri.listPostPath}?page=${page ?? 0}&size=${limit ?? 10}&status=${status ?? 'ACT'}",
    );
    if (responseBody != null) {
      PostResponse postResponse = PostResponse.fromJson(
        jsonDecode(responseBody),
      );
      if (postResponse.data != null && postResponse.data!.content!.isNotEmpty) {
        list = postResponse.data!.content ?? [];
      }
    }
    return list;
  }

  @override
  Future<bool> createPost(Content post) async {

    var response = await apiNetworkService.post(
        ConstantUri.listPostPath,
        post.toJson());

    return response != null;
  }

  @override
  Future<bool> deletePost(int id) async {

    return await apiNetworkService.delete(
        "${ConstantUri.listPostPath}/$id");
  }

  @override
  Future<Content?> getPostById(int id) async {

    var response = await apiNetworkService.get(
        "${ConstantUri.listPostPath}/$id");

    if(response != null){

      PostResponse postResponse =
      PostResponse.fromJson(jsonDecode(response));

      return postResponse.data?.content?.first;
    }

    return null;
  }

  @override
  Future<bool> updatePost(int id, Content post) async {
    print("PUT URL: ${ConstantUri.listPostPath}/$id");
    print("BODY: ${post.toJson()}");

    var response = await apiNetworkService.put(
      "${ConstantUri.listPostPath}/$id",
      post.toJson(),
    );

    print("Response: $response");

    return response != null;
  }
}