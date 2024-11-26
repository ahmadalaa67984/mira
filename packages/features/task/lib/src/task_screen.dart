import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';
import 'package:component_library/component_library.dart';
import 'package:task/src/task_cubit.dart';
import 'package:function_and_extension_library/function_and_extension_library.dart';

import 'components/components.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({
    super.key,
    required this.userRepository,
  });

  final UserRepository userRepository;

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider<TasksCubit>(
      create: (_) => TasksCubit(
        userRepository: widget.userRepository,
      ),
      child: GestureDetector(
        onTap: () => context.releaseFocus(),
        child: const TasksView(),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class TasksView extends StatelessWidget {
  const TasksView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksCubit, TasksState>(
      builder: (context, state) {
        final theme = MiraTheme.of(context);
        // final textTheme = Theme.of(context).textTheme;
        return Scaffold(
            appBar: AppBar(),
            body: Stack(
              children: [
                ListView(
                    padding: EdgeInsets.all(theme.screenMargin),
                    children: List.generate(
                      5,
                      (index) => TaskCard(),
                    )),
                Container(child: MyButton(),),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    decoration: BoxDecoration(
                        color: theme.primaryColor,
                      borderRadius:
                        BorderRadius.circular(10)
                    ),
                    margin:EdgeInsets.only(left: 20,bottom: 60),
                    padding: EdgeInsets.symmetric(vertical: 10 ,horizontal: 20),
                    child:GestureDetector(onTap: (){},child: Text("+",style:TextStyle(color: Colors.white), ),),
                  ),
                )
              ],
            ));
      },
    );
  }
}

class TaskCard extends StatefulWidget {
  const TaskCard({super.key});

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 2,
            offset: Offset(1, 2), // Shadow direction
          ),
        ],
      ),
      height: 100,
      child: Row(
        children: [
          Container(
            width: 10,
            decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            color: Colors.red.withOpacity(0.1),
                            // border: Border.all(width:1,color: Colors.red),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          'جاري العمل',
                          style: textTheme.bodySmall?.copyWith(color: Colors.red),
                        )),
                    Text(
                      'data',
                      style: textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                      Icon(Icons.timelapse,color: Colors.grey,),
                      Text('20/9/2024')
                    ],)
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                   Text('afs'),
                   Align(
                     child: MiraElevatedButton(label: 'close', onTap: Navigator.of(context).pop)
                     ,alignment: Alignment.bottomLeft,)
                 ],
                ),
              ),
            );
          },
        );
      },
      child: Text('Open Custom Popup'),
    );
  }
}