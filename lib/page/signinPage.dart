import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_recipe/pallete.dart';
import 'package:food_recipe/widget/button_widget.dart';
import 'package:food_recipe/widget/subtitle_widget.dart';
import 'package:food_recipe/widget/title_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _textBannerBuilder(context),
                    SizedBox(
                      height: 10,
                    ),
                    _mailInput(),
                    _passwordInput(),
                    _forgotPassword(),
                    ButtonWidget(
                      text: "Login",
                      onClicked: () {
                        Navigator.pushNamed(context, '/home');
                      },
                      color: primary,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: SubtitleWidget(text: "Or Continue with"),
                      ),
                    ),
                    _googleLogin(context),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have any account?",
                              style: GoogleFonts.inter(
                                  fontSize: 14,
                                  color: iconDark,
                                  fontWeight: FontWeight.w500),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.only(left: 10),
                              ),
                              onPressed: () {},
                              child: Text(
                                "Sign UP",
                                style: GoogleFonts.inter(
                                    fontSize: 15,
                                    color: primary,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container _googleLogin(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 40.0,
      height: 50,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: red,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25))),
          onPressed: () {},
          //   Navigator.pushNamed(context, '/login');
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(
                  FontAwesomeIcons.google,
                  size: 20,
                ),
              ),
              Text(
                "Google",
                style: GoogleFonts.inter(fontWeight: FontWeight.bold),
              ),
            ],
          )),
    );
  }

  Padding _forgotPassword() {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0, bottom: 30),
      child: Container(
        alignment: Alignment.centerRight,
        child: TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
          ),
          onPressed: () {},
          child: Text(
            "Forgot password?",
            style: GoogleFonts.inter(
                fontSize: 15, color: iconDark, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  Padding _textBannerBuilder(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          children: [
            TitleWidget(text: "Welcome Back!"),
            SizedBox(
              height: 10,
            ),
            SubtitleWidget(text: "Please enter your account here"),
          ],
        ),
      ),
    );
  }

  Padding _mailInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border.all(color: Color(0xFF9FA5C0).withOpacity(0.5), width: 1.0),
          borderRadius: BorderRadius.circular(25),
        ),
        child: TextFormField(
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Icon(
                Icons.email_outlined,
                size: 20,
                color: iconDark,
              ),
            ),
            hintText: 'Email or phone number',
            hintStyle: GoogleFonts.inter(
                fontSize: 15, color: accent, fontWeight: FontWeight.w500),
          ),
          style: TextStyle(fontSize: 15, color: Colors.black, height: 1.5),
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
        ),
      ),
    );
  }

  Padding _passwordInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border.all(color: Color(0xFF9FA5C0).withOpacity(0.5), width: 1.0),
          borderRadius: BorderRadius.circular(25),
        ),
        child: TextFormField(
          obscureText: _isObscure,
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Icon(
                Icons.lock_outline_rounded,
                size: 20,
                color: iconDark,
              ),
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: IconButton(
                icon: Icon(
                  _isObscure ? Icons.visibility : Icons.visibility_off,
                  color: accent,
                ),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
              ),
            ),
            hintText: 'Password',
            hintStyle: GoogleFonts.inter(
                fontSize: 15, color: accent, fontWeight: FontWeight.w500),
          ),
          style: TextStyle(fontSize: 15, color: Colors.black, height: 1.5),
          keyboardType: TextInputType.text,
        ),
      ),
    );
  }
}
