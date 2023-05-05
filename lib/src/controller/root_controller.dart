import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootController extends GetxController{

  //GetView 선언안된 곳에서도 접근할 수 있도록 선언해준다.
  static RootController get to => Get.find();

  RxInt rootPageIndex = 0.obs;

  RxBool isCategoryOpen = false.obs;

  //onWillPop에서 현재 상태를 파악하기 위해 키를 하나 만들어 준다.
  GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  void changeIndex(int index){
    rootPageIndex(index);
  }

  //뒤로가기 눌러지면 호출되는 함수
  Future<bool> onWillPop() async{
    setCategory(false);
    return !await navKey.currentState!.maybePop();
  }

  //화면 깊이를 판별하는 bool 변수를 변경해주는 함수
  void setCategory(bool ck){
    isCategoryOpen(ck);
  }

  //leading에서 뒤로가기 눌러지면 호출되는 함수
  void back(){
    setCategory(false);
    onWillPop();
  }

}