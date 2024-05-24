import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybookapp/screens/homepage/bloc/homescreen_bloc.dart';
import 'package:mybookapp/screens/productdetails/proddetails.dart';
import 'package:mybookapp/utils/mediaqueries.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

HomescreenBloc homeblc = HomescreenBloc();

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeblc,
      child: Scaffold(
        body: BlocListener<HomescreenBloc, HomeScreenState>(
          listener: (context, state) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetails(),));
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: ScreenQuery.screenHeight(context) * 0.35,
                      width: ScreenQuery.screenWidth(context) * .99,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/AppBar1.jpg"),
                          fit: BoxFit.scaleDown,
                        ),
                        border: Border(
                          top: BorderSide.none,
                          bottom: BorderSide(style: BorderStyle.solid),
                        ),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.elliptical(90, 30),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          AppBar(
                            forceMaterialTransparency: true,
                            automaticallyImplyLeading: false,
                            title: Text(
                              "AppBar",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: ScreenQuery.screenHeight(context) * .35,
                      width: ScreenQuery.screenWidth(context) * 0.99,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade300.withOpacity(0.2),
                        border: Border(
                          top: BorderSide.none,
                          bottom: BorderSide(style: BorderStyle.solid),
                        ),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.elliptical(90, 60),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              prefixIconColor: Colors.green,
                              labelText: "Search",
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.green, width: 2)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.green, width: 2)),
                            ),
                          ),
                        ),
                        Text("Categories"),
                        SizedBox(
                          height: ScreenQuery.screenHeight(context) *
                              0.15, // Specify a fixed height for the ListView
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 8,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: AssetImage(
                                        'assets/icons/Chategories/Sports.webp',
                                      ),
                                      radius:
                                          ScreenQuery.screenHeight(context) *
                                              0.05,
                                    ),
                                    Text("Sports")
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: ScreenQuery.screenWidth(context) * 0.02,
                      mainAxisSpacing: ScreenQuery.screenHeight(context) * 0.01,
                      mainAxisExtent: ScreenQuery.screenHeight(context) * 0.3,
                    ),
                    itemCount: 5,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          homeblc.add(ItemButtonclickEvent());
                        },
                        child: Stack(
                          children: [
                            Container(
                              width: ScreenQuery.screenWidth(context) * .45,
                              color: Colors.blueGrey.shade900,
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        height:
                                            ScreenQuery.screenHeight(context) *
                                                0.2,
                                        width:
                                            ScreenQuery.screenWidth(context) *
                                                0.47,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image:
                                                    AssetImage("assets/hp.jpg"),
                                                fit: BoxFit.cover)),
                                      ),
                                      Positioned(
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.list),
                                          color: Colors.red,
                                        ),
                                        top: ScreenQuery.screenHeight(context) *
                                            0.0089,
                                        right:
                                            ScreenQuery.screenWidth(context) *
                                                0.01,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                              child: Text("Name of the book"),
                              bottom: ScreenQuery.screenHeight(context) * 0.07,
                            ),
                            Positioned(
                              child: Text(r"100$"),
                              bottom: ScreenQuery.screenHeight(context) * 0.01,
                              right: ScreenQuery.screenWidth(context) * 0.07,
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
