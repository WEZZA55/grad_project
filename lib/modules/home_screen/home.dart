// ignore_for_file: missing_required_param, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:udemy_flutter/models/choose%20type%20of%20user/ChooseTypeOfUser.dart';
import 'package:udemy_flutter/modules/cubit/homecubit_cubit.dart';
import 'package:udemy_flutter/modules/cubit/homecubit_state.dart';
import 'package:udemy_flutter/shared/components/components.dart';
import 'dart:ui';

import '../../models/Service/service.dart';
import '../../models/payment/about_us.dart';
import '../../models/payment/contact_us.dart';

class home extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  bool ispassword = true;
  bool value = false;

  @override
  Widget build(BuildContext context) {
    var cubit = HomecubitCubit.get(context);
    Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (BuildContext context) => HomecubitCubit(),
      child: BlocConsumer<HomecubitCubit, HomecubitState>(
        listener: (context, state) {
          // if (state is Registersuccess) {
          //   if (state.model.status) {
          //     print(state.model.message);
          //     Navigator.pushReplacement(
          //         context, MaterialPageRoute(builder: (context) => Otp()));
          //   } else {
          //     print(state.model.message);
          //   }
          // }
        },
        builder: (context, state) {
          return Stack(children: [
            Container(
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/pics1.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Scaffold(
              drawer: Drawer(
                child: ListView(
                  // Important: Remove any padding from the ListView.
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    const DrawerHeader(
                      decoration: BoxDecoration(
                        //color: const Color(0xff003B75),
                        image: DecorationImage(
                            image: AssetImage('assets/images/intro.jpeg'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      leading: Icon(Icons.personal_injury_outlined),
                      title: Text("Account"),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(Icons.chat),
                      title: Text("About us"),
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => About_us()));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.contacts),
                      title: Text("Contact Us"),
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Contact_us()));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.logout),
                      title: Text("logout"),
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TypeOfUser()));
                      },
                    ),
                  ],
                ),
              ),
              extendBodyBehindAppBar: true,
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                iconTheme: IconThemeData(color: Colors.white),
                centerTitle: false,
                title: Text(
                  'S-PAY',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 190,
                      ),
                      Row(
                        children: [
                          ServicesButton(
                            image: 'assets/images/gas.png',
                            text: 'gas',
                          ),
                          Spacer(),
                          ServicesButton(
                            image: 'assets/images/water.png',
                            text: 'water',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          ServicesButton(
                            // image: 'assets/images/image (7).png',
                            image: 'assets/images/electric.png',
                            text: 'Electronic',
                          ),
                          Spacer(),
                          ServicesButton(
                            image: 'assets/images/phone.png',
                            text: 'phone',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          ServicesButton(
                            image: 'assets/images/image (10).png',
                            text: 'landing',
                          ),
                          Spacer(),
                          Container(
                            child: ServicesButton(
                              image: 'assets/images/image (9).png',
                              text: 'wifi',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Service_Screen()));
                          },
                          child: Text(
                            'Other Service',
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ]);
        },
      ),
    );
  }
}
