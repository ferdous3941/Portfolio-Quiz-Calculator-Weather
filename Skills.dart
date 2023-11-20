import 'package:flutter/material.dart';

class Skills extends StatelessWidget {
  const Skills({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Skills"),
        backgroundColor: Color.fromARGB(255, 192, 8, 152),
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
              _buildSkillTile(Icons.code, "Languages: Python, C, Java, Dart"),
              _buildSkillTile(Icons.computer, "IDE: Web Devlopment"),
              _buildSkillTile(Icons.design_services, "UI Design: XML, Flutter"),
              _buildSkillTile(Icons.layers, "Architecture: Components"),
              _buildSkillTile(Icons.code, "Version Control: Git"),
              _buildSkillTile(Icons.api, "API Integration: Retrofit"),
              _buildSkillTile(Icons.bug_report, "Testing: Debugging"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSkillTile(IconData icon, String text) {
    return ListTile(
      leading: Icon(
        icon,
        color: Color.fromARGB(255, 150, 0, 0),
      ),
      title: Text(text,
          style:
              TextStyle(fontSize: 20, color: Color.fromARGB(134, 230, 6, 6))),
    );
  }
}
