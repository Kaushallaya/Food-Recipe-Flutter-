import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_recipe/model/users.dart';
import 'package:food_recipe/pallete.dart';
import 'package:food_recipe/widget/title_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currntTab = 0;
  late List<String> _choices;
  late int _choiceIndex;

  @override
  void initState() {
    super.initState();
    _choiceIndex = 0;
    _choices = ["All", "Food", "Drink"];
  }

  List<User> _user = [
    User(
        "Marry Stive",
        'https://images.unsplash.com/photo-1486074051793-e41332bf18fc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
        'assets/images/item_1.jpg',
        'Pancake'),
    User(
        "Karl Stafany",
        'https://images.unsplash.com/photo-1496203695688-3b8985780d6a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=641&q=80',
        'assets/images/item_2.jpg',
        'Salad'),
    User(
        "Androw Jacob",
        'https://images.unsplash.com/photo-1519058082700-08a0b56da9b4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
        'assets/images/item_3.jpg',
        'Frut Slash'),
    User(
        "Brayan Lara",
        'https://images.unsplash.com/photo-1586083702768-190ae093d34d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=695&q=80',
        'assets/images/item_4.jpg',
        'Chees Pan'),
    User(
        "Areca Androson",
        'https://images.unsplash.com/photo-1492106087820-71f1a00d2b11?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
        'assets/images/item_2.jpg',
        'Salad'),
    User(
        "Lusiyana Setry",
        'https://images.unsplash.com/photo-1485178575877-1a13bf489dfe?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=991&q=80',
        'assets/images/item_1.jpg',
        'Pancake'),
    User(
        "Ashmin Shadik",
        'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/President_Barack_Obama.jpg/480px-President_Barack_Obama.jpg',
        'assets/images/item_4.jpg',
        'Thosei'),
    User(
        "Snehash Cruse",
        'https://upload.wikimedia.org/wikipedia/commons/9/9b/Andrea_Appiani_Napoleon_K%C3%B6nig_von_Rom.jpg',
        'assets/images/item_3.jpg',
        'Cut Fruit'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              _searchBar(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                    height: 27,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TitleWidget(
                      text: "Category",
                    )),
              ),
              _buildChoiceChips(),
              SizedBox(
                height: 20,
              ),
              Divider(
                height: 30,
                thickness: 5,
                indent: 10,
                endIndent: 10,
              ),
              _tabcontroler(),
              _itemBody(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: primary,
          onPressed: () {},
          child: Icon(FontAwesomeIcons.expand),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _nevItem(0, "Home", Icons.home_rounded),
                    _nevItem(1, "Upload", Icons.edit_rounded)
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _nevItem(2, "Netification", Icons.notifications_rounded),
                    _nevItem(3, "Profile", Icons.person_rounded)
                  ],
                )
              ],
            ),
          ),
        ));
  }

  MaterialButton _nevItem(
    int navNum,
    String label,
    IconData icon,
  ) {
    return MaterialButton(
      minWidth: 40,
      onPressed: () {
        setState(() {
          currntTab = navNum;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: currntTab == navNum ? primary : darkgrey,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: currntTab == navNum ? primary : darkgrey,
            ),
          )
        ],
      ),
    );
  }

  Widget _itemBody() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10),
        child: buildItem(),
      ),
    );
  }

  Widget buildItem() {
    final double parentWidth = MediaQuery.of(context).size.width;
    final double parentHeigth = MediaQuery.of(context).size.height;
    return GridView.count(
      childAspectRatio: parentWidth / (parentHeigth * 0.82),
      crossAxisCount: 2,
      physics: BouncingScrollPhysics(),
      children: List.generate(8, (index) {
        return Container(
            height: 300,
            width: double.infinity,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/detail');
              },
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Row(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(_user[index].urlAvatar),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(11.0),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              _user[index].name,
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          height: (parentWidth * 0.85) / 2,
                          width: (parentWidth * 0.85) / 2,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(_user[index].urlItem),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(11.0),
                          ),
                          child:
                              Stack(alignment: Alignment.topRight, children: [
                            Container(
                              margin: EdgeInsets.only(top: 5, right: 5),
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(11.0),
                              ),
                              child: IconButton(
                                alignment: Alignment.topRight,
                                icon: Center(
                                  child: Icon(
                                    Icons.favorite_border,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                                onPressed: () {},
                              ),
                            )
                          ])),
                      ListTile(
                        title: Text(_user[index].food,
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                                color: iconDark)),
                        subtitle: Text("Food • >60 mins",
                            style: GoogleFonts.inter(
                                fontSize: 10, color: darkgrey)),
                      )
                    ],
                  ),
                ),
              ),
            ));
      }),
    );
  }

  Widget _tabcontroler() {
    //Doesn't use TabBar View - design has only left tab
    return Container(
      height: 40,
      child: DefaultTabController(
        initialIndex: 1,
        length: 2,
        child: TabBar(
          labelColor: iconDark,
          unselectedLabelColor: darkgrey,
          indicatorColor: primary,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 3,
          tabs: [
            Tab(
              text: "LEFT",
            ),
            Tab(
              text: "RIGHT",
            )
          ],
        ),
      ),
    );
  }

  Widget _buildChoiceChips() {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _choices.length,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Transform(
                transform: new Matrix4.identity()..scale(1.6),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 25),
                  child: ChoiceChip(
                    label: Text(_choices[index]),
                    selected: _choiceIndex == index,
                    selectedColor: primary,
                    onSelected: (bool selected) {
                      setState(() {
                        _choiceIndex = selected ? index : 0;
                      });
                    },
                    elevation: 0,
                    pressElevation: 0,
                    backgroundColor: darkgrey,
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                    labelPadding: EdgeInsets.symmetric(horizontal: 13),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _searchBar() {
    return Container(
      height: 50,
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: grey,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Search..',
                border: InputBorder.none,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Icon(
                    Icons.search,
                    size: 20,
                    color: iconDark,
                  ),
                ),
                isDense: true,
                contentPadding: EdgeInsets.all(0),
              ),
              textAlignVertical: TextAlignVertical.center,
            ),
          ),
        ],
      ),
    );
  }
}
