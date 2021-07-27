library giphy_get;

// Imports
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:giphy_get/src/client/models/gif.dart';
import 'package:giphy_get/src/client/models/languages.dart';
import 'package:giphy_get/src/client/models/rating.dart';
import 'package:giphy_get/src/providers/app_bar_provider.dart';
import 'package:giphy_get/src/providers/sheet_provider.dart';
import 'package:giphy_get/src/views/main_view.dart';
import 'package:giphy_get/src/providers/tab_provider.dart';
import 'package:provider/provider.dart';

// Giphy Client Export
export 'package:giphy_get/src/client/client.dart';
export 'package:giphy_get/src/client/models/collection.dart';
export 'package:giphy_get/src/client/models/gif.dart';
export 'package:giphy_get/src/client/models/image.dart';
export 'package:giphy_get/src/client/models/images.dart';
export 'package:giphy_get/src/client/models/languages.dart';
export 'package:giphy_get/src/client/models/rating.dart';
export 'package:giphy_get/src/client/models/user.dart';
export 'package:giphy_get/src/client/models/type.dart';

class GiphyGet {
  // Show Bottom Sheet
  static Future<GiphyGif> getGif({
    @required BuildContext context,
    @required String apiKey,
    String rating = GiphyRating.r, 
    String lang = GiphyLanguage.english,
    String randomID = "",
    String searchText = "Search",
    bool modal = true,
  }) =>
      showModalBottomSheet<GiphyGif>(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        enableDrag: true,
        isScrollControlled: true,
        barrierColor: Colors.black.withOpacity(0.6),
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) => MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (ctx) => AppBarProvider(),
            ),
            ChangeNotifierProvider(
              create: (ctx) => SheetProvider(),
            ),
            ChangeNotifierProvider(
              create: (ctx) => TabProvider(
                apiKey: apiKey,
                randomID: randomID,
                searchText: searchText,
                rating: rating,
                lang: lang,
              ),
            )
          ],
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: SizedBox(
              height: MediaQuery.of(context).size.height - kToolbarHeight,
              child: MainView(),
            ),
          ),
        ),
      );
}
