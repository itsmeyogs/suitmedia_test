import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_test/view/second_screen/second_screen.dart';

import '../../app_state.dart';
import '../widget/round_button.dart';
import '../widget/round_text_field.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  static const routeName="/first_screen";

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController palindromeController = TextEditingController();
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/background.png"), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(left: 32, right: 32),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "images/ic_photo.png",
                  width: 130,
                ),
                const SizedBox(
                  height: 50,
                ),
                RoundTextField(
                    controller: nameController,
                    hint: "Name",
                    keyboardType: TextInputType.name,
                    action: TextInputAction.done),
                const SizedBox(
                  height: 16,
                ),
                RoundTextField(
                    controller: palindromeController,
                    hint: "Palindrome",
                    keyboardType: TextInputType.text,
                    action: TextInputAction.done),
                const SizedBox(
                  height: 45,
                ),
                RoundButton(onPressed: (){
                  if(palindromeController.text.trim().isNotEmpty){
                    String text = palindromeController.text.trim();
                    String cleanedString = text.replaceAll(' ', '').toLowerCase();
                    String reversedString = cleanedString.split('').reversed.join('');

                    if(cleanedString==reversedString){
                      const snackBar = SnackBar(
                                content: Text("isPalindrome"),
                                duration: Duration(seconds: 1),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }else{
                      const snackBar = SnackBar(
                              content: Text("not Palindrome"),
                              duration: Duration(seconds: 1),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  }else{
                    const snackBar = SnackBar(
                      content: Text("Palindrome cannot be empty!"),
                      duration: Duration(seconds: 1),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }

                },label: "CHECK"),
                const SizedBox(
                  height: 5,
                ),
                RoundButton(onPressed: (){
                  if(nameController.text.trim().isNotEmpty){
                    context.read<AppState>().changeName(nameController.text.trim());
                    Navigator.of(context).pushNamed(SecondScreen.routeName);
                  }else{
                    const snackBar = SnackBar(
                      content: Text("Name cannot be empty!"),
                      duration: Duration(milliseconds:500),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                }, label: "NEXT")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
