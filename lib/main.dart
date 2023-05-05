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
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Root(),

      getPages: [
        GetPage(name: '/detail', page:()=>DetailPage()),

      ],
    );
  }
}

