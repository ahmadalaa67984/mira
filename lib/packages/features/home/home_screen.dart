import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mira/packages/component_library/assets/assets.dart';
import 'package:mira/packages/component_library/component_library.dart';
import 'package:mira/packages/features/home/components/home_horizontal_carousel.dart';
import 'package:mira/packages/features/home/components/home_search_bar.dart';
import 'package:mira/packages/features/home/home_cubit.dart';
import 'package:mira/packages/features/shared/components/shared_item_card.dart';
import 'package:mira/packages/mira_api/models/productes/hot_deals_productes.dart';
import 'package:mira/packages/user_repository/user_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.userRepository,
  });

  final UserRepository userRepository;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
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
        child: const HomesView(),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class HomesView extends StatelessWidget {
  const HomesView({
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset('assets/logo.png'),
                      Expanded(child: HomeSearchBar()),
                    ],
                  ),
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
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                    child: HomeHorizontalCarousel(
                      imageUrls: [
                        'https://nafezly-production.fra1.cdn.digitaloceanspaces.com/uploads/portfolios/155131_66e5c0d676eb9_1726333142.webp',
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnZDzS4voDT0dtpi2RzKx1Acrsh8-WaeIzkA&s',
                        'https://i.ytimg.com/vi/ShGK_jUALjw/maxresdefault.jpg',
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildCircle(context),
                      _buildCircle(context),
                      _buildCircle(context),
                      _buildCircle(context),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Hot Deals',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 200, // Constrain the height of the horizontal ListView
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal, // Horizontal scrolling
                      itemCount: hotDealProductes.length,
                      itemBuilder: (ctx, index) {
                        final product = hotDealProductes[index];
                        return SharedItemCard(product: product);
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
  Widget _buildCircle(context) {
    final theme = MiraTheme.of(context);

    return Container(
      width: 100.0, // Circle width
      height: 100.0, // Circle height
      decoration: BoxDecoration(
        color: theme.secondaryColor, // Circle color
        shape: BoxShape.circle, // Make it a circle
      ),
    );
  }

}


