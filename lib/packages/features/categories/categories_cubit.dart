import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mira/packages/user_repository/user_repository.dart';

part 'categories_state.dart';

class HomesCubit extends Cubit<HomesState> {
  HomesCubit({
    required this.userRepository,
  }) : super(
          const HomesState(),
        );

  final UserRepository userRepository;
// final VoidCallback onContactsTapped;
}
