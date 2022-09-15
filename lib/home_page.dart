import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gl_play/screens/happenings_carousel.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: CustomScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.white,
              expandedHeight: 400,
              floating: false,
              stretch: true,
              flexibleSpace: FlexibleSpaceBar(
                // collapseMode: CollapseMode.parallax,
                // titlePadding: EdgeInsets.only(bottom: 64),
                // centerTitle: true,
                background: Image.asset(
                  'assets/images/banner.png',
                  fit: BoxFit.cover,
                ),
                // stretchModes: const [
                //   StretchMode.blurBackground,
                //   StretchMode.zoomBackground
                // ],
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "PLAN YOUR IDEAL DAY",
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Select Your Preference Activities to Personalize Your Experience",
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    _preferenceActivitiesPlaceHolder(),
                    _preferenceActivitiesPlaceHolder(),
                    _preferenceActivitiesPlaceHolder(),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Builder(
                builder: (context){
                  return CarouselSlider(
                      items: [
                        _longWaterCard(),
                        _longWaterCard2(),
                      ],
                      options: CarouselOptions(
                        height: MediaQuery.of(context).size.height,
                        viewportFraction: 1.0,
                        enlargeCenterPage: false, enableInfiniteScroll: false
                        // autoPlay: false,
                      )
                  );
                },
              )
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "OUR PARKS & ATTRACTIONS",
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _circleLogo(Colors.red),
                        _circleLogo(Colors.blue),
                        _circleLogo(Colors.green),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _circleLogo(Colors.purple),
                        _circleLogo(Colors.yellow),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const HappeningsCarousel(),

            SliverToBoxAdapter(
              child: Container(
                color: Colors.black12,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "PLAN YOUR VISIT",
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _circleIcon(Colors.red),
                          _circleIcon(Colors.blue),
                          _circleIcon(Colors.green),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      "SHARE YOUR MEMORIES USING #GAMUDAPLAY",
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20.0,),
                  Column(
                    children: [
                      _hashtagImagesRow(Colors.red,Colors.blue,Colors.green),
                      _hashtagImagesRow(Colors.purple,Colors.yellow,Colors.orange),
                    ],
                  ),
                ],
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    color: Colors.white
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "BE IN TOUCH WITH US",
                          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold,color: Colors.red),
                          textAlign: TextAlign.center,
                        ),
                        const Text(
                          "Get 100% discount on the next order after you sign up.",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal,color: Colors.black54),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10.0,),
                        _inputField('Name',"ex: Mohammad Fadil", _nameController),
                        _inputField('Email',"ex: Fadil@gmail.com", _emailController),
                         RichText(
                          text: const TextSpan(
                              text: "By clicking on the \"Subscribe\" button, I have taken knowledge of and agree to the ",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(
                                  text: "Privacy Policy ",
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.normal,color: Colors.red
                                  ),
                                ),
                                TextSpan(
                                  text: "and ",
                                ),
                                TextSpan(
                                  text: "Term of use",
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.normal,color: Colors.red
                                  ),
                                ),
                                TextSpan(
                                  text: ".",
                                ),
                              ]
                          ),
                        ),
                        const SizedBox(height: 20.0,),
                        _buttonWithBorderRadius("SUBSCRIBE", Colors.white, Colors.red),
                        const SizedBox(height: 20.0,),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_activity), label: "Activities"),
            BottomNavigationBarItem(
                icon: Icon(Icons.landscape), label: "Attraction"),
            BottomNavigationBarItem(
                icon: Icon(Icons.percent), label: "Promotion"),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: "Notifications"),
            BottomNavigationBarItem(icon: Icon(Icons.more_horiz_outlined), label: "More"),
          ],
        ),
      ),
    );
  }



  Widget _inputField(String label,String hintText, TextEditingController controller) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
                text: label,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black),
                children: const <TextSpan>[
                  TextSpan(
                    text: " *",
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w700,color: Colors.red
                    ),
                  ),
                ]
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              color: Colors.black12
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText, hintStyle: TextStyle(color: Colors.black26, fontWeight: FontWeight.bold)
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _longWaterCard(){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.blue,
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              "WATER",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 120,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start ,
              children: [
                _rowCircleOfActivities(),
                _rowCircleOfActivities(),
                _rowCircleOfActivities(),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
            const Expanded(child: SizedBox(height: double.infinity,)),
            _buttonWithBorderRadius('MORE WATER',Colors.blue,Colors.white),
            const SizedBox(
              height: 20,
            ),
          ]),
    );
  }

  Widget _longWaterCard2(){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.green,
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              "WATER",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 120,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start ,
              children: [
                _rowCircleOfActivities(),
                _rowCircleOfActivities(),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
            const Expanded(child: SizedBox(height: double.infinity,)),
            _buttonWithBorderRadius('MORE WATER',Colors.lightGreen,Colors.white),
            const SizedBox(
              height: 20,
            ),
          ]),
    );
  }

  Widget _buttonWithBorderRadius(String label, Color labelColor, Color buttonColor) {
    return Container(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.07,
        right: MediaQuery.of(context).size.width * 0.07,
        top: MediaQuery.of(context).size.height * 0.015,
        bottom: MediaQuery.of(context).size.height * 0.015,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(38.0),
        color: buttonColor,
      ),
      child:  Text(
        label,
        style: TextStyle(
            fontSize: 18, color: labelColor, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _hashtagImagesRow(Color color1, Color color2, Color color3){
    return Row(
      children: [
        Container(
            color: color1,
            width: MediaQuery.of(context).size.width / 3,
            height: MediaQuery.of(context).size.height / 6,
            child: const Center(child: Text("Insert image here", textAlign: TextAlign.center,))
        ),
        Container(
            color: color2,
            width: MediaQuery.of(context).size.width / 3,
            height: MediaQuery.of(context).size.height / 6,
            child: const Center(child: Text("Insert image here", textAlign: TextAlign.center,))
        ),
        Container(
            color: color3,
            width: MediaQuery.of(context).size.width / 3,
            height: MediaQuery.of(context).size.height / 6,
            child: const Center(child: Text("Insert image here", textAlign: TextAlign.center,))
        )
      ],
    );
  }
  Widget _circleLogo(Color color){
    return Container(
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      width: MediaQuery.of(context).size.width / 4,
      height: MediaQuery.of(context).size.height / 8,
      child: const Center(child: Text("Insert logo here", textAlign: TextAlign.center,)),
    );
  }

  Widget _circleIcon(Color color){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          width: MediaQuery.of(context).size.width / 4,
          height: MediaQuery.of(context).size.height / 8,
          child: const Center(child: Text("Insert icon here", textAlign: TextAlign.center,)),
        ),
        const Text("something", style: TextStyle(color: Colors.red),)
      ],
    );
  }

  Widget _rowCircleOfActivities() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              width: MediaQuery.of(context).size.width / 3,
              height: MediaQuery.of(context).size.height / 5,
            ),
            const Text(
              "WATER",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white),
            )
          ],
        ),
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              width: MediaQuery.of(context).size.width / 3,
              height: MediaQuery.of(context).size.height / 5,
            ),
            const Text(
              "WATER",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white),
            )
          ],
        ),
      ],
    );
  }

  Widget _preferenceActivitiesPlaceHolder() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Placeholder(
                  fallbackWidth: MediaQuery.of(context).size.width / 4,
                  fallbackHeight: MediaQuery.of(context).size.height / 8),
              const Text(
                "WATER",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const Icon(
                Icons.check_circle_outline,
                size: 50,
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Placeholder(
                  fallbackWidth: MediaQuery.of(context).size.width / 4,
                  fallbackHeight: MediaQuery.of(context).size.height / 8),
              const Text(
                "WATER",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const Icon(
                Icons.check_circle_outline,
                size: 50,
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Placeholder(
                  fallbackWidth: MediaQuery.of(context).size.width / 4,
                  fallbackHeight: MediaQuery.of(context).size.height / 8),
              const Text(
                "WATER",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const Icon(
                Icons.check_circle_outline,
                size: 50,
              )
            ],
          ),
        ],
      ),
    );
  }
}
