import 'package:agrofarm/utils/app_color.dart' show AppColors;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OtpLoginPage extends StatelessWidget {

  OtpLoginPage({
    super.key,
    required this.phone
  });
  String phone;

  @override
  Widget build(BuildContext context) {
    double screenheight=MediaQuery.of(context).size.height;
    double screenwidth=MediaQuery.of(context).size.width;
    return SafeArea(
      child: Stack(
        children: [
         Container(
           padding: EdgeInsets.only(bottom: 48),
           width: screenwidth,
           decoration: BoxDecoration(
             color: Colors.white
           ),

         ),
          Container(
            height: screenheight * 0.70,
            width: screenwidth,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40)
              )
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: const Icon(CupertinoIcons.back,color: AppColors.util,size: 28,),
                        onPressed: ()=>Navigator.pop(context),
                      ),
                    ],
                  ),
                  SizedBox(height: screenheight * 0.05,),
                  Padding(
                    padding: const EdgeInsets.only(left: 21,),
                    child: Container(
                      // height: 400,
                      // width: 900,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 0,left: 2),
                            child: RichText(
                                text: TextSpan(
                                    children: [
                                      const TextSpan(
                                        text: "Please Enter the OTP Sent To \n",
                                        style: TextStyle(
                                          fontFamily: "Raleway",
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '${phone} \n',
                                        style: const TextStyle(
                                            fontFamily: "Raleway",
                                            fontSize: 17,
                                            color: AppColors.util,
                                            height: 2.0,
                                          fontWeight: FontWeight.w600
                                        ),
                                      ),
                                      const TextSpan(
                                        text: "Didn't Recieved Yet ?",
                                        style: TextStyle(
                                          fontFamily: "Raleway",
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          height: 1.5
                                        )
                                      )
                                    ]
                                )
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
