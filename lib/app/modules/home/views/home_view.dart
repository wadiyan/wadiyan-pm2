import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myapp/app/controllers/auth_controller.dart';
import 'package:myapp/app/modules/mahasiswa/views/mahasiswa_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final cAuth = Get.find<AuthController>();

  HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return const DashboardAdmin();
  }
}

class DashboardAdmin extends StatefulWidget {
  const DashboardAdmin({super.key});

  @override
  State<DashboardAdmin> createState() => _DashboardAdminState();
}

class _DashboardAdminState extends State<DashboardAdmin> {
  final cAuth = Get.find<AuthController>();
  int _index = 0;
  final List<Map> _fragment = [
    {'title': 'Dashboard', 'view': MahasiswaView()},
    {'title': 'Data Mahasiswa', 'view': MahasiswaView()},
    {'title': 'Data Dosen', 'view': MahasiswaView()},
    {'title': 'Data Pegawai', 'view': MahasiswaView()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        titleSpacing: 0,
        title: Text(_fragment[_index]['title']),
      ),
      body: _fragment[_index]['view'],
    );
  }

  Widget drawer() {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 40, // ukuran foto
                  backgroundImage: NetworkImage(
                    'https://cdn.britannica.com/73/234573-050-8EE03E16/Cristiano-Ronaldo-ceremony-rename-airport-Santa-Cruz-Madeira-Portugal-March-29-2017.jpg',
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Ludfi Eric Fernando",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  'Admin',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              setState(() => _index = 0);
              Get.back();
            },
            leading: const Icon(Icons.dashboard),
            title: const Text('Dashboard'),
            trailing: const Icon(Icons.navigate_next),
            iconColor: Colors.blue,
            textColor: Colors.blue,
          ),
          ListTile(
            onTap: () {
              setState(() => _index = 1);
              Get.back();
            },
            leading: const Icon(Icons.people),
            title: const Text('Data Mahasiswa'),
            trailing: const Icon(Icons.navigate_next),
            iconColor: Colors.blue,
            textColor: Colors.blue,
          ),
          ListTile(
            onTap: () {
              setState(() => _index = 2);
              Get.back();
            },
            leading: const Icon(Icons.people),
            title: const Text('Data Dosen'),
            trailing: const Icon(Icons.navigate_next),
            iconColor: Colors.blue,
            textColor: Colors.blue,
          ),
          ListTile(
            onTap: () {
              setState(() => _index = 3);
              Get.back();
            },
            leading: const Icon(Icons.people),
            title: const Text('Data Pegawai'),
            trailing: const Icon(Icons.navigate_next),
            iconColor: Colors.blue,
            textColor: Colors.blue,
          ),
          ListTile(
            onTap: () {
              Get.back();
              cAuth.logout();
            },
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            trailing: const Icon(Icons.navigate_next),
            iconColor: Colors.blue,
            textColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
