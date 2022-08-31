import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';
import 'dart:ui';
import 'package:lng/controllers/onPressController.dart';
import 'package:lng/screens/screen-components/table-view.dart';



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final pressController = Get.put(PressedState());

  @override
  void initState() {
    setState(() {
      addMarkers();
    });
    super.initState();
  }

  GoogleMapController? mapController; //contrller for Google map
  static const LatLng showLocation =
  const LatLng(40.719109, -74.000183); //location to show in map

  Set<Marker> markers = Set(); //markers for google map

  Set<Marker> marker = Set();

  addMarkers() async {
    BitmapDescriptor markerbitmap = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      "assets/images/red.png",
    );

    BitmapDescriptor markerbitmapL2 = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      "assets/images/blue.png",
    );
    BitmapDescriptor markerbitmapL3 = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      "assets/images/green.png",
    );

    BitmapDescriptor markerDelivery = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      "assets/images/delivery_man_marker.png",
    );

    marker.add(Marker(
      //add start location marker
      markerId: MarkerId("1.289440, 103.849980"),
      position: LatLng(1.289440, 103.849980),
      infoWindow: InfoWindow(
        //popup info
        title: 'Loc 1 ',
        snippet: '1.289440, 103.849980',
      ),
      icon: markerDelivery, //Icon for Marker
    ));

    marker.add(Marker(
      //add start location marker
      markerId: MarkerId("1.3311606377711733,103.7033139540567"),
      position: LatLng(1.3311606377711733, 103.7033139540567),
      rotation: -45,
      infoWindow: InfoWindow(
        //popup info
        title: 'Loc 2',
        snippet: '1.3311606377711733,103.7033139540567',
      ),
      icon: markerbitmapL2, //Icon for Marker
    ));

    marker.add(Marker(
      //add start location marker
      markerId: MarkerId("1.386774284868601, 103.76644590710862"),
      position: LatLng(1.386774284868601, 103.76644590710862),
      rotation: -45,
      infoWindow: InfoWindow(
        //popup info
        title: 'Loc 3',
        snippet: '1.386774284868601, 103.76644590710862',
      ),
      icon: markerbitmapL3, //Icon for Marker
    ));

    markers.add(Marker(
      //add start location marker
      markerId: MarkerId("1.289440, 103.849980"),
      position: LatLng(1.289440, 103.849980),
      infoWindow: InfoWindow(
        //popup info
        title: 'Loc 1 ',
        snippet: '1.289440, 103.849980',
      ),
      icon: markerbitmap, //Icon for Marker
    ));
    markers.add(Marker(
      //add start location marker
      markerId: MarkerId("1.3311606377711733,103.7033139540567"),
      position: LatLng(1.3311606377711733, 103.7033139540567),
      rotation: -45,
      infoWindow: InfoWindow(
        //popup info
        title: 'Loc 2',
        snippet: '1.3311606377711733,103.7033139540567',
      ),
      icon: markerbitmapL2, //Icon for Marker
    ));

    markers.add(Marker(
      //add start location marker
      markerId: MarkerId('1.386774284868601, 103.76644590710862'),
      position: LatLng(1.386774284868601, 103.76644590710862),
      rotation: -45,
      infoWindow: InfoWindow(
        //popup info
        title: 'Loc 3',
        snippet: '1.386774284868601, 103.76644590710862',
      ),
      icon: markerbitmapL3, //Icon for Marker
    ));

    setState(() {
      //refresh UI
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(""),
      //   backgroundColor: Colors.deepOrangeAccent,
      // ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(() {
                return Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      width: pressController.pressedBoolTableView.isTrue
                          ? MediaQuery.of(context).size.width * 0.65
                          : MediaQuery.of(context).size.width * 0.88,
                      child: GoogleMap(
                        //Map widget from google_maps_flutter package
                        zoomGesturesEnabled: true, //enable Zoom in, out on map
                        initialCameraPosition: CameraPosition(
                          //innital position in map
                          target:
                          LatLng(1.289440, 103.849980), //initial position
                          zoom: 15.0, //initial zoom level
                        ),
                        markers: pressController.pressedBool.isTrue
                            ? markers
                            : marker,
                        mapType: MapType.satellite, //map type
                        onMapCreated: (controller) {
                          //method called when map is created
                          setState(() {
                            mapController = controller;
                          });
                        },
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        pressController.tableView();
                      },
                      icon: Icon(Icons
                          .table_chart_outlined), //icon data for elevated button
                      label: Text("Table view"), //
                      style: ButtonStyle(
                        foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(color: Colors.white)),
                        ),
                      ),
                    ),
                  ],
                );
              }),
              Obx(() {
                return Flexible(
                    child: pressController.pressedBoolTableView.isTrue
                        ? Container(
                        width: MediaQuery.of(context).size.width * 0.40,
                        child: TableView())
                        : SizedBox());
              }),
            ],
          ),
        ),
      ),
    );
  }
}