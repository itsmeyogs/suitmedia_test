import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_test/app_state.dart';
import 'package:suitmedia_test/model/user.dart';
import 'package:suitmedia_test/view_model/third_view_model.dart';

import '../widget/item_user.dart';

class ThirdScreen extends StatelessWidget{
  const ThirdScreen({super.key});

  static const routeName = "/third_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Third Screen", style: TextStyle(fontWeight: FontWeight.w600),),
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
      body: Consumer<ThirdViewModel>(builder: (context, viewModel, child){
        if(!viewModel.fetchingData && viewModel.data.isEmpty){
          Provider.of<ThirdViewModel>(context, listen: false).getData();
        }
        if(viewModel.fetchingData){
          return const Center(child: CircularProgressIndicator());
        }else{
          List<User> users = viewModel.data;
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index){
              final fullName = "${users[index].firstName} ${users[index].lastName}";
              return InkWell(
                onTap: (){
                  context.read<AppState>().setSelectedUser(fullName);
                  Navigator.of(context).pop();
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: ItemUser(fullName: fullName, email: users[index].email, imageUrl: users[index].avatar,),
                )
              );
            },
          );
        }
      },),

    );

  }

}