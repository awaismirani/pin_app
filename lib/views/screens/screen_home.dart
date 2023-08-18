import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pin_app/helpers/constant.dart';
import 'package:pin_app/views/screens/screen_add_custom_cable.dart';
import '../../helpers/services/color_services.dart';
import '../../helpers/theme_services.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_confirm_dialogue.dart';
import '../../widgets/custom_input_field2.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../widgets/custom_warning_dialogue.dart';
import '../layouts/item_chart.dart';

class ScreenHome extends StatefulWidget {
  ScreenHome({Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  var selectedCable = '';
  var selectedCableList = [
    'Cable 1',
    'Cable 2',
    'Cable 3',
  ];
  var selectedCable1 = '';
  var selectedCableList1 = [
    'Cable 1',
    'Cable 2',
    'Cable 3',
  ];
  bool isKM = true;
  TextEditingController resistanceC =
      TextEditingController(text: 138.toString());
  TextEditingController capacitanceC =
      TextEditingController(text: 138.toString());
  TextEditingController impedanceC =
      TextEditingController(text: 138.toString());
List <FlSpot> data2 =[
  FlSpot(0, 50),
  FlSpot(20, 60),
  FlSpot(40, 70),
  FlSpot(50, 30),
  FlSpot(60, 70),
  FlSpot(70, 55),
  FlSpot(80, 75),
  FlSpot(100, 80),
];
List <FlSpot> data1 =[
  FlSpot(0, 30),
  FlSpot(20, 55),
  FlSpot(40, 80),
  FlSpot(50, 40),
  FlSpot(60, 30),
  FlSpot(70, 70),
  FlSpot(80, 60),
  FlSpot(100, 50),
];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor:
          ThemeService.isSavedDarkMode() ? sfbackColorD : sfbackColorL,
          elevation: 0,
          centerTitle: true,
          title: Text('Programmable Impedance Network (PIN)',
                maxLines: 2,
                textAlign: TextAlign.center,
                style: main_hStyle_bold.copyWith(
                    color: ThemeService.isSavedDarkMode()
                        ? whiteTxtColor
                        : blackTxtColor)),
          bottom: PreferredSize(
              child: Align(
            alignment: Alignment.centerRight ,
            child: Container(
              width: 250,
              child: ListTile(
                  leading: Icon(
                    Icons.mode_night,
                    color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
                  ),
                  dense: true,
                  title: Text("Dark Mode"),
                  trailing: CupertinoSwitch(
                      value: ThemeService.isSavedDarkMode(),
                      onChanged: (value) {
                        ThemeService().setDarkThemeMode(value);
                        setState(() {});
                      })),
            ),
          ),
              preferredSize: Size(MediaQuery.of(context).size.width, 30)),
        ),
        backgroundColor:
            ThemeService.isSavedDarkMode() ? sfbackColorD : sfbackColorL,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: ThemeService.isSavedDarkMode()
                          ? grapghbackColorD
                          : grapghbackColorL),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(15),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: ThemeService.isSavedDarkMode()
                                ? containerBackColorD
                                : containerBackColorL),
                        child: MediaQuery.of(context).size.width <900?
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 8),
                              // padding: EdgeInsets.symmetric(horizontal: 15),
                              decoration: BoxDecoration(
                                color: ThemeService.isSavedDarkMode()
                                    ? FieldbgColorD
                                    : FieldbgColorL,
                                // border: Border.all(width: 1.3,
                                //   color: ThemeService.isSavedDarkMode() ? whiteTxtColor.withOpacity(.20) : blackTxtColor.withOpacity(.20)
                                // ),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                hint: Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        cableImage,
                                        height: 25,
                                        width: 25,
                                        fit: BoxFit.cover,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Select Cable',
                                        style: hintTextStyle.copyWith(
                                            color: ThemeService.isSavedDarkMode()
                                                ? hintTextColorD
                                                : hintTextColorL),
                                      ),
                                    ],
                                  ),
                                ),
                                icon: Icon(
                                  Icons.arrow_drop_down_rounded,
                                  size: 40,
                                  color: redColor,
                                ),
                                iconSize: 20,
                                borderRadius: BorderRadius.circular(14),
                                isExpanded: true,
                                onChanged: (newValue) {
                                  setState(() {
                                    selectedCable = newValue.toString();
                                  });
                                },
                                value: selectedCable.isNotEmpty
                                    ? selectedCable
                                    : null,
                                items: selectedCableList.map((selectedType) {
                                  return DropdownMenuItem(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            cableImage,
                                            height: 25,
                                            width: 25,
                                            fit: BoxFit.cover,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          new Text(
                                            selectedType,
                                            style: hintTextStyle.copyWith(
                                                color:
                                                    ThemeService.isSavedDarkMode()
                                                        ? hintTextColorD
                                                        : hintTextColorL),
                                          ),
                                        ],
                                      ),
                                    ),
                                    value: selectedType,
                                  );
                                }).toList(),
                              )),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomInputField2(
                              hint: 'Cable Length',
                              prefix: Image.asset(
                                cableLength,
                                height: 25,
                                width: 25,
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Switch(
                                  value: isKM,
                                  onChanged: (v) {
                                    isKM = v;
                                    setState(() {});
                                  },
                                  activeColor: redColor,
                                  activeTrackColor: redColorDeep,
                                ),
                                Text(
                                  'km/miles',
                                  style: regularTextStyle.copyWith(
                                    color: ThemeService.isSavedDarkMode()
                                        ? whiteTxtColor
                                        : blackTxtColor,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                '(Other Cable params can also be edited)',
                                style: smallTextStyle_bold.copyWith(
                                  color: ThemeService.isSavedDarkMode()
                                      ? hintTextColorD
                                      : hintTextColorL,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomButton(
                                  text: 'Select a Preset',
                                  color: redColor,
                                  onPressed: () {
                                    Get.to(ScreenAddCustomCable());
                                  },
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                CustomButton(
                                  text: 'Confirm',
                                  onPressed: () {
                                    showDialog(context: context, builder: (BuildContext context) {
                                      return CustomConfirmDialogue(context);
                                    }, );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ):
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                // margin: EdgeInsets.only(top: 8),
                                // padding: EdgeInsets.symmetric(horizontal: 15),
                                decoration: BoxDecoration(
                                  color: ThemeService.isSavedDarkMode()
                                      ? FieldbgColorD
                                      : FieldbgColorL,
                                  // border: Border.all(width: 1.3,
                                  //   color: ThemeService.isSavedDarkMode() ? whiteTxtColor.withOpacity(.20) : blackTxtColor.withOpacity(.20)
                                  // ),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      hint: Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              cableImage,
                                              height: 25,
                                              width: 25,
                                              fit: BoxFit.cover,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              'Select Cable',
                                              style: hintTextStyle.copyWith(
                                                  color: ThemeService.isSavedDarkMode()
                                                      ? hintTextColorD
                                                      : hintTextColorL),
                                            ),
                                          ],
                                        ),
                                      ),
                                      icon: Icon(
                                        Icons.arrow_drop_down_rounded,
                                        size: 40,
                                        color: redColor,
                                      ),
                                      iconSize: 20,
                                      borderRadius: BorderRadius.circular(14),
                                      isExpanded: true,
                                      onChanged: (newValue) {
                                        setState(() {
                                          selectedCable = newValue.toString();
                                        });
                                      },
                                      value: selectedCable.isNotEmpty
                                          ? selectedCable
                                          : null,
                                      items: selectedCableList.map((selectedType) {
                                        return DropdownMenuItem(
                                          child: Padding(
                                            padding: EdgeInsets.only(left: 10),
                                            child: Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  cableImage,
                                                  height: 25,
                                                  width: 25,
                                                  fit: BoxFit.cover,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                new Text(
                                                  selectedType,
                                                  style: hintTextStyle.copyWith(
                                                      color:
                                                      ThemeService.isSavedDarkMode()
                                                          ? hintTextColorD
                                                          : hintTextColorL),
                                                ),
                                              ],
                                            ),
                                          ),
                                          value: selectedType,
                                        );
                                      }).toList(),
                                    )),
                              ),
                            ),
                            SizedBox(
                              // height: 10,
                              width: 10,
                            ),
                            Expanded(
                              flex: 3,
                              child: CustomInputField2(
                                hint: 'Cable Length',
                                prefix: Image.asset(
                                  cableLength,
                                  height: 25,
                                  width: 25,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Row(
                              children: [
                                Switch(
                                  value: isKM,
                                  onChanged: (v) {
                                    isKM = v;
                                    setState(() {});
                                  },
                                  activeColor: redColor,
                                  activeTrackColor: redColorDeep,
                                ),
                                Text(
                                  'km/miles',
                                  style: regularTextStyle.copyWith(
                                    color: ThemeService.isSavedDarkMode()
                                        ? whiteTxtColor
                                        : blackTxtColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 4,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomButton(
                                    text: 'Select a Preset',
                                    color: redColor,
                                    onPressed: () {
                                      Get.to(ScreenAddCustomCable());
                                    },
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  CustomButton(
                                    text: 'Confirm',
                                    onPressed: () {
                                      showDialog(context: context, builder: (BuildContext context) {
                                        return CustomConfirmDialogue(context);
                                      }, );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: MediaQuery.of(context).size.width <900?Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Resistance',
                                  style: mediumTextStyle.copyWith(
                                    color: ThemeService.isSavedDarkMode()
                                        ? whiteTxtColor
                                        : blackTxtColor,
                                  ),
                                ),
                                Container(
                                  width: 110,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      color: ThemeService.isSavedDarkMode()
                                          ? FieldbgColorD
                                          : FieldbgColorL),
                                  child: TextFormField(
                                    controller: resistanceC,
                                    style: hintTextStyle.copyWith(
                                        color: ThemeService.isSavedDarkMode()
                                            ? hintTextColorD
                                            : hintTextColorL),
                                    keyboardType: TextInputType.number,
                                    cursorColor: redColor,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                            top: 12, bottom: 12, left: 10),
                                        hintStyle: hintTextStyle.copyWith(
                                            color: ThemeService.isSavedDarkMode()
                                                ? hintTextColorD
                                                : hintTextColorL),
                                        suffixIcon: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                var v =
                                                    int.parse(resistanceC.text);
                                                setState(() {
                                                  v++;
                                                  resistanceC.text = v.toString();
                                                });
                                              },
                                              child: Image.asset(
                                                upImage,
                                                height: 18,
                                                width: 18,
                                              ),
                                            ),
                                            InkWell(
                                                onTap: () {
                                                  var v =
                                                      int.parse(resistanceC.text);
                                                  setState(() {
                                                    v--;
                                                    resistanceC.text =
                                                        v.toString();
                                                  });
                                                },
                                                child: Image.asset(
                                                  downImage,
                                                  height: 18,
                                                  width: 18,
                                                )),
                                          ],
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.circular(14),
                                        )),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Capacitance',
                                  style: mediumTextStyle.copyWith(
                                    color: ThemeService.isSavedDarkMode()
                                        ? whiteTxtColor
                                        : blackTxtColor,
                                  ),
                                ),
                                Container(
                                  width: 110,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      color: ThemeService.isSavedDarkMode()
                                          ? FieldbgColorD
                                          : FieldbgColorL),
                                  child: TextFormField(
                                    controller: capacitanceC,
                                    style: hintTextStyle.copyWith(
                                        color: ThemeService.isSavedDarkMode()
                                            ? hintTextColorD
                                            : hintTextColorL),
                                    keyboardType: TextInputType.number,
                                    cursorColor: redColor,
                                    decoration: InputDecoration(
                                        hintStyle: hintTextStyle.copyWith(
                                            color: ThemeService.isSavedDarkMode()
                                                ? hintTextColorD
                                                : hintTextColorL),
                                        suffixIcon: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                var v =
                                                    int.parse(capacitanceC.text);
                                                setState(() {
                                                  v++;
                                                  capacitanceC.text =
                                                      v.toString();
                                                });
                                              },
                                              child: Image.asset(
                                                upImage,
                                                height: 18,
                                                width: 18,
                                              ),
                                            ),
                                            InkWell(
                                                onTap: () {
                                                  var v =
                                                      int.parse(capacitanceC.text);
                                                  setState(() {
                                                    v--;
                                                    capacitanceC.text =
                                                        v.toString();
                                                  });
                                                },
                                                child: Image.asset(
                                                  downImage,
                                                  height: 18,
                                                  width: 18,
                                                )),
                                          ],
                                        ),
                                        contentPadding: EdgeInsets.only(
                                            top: 12, bottom: 12, left: 10),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.circular(14),
                                        )),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Impedance',
                                  style: mediumTextStyle.copyWith(
                                    color: ThemeService.isSavedDarkMode()
                                        ? whiteTxtColor
                                        : blackTxtColor,
                                  ),
                                ),
                                Container(
                                  width: 110,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      color: ThemeService.isSavedDarkMode()
                                          ? FieldbgColorD
                                          : FieldbgColorL),
                                  child: TextFormField(
                                    controller: impedanceC,
                                    style: hintTextStyle.copyWith(
                                        color: ThemeService.isSavedDarkMode()
                                            ? hintTextColorD
                                            : hintTextColorL),
                                    keyboardType: TextInputType.number,
                                    cursorColor: redColor,
                                    decoration: InputDecoration(
                                        hintStyle: hintTextStyle.copyWith(
                                            color: ThemeService.isSavedDarkMode()
                                                ? hintTextColorD
                                                : hintTextColorL),
                                        suffixIcon: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                var v =
                                                    int.parse(impedanceC.text);
                                                setState(() {
                                                  v++;
                                                  impedanceC.text = v.toString();
                                                });
                                              },
                                              child: Image.asset(
                                                upImage,
                                                height: 18,
                                                width: 18,
                                              ),
                                            ),
                                            InkWell(
                                                onTap: () {
                                                  var v =
                                                      int.parse(impedanceC.text);
                                                  setState(() {
                                                    v--;
                                                    impedanceC.text =
                                                        v.toString();
                                                  });
                                                },
                                                child: Image.asset(
                                                  downImage,
                                                  height: 18,
                                                  width: 18,
                                                )),
                                          ],
                                        ),
                                        contentPadding: EdgeInsets.only(
                                            top: 12, bottom: 12, left: 10),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.circular(14),
                                        )),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              onTap: (){
                                showDialog(context: context, builder: (BuildContext context) {
                                  return CustomWarningDialogue();
                                }, );
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 35),
                                margin: EdgeInsets.symmetric(
                                  vertical: 20,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: lightBlueColor,
                                ),
                                child: Text(
                                  'Update',
                                  style: buttonTextStyle_bold.copyWith(
                                      color: blueColor),
                                ),
                              ),
                            ),
                          ],
                        ):
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Expanded(
                              flex: 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Resistance',
                                    style: mediumTextStyle.copyWith(
                                      color: ThemeService.isSavedDarkMode()
                                          ? whiteTxtColor
                                          : blackTxtColor,
                                    ),
                                  ),
                                  Container(
                                    width: 110,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        color: ThemeService.isSavedDarkMode()
                                            ? FieldbgColorD
                                            : FieldbgColorL),
                                    child: TextFormField(
                                      controller: resistanceC,
                                      style: hintTextStyle.copyWith(
                                          color: ThemeService.isSavedDarkMode()
                                              ? hintTextColorD
                                              : hintTextColorL),
                                      keyboardType: TextInputType.number,
                                      cursorColor: redColor,
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                              top: 12, bottom: 12, left: 10),
                                          hintStyle: hintTextStyle.copyWith(
                                              color: ThemeService.isSavedDarkMode()
                                                  ? hintTextColorD
                                                  : hintTextColorL),
                                          suffixIcon: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  var v =
                                                      int.parse(resistanceC.text);
                                                  setState(() {
                                                    v++;
                                                    resistanceC.text = v.toString();
                                                  });
                                                },
                                                child: Image.asset(
                                                  upImage,
                                                  height: 18,
                                                  width: 18,
                                                ),
                                              ),
                                              InkWell(
                                                  onTap: () {
                                                    var v =
                                                        int.parse(resistanceC.text);
                                                    setState(() {
                                                      v--;
                                                      resistanceC.text =
                                                          v.toString();
                                                    });
                                                  },
                                                  child: Image.asset(
                                                    downImage,
                                                    height: 18,
                                                    width: 18,
                                                  )),
                                            ],
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.circular(14),
                                          )),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Capacitance',
                                    style: mediumTextStyle.copyWith(
                                      color: ThemeService.isSavedDarkMode()
                                          ? whiteTxtColor
                                          : blackTxtColor,
                                    ),
                                  ),
                                  Container(
                                    width: 110,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        color: ThemeService.isSavedDarkMode()
                                            ? FieldbgColorD
                                            : FieldbgColorL),
                                    child: TextFormField(
                                      controller: capacitanceC,
                                      style: hintTextStyle.copyWith(
                                          color: ThemeService.isSavedDarkMode()
                                              ? hintTextColorD
                                              : hintTextColorL),
                                      keyboardType: TextInputType.number,
                                      cursorColor: redColor,
                                      decoration: InputDecoration(
                                          hintStyle: hintTextStyle.copyWith(
                                              color: ThemeService.isSavedDarkMode()
                                                  ? hintTextColorD
                                                  : hintTextColorL),
                                          suffixIcon: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  var v =
                                                      int.parse(capacitanceC.text);
                                                  setState(() {
                                                    v++;
                                                    capacitanceC.text =
                                                        v.toString();
                                                  });
                                                },
                                                child: Image.asset(
                                                  upImage,
                                                  height: 18,
                                                  width: 18,
                                                ),
                                              ),
                                              InkWell(
                                                  onTap: () {
                                                    var v =
                                                        int.parse(capacitanceC.text);
                                                    setState(() {
                                                      v--;
                                                      capacitanceC.text =
                                                          v.toString();
                                                    });
                                                  },
                                                  child: Image.asset(
                                                    downImage,
                                                    height: 18,
                                                    width: 18,
                                                  )),
                                            ],
                                          ),
                                          contentPadding: EdgeInsets.only(
                                              top: 12, bottom: 12, left: 10),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.circular(14),
                                          )),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Impedance',
                                    style: mediumTextStyle.copyWith(
                                      color: ThemeService.isSavedDarkMode()
                                          ? whiteTxtColor
                                          : blackTxtColor,
                                    ),
                                  ),
                                  Container(
                                    width: 110,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        color: ThemeService.isSavedDarkMode()
                                            ? FieldbgColorD
                                            : FieldbgColorL),
                                    child: TextFormField(
                                      controller: impedanceC,
                                      style: hintTextStyle.copyWith(
                                          color: ThemeService.isSavedDarkMode()
                                              ? hintTextColorD
                                              : hintTextColorL),
                                      keyboardType: TextInputType.number,
                                      cursorColor: redColor,
                                      decoration: InputDecoration(
                                          hintStyle: hintTextStyle.copyWith(
                                              color: ThemeService.isSavedDarkMode()
                                                  ? hintTextColorD
                                                  : hintTextColorL),
                                          suffixIcon: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  var v =
                                                      int.parse(impedanceC.text);
                                                  setState(() {
                                                    v++;
                                                    impedanceC.text = v.toString();
                                                  });
                                                },
                                                child: Image.asset(
                                                  upImage,
                                                  height: 18,
                                                  width: 18,
                                                ),
                                              ),
                                              InkWell(
                                                  onTap: () {
                                                    var v =
                                                        int.parse(impedanceC.text);
                                                    setState(() {
                                                      v--;
                                                      impedanceC.text =
                                                          v.toString();
                                                    });
                                                  },
                                                  child: Image.asset(
                                                    downImage,
                                                    height: 18,
                                                    width: 18,
                                                  )),
                                            ],
                                          ),
                                          contentPadding: EdgeInsets.only(
                                              top: 12, bottom: 12, left: 10),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.circular(14),
                                          )),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: (){
                                showDialog(context: context, builder: (BuildContext context) {
                                  return CustomWarningDialogue();
                                }, );
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 35),
                                margin: EdgeInsets.symmetric(
                                  vertical: 20,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: lightBlueColor,
                                ),
                                child: Text(
                                  'Update',
                                  style: buttonTextStyle_bold.copyWith(
                                      color: blueColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width <800?MediaQuery.of(context).size.width:MediaQuery.of(context).size.width/2,
                  margin: EdgeInsets.only(top: 8),
                  // padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: ThemeService.isSavedDarkMode()
                        ? FieldbgColorD
                        : FieldbgColorL,
                    border: Border.all(
                        width: 1.3,
                        color: ThemeService.isSavedDarkMode()
                            ? whiteTxtColor.withOpacity(.20)
                            : blackTxtColor.withOpacity(.20)),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                    hint: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            cableImage,
                            height: 25,
                            width: 25,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Select Cable',
                            style: hintTextStyle.copyWith(
                                color: ThemeService.isSavedDarkMode()
                                    ? hintTextColorD
                                    : hintTextColorL),
                          ),
                        ],
                      ),
                    ),
                    icon: Icon(
                      Icons.arrow_drop_down_rounded,
                      size: 40,
                      color: redColor,
                    ),
                    iconSize: 20,
                    borderRadius: BorderRadius.circular(14),
                    isExpanded: true,
                    onChanged: (newValue) {
                      setState(() {
                        selectedCable1 = newValue.toString();
                      });
                    },
                    value: selectedCable1.isNotEmpty ? selectedCable1 : null,
                    items: selectedCableList1.map((selectedType) {
                      return DropdownMenuItem(
                        child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                cableImage,
                                height: 25,
                                width: 25,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              new Text(
                                selectedType,
                                style: hintTextStyle.copyWith(
                                    color: ThemeService.isSavedDarkMode()
                                        ? hintTextColorD
                                        : hintTextColorL),
                              ),
                            ],
                          ),
                        ),
                        value: selectedType,
                      );
                    }).toList(),
                  )),
                ),
                SizedBox(
                  height: 20,
                ),
               MediaQuery.of(context).size.width < 900? Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   ItemChart(chartDataList1: data1, chartDataList2: data2,title: 'Resistance Value',),
                   SizedBox(
                     height: 20,
                   ),
                   ItemChart(chartDataList1: data1, chartDataList2: data2,title: 'Capacitance Value',),
                   SizedBox(
                     height: 20,
                   ),
                   ItemChart(chartDataList1: data1, chartDataList2: data2,title: 'Impedance Value',),
                 ],
               ): Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Expanded(
                       child: ItemChart(chartDataList1: data1, chartDataList2: data2,title: 'Resistance Value',)),
                   SizedBox(
                     width: 20,
                   ),
                   Expanded(child: ItemChart(chartDataList1: data1, chartDataList2: data2,title: 'Capacitance Value',)),
                   SizedBox(
                     width: 20,
                   ),
                   Expanded(child: ItemChart(chartDataList1: data1, chartDataList2: data2,title: 'Impedance Value',)),
                 ],
               ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
