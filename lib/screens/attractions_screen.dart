import 'package:flutter/material.dart';

class AttractionsScreen extends StatefulWidget {
  const AttractionsScreen({Key? key}) : super(key: key);

  @override
  State<AttractionsScreen> createState() => _AttractionsScreenState();
}

class _AttractionsScreenState extends State<AttractionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Container(child: Text("Attractions"),));
  }
}
