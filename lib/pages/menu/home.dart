import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/post_controller.dart';
import '../../widget/my_image_network.dart';
import '../../widget/my_text.dart';

class HomePage extends StatelessWidget {
  final PostController postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: MyText(
              text: 'Liga Inggris',
              fontSize: 20,
              colors: Colors.yellowAccent
          ),
          centerTitle: true,
          automaticallyImplyLeading: false
      ),
      backgroundColor: Color(0xff0C0C0C),
      body: Obx(() {
        if (postController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return Padding(
          padding: EdgeInsets.all(10.0),
          child: ListView.builder(
            itemCount: postController.postList.length,
            itemBuilder: (context, index) {
              final post = postController.postList[index];
              return GestureDetector(
                onLongPress: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Color(0xff0C0C0C),
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: 250,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: MyImageNetwork(imagePath: post.strBadge, width: 60, height: 60),
                                  ),
                                ),
                                SizedBox(width: 5),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyText(text: post.strTeam, fontSize: 16, colors: Colors.white),
                                    MyText(text: post.strStadium, fontSize: 12, colors: Colors.white)
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 10),
                            ListTile(
                              leading: Icon(Icons.favorite_border, color: Colors.white),
                              title: MyText(text: 'Add to Favorite', fontSize: 16, colors: Colors.white),
                              onTap: () {
                                postController.addTaskToFavorites(post);
                                Get.snackbar(
                                  'Berhasil ditambahkan ke favorit',
                                  'Added ${post.strTeam} to Favorite',
                                  backgroundColor: Colors.black,
                                  colorText: Colors.white,
                                  snackPosition: SnackPosition.TOP,
                                  duration: Duration(seconds: 2),
                                );
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.info_outline_rounded, color: Colors.white),
                              title: MyText(text: 'Detailed', fontSize: 16, colors: Colors.white),
                              onTap: () {
                                Get.snackbar(
                                  '${post.strTeam}',
                                  '',
                                  backgroundColor: Colors.black,
                                  colorText: Colors.white,
                                  messageText: MyText(text: '${post.strDescriptionEN}', fontSize: 12, colors: Colors.white),
                                  snackPosition: SnackPosition.TOP,
                                  duration: Duration(seconds: 5),
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Card(
                  elevation: 3,
                  color: Colors.black,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: MyImageNetwork( imagePath: post.strBadge, width: 60, height: 60),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText(text: post.strTeam, fontSize: 16, colors: Colors.white),
                              SizedBox(height: 4),
                              MyText(text: post.strStadium, fontSize: 14, colors: Colors.white)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}