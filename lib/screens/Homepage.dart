import 'package:flutter/material.dart';
import 'package:flutter_todo_application_6/widgets/customWidgets/TaskType.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List tabs = ["Health", "Work", "Mental Health", "Others"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 20),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            // Creating title and date
            Row(
              children: [
                Text(
                  "Todo",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 5),
                Text(
                  "26 Dec",
                  style: TextStyle(fontSize: 30, color: Colors.grey),
                ),
              ],
            ),

            //Creating 4 tabs
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TaskType(
                          type: "Health",
                          count: 6,
                          icon: Icon(Icons.favorite),
                          iconColor: Colors.deepPurple,
                          colors: Colors.deepPurple.shade100,
                        ),
                        TaskType(
                          type: "Work",
                          count: 5,
                          icon: Icon(Icons.work, color: Colors.green),
                          colors: Colors.green.shade100,
                          iconColor: Colors.green,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TaskType(
                          type: "Health",
                          count: 6,
                          icon: Icon(Icons.favorite),
                          iconColor: Colors.pink,
                          colors: Colors.pink.shade100,
                        ),
                        TaskType(
                          type: "Work",
                          count: 5,
                          icon: Icon(Icons.work, color: Colors.green),
                          colors: Colors.grey.shade200,
                          iconColor: Colors.grey,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 40),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder:
                    (context, index) => Container(
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(width: 1)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Transform.scale(
                              scale: 1.4,
                              child: Checkbox(
                                shape: ContinuousRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                checkColor: Colors.blue,
                                value: false,
                                onChanged: (value) => value,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Drink 8 glasses of water"),
                                SizedBox(height: 5),
                                Container(
                                  padding: EdgeInsets.only(
                                    left: 10,
                                    right: 10,
                                    top: 2,
                                    bottom: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurple[100],
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    "Health",
                                    style: TextStyle(color: Colors.deepPurple),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.black87,
        child: Icon(Icons.add, size: 40, color: Colors.white),
      ),
    );
  }
}
