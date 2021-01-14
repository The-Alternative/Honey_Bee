import 'package:bmi_honey_bee/enums/device_Type.dart';
import 'package:flutter/material.dart';

DeviceType getDeviceType(MediaQueryData mediaQueryData)
{
  Orientation orientation = mediaQueryData.orientation;
  double width=0;
  if(orientation == Orientation.landscape){
    width = mediaQueryData.size.height;
  }
  else{
    width =mediaQueryData.size.width;
  }
  if(width > 950){
    return DeviceType.Desktop;
  }
  if(width > 600){
    return DeviceType.Tablet;
  }
  return DeviceType.Mobile;
}