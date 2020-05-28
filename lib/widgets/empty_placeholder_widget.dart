import 'package:flutter/material.dart';

class EmptyPlaceholderWidget extends StatelessWidget {
  final Widget content;

  EmptyPlaceholderWidget({
    @required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: content,
    );
  }
}
