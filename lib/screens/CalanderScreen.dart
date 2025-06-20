import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_todo_application_6/screens/NewTask.dart';
import 'package:flutter_todo_application_6/screens/bloc/task_bloc.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Calanderscreen extends StatefulWidget {
  const Calanderscreen({super.key});

  @override
  State<Calanderscreen> createState() => _CalanderscreenState();
}

class _CalanderscreenState extends State<Calanderscreen> {
  @override
  void initState() {
    super.initState();
    context.read<TaskBloc>().add(TaskHomepageTaskDisplayEvent());
  }

  DateTime selectedDate = DateTime.now();
  bool isSelected(DateTime a, DateTime b) {
    return (a.year == b.year && b.month == a.month && a.day == b.day);
  }

  int date = 0;
  List<DateTime> dates = List.generate(365, (index) {
    return DateTime.now().add(Duration(days: index));
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            if (state is HomepageInitialDisplayState) {
              return Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Calendar",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10),
                      Row(
                        children: [
                          Text(
                            DateFormat('d ').format(dates[date]),
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            DateFormat(
                              'MMMM',
                            ).format(dates[date]).substring(0, 3),
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    height: 80,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: dates.length,
                      itemBuilder: (value, index) {
                        bool selected = isSelected(selectedDate, dates[index]);
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedDate = dates[index];
                              print(selectedDate.day);
                              date = index;
                            });
                            print(selected);
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.circular(10),
                              color: selected ? Colors.black87 : Colors.white,
                            ),
                            width: 65,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  DateFormat('E').format(dates[index]),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color:
                                        selected ? Colors.white : Colors.grey,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  DateFormat('d').format(dates[index]),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color:
                                        selected ? Colors.white : Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 40),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.tasks.length,
                      itemBuilder:
                          (context, index) => Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  padding: EdgeInsets.only(
                                    left: 10,
                                    top: 20,
                                    bottom: 40,
                                    right: 20,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurple[100],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.circle,
                                              color: Colors.deepPurple,
                                            ),
                                            SizedBox(width: 10),
                                            Expanded(
                                              child: Text(
                                                state.tasks[index],
                                                maxLines: 5,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        DateTime.now()
                                            .toIso8601String()
                                            .substring(11, 16),
                                        style: TextStyle(
                                          color: Colors.blueGrey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                    ),
                  ),
                ],
              );
            }
            return Scaffold(body: Center(child: Text("data")));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Newtask()),
          );
        },
        backgroundColor: Colors.black87,
        child: Icon(Icons.add, size: 40, color: Colors.white),
      ),
    );
  }
}
