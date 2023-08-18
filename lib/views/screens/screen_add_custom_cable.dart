import 'package:flutter/material.dart';
import 'package:pin_app/helpers/constant.dart';
import '../../helpers/services/color_services.dart';
import '../../helpers/theme_services.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_confirm_dialogue.dart';
import '../../widgets/custom_input_field2.dart';
import '../layouts/item_cable_preset.dart';

class ScreenAddCustomCable extends StatefulWidget {
  ScreenAddCustomCable({Key? key}) : super(key: key);

  @override
  State<ScreenAddCustomCable> createState() => _ScreenAddCustomCableState();
}

class _ScreenAddCustomCableState extends State<ScreenAddCustomCable> {
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

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = 1;
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 800) {
      crossAxisCount = 1;
    } else if (screenWidth < 900) {
      crossAxisCount = 2;
    } else {
      crossAxisCount = 3;
    }
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor:
        ThemeService.isSavedDarkMode() ? sfbackColorD : sfbackColorL,
        elevation: 0,
        centerTitle: true,
        title: Text('Add Custom Cable',
            maxLines: 2,
            textAlign: TextAlign.center,
            style: main_hStyle_bold.copyWith(
                color: ThemeService.isSavedDarkMode()
                    ? whiteTxtColor
                    : blackTxtColor)),
      ),
      backgroundColor:
      ThemeService.isSavedDarkMode() ? sfbackColorD : sfbackColorL,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: ThemeService.isSavedDarkMode()
                        ? grapghbackColorD
                        : grapghbackColorL),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MediaQuery.of(context).size.width <900?Column(
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
                    ],
                  ):
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
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
                          width: 10,
                        ),
                        Expanded(
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
                        Expanded(
                          child: Row(
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
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MediaQuery.of(context).size.width <903?
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                        Center(
                          child: CustomButton(text: 'Add New Cable',
                              color: blueColor,
                              onPressed: (){
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return CustomConfirmDialogue(context);
                                  },
                                );
                              }),
                        ),
                      ],
                    ):
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
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
                        CustomButton(text: 'Add New Cable',
                            color: blueColor,
                            onPressed: (){
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return CustomConfirmDialogue(context);
                                },
                              );
                            }),
                      ],
                    )
                  ]
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text('Cable Presets',
                style: big_hStyle.copyWith(color:  ThemeService.isSavedDarkMode()
                  ? whiteTxtColor
                  : blackTxtColor),),
              SizedBox(height: 20,),
              GridView.builder(
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.width<500?(105 * crossAxisCount):(100 * crossAxisCount)), // Fix height to 150
                ),
                itemCount: 6, // Replace with your actual item count
                itemBuilder: (context, index) {
                  return ItemCablePreset(title: 'Cable1', subTitle: 'Cable Length', onPressed: () { },);
                },
              ),
              SizedBox(height: 10,),
            ],
          ),
        ),
      ),

    );
  }
}

