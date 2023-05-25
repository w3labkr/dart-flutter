import 'package:flutter/material.dart';

class FavoriteProvider with ChangeNotifier {
  IconData _favoriteIcon = Icons.favorite;
  IconData get favoriteIcon => _favoriteIcon;

  void toggleFavoriteStatus() {
    if (_favoriteIcon == Icons.favorite) {
      _favoriteIcon = Icons.favorite_border;
    } else {
      _favoriteIcon = Icons.favorite;
    }
    notifyListeners();
  }
}
