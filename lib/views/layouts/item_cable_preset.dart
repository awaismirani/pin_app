import 'package:flutter/material.dart';

import '../../helpers/services/color_services.dart';
import '../../helpers/theme_services.dart';

class ItemCablePreset extends StatelessWidget {
  ItemCablePreset({
    required this.title,
    required this.subTitle,
    required this.onPressed,
});
  String title;
  String subTitle;
  VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: ThemeService.isSavedDarkMode()
                ? grapghbackColorD
                : grapghbackColorL
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Cable1',style: custom_tile_titleStyle.copyWith(color: redColor),),
                  SizedBox(height: 10,),
                  Text('Cable Length',style: hintTextStyle.copyWith( color: ThemeService.isSavedDarkMode()
                      ? whiteTxtColor
                      : blackTxtColor),),
                ],
              ),
            ),
            Icon(Icons.add,size: 30,color:redColor,),
          ],
        ),
      ),
    );
  }
}
