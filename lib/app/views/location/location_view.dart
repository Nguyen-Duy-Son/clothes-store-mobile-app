import 'package:clothes_store_mobile_app/app/datasource/local/storage.dart';
import 'package:clothes_store_mobile_app/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location/location.dart' as loc;

import '../../constants/assets.dart';
import '../../constants/color_constants.dart';

class LocationView extends StatefulWidget {
  const LocationView({super.key});

  @override
  State<LocationView> createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  loc.Location location = new loc.Location();
  void setLocation() async{
    bool serviceEnabled;
    loc.PermissionStatus permissionGranted;
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        print('Location service is not enabled.');
        return;
      }
    }
    permissionGranted = await location.hasPermission();
    if (permissionGranted == loc.PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != loc.PermissionStatus.granted) {
        print('Location permission is not granted.');
        return;
      }
    }
    var locationData = await location.getLocation();
    if (locationData.latitude != null &&
        locationData.longitude != null) {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          locationData.latitude!, locationData.longitude!);
      Placemark place = placemarks[0];
      String address = '${place.street}, ${place.subAdministrativeArea}, ${place.administrativeArea}, ${place.country}';
      Storage.setLocation(address);
      print(address);
      Navigator.popAndPushNamed(context, AppRoutes.HOME);
    } else {
      print('Unable to get location data.');
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Location'),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 28.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: ColorConstants.neutralLight60,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 20.w,
                  ),
                  child: SvgPicture.asset(
                    Assets.icons.map,
                    width: 40.w,
                    height: 40.h,
                    color: ColorConstants.primaryLight110,
                  ),
                ),
                Text(
                  'What is Your Location?',
                  style: GoogleFonts.dongle(
                    color: ColorConstants.neutralLight120,
                    fontSize: 42.sp,
                  ),
                ),
                Text(
                  'We need to know your location in order to suggest nearby services.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.dongle(
                    color: ColorConstants.neutralLight90,
                    fontSize: 20.sp,
                    height: 0.8,
                  ),
                ),
                GestureDetector(
                  onTap: ()=>setLocation(),
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(
                      top: 8.h,
                      bottom: 8.h,
                    ),
                    margin: EdgeInsets.only(
                      top: 32.h,
                      bottom: 8.h,
                    ),
                    decoration: BoxDecoration(
                      color: ColorConstants.primaryLight110,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      "Allow Location Access",
                      style: GoogleFonts.dongle(
                        color: ColorConstants.primaryLight10,
                        fontWeight: FontWeight.w500,
                        fontSize: 24.sp,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.ENTERLOCATION);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(
                      top: 8.h,
                      bottom: 8.h,
                    ),
                    decoration: BoxDecoration(
                      color: ColorConstants.neutralLight70,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      "Enter Location Manually",
                      style: GoogleFonts.dongle(
                        color: ColorConstants.primaryLight110,
                        fontWeight: FontWeight.w500,
                        fontSize: 24.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
