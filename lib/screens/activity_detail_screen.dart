import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../model/acitivity.dart';

class ActivityDetailScreen extends StatefulWidget {
  final Activity activity;
  const ActivityDetailScreen({required this.activity, Key? key})
      : super(key: key);

  @override
  State<ActivityDetailScreen> createState() => _ActivityDetailScreenState();
}

class _ActivityDetailScreenState extends State<ActivityDetailScreen> {
  final List<Activity> recommendedActivities = [
    Activity(
        name: "Beach Pool Club",
        category: "WATER",
        excerpt:
            "A premier event and dining destination, guests are invited to escape the hustle.",
        description: '',
        price: 69.00),
    Activity(
        name: "D'Swim Academy",
        category: "WATER",
        excerpt:
            "DSA is proud to be the LARGEST and only GOLD LEVEL AUTISM Recognised Swim Centre in Malaysia.",
        description: '',
        price: 69.00),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _appBar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    transitionOnUserGestures: true,
                    tag: widget.activity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset('assets/images/confused_cat.jpeg'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.activity.category.toUpperCase(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.blue),
                          ),
                          Text(
                            widget.activity.name.toUpperCase(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      const Expanded(child: SizedBox()),
                      Icon(
                        Icons.star,
                        color: Colors.amberAccent,
                        size: 32,
                      ),
                      Text(
                        '5.0',
                        style: TextStyle(fontSize: 28),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.share_outlined),
                      Text('Share this'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.favorite_outline),
                      Text('Add to wishlist')
                    ],
                  ),
                  Text(widget.activity.description),
                  const Text(
                    'HIGHTLIGHTS',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        color: Colors.green,
                        size: 40,
                      ),
                      Expanded(
                          child: Text(
                        'Rainforest themed water play attraction that covers 1,000 sq ft of land',
                        overflow: TextOverflow.visible,
                      ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        color: Colors.green,
                        size: 40,
                      ),
                      Expanded(
                          child: Text(
                        'Rainforest themed water play attraction that covers 1,000 sq ft of land',
                        overflow: TextOverflow.visible,
                      ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        color: Colors.green,
                        size: 40,
                      ),
                      Expanded(
                          child: Text(
                        'Rainforest themed water play attraction that covers 1,000 sq ft of land',
                        overflow: TextOverflow.visible,
                      ))
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ExpansionPanelList(
                elevation: 2,
                children: [
                  ExpansionPanel(
                    headerBuilder: (context, isExpanded) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.article,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Ticket Rate'),
                        ],
                      );
                    },
                    body: Text('Hidden text to show'),
                    isExpanded: false,
                  ),
                  ExpansionPanel(
                    headerBuilder: (context, isExpanded) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.location_on,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Location'),
                        ],
                      );
                    },
                    body: Text('Hidden text to show'),
                    isExpanded: false,
                  ),
                  ExpansionPanel(
                    headerBuilder: (context, isExpanded) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.access_time_outlined,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Operation Hours'),
                        ],
                      );
                    },
                    body: Text('Hidden text to show'),
                    isExpanded: false,
                  ),
                  ExpansionPanel(
                    headerBuilder: (context, isExpanded) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.question_answer,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Enquiry'),
                        ],
                      );
                    },
                    body: Text('Hidden text to show'),
                    isExpanded: false,
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'REVIEWS',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '5.0',
                        style: TextStyle(fontSize: 42),
                      ),
                      RatingBar.builder(
                        itemSize: 36,
                        ignoreGestures: true,
                        initialRating: 5,
                        // minRating: 1,
                        direction: Axis.horizontal,
                        // allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          //print(rating);
                        },
                      ),
                      Text('69 reviews'),
                    ],
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("GALERY"),
                        Text("#GAMUDAPLAY"),
                      ],
                    ),
                    Expanded(
                        child: Image.asset(
                      'assets/images/confused_cat.jpeg',
                      fit: BoxFit.contain,
                    )),
                    Expanded(
                        child: Image.asset(
                      'assets/images/confused_cat.jpeg',
                      fit: BoxFit.contain,
                    )),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  _karenReview(),
                  _stevenReview(),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    child: Center(
                        child: Text(
                      'VIEW MORE',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    )),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ACTIVITIES YOU MAY INTERESTED',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.black),
                  ),
                  GridView.builder(
                    padding: EdgeInsets.zero,
                    //make this un-scrollable
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.55,
                            crossAxisSpacing: 20.0),
                    itemCount: recommendedActivities.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final activity = recommendedActivities[index];
                      return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ActivityDetailScreen(
                                    activity: activity)));
                          },
                          child: _recommendedActivityCard(activity));
                    })
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _imageAndPromotion(Activity activity) {
    return Stack(
      children: [
        Hero(
          transitionOnUserGestures: true,
          tag: activity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset('assets/images/confused_cat.jpeg'),
          ),
        ),
        Container(
          alignment: Alignment.topRight,
          child: activity.promotion != null
              ? Container(
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.red),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 2.0, horizontal: 4.0),
                    child: Text(
                      activity.promotion!.toUpperCase(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              : const SizedBox(),
        ),
      ],
    );
  }

  Widget _recommendedActivityCard(Activity activity) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _imageAndPromotion(activity),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              activity.category.toUpperCase(),
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.blue),
            ),
            Text(activity.name.toUpperCase(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black)),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Icon(
                  Icons.star,
                  color: Colors.amberAccent,
                  size: 20,
                ),
                Text(
                  '5.0',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _karenReview() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.black12),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Icon(
                    Icons.person,
                    size: 50,
                  ),
                )),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('KAREN'),
                RatingBar.builder(
                  itemSize: 24,
                  ignoreGestures: true,
                  initialRating: 1,
                  // minRating: 1,
                  direction: Axis.horizontal,
                  // allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.only(right: 2.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    //print(rating);
                  },
                ),
                Text('Not Recommended'),
              ],
            ),
          ],
        ),
        Text('31 FEB 2022'),
        Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.thumb_up_sharp), Text('HELPFUL')],
          ),
        ),
        Center(
          child: Text('69 People Found The Manager'),
        ),
        Divider(
          thickness: 0.5,
          color: Colors.black45,
        )
      ],
    );
  }

  Widget _stevenReview() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.black12),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Icon(
                    Icons.person,
                    size: 50,
                  ),
                )),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('STEVEN'),
                RatingBar.builder(
                  itemSize: 24,
                  ignoreGestures: true,
                  initialRating: 1,
                  // minRating: 1,
                  direction: Axis.horizontal,
                  // allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.only(right: 2.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    //print(rating);
                  },
                ),
                Text('Not Recommended'),
              ],
            ),
          ],
        ),
        Text('5 SEP 2022'),
        Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.thumb_up_sharp), Text('HELPFUL')],
          ),
        ),
        Center(
          child: Text('69 People Hate This Review'),
        ),
        Divider(
          thickness: 0.5,
          color: Colors.black45,
        )
      ],
    );
  }

  Widget _appBar() {
    return SliverAppBar(
      iconTheme: const IconThemeData(
        color: Colors.blueAccent, //change your color here
      ),
      title: PreferredSize(
          preferredSize: Size.fromHeight(24),
          child: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.fitWidth,
            height: 40,
            alignment: FractionalOffset.center,
          )),
      backgroundColor: Colors.white,
      //expandedHeight: 400,
      pinned: true,
      centerTitle: true,
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(10),
        child: Divider(
          height: 1,
          color: Colors.black54,
        ),
      ),
    );
  }
}
