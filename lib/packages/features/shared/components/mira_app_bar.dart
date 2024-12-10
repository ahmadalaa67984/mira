import 'package:flutter/material.dart';
import 'package:mira/packages/component_library/component_library.dart';

class MiraAppBar extends StatefulWidget {
  @override
  _MiraAppBarState createState() => _MiraAppBarState();
}

class _MiraAppBarState extends State<MiraAppBar> {
  @override
  Widget build(BuildContext context) {
    final theme = MiraTheme.of(context);

    return  Row(
      children: [
        Image.asset('assets/logo.png'),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 10.0, // Adjust as needed
                vertical: 10.0,   // Adjust as needed
              ),
              filled: true,
              isDense: true,
              prefixIconConstraints: BoxConstraints(
                minWidth: 40,
                minHeight: 0,
              ),
              prefixIcon: Icon(
                Icons.search,
                color:theme.dimmedTextColor,
              ),
              hintStyle: TextStyle(color: theme.dimmedTextColor),
              hintText: 'What are you looking for?',
              fillColor: Colors.white, // Removes background color
              border: _buildBorder(),
              enabledBorder: _buildBorder(),
              focusedBorder: _buildBorder(),
            ),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder _buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.0), // Set border radius
      borderSide: BorderSide.none,
      // Remove outline color
    );
  }
}
