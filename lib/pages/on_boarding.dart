import 'package:deliveryapp/animations/fade_animation.dart';
import 'package:deliveryapp/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  bool _textVisible = true;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(microseconds: 100));

    _animation =
        Tween<double>(begin: 1.0, end: 25.0).animate(_animationController);

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTap() {
    setState(() {
      _textVisible = false;
    });

    _animationController.forward().then(
          (f) => Navigator.push(
            context,
            PageTransition(type: PageTransitionType.fade, child: HomePage()),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/starter-image.jpg'),
            fit: BoxFit.cover),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.bottomCenter, colors: [
            Colors.black.withOpacity(.9),
            Colors.black.withOpacity(.8),
            Colors.black.withOpacity(.2),
          ]),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FadeAnimation(
                .5,
                Text('Taking Order For Faster Delivery',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 20,
              ),
              FadeAnimation(
                  1,
                  Text(
                    'See restaurant nearby',
                    style: TextStyle(
                      color: Colors.white,
                      height: 1.4,
                      fontSize: 20,
                    ),
                  )),
              SizedBox(
                height: 80,
              ),
              FadeAnimation(
                1.2,
                ScaleTransition(
                  scale: _animation,
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(colors: [
                          Colors.yellow,
                          Colors.orange,
                        ]),
                      ),
                      child: AnimatedOpacity(
                        opacity: _textVisible ? 1.0 : 0.0,
                        duration: Duration(
                          milliseconds: 50,
                        ),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          onPressed: () => _onTap(),
                          child: Text(
                            'Start Your Order',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              FadeAnimation(
                1.4,
                AnimatedOpacity(
                  opacity: _textVisible ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 50),
                  child: Align(
                    child: Text(
                      'Now deliver to your door 24/7',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
