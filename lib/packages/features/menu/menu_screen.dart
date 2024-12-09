import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mira/packages/component_library/component_library.dart';
import 'package:mira/packages/features/menu/menu_cubit.dart';
import 'package:mira/packages/user_repository/user_repository.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({
    super.key,
    required this.userRepository,
  });

  final UserRepository userRepository;

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider<MenuCubit>(
      create: (_) => MenuCubit(
        userRepository: widget.userRepository,
      ),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus,
        child: const MenuView(),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class MenuView extends StatelessWidget {
  const MenuView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuCubit, MenuState>(
      builder: (context, state) {
        final theme = MiraTheme.of(context);
        // final textTheme = Theme.of(context).textTheme;
        return Scaffold(
          appBar: AppBar(),
          body: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: theme.screenMargin,
              vertical: Spacing.large,
            ),
            children: const [Text('data dsdnd')],
          ),
        );
      },
    );
  }
}
