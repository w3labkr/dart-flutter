import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'favorite_provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(
            Provider.of<FavoriteProvider>(context).favoriteIcon,
            size: 100,
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
