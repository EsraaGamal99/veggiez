import 'package:flutter/material.dart';
import 'package:veggiez/shared/componentes/components.dart';
import 'package:veggiez/shared/network/local/cache_helper.dart';
import 'package:veggiez/style/colors.dart';
import '../login/login_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<BoardingModel> board = [
    BoardingModel(
      image: 'assets/images/Delv.png',
      title: 'Fast Delivery',
      body: 'Fast delivery Suitable for every palate Hand Picked',
    ),
    BoardingModel(
        image: 'assets/images/cook.png',
        title: 'Suitable for every palate',
        body:
            'Taste perfection for all! Our menu caters to diverse preferences, ensuring satisfaction for every taste bud.'),
    BoardingModel(
        image: 'assets/images/best for home.png',
        title: 'Hand Picked',
        body:
            'Handcrafted excellence! Each ingredient is carefully chosen, guaranteeing a dining experience that is meticulously curated.'),
  ];

  var boardController = PageController();
  bool isLast = false;

  void submit() {
    CacheHelper.saveData(
      key: 'onBoarding',
      value: true,
    ).then((value) {
      if (value) {
        navigateAndFinish(
          context,
          LoginScreen(),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              submit();
            },
            child: Text(
              'SKIP',
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            //Board
            Expanded(
              child: PageView.builder(
                itemBuilder: (context, index) => buildBoardItem(board[index]),
                physics: BouncingScrollPhysics(),
                itemCount: board.length,
                onPageChanged: (index) {
                  if (index == (board.length) - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                controller: boardController,
              ),
            ),

            defaultIndicator(
              controller: boardController,
              count: board.length,
            ),
            SizedBox(
              height: 15.0,
            ),
            defaultButton(
              onPressed: () {
                if (isLast == true) {
                  submit();
                } else {
                  boardController.nextPage(
                    duration: Duration(milliseconds: 750),
                    curve: Curves.fastOutSlowIn,
                  );
                }
              },
              text: 'next',
              textColor: defaultColor,
              backgroundColor: secondColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Container(
                height: 396.404,
                width: 747.12,
                //decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.0,),),
                // clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image(
                  image: AssetImage(
                    '${model.image}',
                  ),
                  fit: BoxFit.fill,
                  height: 396.404,
                  width: 747.12,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 54.0,
          ),
          Text(
            '${model.title}',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            '${model.body}',
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
        ],
      );
}

class BoardingModel {
  final String title;
  final String body;
  final String image;

  BoardingModel({
    required this.title,
    required this.body,
    required this.image,
  });
}
