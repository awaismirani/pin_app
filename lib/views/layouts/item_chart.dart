import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helpers/services/color_services.dart';
import '../../helpers/theme_services.dart';

class ItemChart extends StatefulWidget {
  ItemChart({
    required this.chartDataList1,
    required this.chartDataList2,
    required this.title,
});
 List<FlSpot> chartDataList1 = [];
 List<FlSpot> chartDataList2 = [];
 String title ;
  @override
  _ItemChartState createState() => _ItemChartState();
}

class _ItemChartState extends State<ItemChart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16,bottom: 16,right: 25,),
      width: MediaQuery.of(context).size.width,
      // width: MediaQuery.of(context).size.width > 500 ?400:MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: ThemeService.isSavedDarkMode()
              ? grapghbackColorD
              : grapghbackColorL),
      height: 380,
      child: Column(
        children: [
          Text(
            widget.title.toString(),
            style: chartTextStyle.copyWith(
                color: ThemeService.isSavedDarkMode()
                    ? whiteTxtColor
                    : blackTxtColor),
          ),
          SizedBox(
            height: 25,
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: LineChart(
              swapAnimationCurve :Curves.linearToEaseOut,
                LineChartData(
                  gridData: FlGridData(
                      show: true,
                      horizontalInterval: 20,
                      drawVerticalLine: false,
                      getDrawingHorizontalLine: (value) {
                        return FlLine(
                          color: ThemeService.isSavedDarkMode() ? whiteTxtColor.withOpacity(.20) : blackTxtColor.withOpacity(.20),
                          strokeWidth: 1,
                        );
                      },
                      drawHorizontalLine: true),
                  titlesData: FlTitlesData(
                    rightTitles: AxisTitles(drawBehindEverything: false,),
                    topTitles: AxisTitles(drawBehindEverything: false),

                  ),

                  borderData: FlBorderData(show: false),
                  minX: 0,
                  maxX: 100,
                  minY: 0,
                  maxY: 100,
                  lineBarsData: [
                    LineChartBarData(
                      spots: widget.chartDataList1,
                      isCurved: true,
                      color: redColor,
                      // shadow: Shadow(color: redColor.withOpacity(.3),blurRadius: 10),
                      dotData: FlDotData(
                          show: false), // Hide dots for this line
                    ),
                    LineChartBarData(
                      spots: widget.chartDataList2,
                      isCurved: true,
                      color: blueColor,
                      shadow: Shadow(color: blueColor.withOpacity(.7),blurRadius: 5),
                      dotData: FlDotData(
                          show: true), // Show dots for this line
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: blueColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Cable',
                    style: chartSmallTextStyle.copyWith(
                        color: ThemeService.isSavedDarkMode()
                            ? whiteTxtColor
                            : blackTxtColor),
                  ),
                ],
              ),
              SizedBox(
                width: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: redColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Cable',
                    style: chartSmallTextStyle.copyWith(
                        color: ThemeService.isSavedDarkMode()
                            ? whiteTxtColor
                            : blackTxtColor),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
