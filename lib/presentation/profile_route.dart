import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapp/res/colors.dart';
import 'package:flutterapp/res/images.dart';
import 'package:flutterapp/widgets/progress/arc_progress.dart';

class ProfileRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfileRouteState();
  }
}

class _ProfileRouteState extends State<ProfileRoute> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: AppColors.profileHeader,
        statusBarIconBrightness: Brightness.light
    ));
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            color: AppColors.profileHeader,
            child: Column(
              children: <Widget>[
                SizedBox( height: 38),
                _UserProfileInfoWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _UserProfileInfoWidget extends StatelessWidget {

  final double userAvatarSize = 98;

  _UserProfileInfoWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 98,
          height: 98,
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: <Widget>[
              SvgPicture.asset(Images.bgUserAvatar, height: userAvatarSize, width: userAvatarSize),
              Image.asset(Images.userAvatar),
              CustomPaint(
                size: Size(userAvatarSize, userAvatarSize),
                painter: ArcProgressPainter(userAvatarSize.round(), 45, 225, 3, Colors.red),
              )
            ],
          ),
        ),
        SizedBox(width: 18),
        Column(

        ),
      ],
    );
  }
}

