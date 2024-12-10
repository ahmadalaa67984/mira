import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mira/packages/component_library/assets/assets.dart';
import 'package:mira/packages/component_library/component_library.dart';
import 'package:mira/packages/features/home/components/home_horizontal_carousel.dart';
import 'package:mira/packages/features/home/home_cubit.dart';
import 'package:mira/packages/features/shared/components/mira_app_bar.dart';
import 'package:mira/packages/features/shared/components/shared_item_card.dart';
import 'package:mira/packages/mira_api/models/productes/hot_deals_productes.dart';
import 'package:mira/packages/user_repository/user_repository.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({
    super.key,
    required this.userRepository,
  });

  final UserRepository userRepository;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider<HomesCubit>(
      create: (_) => HomesCubit(
        userRepository: widget.userRepository,
      ),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus,
        child: const CategoriesView(),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class CategoriesView extends StatelessWidget {
  const CategoriesView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomesCubit, HomesState>(
      builder: (context, state) {
        final theme = MiraTheme.of(context);
        // final textTheme = Theme.of(context).textTheme;
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40,),
                  MiraAppBar(),
                  SizedBox(height: 20),
                  const Text(
                    'Fresh Food',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 2, // Horizontal scrolling
                      itemBuilder: (ctx, index) {
                        return _buildSquare(context);
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Fruits & Vegetables',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5, // Horizontal scrolling
                      itemBuilder: (ctx, index) {
                        return _buildSquare(context);
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Food Cupboard',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3, // Horizontal scrolling
                      itemBuilder: (ctx, index) {
                        return _buildSquare(context);
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Bakery',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4, // Horizontal scrolling
                      itemBuilder: (ctx, index) {
                        return _buildSquare(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

      },
    );
  }
  // Helper function to define the border style
  OutlineInputBorder _buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.0), // Set border radius
      borderSide: BorderSide.none, // Remove outline color
    );
  }
  Widget _buildSquare(context) {
    final theme = MiraTheme.of(context);

    return Padding(
      padding: EdgeInsets.all(3),
      child: Container(
        width: 100.0, // Circle width
        height: 100.0, // Circle height
        decoration: BoxDecoration(
          color: theme.secondaryColor, // Circle color
            borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }


}


