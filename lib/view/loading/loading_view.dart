import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_words_app/components/my_background.dart';
import 'package:my_words_app/constants/colors.dart';
import 'package:my_words_app/controllers/auth_controller.dart';
import 'package:my_words_app/controllers/my_page_controller.dart';
import 'package:my_words_app/controllers/words_controller.dart';
import 'package:my_words_app/view/login/login_view.dart';
import 'package:my_words_app/view/splash/splash_view.dart';

class LoadingView extends StatelessWidget {
  LoadingView({Key? key});

  final MyPageController _pageController = Get.put(MyPageController());
  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => _authController.isloading.value == false
        ? _authController.isUser.value == true
            ? _buildHome()
            : LoginView()
        : SplashView());
  }

  Scaffold _buildHome() {
    final WordsController _wordsController =
        Get.put(WordsController(userID: _authController.myUser!.userID));
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
