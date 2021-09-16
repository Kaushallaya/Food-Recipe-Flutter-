import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_recipe/pallete.dart';
import 'package:food_recipe/widget/subtitle_widget.dart';
import 'package:food_recipe/widget/title_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [_detailHedder(context), _detailBoddy(context)],
        ),
      ),
    );
  }

  Container _detailBoddy(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(top: (MediaQuery.of(context).size.height * 0.5) - 50),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.6,
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50), topRight: Radius.circular(50))),
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: TitleWidget(
                  text: 'Cacao Maca Walnut Milk',
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                alignment: Alignment.topLeft,
                child: SubtitleWidget(
                  text: 'Food • >60 mins',
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1586083702768-190ae093d34d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=695&q=80'),
                        radius: 15,
                      ),
                      _detaiTitle('Elena Shelby'),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: IconButton(
                          alignment: Alignment.topRight,
                          icon: Center(
                            child: Icon(
                              Icons.favorite,
                              color: Colors.white.withOpacity(0.9),
                              size: 15,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      _detaiTitle('273 Likes')
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                height: 30,
                thickness: 1,
                indent: 5,
                endIndent: 5,
              ),
              _detaiTitle('Description'),
              Container(
                padding: EdgeInsets.only(top: 10, left: 10),
                alignment: Alignment.topLeft,
                child: Text(
                  'Your recipe has been uploaded, you can see it on your profile. Your recipe has been uploaded, you can see it on your',
                  style: GoogleFonts.inter(
                      fontSize: 15, color: accent, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                height: 30,
                thickness: 1,
                indent: 5,
                endIndent: 5,
              ),
              _detaiTitle('Ingredients'),
              _ingredientItem("4 Eggs"),
              _ingredientItem("1/2 butter"),
              _ingredientItem("300 ml Fresh Milks"),
              _ingredientItem("1/2 Spoon of salt"),
            ],
          ),
        ),
      ),
    );
  }

  Container _detailHedder(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/food_pic.jpg'),
              fit: BoxFit.cover)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(children: [
          InkWell(
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white30,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: IconButton(
                alignment: Alignment.topRight,
                icon: Center(
                  child: Icon(
                    Icons.keyboard_arrow_left,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
                onPressed: () {},
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
        ]),
      ),
    );
  }

  Container _detaiTitle(String title) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      alignment: Alignment.topLeft,
      child: Text(title,
          style: GoogleFonts.inter(
              fontWeight: FontWeight.w700, fontSize: 15, color: iconDark)),
    );
  }

  Widget _ingredientItem(String name) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                color: primary.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20.0)),
            child: IconButton(
              icon: Center(
                child: Icon(
                  FontAwesomeIcons.check,
                  color: primary,
                  size: 15,
                ),
              ),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              name,
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500, fontSize: 15, color: iconDark),
            ),
          )
        ],
      ),
    );
  }
}
