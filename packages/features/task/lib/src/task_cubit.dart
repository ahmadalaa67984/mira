import 'package:domain_models/domain_models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_fields/form_fields.dart';
import 'package:user_repository/user_repository.dart';

part 'task_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit({
    required this.userRepository,

  }) : super(
          const TasksState(),
        ) {
    getUser();
  }

  final UserRepository userRepository;
  // final VoidCallback onContactsTapped;


  void getUser() async {
    try {

      final user = await userRepository.getUser().first;

      emit(state.copyWith(user: user));
    } catch (e) {
      rethrow;
    }
  }

  void onLogout() {
    userRepository.logout();
  }
}
