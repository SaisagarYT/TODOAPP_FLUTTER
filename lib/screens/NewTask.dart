import 'package:flutter/material.dart';
import 'package:flutter_todo_application_6/screens/CalanderScreen.dart';
import 'package:flutter_todo_application_6/screens/bloc/task_bloc.dart';
import 'package:flutter_todo_application_6/widgets/customWidgets/TaskTag.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Newtask extends StatefulWidget {
  const Newtask({super.key});

  @override
  State<Newtask> createState() => _NewtaskState();
}

class _NewtaskState extends State<Newtask> {
  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();

  String tabData = "";
  void tabDetails(String tab) {
    setState(() {
      tabData = tab;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Icon(Icons.close, size: 35)],
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            width: double.maxFinite,
            child: BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: textEditingController1,
                            maxLines: 2,
                            autocorrect: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: "Write a new task...",
                            ),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: textEditingController2,
                            maxLines: 5,
                            autocorrect: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: "Write your description...",
                            ),
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () => tabDetails("Health"),
                                child: TaskTag(
                                  name: "HEALTH",
                                  isSelected: tabData == "Health",
                                  selectedColor: Colors.deepPurple,
                                ),
                              ),
                              GestureDetector(
                                onTap: () => tabDetails("Work"),
                                child: TaskTag(
                                  name: "WORK",
                                  isSelected: tabData == "Work",
                                  selectedColor: Colors.green,
                                ),
                              ),
                              GestureDetector(
                                onTap: () => tabDetails("Mental Health"),
                                child: TaskTag(
                                  name: "MENTAL HEALTH",
                                  isSelected: tabData == "Mental Health",
                                  selectedColor: Colors.pink,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            children: [
                              Container(
                                width: 55,
                                height: 55,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(Icons.timelapse),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Calanderscreen(),
                                      ),
                                    );

                                    context.read<TaskBloc>().add(
                                      AddDetailsToServerEvent(
                                        task: textEditingController1.text,
                                        description:
                                            textEditingController2.text,
                                        tab: tabData??"",
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: 55,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.black87,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Save",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
