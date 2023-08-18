import 'package:flutter/material.dart';
import '../constant.dart';
import '../theme_services.dart';

const sfbackColorL = Color(0xffffffff);
const sfbackColorD = Color(0xff25222C);
const grapghbackColorL = Color(0xffEBEBEB);
const FieldbgColorD = Color(0xff3C3846);
const FieldbgColorL = Color(0xffffffff);
const grapghbackColorD = Color(0xff1E1B23);
const containerBackColorL = Color(0xFFDEDEDE);
const containerBackColorD = Color(0xFF18161C);
const blackTxtColor = Color(0xff000000);
const whiteTxtColor = Color(0xffffffff);
const redColor = Color(0xffFE0201);
const redColorDeep= Color(0xff8A232A);
const blueColor= Color(0xff0166FE);
const graphTextColorL= Color(0xff757575);
const graphTextColorD= Color(0xff757575);
const hintTextColorL= Color(0x66000000);
const hintTextColorD= Color(0x66ffffff);
const lightBlueColor= Color(0x330166fe);


  Color getSfBgColor(){
  return  ThemeService.isSavedDarkMode() ? sfbackColorD : sfbackColorL;
  }
  Color getGraphBgColor(){
  return  ThemeService.isSavedDarkMode() ? grapghbackColorD : grapghbackColorL;
  }
  Color getMainTextColor(){
  return  ThemeService.isSavedDarkMode() ? whiteTxtColor : blackTxtColor;
  }
  Color getHintTextColor(){
  return  ThemeService.isSavedDarkMode() ? hintTextColorD : hintTextColorL;
  }
  Color getGraphTextColor(){
  return  ThemeService.isSavedDarkMode() ? graphTextColorD : graphTextColorL;
  }

TextStyle main_hStyle_bold = TextStyle(fontSize: 25,fontWeight: FontWeight.w700,fontFamily: family);
TextStyle big_hStyle = TextStyle(fontSize: 22,fontWeight: FontWeight.w700,fontFamily: family);
TextStyle dialogue_big_hStyle = TextStyle(fontSize: 21,fontWeight: FontWeight.w800,fontFamily: family);
TextStyle dialogue_small_hStyle = TextStyle(fontSize: 21,fontWeight: FontWeight.w500,fontFamily: family);
TextStyle custom_tile_titleStyle = TextStyle(fontSize: 16,fontWeight: FontWeight.w700,fontFamily: family);
TextStyle hintTextStyle = TextStyle(fontSize: 20,fontWeight: FontWeight.w400,fontFamily: family);
TextStyle regularTextStyle = TextStyle(fontSize: 20,fontWeight: FontWeight.w400,fontFamily: family);
TextStyle mediumTextStyle = TextStyle(fontSize: 20,fontWeight: FontWeight.w500,fontFamily: family);
TextStyle smallTextStyle_bold = TextStyle(fontSize: 12,fontWeight: FontWeight.w600,fontFamily: family);
TextStyle buttonTextStyle_bold = TextStyle(fontSize: 18,fontWeight: FontWeight.w600,fontFamily: family);
TextStyle chartTextStyle = TextStyle(fontSize: 20,fontWeight: FontWeight.w600,fontFamily: family);
TextStyle chartSmallTextStyle = TextStyle(fontSize: 10,fontWeight: FontWeight.w600,fontFamily: family);
