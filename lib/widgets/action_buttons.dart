import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  var _drawKey;
  ActionButtons(this._drawKey);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: () {},
          child: Icon(
            Icons.search,
            color: Colors.white,
          ),
          style: TextButton.styleFrom(
            // padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
        TextButton(
          onPressed: () {
            _drawKey.currentState!.openEndDrawer();
          },
          child: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
