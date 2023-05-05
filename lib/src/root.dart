import 'package:bottom_navagation/src/controller/root_controller.dart';
import 'package:bottom_navagation/src/page/explore.dart';
import 'package:bottom_navagation/src/page/setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'page/home.dart';

import 'package:bottom_navagation/color_schemes.g.dart';

class Root extends GetView<RootController> {
  Root({Key? key}) : super(key: key);



  @override

  Widget build(BuildContext context) {

    //뒤로가기 이벤트를 가로채는 WillPopScope
    //인덱스가 바뀌는걸 감지하기 위해 Obx로 전체를 감싸준다.
    return WillPopScope(
      onWillPop: ()=> controller.onWillPop(),

      child: Obx(()=>Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: controller.isCategoryOpen.value?Text('This is Sub'):Text('This is Up Level!!!'),
          leading: controller.isCategoryOpen.value?GestureDetector(
            onTap: (){
              controller.back();
            },
            child: const Icon(Icons.arrow_back_ios),
          ):Container(),
        ),
        body: IndexedStack(
          //페이지 변화 감지를 위한 변수를 컨트롤러에 선언하여 관리
          index: controller.rootPageIndex.value,

          children: [
            Home(),
            Navigator(
              //키를 사용하기 위해 여기에 키를 하나 등록해 준다. 일종의 색인 기능이라고 보면 될 듯....
              //이렇게 키를 등록해주면 하위에 있는 state에 접근할 수 있게 된다.
              key: controller.navKey,
              onGenerateRoute: (routesetting)=>MaterialPageRoute(builder: (context)=>Explore()),),
            Setting(),
          ],


        ),
        bottomNavigationBar: BottomNavigationBar(
          //인덱스 변수 모니터링
          currentIndex: controller.rootPageIndex.value,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          //탭이 변화되면 컨트롤러-메쏘드를 호출해 인덱스 변수 업데이트
          onTap: controller.changeIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home,  ),
              label: 'home',
              activeIcon: Icon(Icons.home,color: darkColorScheme.primary),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore, ),
              label: 'explore',
              activeIcon: Icon(Icons.explore,color: darkColorScheme.primary),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings, ),
              label: 'setting',
              activeIcon: Icon(Icons.settings, color: darkColorScheme.primary),
            ),
          ],
        ),
      ),),
    );
  }
}
