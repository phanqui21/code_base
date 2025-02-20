import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BorderRadiusConstants {
  /// Screen util
  static BorderRadius c4r = BorderRadius.circular(4.r);
  static BorderRadius c5r = BorderRadius.circular(5.r);
  static BorderRadius c6r = BorderRadius.circular(6.r);
  static BorderRadius c8r = BorderRadius.circular(8.r);
  static BorderRadius c12r = BorderRadius.circular(12.r);
  static BorderRadius c15r = BorderRadius.circular(15.r);
  static BorderRadius c16r = BorderRadius.circular(16.r);
  static BorderRadius c20r = BorderRadius.circular(20.r);
  static BorderRadius c30r = BorderRadius.circular(30.r);
  static BorderRadius c50r = BorderRadius.circular(50.r);
  static BorderRadius tl20r =
      BorderRadius.only(topLeft: Radius.circular(20.r));
  static BorderRadius tr20r =
      BorderRadius.only(topRight: Radius.circular(20.r));
  static BorderRadius bl20r =
      BorderRadius.only(bottomLeft: Radius.circular(20.r));
  static BorderRadius br20r =
      BorderRadius.only(bottomRight: Radius.circular(20.r));
  static BorderRadius bl15br15r = BorderRadius.only(
    bottomLeft: Radius.circular(15.r),
    bottomRight: Radius.circular(15.r),
  );
  static BorderRadius tr16tl16r = BorderRadius.only(
    topRight: Radius.circular(16.r),
    topLeft: Radius.circular(16.r),
  );

  /// Normal
  static const BorderRadius c3 = BorderRadius.all(Radius.circular(3));
  static const BorderRadius c4 = BorderRadius.all(Radius.circular(4));
  static const BorderRadius c5 = BorderRadius.all(Radius.circular(5));
  static const BorderRadius c6 = BorderRadius.all(Radius.circular(6));
  static const BorderRadius c8 = BorderRadius.all(Radius.circular(8));
  static const BorderRadius c10 = BorderRadius.all(Radius.circular(10));
  static const BorderRadius c12 = BorderRadius.all(Radius.circular(12));
  static const BorderRadius c15 = BorderRadius.all(Radius.circular(15));
  static const BorderRadius c16 = BorderRadius.all(Radius.circular(16));
  static const BorderRadius c18 = BorderRadius.all(Radius.circular(18));
  static const BorderRadius c20 = BorderRadius.all(Radius.circular(20));
  static const BorderRadius c22 = BorderRadius.all(Radius.circular(22));
  static const BorderRadius c25 = BorderRadius.all(Radius.circular(25));
  static const BorderRadius c30 = BorderRadius.all(Radius.circular(30));
  static const BorderRadius c50 = BorderRadius.all(Radius.circular(50));

  static const BorderRadius a30 = BorderRadius.all(Radius.circular(30));

  static const BorderRadius tl12tr12 = BorderRadius.only(
    topLeft: Radius.circular(12),
    topRight: Radius.circular(12),
  );

  static const BorderRadius tl20bl20 = BorderRadius.only(
    bottomLeft: Radius.circular(20),
    topLeft: Radius.circular(20),
  );

  static const BorderRadius tl15tr15 = BorderRadius.only(
    topRight: Radius.circular(15),
    topLeft: Radius.circular(15),
  );
}
