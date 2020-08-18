import 'dart:async';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/pages/home/home.dart';

class LaunchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LaunchPageState();
  }
}

class _LaunchPageState extends State<LaunchPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () => {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage()))
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        //backgroundColor:const Color(0xff2980b9),
        body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              height: size.height *0.4,
                              width: size.width *0.3,
                              child: SvgPicture.asset('images/logos/todo-logo.svg', fit: BoxFit.contain,),
                            ),
                            CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: new AlwaysStoppedAnimation(const Color(0xFF00BFA6)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
        ),
      ),
    );
  }
}
