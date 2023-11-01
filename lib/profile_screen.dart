import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/api/apis.dart';
import 'package:myapp/models/user_model.dart';
import 'package:myapp/themes/theme.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key, required this.userId}) : super(key: key);
  final String userId;

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  late Stream<DocumentSnapshot<Map<String, dynamic>>> userStream;

  @override
  void initState() {
    super.initState();
    APIs.getSelfInfo();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: HashColorCodes.green,
        title: const Text(
          "Settings",
          style: TextStyle(
            fontFamily: 'Sarala',
            color: HashColorCodes.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: HashColorCodes.screenGrey,
      body: Center(
        child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          stream: APIs.getSelfInfo(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final userData = snapshot.data!.data() as Map<String, dynamic>;
              final user = TurfUser(
                  id: APIs.auth.currentUser!.uid,
                  name: userData['name'] ?? '',
                  email: userData['email'] ?? '');

              return Column(
                children: [
                  Container(
                    width: screenWidth,
                    height: 33,
                    decoration: const BoxDecoration(
                      color: HashColorCodes.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        children: [
                          const CircleAvatar(
                            radius: 65,
                            backgroundColor: Colors.blue,
                            child: Icon(
                              Icons.person,
                              color: HashColorCodes.white,
                              size: 110,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            user.name,
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            user.email,
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text("Error fetching user data: ${snapshot.error}");
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
