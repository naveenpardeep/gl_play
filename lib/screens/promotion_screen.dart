import 'package:flutter/material.dart';

class PromotionScreen extends StatefulWidget {
  const PromotionScreen({Key? key}) : super(key: key);

  @override
  State<PromotionScreen> createState() => _PromotionScreenState();
}

class _PromotionScreenState extends State<PromotionScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Container(child: Text("Promotion"),));
  }
}
