import 'package:agrofarm/Views/OtpLoginPage.dart';
import 'package:agrofarm/utils/app_color.dart';
import 'package:agrofarm/utils/screen_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterUser extends StatefulWidget {
  const RegisterUser({super.key});

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordcontroller =
      TextEditingController();
  final TextEditingController roleController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  String? selectedrole;
  String mobilenum='';




  final List<String> roles = ['Farmer', 'Consumer', 'Dealer'];

  Future<void> registerUser() async {
    if (passwordController.text != confirmpasswordcontroller.text) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Passwords Doesn't Match")));
      return;
    }
    final String apiUrl = "http://10.201.4.53:5000/api/register";

    Map<String, String> body = {
      'name': nameController.text,
      'email': emailController.text,
      'password': passwordController.text,
      'role': selectedrole ?? '',
      'phone': phoneController.text,
      'address': addressController.text,
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );

      if (response.statusCode == 201) {
        final data = jsonDecode(response.body);
        print("User registered successfully: ${data['message']}");

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('User registered successfully')),
        );
        nameController.clear();
        emailController.clear();
        passwordController.clear();
        roleController.clear();
        phoneController.clear();
        addressController.clear();
      } else {
        print("Error: ${response.body}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registration failed')),
        );
      }
    } catch (error) {
      print("Error: $error");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(color: AppColors.primary),
            child: Padding(
                padding: const EdgeInsets.only(top: 60.0, left: 24.0),
                child: RichText(
                  text: const TextSpan(children: [
                    TextSpan(
                      text: " From Farm To Market \n In a Click",
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 30,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                        text: " \nSign Up Now !",
                        style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                            color: AppColors.util,
                            height: 1.4)),
                  ]),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height - 200,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 20.0, right: 18.0, left: 18.0),
                  child: Column(
                    children: <Widget>[
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Enter Name",
                          style: TextStyle(
                            //fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w700,
                              fontSize: 15
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.primary,
                            width: 2
                          ),
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextField(
                            style: const TextStyle(
                                fontFamily: 'Raleway'
                            ),
                            controller: nameController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Leo Das',
                              hintStyle: TextStyle(
                                color: AppColors.grey,
                                fontFamily: 'Raleway'
                              )
                            ),
                            keyboardType: TextInputType.name,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Enter Phone",
                          style: TextStyle(
                            //fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                              fontFamily: 'Raleway',
                            fontWeight: FontWeight.w700,
                            fontSize: 15
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.primary,
                                width: 2
                            ),
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextField(
                            onChanged: (String value){
                              if(value.length>9){
                                mobilenum=value;
                              }

                            },
                            style: const TextStyle(
                                fontFamily: 'Raleway'
                            ),
                            controller: phoneController,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: '1234567891',
                                hintStyle: TextStyle(
                                    color: AppColors.grey,
                                    fontFamily: 'Raleway'
                                ),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      DropdownButtonFormField<String>(
                        value: selectedrole,
                        hint: const Text(
                          "Select Category",
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.bold,
                            color: AppColors.grey,
                          ),
                        ),
                        items: roles.map((String role) {
                          return DropdownMenuItem<String>(
                            value: role,
                            child: Text(
                              role,
                              style: const TextStyle(
                                  fontFamily: 'Raleway', fontSize: 16),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedrole = value;
                          });
                        },
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 15.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                  color: AppColors.primary, width: 1.5),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    color: AppColors.primary, width: 1.5)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: AppColors.util)),
                            fillColor: Colors.white,
                            filled: true),
                        dropdownColor: Colors.white,
                        // Background color of the dropdown menu
                        icon: const Icon(Icons.arrow_drop_down,
                            color: AppColors.primary),
                        // Dropdown arrow color
                        style: const TextStyle(
                          fontFamily: 'Raleway',
                          color: AppColors.primary,
                          // Text color for selected item
                          fontSize: 16,
                        ),
                      ),


                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder: (BuildContext context)=>OtpLoginPage(phone: phoneController.text)));

                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.util,
                          ),
                          height: 50,
                          width: 150,
                          child: const Center(
                            child: Text(
                              "Register",
                              style: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.black),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Back To Login?",
                          style: TextStyle(
                              fontFamily: 'Raleway',
                              color: AppColors.primary,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
