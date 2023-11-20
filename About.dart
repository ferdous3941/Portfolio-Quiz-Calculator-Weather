import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: About(),
    debugShowCheckedModeBanner: false,
  ));
}

//stless
class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("image/S_BG.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.only(top: 30.0, left: 30),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage("image/MY_PHOTO.jpg"),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Ferdous Hasan",
                        style: TextStyle(
                            fontSize: 28,
                            color: Color.fromARGB(255, 14, 13, 13),
                            fontFamily: "Roboto"),
                      ),
                      Text(
                        "Web & Apps Developer",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(179, 235, 6, 6),
                            fontFamily: "Robotor"),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.only(left: 30),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.school,
                          size: 30,
                          color: Color.fromARGB(255, 214, 7, 197),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          " Studing BSc in CSE at Daffodil",
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(179, 15, 15, 15),
                              fontFamily: "Robotor"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.note_add_rounded,
                          size: 30,
                          color: Color.fromARGB(255, 206, 4, 155),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "This is my own app which developed by Flutter.",
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(159, 14, 0, 14),
                              fontFamily: "Robotor"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_pin,
                          size: 30,
                          color: Color.fromARGB(255, 214, 4, 186),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Gaibandha, Rangpur",
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(179, 10, 10, 10),
                              fontFamily: "Robotor"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.email,
                          size: 30,
                          color: Color.fromARGB(255, 219, 7, 173),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "ferdoushasanfm@gmail.com",
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(179, 14, 13, 13),
                              fontFamily: "Robotor"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.phone,
                          size: 30,
                          color: Color.fromARGB(255, 199, 5, 173),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "01521-784292",
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(167, 10, 10, 10),
                              fontFamily: "Robotor"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "Meet Ferdous Hasan: An Exceptional Bangladeshi BSc Student in CSE. Ferdous Hasan is a remarkable BSc student of Daffodil International University in Computer Science and Engineering (CSE) hailing from Bangladesh. His unwavering dedication, sharp intellect, and passion for CSE set her apart. Ferdous's exceptional academic performance, problem-solving skills, and collaborative nature make his a deserving candidate for recognition. With a commitment to personal growth and a drive to make a positive impact, Ferdous is poised to excel in her field and contribute meaningfully to society.",
                  style: TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 17, 17, 16),
                      fontFamily: "Robotor"),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Text(
                "Created By Ferdous Hasan",
                style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 12, 6, 0),
                    fontFamily: "Robotor"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
