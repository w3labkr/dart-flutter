import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'favorite_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('home'),
        IconButton(
          icon: Icon(
            Provider.of<FavoriteProvider>(context).favoriteIcon,
            color: Colors.red,
          ),
          onPressed: () {
            Provider.of<FavoriteProvider>(context, listen: false)
                .toggleFavoriteStatus();
          },
        )
      ],
    ));
  }
}
