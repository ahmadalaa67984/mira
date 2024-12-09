import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mira/packages/user_repository/user_repository.dart';

part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit({
    required this.userRepository,
  }) : super(
          const MenuState(),
        );

  final UserRepository userRepository;
}
