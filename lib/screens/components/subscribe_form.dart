import 'package:flutter/material.dart';
import 'package:gl_play/styles/border_radius_button.dart';
import 'package:gl_play/styles/text_style.dart';

class SubscribeForm extends StatefulWidget {

  const SubscribeForm({Key? key}) : super(key: key);

  @override
  State<SubscribeForm> createState() => _SubscribeFormState();
}

class _SubscribeFormState extends State<SubscribeForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
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
                  offset: const Offset(0, 3),
                ),
              ],
              color: Colors.white
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "BE IN TOUCH WITH US",
                  style: AppTextStyle(context).title().copyWith(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Get 100% discount on the next order after you sign up.",
                  style: AppTextStyle(context).bigText().copyWith(color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10.0,),
                _inputField('Name',"ex: Mohammad Fadil", _nameController),
                _inputField('Email',"ex: Fadil@gmail.com", _emailController),
                RichText(
                  text: TextSpan(
                      text: "By clicking on the \"Subscribe\" button, I have taken knowledge of and agree to the ",
                      style: AppTextStyle(context).bigText().copyWith(color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: "Privacy Policy ",
                          style: AppTextStyle(context).bigText().copyWith(color: Colors.red),
                        ),
                        TextSpan(
                          text: "and ",
                          style: AppTextStyle(context).bigText().copyWith(color: Colors.black),
                        ),
                        TextSpan(
                          text: "Term of use",
                          style: AppTextStyle(context).bigText().copyWith(color: Colors.red),
                        ),
                        TextSpan(
                          text: ".", style: AppTextStyle(context).bigText().copyWith(color: Colors.black),
                        ),
                      ]
                  ),
                ),
                const SizedBox(height: 20.0,),
                const BorderRadiusButton(label: 'SUBSCRIBE', labelColor: Colors.white, buttonColor: Colors.red),
                const SizedBox(height: 20.0,),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _inputField(String label,String hintText, TextEditingController controller) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
                text: label,
                style: AppTextStyle(context).bigText().copyWith(fontWeight: FontWeight.w700, color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                    text: " *",
                    style: AppTextStyle(context).bigText().copyWith(
                        fontWeight: FontWeight.w700,color: Colors.red
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
                    hintText: hintText, hintStyle: AppTextStyle(context).header4().copyWith(color: Colors.black26)
                ),
              ),
            ),
          )
        ],
      ),
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
}
