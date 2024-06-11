// import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:random_string/random_string.dart";
import "package:todo_app/service/database.dart";
// import "package:flutter/widgets.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // ignore: non_constant_identifier_names
  bool today = true, tomorrow = false, NextWeek = false;
  bool suggest = false;
  TextEditingController to_do_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openBox();
        },
        child: Icon(
          Icons.add,
          color: Color(0xFF4E65FF),
          size: 25.0,
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0, left: 50.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFF4E65FF),
            Color(0xFF92EFFD),
            Color.fromARGB(255, 34, 236, 118)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "HELLO\nUJJWAL",
              style: TextStyle(
                fontSize: 35.0,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Good Morning",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.w100,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                today
                    ? Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 20.0),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 150, 235, 221),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Text(
                            "Today",
                            style: TextStyle(
                                fontSize: 17.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          today = true;
                          tomorrow = false;
                          NextWeek = false;
                          setState(() {});
                        },
                        child: Text(
                          "Today",
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                tomorrow
                    ? Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 20.0),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 150, 235, 221),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Text(
                            "Tomorrow",
                            style: TextStyle(
                                fontSize: 17.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          today = false;
                          tomorrow = true;
                          NextWeek = false;
                          setState(() {});
                        },
                        child: Text(
                          "Tomorrow",
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                NextWeek
                    ? Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 20.0),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 150, 235, 221),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Text(
                            "Next Week",
                            style: TextStyle(
                                fontSize: 17.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          today = false;
                          tomorrow = false;
                          NextWeek = true;
                          setState(() {});
                        },
                        child: Text(
                          "Next Week",
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            CheckboxListTile(
              activeColor: Color(0xFF279CFB),
              title: Text(
                "Go to campus",
                style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
              value: suggest,
              onChanged: (newValue) {
                setState(() {
                  suggest = newValue!;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            )
          ],
        ),
      ),
    );
  }

  Future openBox() => (showDialog(
        context: context,
        builder: (builder) => AlertDialog(
          content: SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.cancel,
                          size: 16.0,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                        width: 5.0,
                      ),
                      Text(
                        "Add the work to-do",
                        style: TextStyle(
                          color: Color(0xFF008080),
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text("Add text"),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black38, width: 3.0),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextField(
                        controller: to_do_controller,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "eg: buy vegetables",
                          hintStyle: TextStyle(fontSize: 15.0),
                        ),
                      )),
                  SizedBox(height: 20.0),
                  GestureDetector(
                    onTap: () {
                      String id = randomAlphaNumeric(10);
                      Map<String, dynamic> userTodo = {
                        "Work": to_do_controller.text,
                        "Id": id
                      };
                      if (today) {
                        DatabaseMethods().addTodayWork(userTodo, id);
                      } else if (tomorrow) {
                        DatabaseMethods().addTomorrowWork(userTodo, id);
                      } else if(NextWeek) {
                          DatabaseMethods().addNextWeekWork(userTodo, id);
                      }else{
                        // do nothing
                        // ignore: avoid_print
                        print("Nothing is done here");
                      }
                      Navigator.pop(context);
                    },
                    child: Center(
                      child: Container(
                        width: 100,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFF008080)),
                        child: Center(
                          child: Text(
                            "Add",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ));
}
