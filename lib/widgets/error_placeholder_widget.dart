import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/resources/app_dimens.dart';
import 'package:flutterapp/resources/strings/app_localizations.dart';
import 'package:flutterapp/resources/app_text_styles.dart';

class ErrorPlaceholderWidget extends StatelessWidget {
  final String message;
  final Function() onRetryPressed;

  ErrorPlaceholderWidget({
    this.message,
    this.onRetryPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: AppTextStyles.h3RegularPrimary,
          ),
          SizedBox(
            height: AppDimens.retryButtonMarginTop,
          ),
          MaterialButton(
          onPressed: () => onRetryPressed.call(),
          color: Theme.of(context).accentColor,
          child: Text(
            AppLocalizations.of(context).retry.toUpperCase(),
            style: AppTextStyles.h4MediumWhite,
          ),
        )
        ],
      ),
    );
  }
}
