import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helpers/constant.dart';
import '../helpers/services/color_services.dart';
import '../helpers/theme_services.dart';
import 'custom_button.dart';

  Widget CustomWarningDialogue() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: AlertDialog(
        content: Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(warningImage.toString(),height: 70,width: 70,),
                SizedBox(height: 20,),
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'Resistance ',
                              style: dialogue_big_hStyle.copyWith(
                                color: ThemeService.isSavedDarkMode() ? whiteTxtColor : blackTxtColor,
                              )
                          ),
                          TextSpan(
                            text: 'value is too High!',
                            style: dialogue_small_hStyle.copyWith(
                              color: ThemeService.isSavedDarkMode() ? whiteTxtColor : blackTxtColor,
                            ),
                          ),

                        ]
                    )),
                SizedBox(height: 20,),
                CustomButton(text: 'Go Back',  onPressed: (){
                  Get.back();
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

