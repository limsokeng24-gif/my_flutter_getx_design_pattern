import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter_getx_design_pattern/app/moduls/post/post_controller.dart';
import '../../cores/models/post/Content.dart';

class UpdatePostView extends StatefulWidget {
  final Content post = Get.arguments;

  UpdatePostView({super.key});

  @override
  State<UpdatePostView> createState() => _UpdatePostViewState();
}

class _UpdatePostViewState extends State<UpdatePostView> {
  final controller = Get.find<PostController>();

  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController bodyController;
  late TextEditingController imageController;

  @override
  void initState() {
    super.initState();

    titleController = TextEditingController(text: widget.post.title ?? "");

    descriptionController = TextEditingController(
      text: widget.post.description ?? "",
    );

    bodyController = TextEditingController(text: widget.post.body ?? "");

    imageController = TextEditingController(text: widget.post.image ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Post"),
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: "Title"),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: "Description"),
            ),
            TextField(
              controller: bodyController,
              decoration: const InputDecoration(labelText: "Body"),
            ),
            TextField(
              controller: imageController,
              decoration: const InputDecoration(labelText: "Image"),
            ),
            ElevatedButton(
              onPressed: () async {
                Content post = Content();
                post.id = widget.post.id;
                post.title = titleController.text;
                post.description = descriptionController.text;
                post.body = bodyController.text;
                post.image = imageController.text;
                await controller.updatePost(widget.post.id!, post);
                Get.snackbar(
                  "Success",
                  "Post updated successfully",
                  backgroundColor: Colors.green,
                  colorText: Colors.white,
                );
                Get.back();
              },
              child: const Text("Update"),
            ),
          ],
        ),
      ),
    );
  }
}