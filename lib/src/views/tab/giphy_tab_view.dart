import 'package:flutter/material.dart';
import 'package:giphy_get/src/client/models/type.dart';
import 'package:giphy_get/src/providers/tab_provider.dart';
import 'package:provider/provider.dart';

import 'giphy_tab_detail.dart';

class GiphyTabView extends StatelessWidget {
  final TabController tabController;
  final TabType tabType;

  const GiphyTabView(
      {Key key,
      this.tabController,
      this.tabType})
      : super(key: key);

  Widget build(BuildContext context) {
    switch (tabType) {
      case TabType.gifs:
        return GiphyTabDetail(
          key: ValueKey(tabType),
          type: GiphyType.gifs,
        );
        break;
      case TabType.stickers:
        return GiphyTabDetail(
          key: ValueKey(tabType),
          type: GiphyType.stickers,
        );
        break;
      case TabType.emoji:
        return GiphyTabDetail(
          key: ValueKey(tabType),
          type: GiphyType.emoji,
        );
        break;
    }
  }
}
