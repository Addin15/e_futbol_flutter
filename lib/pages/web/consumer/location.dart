import 'package:e_futbol_flutter/constants/color.dart';
import 'package:e_futbol_flutter/models/arena.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';

class ArenaLocation extends StatefulWidget {
  const ArenaLocation(
      {Key? key, required this.latitude1, required this.longitude1})
      : super(key: key);

  final double latitude1;
  final double longitude1;
  @override
  State<ArenaLocation> createState() => _ArenaLocationState();
}

class _ArenaLocationState extends State<ArenaLocation> {
  late GoogleMapController mapscontroller;
  final Set<Marker> _markers = {};
  bool showmaps = true;
  Arena? arena;

  @override
  void initState() {
    super.initState();
    _markers.add((Marker(
      markerId: MarkerId("Arena Location"),
      position: LatLng(widget.latitude1, widget.longitude1),
    )));

    if (_markers.isNotEmpty) {
      setState(() {
        showmaps = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20),
        child: showmaps
            ? Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton.icon(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 1.w, vertical: 2.h),
                          backgroundColor: primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.sp),
                          ),
                        ),
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.chevron_left_outlined,
                          color: Colors.white,
                          size: 3.sp,
                        ),
                        label: Text(
                          'Back',
                          style: TextStyle(fontSize: 3.sp, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Container(
                    height: 300,
                    width: 1230,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                          target: LatLng(widget.latitude1, widget.longitude1),
                          zoom: 13),
                      markers: Set<Marker>.of(_markers),
                      mapType: MapType.terrain,
                      onMapCreated: (controller) {
                        setState(() {
                          mapscontroller = controller;
                        });
                      },
                    ),
                  ),
                ],
              )
            : CircularProgressIndicator(
                color: Colors.blue,
              ));
  }
}
