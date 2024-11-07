import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/mahasiswa_controller.dart';

class MahasiswaView extends GetView<MahasiswaController> {
  const MahasiswaView({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Object?>>(
        stream: Get.put(MahasiswaController()).StreamData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {}
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
