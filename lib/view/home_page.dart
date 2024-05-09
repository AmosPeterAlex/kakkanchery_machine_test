import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexteons_machine_test/controller/controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    final TestController controller = Get.put(TestController());
    controller.fetchData();

    return Scaffold(
      appBar: AppBar(title: Text("Nexteons Test"),),
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.testModel.value.data?.list?.length ?? 0,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(
                        controller.testModel.value.data?.list?[index].name ?? '',
                        style: TextStyle(fontSize: 20),
                      ),
                      subtitle: Text(
                        'UID: ${controller.testModel.value.data?.list?[index].uid}',
                        style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      trailing: _buildDocumentTypeIndicator(
                          controller.testModel.value.data?.list?[index].docType),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            controller.testModel.value.data?.list?[index].url ??
                                ''),
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildDocumentTypeIndicator(int? docType) {
    IconData iconData;
    Color color;
    switch (docType) {
      case 0:
        iconData = Icons.image;
        color = Colors.blue;
        break;
      case 1:
        iconData = Icons.video_label;
        color = Colors.red;
        break;
      case 2:
        iconData = Icons.audiotrack;
        color = Colors.green;
        break;
      case 3:
        iconData = Icons.description;
        color = Colors.orange;
        break;
      default:
        iconData = Icons.error;
        color = Colors.grey;
    }
    return Icon(
      iconData,
      color: color,
    );
  }
}
