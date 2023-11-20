import 'package:flutter/material.dart';

class Experiences extends StatelessWidget {
  const Experiences({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Experiences"),
        backgroundColor: Color.fromARGB(255, 3, 240, 42),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("image/S_BG.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildExperienceTile(
                company: "Telegram Company",
                icon: Icons.work,
                role: "Software Engineer",
                years: "2017 - 2018",
                about:
                    "Telegram is the most popular instant messaging application in parts of Europe, Asia, and Africa. As of August 2023, Telegram has more than 800 million monthly active users, with India leading in the number of users.",
              ),
              _buildExperienceTile(
                company: "IT America Solutions",
                icon: Icons.work,
                role: "Android Developer",
                years: "2018 - 2019",
                about:
                    "IT America Solutions is a software development firm known for its Android app development expertise.",
              ),
              _buildExperienceTile(
                company: "Microsoft Company",
                icon: Icons.work,
                role: "Junior Developer",
                years: "2020-Still Workking",
                about:
                    "Microsoft Corporation is an American multinational technology corporation headquartered in Redmond, Washington. Microsoft's best-known software products are the Windows line of operating systems, the Microsoft 365 suite of productivity applications, and the Edge web browser.",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExperienceTile({
    required String company,
    required IconData icon,
    required String role,
    required String years,
    required String about,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 8),
      leading: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 250, 4, 229), // Change the color to teal
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: Color.fromARGB(255, 231, 223, 223),
        ),
      ),
      title: Text(
        company,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 241, 4, 4),
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(role,
              style:
                  TextStyle(fontSize: 18, color: Color.fromARGB(179, 0, 0, 0))),
          Text(
            years,
            style:
                TextStyle(fontSize: 16, color: Color.fromARGB(255, 199, 9, 9)),
          ),
          SizedBox(height: 8), // Add spacing between role/years and about
          Text(
            about,
            style:
                TextStyle(fontSize: 16, color: Color.fromARGB(255, 66, 11, 96)),
          ),
        ],
      ),
    );
  }
}
