import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_words_app/view/add/add_view.dart';
import 'package:my_words_app/view/home/home_view.dart';
import 'package:my_words_app/view/profile/profile_view.dart';

class MyPageController extends GetxController {
  RxInt _page = 1.obs;

  Widget get page => _pages[_page.value];

  int get pageIndex => _page.value;

  List _pages = [AddView(), HomeView(), ProfilView()];

  set pageUpdate(int value) {
    _page.value = value;
  }
}
