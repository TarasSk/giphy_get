import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giphy_get/src/providers/tab_provider.dart';
import 'package:provider/provider.dart';

class GiphyTabBar extends StatefulWidget {
  final TabController tabController;
  const GiphyTabBar({Key key, @required this.tabController}) : super(key: key);

  @override
  _GiphyTabBarState createState() => _GiphyTabBarState();
}

class _GiphyTabBarState extends State<GiphyTabBar> {
  TabProvider _tabProvider;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // TabProvider
    _tabProvider = Provider.of<TabProvider>(context, listen: true);
  }

  @override
  void dispose() {
    //Dispose tabController
    widget.tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      color: Colors.white,
      child: CupertinoSlidingSegmentedControl<TabType>(
        padding: const EdgeInsets.all(3.0),
        groupValue: _tabProvider.tabType,
        onValueChanged: (TabType value) => _setTabType(value),
        children: const <TabType, Widget>{
          TabType.gifs: _SegmentItem(title: 'Gifs'),
          TabType.stickers: _SegmentItem(title: 'Stickers'),
          TabType.emoji: _SegmentItem(title: 'Emoji'),
        },
      ),
    );
  }

  _setTabType(TabType pos) => _tabProvider.tabType = pos;
}

class _SegmentItem extends StatelessWidget {
  const _SegmentItem({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: Text(
        title,
        //style: WeStriveTextStyle.lato12Bold,
        textAlign: TextAlign.center,
      ),
    );
  }
}
