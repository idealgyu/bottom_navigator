import 'package:bottom_navagation/src/controller/root_controller.dart';
import 'package:bottom_navagation/src/page/detail_explore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Explore extends StatelessWidget {
  const Explore({Key? key}) : super(key: key);

  //Navigator에서 context를 사용하기 위해 context를 인자로 넘겨 받아야 한다.
  Widget _categoryMenu(BuildContext context) {
    return Wrap(
      children: [
        GestureDetector(
          //아래 Get.to 방식으로는 네비게이션 바를 유지할 수 없다.
          // onTap: ()=>Get.to(DetailFromExplorePage()),

          //아래처럼 원래 플러터 방식으로 처리해야 네비게이션 바를 유지할 수 있다.
          onTap: () {
            RootController.to.setCategory(true);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailFromExplorePage()));
          },

          child: Container(
            //width 언급 안했는데 왜 나타나는거지??
            //일단 마진 주석처리해도 가로로 꽉 차긴 함..
            margin: EdgeInsets.all(8),
            width: 100,
            height: 30,

            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        Container(
          //width 언급 안했는데 왜 나타나는거지??
          //일단 마진 주석처리해도 가로로 꽉 차긴 함..
          margin: EdgeInsets.all(8),
          width: 100,
          height: 30,

          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        Container(
          //width 언급 안했는데 왜 나타나는거지??
          //일단 마진 주석처리해도 가로로 꽉 차긴 함..
          margin: EdgeInsets.all(8),
          width: 100,
          height: 30,

          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        Container(
          //width 언급 안했는데 왜 나타나는거지??
          //일단 마진 주석처리해도 가로로 꽉 차긴 함..
          margin: EdgeInsets.all(8),
          width: 100,
          height: 30,

          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ],
    );
  }

  Widget _listMenu() {
    return Center(
        child: SingleChildScrollView(
      child: Column(
        children: List.generate(
            20,
            (index) => Container(
                  //width 언급 안했는데 왜 나타나는거지??
                  //일단 마진 주석처리해도 가로로 꽉 차긴 함..
                  margin: EdgeInsets.all(8),
                  height: 150,

                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                )),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Navigator에서 context가 필요하므로 여기에서 context를 넘겨준다.
        _categoryMenu(context),

        //오버플로우 발생 -> Expanded로 감싸서 영역을 지정해줘서 해결했다.
        Expanded(child: _listMenu())
      ],
    );
  }
}
