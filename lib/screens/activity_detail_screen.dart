import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/acitivity.dart';

class ActivityDetailScreen extends StatefulWidget {
  final Activity activity;
  const ActivityDetailScreen({required this.activity, Key? key})
      : super(key: key);

  @override
  State<ActivityDetailScreen> createState() => _ActivityDetailScreenState();
}

class _ActivityDetailScreenState extends State<ActivityDetailScreen> {
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
                    tag: widget.activity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset('assets/images/confused_cat.jpeg'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.start,
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
                      Icon(Icons.star, color: Colors.yellow,size: 32,),
                      Text('5.0',style: TextStyle(fontSize: 28),),
                    ],
                  ),
                  Icon(Icons.share_outlined),
                  Icon(Icons.favorite_outline)
                ],
              ),
            ),
          )
        ],
      ),
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
        )
      ),
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
