import 'package:flutter/material.dart';
import 'package:flutter_project/Apps.dart';
import 'package:flutter_project/Skills.dart';
import 'package:flutter_project/Experiences.dart';
import 'package:flutter_project/About.dart';
import 'package:flutter_project/Certificates.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeActivity(),
      theme: ThemeData(
        primaryColor: Colors.black87,
        hintColor: Colors.black87,
        textTheme: const TextTheme(
          headline6: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          subtitle1: TextStyle(
            fontSize: 20,
            color: Colors.black87,
          ),
          subtitle2: TextStyle(
            fontSize: 18,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}

class HomeActivity extends StatelessWidget {
  const HomeActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5, // Changed the length to 5 for the five tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "My Portfolio",
            style: Theme.of(context).textTheme.headline6!,
          ),
          backgroundColor: Theme.of(context).primaryColor,
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                icon:
                    Icon(Icons.person, color: Color.fromARGB(255, 6, 245, 46)),
                text: 'About',
              ),
              Tab(
                icon: Icon(Icons.star, color: Color.fromARGB(255, 6, 236, 37)),
                text: 'Skills',
              ),
              Tab(
                icon: Icon(Icons.work, color: Color.fromARGB(255, 4, 241, 24)),
                text: 'Experiences',
              ),
              Tab(
                icon: Icon(Icons.apps_outage_outlined,
                    color: Color.fromARGB(255, 25, 245, 5)),
                text: 'Apps',
              ),
              Tab(
                icon: Icon(Icons.card_membership,
                    color: Color.fromARGB(255, 3, 243, 23)),
                text: 'Certificates',
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: Container(
            color: Colors.black54,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Colors.black54,
                  ),
                  child: UserAccountsDrawerHeader(
                    accountName: const Text(
                      "Ferdous Hasan",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 250, 246, 246),
                      ),
                    ),
                    accountEmail: const Text(
                      "hasan15-3941@diu.edu.bd",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 248, 246, 246),
                      ),
                    ),
                    currentAccountPicture: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        "image/image_me.jpg",
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(133, 5, 241, 17),
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Color.fromARGB(255, 35, 241, 8),
                  ),
                  title: Text(
                    'Home',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 18,
                    ),
                  ),
                  onTap: () {
                    // Add logic for Home onTap
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: Color.fromARGB(250, 7, 241, 7),
                  ),
                  title: Text(
                    'Settings',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  onTap: () {
                    // Add logic for Settings onTap
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Color.fromARGB(255, 3, 248, 36),
                  ),
                  title: Text(
                    'Gmail',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  onTap: () {
                    launch('https://mail.google.com/mail/u/0/#inbox');
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.facebook,
                    color: const Color.fromARGB(255, 100, 255, 100),
                  ),
                  title: Text(
                    'Facebook',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  onTap: () {
                    launch('https://www.facebook.com/ferdous3941');
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.account_tree_sharp,
                    color: Color.fromARGB(255, 11, 243, 3),
                  ),
                  title: Text(
                    'Github',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  onTap: () {
                    launch('https://github.com/ferdous3941');
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Color.fromARGB(255, 3, 245, 15),
                  ),
                  title: Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            About(),
            Skills(),
            Experiences(),
            Apps(),
            Certificates(),
          ],
        ),
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could not launch $url";
    }
  }
}
