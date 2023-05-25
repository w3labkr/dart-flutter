import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'favorite_provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('favorite'),
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
