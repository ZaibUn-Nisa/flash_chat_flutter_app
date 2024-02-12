import 'package:flash_chat_app/screens/login_screen.dart';
import 'package:flash_chat_app/screens/registration_screen.dart';
import 'package:flash_chat_app/widgets/rounded_buttons.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation? animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animation =
        CurvedAnimation(parent: animationController!, curve: Curves.decelerate);
    animationController!.forward();

    //   animationController!.forward();
    //   animationController!.addStatusListener((status) {
    //     if (status == AnimationStatus.completed) {
    //       animationController!.reverse(from: 1);
    //     } else if (status == AnimationStatus.dismissed) {
    //       animationController!.forward();
    //     }
    //   });
    animationController!.addListener(() {
      setState(() {});
      animation!.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  child: Image.asset('images/logo.png'),
                  height: animation!.value * 100,
                ),
                Container(
                  //width: 250.0,
                  child: DefaultTextStyle(
                    style: const TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.black),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText('Flash Chat'),
                      ],
                      onTap: () {
                        print("Tap Event");
                      },
                    ),
                  ),
                ),
                //const  Text(
                //   'Flash Chat',
                //   style: TextStyle(
                //     fontSize: 45.0,
                //     fontWeight: FontWeight.w900,
                //   ),
                // ]
                //),
                // ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            RoundedButton(
                myColor: Colors.lightBlueAccent,
                mybuttonText: 'log in',
                myButtonFunction: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                }),
            RoundedButton(
                myColor: Colors.blueAccent,
                mybuttonText: 'Register',
                myButtonFunction: () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                }),
          ],
        ),
      ),
    );
  }
}
