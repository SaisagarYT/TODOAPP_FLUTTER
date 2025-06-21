import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_application_6/screens/CalanderScreen.dart';
import 'package:flutter_todo_application_6/screens/bloc/task_bloc.dart';

class Description extends StatefulWidget {
  const Description({super.key});

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            if (state is HomepageLoadingIndicatorState) {
              return Scaffold(body: Center(child: CircularProgressIndicator()));
            } else if (state is DescriptionDisplayState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Calanderscreen(),
                            ),
                          );
                        },
                        icon: Icon(Icons.navigate_before, size: 35),
                      ),
                      Text("Description", style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 5),
                    child: Text(state.description.toString(), maxLines: 5),
                  ),
                ],
              );
            }
            return Scaffold(body: Center(child: Text("Nothing")));
          },
        ),
      ),
    );
  }
}
