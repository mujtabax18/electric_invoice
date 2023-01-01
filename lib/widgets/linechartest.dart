import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:electric_invoice/styles/colors.dart';
import 'package:electric_invoice/model/chartdatamodel.dart';
class Spline_test extends StatefulWidget {
  const Spline_test({
    Key? key,
    required this.chartData1,
    required this.chartData2,
    required this.chartData3,
    required this.chartData4,
    required this.color1,
    required this.color2,
    required this.color3,
    required this.color4,
    required this.labelList,
    this.colorAlpha:10,
  }) : super(key: key);
  final List<ChartData> chartData4;
  final List<ChartData> chartData1;
  final List<ChartData> chartData2;
  final List<ChartData> chartData3;
  final Color color1;
  final Color color2;
  final Color color3;
  final Color color4;
  final  int colorAlpha;
  final List<String> labelList;

  @override
  State<Spline_test> createState() => _Spline_testState();
}

class _Spline_testState extends State<Spline_test> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 10/2,
          // Legends setting
          child: Container(
            padding: EdgeInsets.only(
              left: 16,top: 16,right: 16,
            ),
            child: Row(
              mainAxisAlignment:MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ChartLabel(color: widget.color1, text: widget.labelList[0],),
                    SizedBox(height: 8,),
                    ChartLabel(color: widget.color2, text: widget.labelList[1],),
                  ],
                ),
                SizedBox(),
                SizedBox(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ChartLabel(color: widget.color3, text: widget.labelList[2],),
                    SizedBox(height: 8,),
                    ChartLabel(color: widget.color4, text: widget.labelList[3],),
                  ],
                ),
              ],
            ),
          ),
        ),
        AspectRatio(
          aspectRatio: 10/7,
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: SfCartesianChart(
              backgroundColor: kColorWhite,
                  enableAxisAnimation: true,
                series: <ChartSeries>[
                  SplineAreaSeries<ChartData, int>(
                      dataSource: widget.chartData1,
                      // Type of spline
                      splineType: SplineType.cardinal,
                      markerSettings: MarkerSettings(isVisible: true,color: widget.color1),
                      borderColor:  widget.color1,
                     borderWidth: 2,
                     color:  widget.color1.withAlpha(widget.colorAlpha),
                      cardinalSplineTension: 0.9,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y,
                  ),
                  SplineAreaSeries<ChartData, int>(
                      dataSource: widget.chartData2,
                      // Type of spline
                      splineType: SplineType.cardinal,
                      markerSettings: MarkerSettings(isVisible: true,color:  widget.color2),
                      borderColor:  widget.color2,
                      borderWidth: 2,
                      color:  widget.color2.withAlpha(widget.colorAlpha),
                      cardinalSplineTension: 0.9,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y
                  ),
                  SplineAreaSeries<ChartData, int>(
                      dataSource: widget.chartData3,
                      // Type of spline
                      splineType: SplineType.cardinal,
                      markerSettings: MarkerSettings(isVisible: true,color:  widget.color3),
                      borderColor:  widget.color3,
                      borderWidth: 2,
                      color:  widget.color3.withAlpha(widget.colorAlpha),
                      cardinalSplineTension: 0.9,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y
                  ),
                  SplineAreaSeries<ChartData, int>(
                      dataSource: widget.chartData4,
                      // Type of spline
                      splineType: SplineType.cardinal,
                      markerSettings: MarkerSettings(isVisible: true,color:  widget.color4),
                      borderColor:  widget.color4,
                      borderWidth: 2,
                      color:  widget.color4.withAlpha(widget.colorAlpha),
                      cardinalSplineTension: 0.9,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y
                  )
                ]
            ),
          ),
        ),
      ],
    )
    ;
  }


}

class ChartLabel extends StatelessWidget {
  const ChartLabel({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 11,
          width: 11,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        SizedBox(width: 8,),
        Text(text,style:TextStyle(
            color:kColorGrey,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),),

      ],
    );
  }
}

