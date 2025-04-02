import 'package:agrofarm/Views/registration_screen.dart';
import 'package:agrofarm/utils/app_color.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  final TextEditingController nameController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();

  


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 40),
            //height: MediaQuery.of(context).size.height*0.25,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.75,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40)
                )
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0,right: 20.0,left: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 0,left: 24),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "You Have Been Missed !\n",
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w500,
                              fontSize: 29,
                              
                    
                            ),
                          ),
                          TextSpan(
                            text: "Welcome Back !",
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 34,
                              height: 1.4,
                              color: AppColors.util,
                              fontWeight: FontWeight.bold
                            )
                          )
                          
                          
                        ]
                      )
                      ),
                  ),
                  SizedBox(height: 30,),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      label: Text(
                        "Username Or E-mail",
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          color: Colors.white
                        ),
                        ),
                      
               
                    ),
              
                  ),
                  TextField(
                    controller: nameController,
                    obscureText: true,
                    decoration: InputDecoration(
                      label: Text(
                        "Password",

                        style: TextStyle(
                          fontFamily: 'Raleway',
                          color: Colors.white
                        ),
                        ),
                      
               
                    ),
              
                  ),
                  SizedBox(height: 30,),
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.util
                      ),
                      height: 50,
                      width: 150,
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            color: AppColors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                      Text(
                        "Not An User?",
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          color: AppColors.grey,
                          fontSize: 16
                        ),
                        ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context)=>RegisterUser()
                        )
                        );
                        },
                        child: Text(
                          "Register Now",
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            color: AppColors.util,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          ),
                          ),
                      ),
                    ],
                  )

                ],
                
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}