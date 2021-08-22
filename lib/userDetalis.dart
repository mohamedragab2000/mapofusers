import 'package:flutter/material.dart';
import 'package:userstask/utils.dart';
import 'package:userstask/mapScreen.dart';
import 'package:userstask/widgets/myCard.dart';

import 'models/usersModels.dart';

class UserDestails extends StatefulWidget {
  final User user;
  UserDestails(this.user);

  @override
  _UserDestailsState createState() => _UserDestailsState();
}

class _UserDestailsState extends State<UserDestails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            MyCard(
              content: '${widget.user.name}',
            ),
            InkWell(
                onTap: () {
                  launchURL('mailto:${widget.user.email}');
                },
                child: Text('Email: ${widget.user.email}')),
            SizedBox(
              height: 20,
            ),
            Divider(),
            InkWell(
                onTap: () {
                  launchURL('tel:${widget.user.phone}');
                },
                child: Text('Phone:${widget.user.phone}')),
            SizedBox(
              height: 20,
            ),
            Divider(),
            InkWell(
                onTap: () {
                  launchURL('https://${widget.user.website}');
                },
                child: Text('web :${widget.user.website}')),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MapSample(userLoaction: widget.user.address.geo,)),
                );
              },
              child: Text('go to map'),
            ),
          ],
        ),
      ),
    );
  }
}
