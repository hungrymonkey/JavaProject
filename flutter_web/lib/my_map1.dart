import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'my_scatter.dart';
import 'my_appbar.dart';

class MyMapPage1 extends StatefulWidget {
  MyMapPage1({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyMapPageState1 createState() => _MyMapPageState1();
}

class _MyMapPageState1 extends State<MyMapPage1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      LinearSales(0, 5, 3.0),
      LinearSales(10, 25, 5.0),
      LinearSales(12, 75, 4.0),
      LinearSales(13, 225, 5.0),
      LinearSales(16, 50, 4.0),
      LinearSales(24, 75, 3.0),
      LinearSales(25, 100, 3.0),
      LinearSales(34, 150, 5.0),
      LinearSales(37, 10, 4.5),
      LinearSales(45, 300, 8.0),
      LinearSales(52, 15, 4.0),
      LinearSales(56, 200, 7.0),
    ];

    final maxMeasure = 300;

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        // Providing a color function is optional.
        colorFn: (LinearSales sales, _) {
          // Bucket the measure column value into 3 distinct colors.
          final bucket = sales.sales / maxMeasure;

          if (bucket < 1 / 3) {
            return charts.MaterialPalette.blue.shadeDefault;
          } else if (bucket < 2 / 3) {
            return charts.MaterialPalette.red.shadeDefault;
          } else {
            return charts.MaterialPalette.green.shadeDefault;
          }
        },
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        // Providing a radius function is optional.
        radiusPxFn: (LinearSales sales, _) => sales.radius,
        data: data,
      )
    ];
  }
  static LatLng kColumbusOhio = LatLng(39.9612, -82.9988);
  var locationMap = AspectRatio( 
      aspectRatio: 1,
      child: FlutterMap(
        options: MapOptions(
          center: kColumbusOhio,
          zoom: 12.0,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayerOptions(
            markers: [
              Marker(
                width: 40.0,
                height: 40.0,
                point: kColumbusOhio,
                builder: (context) =>
                Container(
                  child: Icon(Icons.location_on),
                ),
                ),
              ],
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: buildAppbar(),
      drawer: buildDrawer(context),
      body: SingleChildScrollView(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Center(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(30), 
                child: Text(widget.title, style: Theme.of(context).textTheme.headline2),
              ),
              Wrap(
                children: <Widget>[
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 300, maxHeight: 300),
                    child: SimpleScatterPlotChart(
                      _createSampleData(),
                      // Disable animations for image tests.
                      animate: false,
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 300, maxHeight: 300),
                    child: locationMap,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    

  }
}

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;
  final double radius;

  LinearSales(this.year, this.sales, this.radius);
}
