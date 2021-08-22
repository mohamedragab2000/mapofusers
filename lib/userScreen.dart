import 'package:flutter/material.dart';
import 'package:userstask/userDetalis.dart';
import 'package:userstask/utils.dart';
import 'package:userstask/widgets/myCard.dart';



import 'api/userApi.dart';
import 'models/usersModels.dart';

class userScreen extends StatefulWidget {
  @override
  _userScreenState createState() => _userScreenState();
}

class _userScreenState extends State<userScreen> {
  var users = <User>[];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadUsers();
  }

  Future<void> loadUsers() async {
    users.addAll(await getUsers());
    loading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Screen'),
      ),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (BuildContext context, index) {

                  return InkWell  (
                    onTap: (){
                      pushPage(context, UserDestails(users[index]));
                    },
                    child: MyCard(content: "${users[index].name}",
                    ),
                  );
                },
              ),
            ),
    );
  }
}
