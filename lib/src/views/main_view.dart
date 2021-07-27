import 'package:flutter/material.dart';
import 'package:giphy_get/src/providers/sheet_provider.dart';
import 'package:giphy_get/src/providers/tab_provider.dart';
import 'package:giphy_get/src/views/appbar/searchappbar.dart';
import 'package:giphy_get/src/views/tab/giphy_tab_bar.dart';
import 'package:giphy_get/src/views/tab/giphy_tab_view.dart';
import 'package:provider/provider.dart';

class MainView extends StatefulWidget {
  MainView({Key key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView>
    with SingleTickerProviderStateMixin {
  // Scroll Controller
  ScrollController _scrollController;

  // Sheet Provider
  SheetProvider _sheetProvider;

  TabProvider _tabProvider;

  // Tab Controller
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);

    super.initState();
  }

  @override
  void didChangeDependencies() {
    _sheetProvider = Provider.of<SheetProvider>(context);
    _tabProvider = Provider.of<TabProvider>(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _bottomSheetBody();
  }

  Widget _bottomSheetBody() => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 4,
            width: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white.withOpacity(0.6),
            ),
          ),
          const SizedBox(height: 12),
          SearchAppBar(),
          GiphyTabBar(tabController: _tabController),
          Expanded(
            child: GiphyTabView(
              tabController: _tabController,
              tabType: _tabProvider.tabType,
            ),
          ),
          Container(
            color: Colors.white,
            height: 34,
            width: double.infinity,
          )
        ],
      );
}
