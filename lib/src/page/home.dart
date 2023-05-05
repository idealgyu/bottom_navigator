import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(20, (index) =>
              GestureDetector(
                onTap: (){
                  Get.toNamed('/detail');
                },
                child: Container(
            //width 언급 안했는데 왜 나타나는거지??
            //일단 마진 주석처리해도 가로로 꽉 차긴 함..
            margin: EdgeInsets.all(8),
            height: 150,

            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(5),
            ),

          ),
              )),
        ),
      )
    );
  }
}

