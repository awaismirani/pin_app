import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helpers/constant.dart';
import '../helpers/services/color_services.dart';
import '../helpers/theme_services.dart';
import 'custom_button.dart';

 Widget CustomConfirmDialogue(BuildContext context){
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
                Image.asset(messageBoxImage.toString(),height: 70,width: 70,),
                SizedBox(height: MediaQuery.of(context).size.width < 600?10:20,),
                Text('Everything is Correct?',
                    textAlign: TextAlign.center,
                    style: dialogue_big_hStyle.copyWith(
                        color: ThemeService.isSavedDarkMode() ? whiteTxtColor : blackTxtColor,
                        fontWeight: MediaQuery.of(context).size.width < 600?FontWeight.w800:FontWeight.w800,fontSize: MediaQuery.of(context).size.width < 600?20:28
                    )),
                SizedBox(height: MediaQuery.of(context).size.width < 600?10:20,),
                MediaQuery.of(context).size.width < 600?Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Cable Name',style: custom_tile_titleStyle.copyWith(color: redColor),),
                        Text('Name',style: mediumTextStyle.copyWith(color:ThemeService.isSavedDarkMode() ? whiteTxtColor : blackTxtColor, ),),

                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Cable Length',style: custom_tile_titleStyle.copyWith(color: redColor),),
                        Text('Length',style: mediumTextStyle.copyWith(color:ThemeService.isSavedDarkMode() ? whiteTxtColor : blackTxtColor, ),),

                      ],
                    ),
                  ],
                ):
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Cable Name',style: custom_tile_titleStyle.copyWith(color: redColor),),
                          Text('Name',style: mediumTextStyle.copyWith(color:ThemeService.isSavedDarkMode() ? whiteTxtColor : blackTxtColor, ),),

                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Cable Length',style: custom_tile_titleStyle.copyWith(color: redColor),),
                          Text('Length',style: mediumTextStyle.copyWith(color:ThemeService.isSavedDarkMode() ? whiteTxtColor : blackTxtColor, ),),

                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                MediaQuery.of(context).size.width < 600?
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Resistance',style: custom_tile_titleStyle.copyWith(color: redColor),),
                        Text('138',style: mediumTextStyle.copyWith(color:ThemeService.isSavedDarkMode() ? whiteTxtColor : blackTxtColor, ),),

                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Capacitance',style: custom_tile_titleStyle.copyWith(color: redColor),),
                        Text('138',style: mediumTextStyle.copyWith(color:ThemeService.isSavedDarkMode() ? whiteTxtColor : blackTxtColor, ),),

                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Impedance',style: custom_tile_titleStyle.copyWith(color: redColor),),
                        Text('138',style: mediumTextStyle.copyWith(color:ThemeService.isSavedDarkMode() ? whiteTxtColor : blackTxtColor, ),),
                      ],
                    ),
                  ],
                ):
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Resistance',style: custom_tile_titleStyle.copyWith(color: redColor),),
                          Text('138',style: mediumTextStyle.copyWith(color:ThemeService.isSavedDarkMode() ? whiteTxtColor : blackTxtColor, ),),

                        ],
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Capacitance',style: custom_tile_titleStyle.copyWith(color: redColor),),
                          SizedBox(width: 10,),
                          Text('138',style: mediumTextStyle.copyWith(color:ThemeService.isSavedDarkMode() ? whiteTxtColor : blackTxtColor, ),),

                        ],
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Impedance',style: custom_tile_titleStyle.copyWith(color: redColor),),
                          Text('138',style: mediumTextStyle.copyWith(color:ThemeService.isSavedDarkMode() ? whiteTxtColor : blackTxtColor, ),),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.width < 600?10:20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomButton(text: ' Cancel ',
                        color: redColor,
                        onPressed: (){
                          Get.back();
                        }),
                    CustomButton(text: ' Confirm ',  onPressed: (){
                      Get.back();
                    }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
