// ignore_for_file: unused_import

import 'package:conditional_builder/conditional_builder.dart';
import 'package:fl_toast/fl_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:udemy_flutter/models/Service/cubit/service_cubit.dart';
import 'package:udemy_flutter/models/Service/service.dart';
import 'package:udemy_flutter/modules/cubit/homecubit_cubit.dart';
import 'package:udemy_flutter/modules/cubit/homecubit_state.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = const Color(0xff003B75),
  bool isUpperCase = true,
  double radius = 11.0,
  @required Function function,
  @required String text,
}) =>
    Container(
      width: width,
      height: 50.0,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
    );
Widget defaultTextButton({
  @required Function function,
  @required String text,
  Color = Colors.white,
}) =>
    TextButton(
      onPressed: function,
      child: Text(''),
    );

Widget defaultFormField({
  @required TextEditingController controller,
  @required TextInputType type,
  Function onSubmit,
  Function onChange,
  Function onTap,
  int length,
  bool isPassword = false,
  @required Function validate,
  @required String label,
  @required IconData prefix,
  IconData suffix,
  Function suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      maxLength: length,
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        border: OutlineInputBorder(),
      ),
    );
Widget defuletGester({
  Function onTap,
  @required String text,
  @required image,
}) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image(image: image
            //     // height: 100,
            //     // width: 100,
            //     ),
            Text(
              '',
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
          ],
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 3),
          borderRadius: BorderRadius.circular(
            15.0,
          ),
        ),
        height: 140,
        width: 140,
      ),
    );

void toastShow({
  @required String text,
  @required ToastStates state,
  @required BuildContext context,
}) {
  showAndroidToast(
    child: Text(
      text,
      style: TextStyle(
        decoration: TextDecoration.none,
        fontSize: 15.0,
        color: Colors.green,
      ),
    ),
    duration: Duration(seconds: 2),
    backgroundColor: chooseColorToast(state),
    context: context,
  );
}

enum ToastStates { SUCSESS, ERROR, WARNING }

Color chooseColorToast(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCSESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
  }
  return color;
}

void _showToast(BuildContext context) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: const Text('Added to favorite'),
      action: SnackBarAction(
          label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}

void toaster() => Fluttertoast.showToast(
    msg: 'error', fontSize: 18, gravity: ToastGravity.BOTTOM);

class ServicesButton extends StatelessWidget {
  const ServicesButton({
    Key key,
    @required this.image,
    @required this.text,
  }) : super(key: key);

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: BlocProvider(
      create: (context) => ServiceCubit(),
      child: BlocConsumer<ServiceCubit, ServiceState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ServiceCubit.get(context);
          return InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Service_Screen()));
              // cubit.changeindexscreen(text);
              cubit.changeindexscreen(text);
            },
            child: Stack(
              children: [
                Container(
                  width: 135,
                  height: 135,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.5),
                  child: Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromRGBO(30, 36, 110, 1),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: Image(
                          image: AssetImage(
                            image,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      // const SizedBox(height: 5),
                      Text(
                        text,
                        style: const TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    ));
    // curve: Curves.fastOutSlowIn,
    // tween: Tween<double>(begin: 0, end: 1),
    // duration: const Duration(seconds: 4),
    // builder: (context, double _val, Widget child) {
    //   return Opacity(
    //     opacity: _val,
    //     child: Padding(
    //       padding: EdgeInsets.only(top: _val * 4),
    //       child: child,
    //     ),
    //   );
    // });
  }
}
