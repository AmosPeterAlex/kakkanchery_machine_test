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
      appBar: AppBar(
        title: Text('Document List'),
      ),
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('UID')),
                  DataColumn(label: Text('Type')),
                  DataColumn(label: Text('Image')),
                ],
                rows: List.generate(
                  controller.testModel.value.data?.list?.length ?? 0,
                  (index) => DataRow(
                    cells: [
                      DataCell(Text(
                          controller.testModel.value.data?.list?[index].name ??
                              '')),
                      DataCell(Text(
                          '${controller.testModel.value.data?.list?[index].uid}')),
                      DataCell(_buildDocumentTypeIndicator(controller
                          .testModel.value.data?.list?[index].docType)),
                      DataCell(
                        SizedBox(
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(controller
                                    .testModel.value.data?.list?[index].url ??
                                ''),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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

/*
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TestController controller = Get.put(TestController());
    controller.fetchData();
    return Scaffold(
      body: Obx(
        () {
          return controller.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Center(
                child: DataTable(
                    columns: <DataColumn>[
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Name',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'UID',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'DocType',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Image',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                    ],
                    rows: <DataRow>[
                      for (int index = 0;
                          index <
                              (controller.testModel.value.data?.list?.length ??
                                  0);
                          index++)
                        DataRow(
                          cells: <DataCell>[
                            DataCell(
                                Text(
                                "${controller.testModel.value.data?.list?[index].name}")),
                            DataCell(Text(
                                "${controller.testModel.value.data?.list?[index].uid}")),
                            // DataCell(Text(
                            //     "${controller.testModel.value.data?.list?[index].uid}")),
                            DataCell(Text(checkDoc(controller , index))),
                            DataCell(
                              Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(controller.testModel.value
                                            .data?.list?[index].url
                                            .toString() ?? ""),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
              );
        },
      ),
    );
  }

  String checkDoc(TestController controller, int index) {
    if (controller.testModel.value.data?.list?[index].docType == 0) {
      return "image";
    } else if (controller.testModel.value.data?.list?[index].docType == 1) {
      return "video";
    } else if (controller.testModel.value.data?.list?[index].docType == 2) {
      return "audio";
    } else if (controller.testModel.value.data?.list?[index].docType == 3) {
      return "document";
    } else {
      return "null";
    }
  }
}


 */
