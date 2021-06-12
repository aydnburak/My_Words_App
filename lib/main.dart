import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_words_app/components/my_background.dart';
import 'package:my_words_app/constants/colors.dart';
import 'package:my_words_app/constants/thema.dart';
import 'package:my_words_app/controllers/my_page_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My English Words',
      theme: myThemaLight,
      home: LoadingView(),
    );
  }
}

class LoadingView extends StatelessWidget {
  LoadingView({Key? key});

  final MyPageController _pageController = Get.put(MyPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyBackGround(
        child: Obx(() => _pageController.page),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Obx(() {
      return ConvexAppBar(
        items: [
          TabItem(icon: Icons.add, title: 'Add'),
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
        style: TabStyle.react,
        backgroundColor: AppColors.purple,
        initialActiveIndex: _pageController.pageIndex,
        onTap: (int i) => _pageController.pageUpdate = i,
      );
    });
  }
}
