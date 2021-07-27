import 'package:flutter/widgets.dart';
import 'package:giphy_get/src/client/models/languages.dart';
import 'package:giphy_get/src/client/models/rating.dart';

class TabProvider with ChangeNotifier {
  String apiKey;
  String searchText;
  String rating = GiphyRating.g;
  String lang = GiphyLanguage.english;
  String randomID = "";

  // TabType
  TabType _tabType = TabType.gifs;
  TabType get tabType => _tabType;
  set tabType(TabType tabType) {
    _tabType = tabType;
    notifyListeners();
  }

  // Constructor
  TabProvider({
    this.apiKey,
    this.searchText,
    this.rating,
    this.randomID,
    this.lang,
  });
  void setTabColor(Color tabColor) {
    tabColor = tabColor;
    notifyListeners();
  }
}

enum TabType { gifs, stickers, emoji }
