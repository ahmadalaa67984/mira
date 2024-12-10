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

class ProductScreen extends StatefulWidget {
  const ProductScreen({
    super.key,
    required this.userRepository,
  });

  final UserRepository userRepository;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen>
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
        child: const ProductView(),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class ProductView extends StatelessWidget {
  const ProductView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomesCubit, HomesState>(
      builder: (context, state) {
        final theme = MiraTheme.of(context);
        // final textTheme = Theme.of(context).textTheme;
        return Scaffold(
          body:Padding(
            padding: EdgeInsets.all(4),
            child: ListView(
              children: [
                MiraAppBar(),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgAsset(AssetPathConstants.locationPath),
                        Text(
                          'Deliver to:',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Text(
                      'Change',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                GridView.builder(
                  shrinkWrap: true, // Important to let GridView fit its content
                  physics: NeverScrollableScrollPhysics(), // Prevent nested scrolling issues
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Two products per row
                    crossAxisSpacing: 0.0, // Space between columns
                    mainAxisSpacing: 15.0, // Space between rows
                    childAspectRatio: 1.0, // Aspect ratio for each grid item
                  ),
                  itemCount: hotDealProductes.length,
                  itemBuilder: (ctx, index) {
                    final product = hotDealProductes[index];
                    return SharedItemCard(product: product);
                  },
                ),
              ],
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
}


