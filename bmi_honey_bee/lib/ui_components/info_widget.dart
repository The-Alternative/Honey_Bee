import 'package:bmi_honey_bee/functhions/get_device_Type.dart';
import 'package:bmi_honey_bee/models/device_info.dart';
import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
 final Widget Function(BuildContext context,DeviceInfo deviceInfo) builder;

 const InfoWidget ({Key key,this.builder}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,constrains){
        var mediaQueryData = MediaQuery.of(context);
        var deviceInfo = DeviceInfo(
          orientation: mediaQueryData.orientation,
          deviceType: getDeviceType(mediaQueryData),
          screenWidth: mediaQueryData.size.width,
          screenHeight: mediaQueryData.size.height,
          localHeight: constrains.maxHeight,
          localWidth: constrains.maxWidth,

        );
            return builder(context , deviceInfo);
      }
    );
  }
}
