import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Home extends StatelessWidget {
  const Home({
    Key key,
    @required this.user
}) : super(key: key);
  final FirebaseUser user;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Hi ${user.email}'),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: Firestore.instance.collection('users').document(user.uid).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Text('Loading..');
            default:
              return checkRole(snapshot.data);
//              return Text(snapshot.data['cidade']);
          }
        },

      ),
    );
  }

  Center checkRole(DocumentSnapshot snapshot){
    if(snapshot.data['cidade'] == 'Brasília '){
      return brasiliensePage(snapshot);
    }else{
      return gringoPage(snapshot);
    }
  }

  Center brasiliensePage(DocumentSnapshot snapshot){
    return Center(child: Text(snapshot.data['cidade'] + '\nVc é Brasiliense'));
  }

  Center gringoPage(DocumentSnapshot snapshot){
    return Center(child: Text(snapshot.data['cidade'] + '\nVc é Gringo'));
  }
}
