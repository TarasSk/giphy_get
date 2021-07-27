import 'package:flutter/material.dart';
import 'package:giphy_get/src/providers/app_bar_provider.dart';
import 'package:giphy_get/src/providers/sheet_provider.dart';
import 'package:giphy_get/src/providers/tab_provider.dart';
import 'package:provider/provider.dart';

class SearchAppBar extends StatefulWidget {
  // Scroll Controller

  SearchAppBar({
    Key key,
  }) : super(key: key);

  @override
  _SearchAppBarState createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  // Tab Provider
  TabProvider _tabProvider;

  // AppBar Provider
  AppBarProvider _appBarProvider;

  // Sheet Provider
  SheetProvider _sheetProvider;

  // Input controller
  TextEditingController _textEditingController = new TextEditingController();
  // Input Focus
  FocusNode _focus = new FocusNode();

  @override
  void initState() {
    super.initState();
    // Listener TextField
    _textEditingController.addListener(() {
      _appBarProvider.queryText = _textEditingController.text;
    });
  }

  @override
  void didChangeDependencies() {
    // Providers
    _tabProvider = Provider.of<TabProvider>(context);

    _sheetProvider = Provider.of<SheetProvider>(context);

    // AppBar Provider
    _appBarProvider = Provider.of<AppBarProvider>(context);

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _focus.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: _searchWidget(),
    );
  }

  Widget _searchWidget() => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _tabProvider.tabType == TabType.emoji
                ? Container(height: 40.0, child: _giphyLogo())
                : Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFFF0F0F0),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    height: 42.0,
                    child: TextField(
                      autofocus: _sheetProvider.initialExtent ==
                          SheetProvider.maxExtent,
                      focusNode: _focus,
                      controller: _textEditingController,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        prefixIcon: _searchIcon(),
                        hintStyle: TextStyle(color: Colors.black45),
                        hintText: _tabProvider.searchText,
                        border: InputBorder.none,
                      ),
                      autocorrect: false,
                    ),
                  ),
          ],
        ),
      );

  Widget _giphyLogo() {
    const basePath = "assets/img/";
    String logoPath = "GIPHY_light.png";

    return Center(
        child: Image.asset(
      "$basePath$logoPath",
      package: 'giphy_get',
    ));
  }

  Widget _searchIcon() => ShaderMask(
        shaderCallback: (bounds) => LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.pinkAccent,
              Colors.purple[700],
            ]).createShader(bounds),
        child: Icon(Icons.search),
      );
}
