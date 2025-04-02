import 'package:agrofarm/utils/app_color.dart';
import 'package:flutter/material.dart';

import '../Views/login_page.dart';

class IntroWidget extends StatelessWidget {
  const IntroWidget({
    super.key,
    required this.color,
    required this.title,
    required this.image,
    required this.description,
    required this.skip,
    required this.ontab,
    required this.pagec
  });
  final int color;
  final String title;
  final String image;
  final String description;
  final bool skip;
  final VoidCallback ontab;
  final PageController pagec;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Color(color),
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 1.86,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.fill)),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            left: 0,
            child: Container(
              height: MediaQuery.of(context).size.height / 2.10,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(100))),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 45),
                child: Column(
                  children: [
                    SizedBox(
                      height: 62,
                    ),
                    Text(
                      title,
                      style: TextStyle(
                          fontFamily: 'RadioGrotesk',
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      description,
                      style: TextStyle(
                        fontFamily: 'RadioGrotesk',
                        fontSize: 18,
                        height: 1.5,
                        color: AppColors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: skip ?
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(onPressed: () {
                    pagec.animateToPage(2, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
                  }, 
                  child: Text(
                    "Skip Now",
                    style: TextStyle(
                      color: AppColors.black
                    ),
                    ),
                  ),
                  GestureDetector(
                    onTap: ontab,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color(color),
                        borderRadius: BorderRadius.circular(50)
                      ),
                      child: Icon(
                        Icons.arrow_circle_right,
                        color: Colors.white,
                        size: 42,
                      ),
                    ),
                  )
                ],
              )
              : SizedBox(
                height: 46,
                child: MaterialButton(
                  color: Color(color),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                  ),
                  onPressed: (){
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (BuildContext context)=>LoginPage())
                    );
                  },
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                      fontFamily: 'RadioGrotesk',
                      color: Colors.white
                    ),
                    ),
                  ),
              )
            ),
          )
        ],
      ),
    );
  }
}
