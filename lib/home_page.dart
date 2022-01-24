import 'package:flutter/material.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static final String id = "home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _controller = PageController();
  int selectIndex = 0;

  loading() {
    Timer.periodic(Duration(seconds: 3), (timer) {
      selectIndex++;
      if (selectIndex == 5) {
        selectIndex = 0;
      }
      _controller.animateToPage(selectIndex,
          duration: Duration(milliseconds: 2800), curve: Curves.ease);
    });
  }

  @override
  void initState() {
    super.initState();
    loading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 200,
        flexibleSpace: Stack(
          children: [
            PageView.builder(
                itemCount: 5,
                controller: _controller,
                itemBuilder: (context, index) {
                  return Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                                'assets/images/ic_hotel${selectIndex}.jpg'))),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.centerRight,
                            colors: [
                              Colors.black.withOpacity(0.6),
                              Colors.black.withOpacity(0.5),
                              Colors.black.withOpacity(0.5),
                              Colors.black.withOpacity(0.5),
                              Colors.black.withOpacity(0.6),
                            ]),
                      ),
                    ),
                  );
                }),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    // color: Colors.yellowAccent,
                    height: 140,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "What kind of hotel you \n need?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: TextField(
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                hintText: "Search for hotels",
                                hintStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.5)),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                contentPadding: EdgeInsets.all(15),
                                border: InputBorder.none),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Best Hotels",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              // Grid widget
              SizedBox(
                height: 220,
                child: buildGridViewHotel(4),
              ),

              SizedBox(
                height: 15,
              ),
              Text(
                "Luxury Hotels",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              // widget grid
              SizedBox(
                height: 220,
                child: buildGridViewHotel(5),
              ),

              SizedBox(
                height: 15,
              ),
              Text(
                "Cheap Hotels",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 220,
                child: buildGridViewHotel(3),
              ),
            ],
          ),
        ),
      ),
    );
  }

  GridView buildGridViewHotel(int imageIndex) {
    return GridView.builder(
      scrollDirection: Axis.horizontal,
      // padding: EdgeInsets.symmetric(horizontal: 20),
      itemCount: 25,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.7,
        mainAxisSpacing: 20,
        crossAxisCount: 1,
      ),
      itemBuilder: (BuildContext context, int index) {
        return GridTile(
            footer: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridTileBar(
                leading: Text(
                  "Hotel ${index + 1}",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                          "assets/images/ic_hotel${(index + 4) % imageIndex}.jpg"))),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.centerRight,
                      colors: [
                        Colors.black.withOpacity(0.4),
                        Colors.black.withOpacity(0.3),
                        Colors.black.withOpacity(0.2),
                        Colors.black.withOpacity(0.3),
                        Colors.black.withOpacity(0.4),
                      ]),
                ),
              ),
            ));
      },
    );
  }
}
