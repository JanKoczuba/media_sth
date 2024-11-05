import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:media_sth/core/presentation/styles/app_padings.dart';
import 'package:media_sth/core/presentation/widgets/rounded_background_icon.dart';

class DefaultAppBar extends AppBar {
  DefaultAppBar({
    required Widget title,
    super.key,
  }) : super(
          systemOverlayStyle: const SystemUiOverlayStyle(
            systemStatusBarContrastEnforced: false,
            systemNavigationBarContrastEnforced: false,
            statusBarColor: Colors.transparent,
            systemNavigationBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: title,
          actions: [
            const Padding(
              padding: AppPaddings.appBarRoundedIcon,
              child: RoundedBackgroundIcon(
                icon: Icon(Icons.favorite_border),
              ),
            ),
            const Padding(
              padding: AppPaddings.appBarRoundedIcon,
              child: const RoundedBackgroundIcon(
                icon: Icon(Icons.search),
              ),
            ),
          ],
          leading: const Padding(
            padding: AppPaddings.appBarRoundedIcon,
            child: RoundedBackgroundIcon(
              icon: Icon(Icons.menu),
            ),
          ),
        );
}
