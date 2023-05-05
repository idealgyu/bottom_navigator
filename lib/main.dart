import 'package:bottom_navagation/color_schemes.g.dart';
import 'package:bottom_navagation/src/controller/root_controller.dart';
import 'package:bottom_navagation/src/page/detail_home.dart';
import 'package:bottom_navagation/src/root.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async {



  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);


  runApp(const MyApp());
}

// const seedColor = Color(0xFF6750A4);
// const outPadding = 32.0;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      // 컨트롤러 바인딩
      initialBinding: BindingsBuilder((){
        Get.lazyPut(() => RootController());
      }),

      title: 'Flutter Demo',

      //Material 3 적용 코드!!!!!
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
      ),
      themeMode: ThemeMode.system, //시스템 설정을 따라간다!!

      // //아래는 코딩파파 코드
      // theme: ThemeData(
      //   useMaterial3: true,
      //   colorScheme: ColorScheme.fromSeed(seedColor: seedColor,
      //   brightness: Brightness.light),
      // ),
      // darkTheme: ThemeData(
      //   useMaterial3: true,
      //   colorScheme: ColorScheme.fromSeed(seedColor: seedColor,
      //       brightness: Brightness.dark),
      // ),
      // themeMode: ThemeMode.system, //시스템 설정을 따라간다!!


      home: Root(),

      getPages: [
        GetPage(name: '/detail', page:()=>DetailPage()),

      ],
    );
  }
}

