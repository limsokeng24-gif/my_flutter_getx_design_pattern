import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter_getx_design_pattern/app/moduls/post/post_controller.dart';

import '../../cores/models/post/Content.dart';

class CreatePostView extends StatefulWidget {
  const CreatePostView({super.key});

  @override
  State<CreatePostView> createState() => _CreatePostViewState();
}

class _CreatePostViewState extends State<CreatePostView> {
  final PostController controller = Get.find<PostController>();

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final bodyController = TextEditingController();
  final imageController = TextEditingController();

  String selectedCategory = "1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Post"),
        backgroundColor: Colors.cyan,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            /// Title
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: "Title",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            /// Description
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: "Description",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            /// Body
            TextField(
              controller: bodyController,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: "Body",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            /// Image URL
            TextField(
              controller: imageController,
              decoration: const InputDecoration(
                labelText: "Image URL",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            /// Category
            DropdownButtonFormField<String>(
              value: selectedCategory,
              decoration: const InputDecoration(
                labelText: "Category",
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(
                  value: "1",
                  child: Text("Technology"),
                ),
                DropdownMenuItem(
                  value: "2",
                  child: Text("News"),
                ),
                DropdownMenuItem(
                  value: "3",
                  child: Text("Sport"),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  selectedCategory = value!;
                });
              },
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {

                  Content post = Content();

                  post.title = titleController.text;
                  post.description = descriptionController.text;
                  post.body = bodyController.text;
                  post.image = imageController.text;
                  post.status = "ACT";

                  await controller.createPost(post);

                  Get.snackbar(
                    "Success",
                    "Post created successfully",
                    backgroundColor: Colors.green,
                    colorText: Colors.white,
                  );

                  Get.back();
                },
                child: const Text("Save"),
              ),
            )
          ],
        ),
      ),
    );
  }
}