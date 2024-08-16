import 'package:animate_do/animate_do.dart';
import 'package:discovery/utils/constants.dart';
import 'package:discovery/utils/styles.dart';
import 'package:discovery/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../auth/presintation/views/login_or_register.dart';
import 'splash_model.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  Widget animation(
    int index,
    int delay,
    Widget child,
  ) {
    if (index == 1) {
      return FadeInDown(
        delay: Duration(milliseconds: delay),
        child: child,
      );
    }
    return FadeInUp(
      delay: Duration(milliseconds: delay),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: PageView.builder(
              controller: pageController,
              itemCount: listOfItems.length,
              onPageChanged: (newIndex) {
                setState(() {
                  currentIndex = newIndex;
                });
              },
              physics: const BouncingScrollPhysics(),
              itemBuilder: ((context, index) {
                return Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage(listOfItems[index].image),
                    fit: BoxFit.cover,
                  )),
                  child: SizedBox(
                    width: size.width,
                    height: size.height,
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(
                              top: 104,
                            ),
                            child: animation(
                              index,
                              300,
                              Text(
                                listOfItems[index].title,
                                textAlign: TextAlign.center,
                                style: Styles.textStyle40
                                    .copyWith(color: Colors.white),
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 20,
                          ),
                          child: animation(
                            index,
                            500,
                            Text(
                              listOfItems[index].subTitle,
                              textAlign: TextAlign.center,
                              style: Styles.textStyle18
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                        Spacer(),
                        SmoothPageIndicator(
                          controller: pageController,
                          count: listOfItems.length,
                          effect: ExpandingDotsEffect(
                              activeDotColor: Constants.kSecondColor),
                          onDotClicked: (newIndex) {
                            setState(() {
                              currentIndex = newIndex;
                              pageController.animateToPage(newIndex,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease);
                            });
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        currentIndex == 2
                            ? CustomButton(

                          backgroundColor: Constants.kSecondColor,
                          textColor: Colors.white,
                          text: 'Get Started',
                          width: 250,
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginOrRegister(),
                                ),
                                    (route) => false);
                          },
                        )
                            : CustomButton(
                          backgroundColor: Constants.kSecondColor,
                          textColor: Colors.white,
                          width: 250,
                          text: 'Skip',
                          onPressed: () {
                            setState(() {
                              pageController.animateToPage(2,
                                  duration: const Duration(milliseconds: 1000),
                                  curve: Curves.fastOutSlowIn);
                            });
                          },
                        ),
                        SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
