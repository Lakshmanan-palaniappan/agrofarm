import 'package:agrofarm/Screens/intro_widget.dart';
import 'package:flutter/material.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({super.key});

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  final PageController _pageController=PageController();

  void onNext(){
    if(_activepage<_pages.length){
      _pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.fastEaseInToSlowEaseOut);

    }

  }
  int _activepage=0;

  final List<Map<String,dynamic>> _pages=[
    {
      "color":0xff168E6A,
      "title":"Welcome to FarmEase",
      "image":"assets/images/farm1.png",
      "description":"Connecting farmers directly with buyers to ensure fair prices and fresh produce.",
      "skip":true


    },
    {
      "color": 0xffF1A94E,
      "title": "List and Negotiate",
      "image": "assets/images/farm2.png",
      "description": "Easily list your farm’s produce and negotiate prices with consumers and retailers.",
      "skip": true

    },
    {
      "color": 0xff3D9970,
      "title": "Get Started",
      "image": "assets/images/farm3.png",
      "description": "Start using FarmEase today to connect with buyers and showcase your fresh produce. It's simple and efficient!",
      "skip": false

    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _pages.length,
            onPageChanged: (int page){
              setState(() {
                _activepage=page;
              });
            },
            itemBuilder: (BuildContext context,int index){
              return IntroWidget(
                color: _pages[index]['color'], 
                title: _pages[index]['title'], 
                image: _pages[index]['image'], 
                description: _pages[index]['description'], 
                skip: _pages[index]['skip'], 
                ontab: onNext,
                pagec: _pageController,
                );

            },

          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 1.75,
            right: 0,
            left: 0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildIndicator()
                )
              ],
            ),
          )

        ],
      ),
    );
  }
  List<Widget> _buildIndicator() {
    final indicators =  <Widget>[];

    for(var i = 0; i < _pages.length; i++) {

      if(_activepage == i) {
        indicators.add(_indicatorsTrue());
      }else{
        indicators.add(_indicatorsFalse());
      }
    }
    return  indicators;
  }

  Widget _indicatorsTrue() {
    final int color;
    if(_activepage == 0){
      color = 0xff168E6A;
    } else  if(_activepage ==  1) {
      color = 0xffF1A94E;
    } else {
      color = 0xff168E6A;
    }

    return AnimatedContainer(
      duration: const Duration(microseconds: 300),
      height: 6,
      width: 42,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Color(color),
      ),
    );
  }

  Widget _indicatorsFalse() {
    return AnimatedContainer(
      duration: const Duration(microseconds: 300),
      height: 8,
      width: 8,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.grey.shade100,
      ),
    );
  }
}