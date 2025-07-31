import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.appZipList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(controller.appZipList[index].$id),
            );
          },
        ),
      ),
    );
  }
}
