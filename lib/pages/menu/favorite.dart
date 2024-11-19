import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/favorite_controller.dart';
import '../../widget/my_image_network.dart';
import '../../widget/my_text.dart';

class FavoritePage extends StatelessWidget {
  final FavoriteController taskController = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    taskController.loadTasks();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0C0C0C),
        title: MyText(text: 'Favorite', fontSize: 20, colors: Colors.yellowAccent),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Color(0xff0C0C0C),
      body: Column(
        children: [
          Expanded(child: Obx(() {
            return ListView.builder(
              itemCount: taskController.tasks.length,
              itemBuilder: (context, index) {
                final task = taskController.tasks[index];
                return ListTile(
                    leading: MyImageNetwork(imagePath: task.strBadge),
                    title: MyText(text: task.strTeam, fontSize: 16, colors: Colors.white),
                    subtitle: MyText(text: task.strStadium, fontSize: 12, colors: Colors.white),
                    trailing: Icon(Icons.delete),
                    onTap: () {
                      Get.defaultDialog(
                        title: 'Konfirmasi',
                        middleText: 'Apakah Anda yakin ingin menghapus ini?',
                        onConfirm: () {
                          taskController.deleteTask(task.id!);
                          Get.back();
                        },
                        textConfirm: 'Ya',
                        textCancel: 'Tidak',
                        backgroundColor: Colors.black,
                        confirmTextColor: Colors.black,
                        cancelTextColor: Colors.white,
                        buttonColor: Colors.yellow,
                        titleStyle: TextStyle(color: Colors.white),
                        middleTextStyle: TextStyle(color: Colors.white),
                      );
                    }
                );
              },
            );
          }))
        ],
      ),
    );
  }
}