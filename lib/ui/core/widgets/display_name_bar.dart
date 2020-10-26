import 'package:flutter/material.dart';

import '../../app_theme.dart';

class DisplayNameBar extends StatelessWidget {
  const DisplayNameBar({
    Key key,
    @required this.displayName,
  }) : super(key: key);

  final String displayName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'Display Name: $displayName',
            style: Theme.of(context).textTheme.bodyText1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Divider(
          height: 2,
          thickness: 2,
          color: lightestColor,
        ),
      ],
    );
  }
}
