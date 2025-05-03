// // import 'package:fl_chart/fl_chart.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:syncfusion_flutter_charts/charts.dart';
// // import 'package:syncfusion_flutter_charts/sparkcharts.dart';

// // class LineChartWidget extends StatefulWidget {
// //   @override
// //   State<LineChartWidget> createState() => _LineChartWidgetState();
// // }

// // class _LineChartWidgetState extends State<LineChartWidget> {

// //   @override
// //   Widget build(BuildContext context) {
// //     return SizedBox(
// //         height: 250.h,
// //         width: 30,

// //         child: Center(
// //             child: Container(
// //                 child: SfCartesianChart(
// //                     primaryXAxis: CategoryAxis(),
// //                     // Chart title
// //                     title: ChartTitle(text: 'Half yearly sales analysis'),
// //                     // Enable legend
// //                     legend: Legend(isVisible: true),
// //                     // Enable tooltip
// //                     // tooltipBehavior: _tooltipBehavior,
// //                     series: <LineSeries<SalesData, String>>[
// //               LineSeries<SalesData, String>(
// //                   dataSource: <SalesData>[
// //                     SalesData('Jan', 35),
// //                     SalesData('Feb', 28),
// //                     SalesData('Mar', 34),
// //                     SalesData('Apr', 32),
// //                     SalesData('May', 40)
// //                   ],
// //                   xValueMapper: (SalesData sales, _) => sales.month,
// //                   yValueMapper: (SalesData sales, _) => sales.sales,
// //                   // Enable data label
// //                   dataLabelSettings: DataLabelSettings(isVisible: true))
// //             ])))

// //         );
// //   }
// // }

// // class SalesData {
// //   SalesData(this.month, this.sales);
// //   final String month;
// //   final double sales;
// // }
// import 'package:flutter/material.dart';
// import 'package:fruitfly/app/storage/keys.dart';
// import 'package:fruitfly/app/storage/storage.dart';
// import 'package:intl/intl.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// // Main function to run the app

// // Model classes for parsing JSON data
// class GetFliesModels {
//   final bool? success;
//   final String? message;
//   final List<Payload>? payload;

//   GetFliesModels({
//     this.success,
//     this.message,
//     this.payload,
//   });

//   factory GetFliesModels.fromJson(Map<String, dynamic> json) => GetFliesModels(
//         success: json["success"],
//         message: json["message"],
//         payload: json["payload"] == null
//             ? []
//             : List<Payload>.from(
//                 json["payload"]!.map((x) => Payload.fromJson(x))),
//       );
// }

// class Payload {
//   final DateTime? dateTime;
//   final int? quantity;

//   Payload({
//     this.dateTime,
//     this.quantity,
//   });

//   factory Payload.fromJson(Map<String, dynamic> json) => Payload(
//         dateTime: json["date_time"] == null
//             ? null
//             : DateTime.parse(json["date_time"]),
//         quantity: json["quantity"],
//       );
// }

// class SalesData {
//   SalesData(this.date, this.quantity);
//   final DateTime date;
//   final int quantity;
// }

// // Screen widget to display the chart
// class SalesChartScreen extends StatefulWidget {
//   const SalesChartScreen({super.key});

//   @override
//   _SalesChartScreenState createState() => _SalesChartScreenState();
// }

// class _SalesChartScreenState extends State<SalesChartScreen> {
//   late TooltipBehavior _tooltipBehavior;

//   @override
//   void initState() {
//     _tooltipBehavior = TooltipBehavior(enable: true);
//     super.initState();
//   }

//   Future<GetFliesModels> fetchSalesDatas() async {
//     final response = await http.get(
//         Uri.parse('https://foodfly.saeedantechpvt.com/api/user/detectedfly'));
//     if (response.statusCode == 200) {
//       return GetFliesModels.fromJson(json.decode(response.body));
//     } else {
//       throw Exception('Failed to load sales data');
//     }
//   }

//   Future<GetFliesModels> fetchSalesData() async {
//     try {
//       var url =
//           Uri.parse('https://foodfly.saeedantechpvt.com/api/user/detectedfly');

//       var response = await http.get(
//         url,
//         headers: {
//           'Content-Type': 'application/json', // Adjust content type if needed
//           'Authorization':
//               'Bearer ${StorageServices.to.getString(usertoken)}', // Replace with your actual token
//         },
//       );

//       if (response.statusCode == 200) {
//         var data = jsonDecode(response.body);
//         // Handle your response data here
//         var totalQuantity = 0;
//         var returndata = GetFliesModels.fromJson(data);

// // Use fold to calculate the total quantity
//         // totalQuantity =
//         //     returndata.payload!.fold(0, (sum, item) => sum + item.quantity!);

//         // if (totalQuantity >= 20 && !alertShown) {
//         //   showAlert();
//         //   notificationsRepository.sendNotification("Alert", "The insects ");
//         // }
//         return returndata;
//       } else {
//         print('Request failed with status: ${response.statusCode}');
//         print('Response body: ${response.body}');
//         // Handle error responses here
//         throw Exception();
//       }
//     } catch (e) {
//       print('Error: $e');
//       // Handle network or other errors here
//       throw Exception();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final DateTime today = DateTime.now();
//     final DateTime sevenDaysAgo = today.subtract(Duration(days: 7));

//     return Scaffold(
//       // appBar: AppBar(title: Text("Fruitfly Detection")),
//       body: FutureBuilder<GetFliesModels>(
//         future: fetchSalesData(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.payload!.isEmpty) {
//             return const Center(child: Text('No data available'));
//           }

//           final chartData = snapshot.data!.payload!
//               .map((payload) => SalesData(payload.dateTime!, payload.quantity!))
//               .toList();

//           return Center(
//             child: SfCartesianChart(
//               // primaryXAxis: DateTimeAxis(
//               //   dateFormat: DateFormat.yMMMd(), // Formatting the date
//               //   intervalType: DateTimeIntervalType.days,
//               //   interval: 1,
//               // ),
//               primaryXAxis: DateTimeAxis(
//                 minimum: sevenDaysAgo,
//                 maximum: today,
//                 intervalType: DateTimeIntervalType.days,
//                 interval: 1,
//                 dateFormat: DateFormat('MM/dd'),
//               ),
//               primaryYAxis: NumericAxis(
//                 minimum: 0,
//                 maximum: 60,
//                 interval: 10,
//               ),
//               title: const ChartTitle(text: ''),
//               legend: const Legend(isVisible: true),
//               tooltipBehavior: _tooltipBehavior,
//               series: <LineSeries<SalesData, DateTime>>[
//                 LineSeries<SalesData, DateTime>(
//                   dataSource: chartData,
//                   xValueMapper: (SalesData sales, _) => sales.date,
//                   yValueMapper: (SalesData sales, _) => sales.quantity,
//                   dataLabelSettings: const DataLabelSettings(isVisible: true),
//                 )
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:fruitfly/app/resources/colors.dart';
import 'package:fruitfly/app/storage/keys.dart';
import 'package:fruitfly/app/storage/storage.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class GetFliesModels {
  final bool? success;
  final String? message;
  final List<Payload>? payload;

  GetFliesModels({this.success, this.message, this.payload});

  factory GetFliesModels.fromJson(Map<String, dynamic> json) => GetFliesModels(
        success: json["success"],
        message: json["message"],
        payload: json["payload"] == null
            ? []
            : List<Payload>.from(
                json["payload"]!.map((x) => Payload.fromJson(x))),
      );
}

class Payload {
  final DateTime? dateTime;
  final int? quantity;

  Payload({this.dateTime, this.quantity});

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        dateTime: json["date_time"] == null
            ? null
            : DateTime.parse(json["date_time"]),
        quantity: json["quantity"],
      );
}

class SalesData {
  SalesData(this.date, this.quantity);
  final DateTime date;
  final int quantity;
}

class SalesChartScreen extends StatefulWidget {
  const SalesChartScreen({super.key});

  @override
  _SalesChartScreenState createState() => _SalesChartScreenState();
}

class _SalesChartScreenState extends State<SalesChartScreen> {
  late ZoomPanBehavior _zoomPanBehavior;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    _zoomPanBehavior = ZoomPanBehavior(
      enablePanning: true,
      enableDoubleTapZooming: true,
    );
    super.initState();
  }

  Future<GetFliesModels> fetchSalesData() async {
    try {
      var url =
          Uri.parse('https://foodfly.saeedantechpvt.com/api/user/detectedfly');
      var response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${StorageServices.to.getString(usertoken)}',
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        // Handle your response data here

        var returndata = GetFliesModels.fromJson(data);

// Use fold to calculate the total quantity
        // totalQuantity =
        //     returndata.payload!.fold(0, (sum, item) => sum + item.quantity!);

        // if (totalQuantity >= 20 && !alertShown) {
        //   showAlert();
        //   notificationsRepository.sendNotification("Alert", "The insects ");
        // }
        return returndata;
      } else {
        throw Exception('Failed to load flies data');
      }
    } catch (e) {
      throw Exception('Failed to load flies data');
    }
  }

  @override
  Widget build(BuildContext context) {
    final DateTime today = DateTime.now();
    final DateTime sevenDaysAgo = today.subtract(const Duration(days: 7));

    return Scaffold(
      body: FutureBuilder<GetFliesModels>(
        future: fetchSalesData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.payload!.isEmpty) {
            return const Center(
                child: Text(
              'No data available, Please upload image!',
              style: TextStyle(color: blackcolor),
            ));
          }

          List<SalesData> chartData = snapshot.data!.payload!
              .map((payload) => SalesData(payload.dateTime!, payload.quantity!))
              .toList();
          chartData.sort((a, b) => a.date.compareTo(b.date));

          return Center(
            child: SfCartesianChart(
              // primaryXAxis: DateTimeAxis(
              //   dateFormat: DateFormat.yMMMd(), // Formatting the date
              //   intervalType: DateTimeIntervalType.days,
              //   interval: 1,
              // ),

              primaryXAxis: DateTimeAxis(
                minimum: sevenDaysAgo,
                maximum: today,
                intervalType: DateTimeIntervalType.days,
                interval: 1,
                dateFormat: DateFormat('MM/dd'),
                labelAlignment: LabelAlignment.start,
              ),
              primaryYAxis: const NumericAxis(
                minimum: 0,
                maximum: 60,
                interval: 10,
              ),

              tooltipBehavior: _tooltipBehavior,
              series: <CartesianSeries<SalesData, DateTime>>[
                ColumnSeries<SalesData, DateTime>(
                  width: 0.2,
                  dataSource: chartData,
                  xValueMapper: (SalesData sales, _) => sales.date,
                  yValueMapper: (SalesData sales, _) => sales.quantity,
                  dataLabelSettings: const DataLabelSettings(
                      isVisible: true, margin: EdgeInsets.only(right: 5)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
