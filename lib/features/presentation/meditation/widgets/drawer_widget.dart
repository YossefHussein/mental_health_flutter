import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:mental_health_app/features/presentation/about_developer/page/about_developer.dart';
import 'package:mental_health_app/presentation/tech_used.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(0), bottomRight: Radius.circular(0)),
      ),
      child: ListView(
        children: [
          DrawerHeader(
            // to delete the padding of drawer header
            padding: EdgeInsets.zero,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      '${FirebaseAuth.instance.currentUser?.photoURL}'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: AutoSizeText(
                    '${FirebaseAuth.instance.currentUser?.email}',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: FirebaseAuth.instance.currentUser?.photoURL ==
                                  null
                              ? Colors.black
                              : Colors.white,
                        ),
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AboutDeveloper()));
            },
            title: GestureDetector(child: AutoSizeText('About Developer')),
          ),
          ListTile(
            title: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TechUsed()));
              },
              child: AutoSizeText('Tech Used To Make App'),
            ),
          ),
          ListTile(
            title: GestureDetector(
              onTap: () async {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: Text('Are You Sure Exit From Meditation',
                              style: Theme.of(context).textTheme.labelMedium,
                              textAlign: TextAlign.start),
                          content: Text(
                            'My sir ${FirebaseAuth.instance.currentUser?.displayName} You Exit From Meditation environment to help YOU for make good Meditation time, Pleas think again and take option from these option under this text section',
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(fontSize: 24),
                          ),
                          icon: Align(
                              alignment: Alignment.topLeft,
                              child: Icon(
                                Icons.cancel,
                                color: Colors.red,
                                size: 48,
                              )),
                          actions: [
                            TextButton(
                                onPressed: () async {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'cancel',
                                  style: TextStyle(color: Colors.red),
                                )),
                            TextButton(
                                onPressed: () async {
                                  await FirebaseAuth.instance.signOut();
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Logout',
                                  style: TextStyle(color: Colors.black),
                                ))
                          ],
                        ));
                // log out from app
              },
              child: AutoSizeText(
                'LogOut',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
