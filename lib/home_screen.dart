import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/api/apis.dart';
import 'package:myapp/models/turf_model.dart';
import 'package:myapp/profile_screen.dart';
import 'package:myapp/turf_screen.dart';
import 'package:myapp/widget/turf_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  //  Turf turf;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = APIs.auth.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Turf It Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: const Color(0xff1DBE97),
          leading: IconButton(
              onPressed: () {
//                 if (user != null) {
//   // If the user is not null, navigate to the ProfileScreen with the user parameter
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (_) => SettingScreen(userId: APIs.auth.currentUser!.uid,),
    ),
  );
// } else {
//   // Handle the case when the user is null (e.g., show an error message or login screen)
// }
              },
              icon: const Icon(
                CupertinoIcons.person,
                color: Colors.white,
              ))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xff1DBE97),
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<List<Map<String, dynamic>>?>(
        stream: APIs.loadTurfsFromFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  final turfData = snapshot.data![index];
                  final turf = Turf.fromMap(
                      turfData); 

                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>TurfScreen(turf:turf,)));
                    },
                    child: TurfCard(turf: turf));
                });
          } else {
            return const Center(child:  Text('Empty data'));
          }
        },
      ),
    );
  }
}
