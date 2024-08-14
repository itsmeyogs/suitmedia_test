import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_test/app_state.dart';
import 'package:suitmedia_test/view/third_screen/third_screen.dart';

import '../widget/round_button.dart';

class SecondScreen extends StatelessWidget{
  const SecondScreen({super.key});

  static const routeName="/second_screen";

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Screen", style: TextStyle(fontWeight: FontWeight.w600),),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF554AF0),),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 0.5, color: Color(0xFFE2E3E4))
              )
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Welcome", style: TextStyle(fontSize: 12, fontStyle: FontStyle.normal,),),
            Text(appState.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
            const Spacer(),
            Center(
              child: Text(appState.selectedUser!=""? appState.selectedUser :"Selected User Name", style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),),
            ),
            const Spacer(),
            RoundButton(onPressed: () async{
              Navigator.pushNamed(context, ThirdScreen.routeName);
            }, label: "Choose a User")
          ],
        ),
      ),
    );
  }

}