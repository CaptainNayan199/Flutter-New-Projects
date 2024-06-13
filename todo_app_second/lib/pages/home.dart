import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:todo_app/service/database.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool today = true, tomorrow = false, NextWeek = false;
  bool suggest = false;

  Stream<QuerySnapshot>? todoStream;

  getontheload() async {
    todoStream = await DatabaseMethods().getAllTheWork(today
        ? "Today"
        : tomorrow
            ? "Tomorrow"
            : "Next Week");
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getontheload();
  }

  Widget allWork() {
    return StreamBuilder(
      stream: todoStream,
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(),
            ),
          );
        }

        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: snapshot.data!.docs.length,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            DocumentSnapshot ds = snapshot.data!.docs[index];
            return ListTile(
              leading: Checkbox(
                activeColor: const Color(0xFF279CFB),
                value: ds["Yes"],
                onChanged: (newValue) async {
                  await DatabaseMethods().updateIfTricked(
                    ds["Id"],
                    today
                        ? "Today"
                        : tomorrow
                            ? "Tomorrow"
                            : "Next Week",
                  );
                  setState(() {});
                },
              ),
              title: Text(
                ds["Work"],
                style: TextStyle(
                  fontSize: 17.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Color(0xFF008080)),
                onPressed: () async {
                  await DatabaseMethods().deleteWork(
                    ds["Id"],
                    today
                        ? "Today"
                        : tomorrow
                            ? "Tomorrow"
                            : "Next Week",
                  );
                  setState(() {}); // Ensure the UI updates after deletion
                },
              ),
            );
          },
        );
      },
    );
  }

  TextEditingController to_do_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openBox();
        },
        child: const Icon(
          Icons.add,
          color: Color(0xFF4E65FF),
          size: 25.0,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 50.0, left: 50.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFF4E65FF),
            Color(0xFF92EFFD),
            Color.fromARGB(255, 34, 236, 118)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "HELLO\nUJJWAL",
              style: TextStyle(
                fontSize: 35.0,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              "Good Morning",
              style: TextStyle(
                fontSize: 22.0,
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                today
                    ? Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 20.0),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 150, 235, 221),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: const Text(
                            "Today",
                            style: TextStyle(
                                fontSize: 17.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () async {
                          today = true;
                          tomorrow = false;
                          NextWeek = false;
                          await getontheload();
                        },
                        child: const Text(
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
                          padding: const EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 20.0),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 150, 235, 221),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: const Text(
                            "Tomorrow",
                            style: TextStyle(
                                fontSize: 17.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () async {
                          today = false;
                          tomorrow = true;
                          NextWeek = false;
                          await getontheload();
                        },
                        child: const Text(
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
                          padding: const EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 20.0),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 150, 235, 221),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: const Text(
                            "Next Week",
                            style: TextStyle(
                                fontSize: 17.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () async {
                          today = false;
                          tomorrow = false;
                          NextWeek = true;
                          await getontheload();
                        },
                        child: const Text(
                          "Next Week",
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(child: allWork()), // Ensure the ListView expands properly
          ],
        ),
      ),
    );
  }

  Future openBox() => showDialog(
    barrierColor: Colors.black54,
    context: context,
    builder: (builder) => AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.cancel,
                    size: 20.0,
                  ),
                ),
                const SizedBox(
                  height: 17.0,
                  width: 5.0,
                ),
                const Text(
                  "Add Your Work To-Do",
                  style: TextStyle(
                    color: Color(0xFF008080),
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            // const Text("Add text"),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black38, width: 3.0),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: to_do_controller,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "eg: turn of the gas 🔥 ",
                  hintStyle: TextStyle(fontSize: 15.0),
                  contentPadding: EdgeInsets.fromLTRB(30, 0, 0, 0)
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            GestureDetector(
              onTap: () async {
                String id = randomAlphaNumeric(10);
                Map<String, dynamic> userTodo = {
                  "Work": to_do_controller.text,
                  "Id": id,
                  "Yes": false,
                };
                if (today) {
                  await DatabaseMethods().addTodayWork(userTodo, id);
                } else if (tomorrow) {
                  await DatabaseMethods().addTomorrowWork(userTodo, id);
                } else if (NextWeek) {
                  await DatabaseMethods().addNextWeekWork(userTodo, id);
                } else {
                  // do nothing
                  // ignore: avoid_print
                  print("Nothing is done here");
                }
                to_do_controller.clear(); // Clear the text field
                Navigator.pop(context); // Close the dialog
              },
              child: Center(
                child: Container(
                  width: 110,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFF008080),
                  ),
                  child: const Center(
                    child: Text(
                      "Add",
                      style: TextStyle(color: Colors.white, fontSize: 15.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
