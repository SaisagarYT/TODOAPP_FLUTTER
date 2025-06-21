import 'package:flutter/material.dart';
import 'package:flutter_todo_application_6/screens/CalanderScreen.dart';
import 'package:flutter_todo_application_6/screens/NewTask.dart';
import 'package:flutter_todo_application_6/screens/bloc/task_bloc.dart';
import 'package:flutter_todo_application_6/widgets/customWidgets/TaskType.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    context.read<TaskBloc>().add(TaskHomepageTaskDisplayEvent());
  }

  Map<String, bool> completedStatus = {};

  int index = 0;

  Map<String, dynamic> bgColors = {
    'Health': Colors.deepPurple[100],
    'Work': Colors.green[100],
    'Mental Health': Colors.pink[100],
    'Others': Colors.grey[300],
  };
  Map<String, dynamic> textColors = {
    'Health': Colors.deepPurple,
    'Work': Colors.green,
    'Mental Health': Colors.pink,
    'others': Colors.grey[600],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 20),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            if (state is HomepageLoadingIndicatorState) {
              return Scaffold(body: Center(child: CircularProgressIndicator()));
            } else if (state is HomepageInitialDisplayState) {
              final otherCount = state.tasks.where((element) {
                return element.tab == "Others" || element.tab == "";
              });
              final workCount = state.tasks.where((element) {
                return element.tab == "Work";
              });
              final healthCount = state.tasks.where((element) {
                return element.tab == "Health";
              });
              final mentalHealthCount = state.tasks.where((element) {
                return element.tab == "Mental Health";
              });
              return Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Todo",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        DateTime.now().toLocal().toString().substring(0, 10),
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                    ],
                  ),

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
                                count: healthCount.length,
                                icon: Icon(Icons.favorite),
                                iconColor: Colors.deepPurple,
                                colors: Colors.deepPurple.shade100,
                              ),
                              TaskType(
                                type: "Work",
                                count: workCount.length,
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
                                type: "Mental Health",
                                count: mentalHealthCount.length,
                                icon: Icon(Icons.favorite),
                                iconColor: Colors.pink,
                                colors: Colors.pink.shade100,
                              ),
                              TaskType(
                                type: "Others",
                                count: otherCount.length,
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
                      itemCount: state.tasks.length,
                      itemBuilder: (context, index) {
                        final task = state.tasks[index];
                        final taskId = task.id;
                        bool isComplete = completedStatus[taskId] ?? false;
                        return Dismissible(
                          direction: DismissDirection.endToStart,
                          background: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.red,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(right: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onDismissed: (direction) {
                            context.read<TaskBloc>().add(
                              RemoveTaskEvent(taskId: state.tasks[index].id),
                            );
                          },
                          key: Key(state.tasks[index].task),
                          child: Container(
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
                                      checkColor: Colors.white,
                                      activeColor: Colors.black,
                                      value: isComplete,
                                      onChanged: (value) {
                                        setState(() {
                                          completedStatus[taskId] = value!;
                                        });
                                      },
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(state.tasks[index].task),
                                      SizedBox(height: 5),
                                      Container(
                                        padding: EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 2,
                                          bottom: 2,
                                        ),
                                        decoration: BoxDecoration(
                                          color:
                                              bgColors[state.tasks[index].tab ==
                                                      ""
                                                  ? "Others"
                                                  : state.tasks[index].tab],
                                          borderRadius: BorderRadius.circular(
                                            5,
                                          ),
                                        ),
                                        child: Text(
                                          state.tasks[index].tab.isEmpty
                                              ? "Others"
                                              : state.tasks[index].tab,
                                          style: TextStyle(
                                            color:
                                                textColors[state
                                                            .tasks[index]
                                                            .tab ==
                                                        ""
                                                    ? "Others"
                                                    : state.tasks[index].tab],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }
            return Scaffold(body: Center(child: Text("Hello world")));
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
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        selectedItemColor: Colors.black,
        selectedIconTheme: IconThemeData(size: 30),
        unselectedItemColor: Colors.grey,
        onTap: (value) {
          setState(() {
            index = value;
          });
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Homepage()),
              );
              break;
            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Calanderscreen()),
              );
              break;
          }
        },
        currentIndex: index,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: "Calander",
          ),
        ],
      ),
    );
  }
}
