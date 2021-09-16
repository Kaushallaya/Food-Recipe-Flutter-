import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_recipe/pallete.dart';
import 'package:food_recipe/widget/button_widget.dart';
import 'package:food_recipe/widget/subtitle_widget.dart';
import 'package:food_recipe/widget/title_widget.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 30),
                constraints: BoxConstraints.expand(height: 406),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/onbord.jpg'),
                        fit: BoxFit.cover)),
              ),
              txtBanner(),
              // eleButton(),
              SizedBox(
                height: 10,
              ),
              ButtonWidget(
                text: "Get Started",
                onClicked: () {
                  Navigator.pushNamed(context, '/login');
                },
                color: primary,
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding txtBanner() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        child: Column(
          children: [
            TitleWidget(text: "Start Cooking"),
            SizedBox(
              height: 15,
            ),
            SubtitleWidget(
                text: "Let's join our Community to cook better food!"),
          ],
        ),
      ),
    );
  }
}
