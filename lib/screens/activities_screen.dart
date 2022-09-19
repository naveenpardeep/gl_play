import 'package:flutter/material.dart';
import 'package:gl_play/model/acitivity.dart';
import 'components/subscribe_form.dart';

class ActivitiesScreen extends StatefulWidget {
  const ActivitiesScreen({Key? key}) : super(key: key);

  @override
  State<ActivitiesScreen> createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen> {
  final List<Activity> activities = [
    Activity(
        name: "Splashmania",
        category: "WATER",
        description: "Asia's Largest Raiforest Themed Water Park.",
        price: 69.00,
        promotion: "Buy 2 Free 1"
    ),
    Activity(
        name: "Big Bucket Splash",
        category: "WATER",
        description: "Calling young hearts to spend a day at BIG BUCKET SPLASH!",
        price: 69.00,
        promotion: "-69%"
    ),
    Activity(
        name: "Water Playscape",
        category: "WATER",
        description: "The perfect space for your little ones to cool off, located within The Buzz.ar",
        price: 69.00),
    Activity(
        name: "Beach Pool Club",
        category: "WATER",
        description: "A premier event and dining destination, guests are invited to escape the hustle.",
        price: 69.00),
    Activity(
        name: "D'Swim Academy",
        category: "WATER",
        description: "DSA is proud to be the LARGEST and only GOLD LEVEL AUTISM Recognised Swim Centre in Malaysia.",
        price: 69.00),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      slivers: <Widget>[
        _appBar(),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: GridView.builder(
                //make this un-scrollable
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.375,
                    crossAxisSpacing: 20.0),
                itemCount: activities.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _imageAndPromotion(activities[index].promotion ?? ''),
                          const SizedBox(height: 10.0,),
                          Text(activities[index].category.toUpperCase(),style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.blue),),
                          const SizedBox(height: 10.0,),
                          Text(activities[index].name.toUpperCase(),style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black)),
                          const SizedBox(height: 10.0,),
                          Text(activities[index].description,maxLines: 4,overflow: TextOverflow.ellipsis,),
                          const Expanded(child: SizedBox(height: double.infinity,)),
                          const Divider(
                            color: Colors.black54,
                            thickness: 0.5,
                          ),
                          const Text("NOW",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black)),
                          Text('RM${activities[index].price.toString()}',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 26,color: Colors.black),),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ),
        const SubscribeForm(),
      ],
    );
  }

  _appBar() {
    return SliverAppBar(
      // title: PreferredSize(
      //     preferredSize: Size.fromHeight(28),
      //     child: Image.asset('assets/images/logo.png', fit: BoxFit.fitWidth, height: 50, alignment: FractionalOffset.center,)
      // ),
      backgroundColor: Colors.white,
      expandedHeight: 400,
      floating: false,
      stretch: true,
      excludeHeaderSemantics: true,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        centerTitle: true,
        background: Image.asset(
          'assets/images/banner.png',
          fit: BoxFit.cover,
        ),
        stretchModes: const [
          StretchMode.blurBackground,
          StretchMode.zoomBackground,
          StretchMode.fadeTitle
        ],
      ),
    );
  }
  
  Widget _imageAndPromotion(String promotion){
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset('assets/images/confused_cat.jpeg'),
        ),
        Container(
          alignment: Alignment.topRight,
          child: promotion != '' ? Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.red
            ),
            child:  Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 4.0),
              child: Text( 
                promotion.toUpperCase(),
                style: const TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),),
            ),
          ) : const SizedBox(),
        ),
      ],
    );
  }
}
