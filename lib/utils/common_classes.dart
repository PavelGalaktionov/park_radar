import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

/// An entity of `geo` field of Cloud Firestore location document.
class Geo {
  Geo({
    required this.geohash,
    required this.geopoint,
  });

  factory Geo.fromJson(Map<String, dynamic> json) => Geo(
    geohash: json['geohash'] as String,
    geopoint: json['geopoint'] as GeoPoint,
  );

  final String geohash;
  final GeoPoint geopoint;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'geohash': geohash,
    'geopoint': geopoint,
  };
}

class CustomTextStyle {
  static TextStyle labelTextStyle(BuildContext context) {
    return TextStyle(fontStyle: FontStyle.normal, fontWeight: FontWeight.bold, fontSize: 16.0,);
  }

  static TextStyle labelTextStyleNormal12(BuildContext context) {
    return TextStyle(fontStyle: FontStyle.normal, fontWeight: FontWeight.normal, fontSize: 12.0,);
  }

  static TextStyle labelTextStyleNormal16(BuildContext context) {
    return TextStyle(fontStyle: FontStyle.normal, fontSize: 16.0,);
  }

  static TextStyle labelTextStyleBoldl16(BuildContext context) {
    return TextStyle(fontStyle: FontStyle.normal, fontWeight: FontWeight.bold, fontSize: 16.0,);
  }

  static TextStyle labelTextStyleBoldl20(BuildContext context) {
    return TextStyle(fontStyle: FontStyle.normal, fontWeight: FontWeight.bold, fontSize: 20.0,);
  }

  static TextStyle labelTextStyleBoldl35(BuildContext context) {
    return TextStyle(fontStyle: FontStyle.normal, fontWeight: FontWeight.normal, fontSize: 35.0,);
  }

  static TextStyle labelTextStylePrimary(BuildContext context) {
    return TextStyle(fontStyle: FontStyle.normal, fontSize: 14.0, color: Colors.blueAccent);
  }

  static TextStyle labelTextStyleBlue16Primary(BuildContext context) {
    return TextStyle(fontStyle: FontStyle.normal, fontWeight: FontWeight.bold,
        fontSize: 16.0, color: Platform.isAndroid ? Colors.blueAccent : CupertinoColors.activeBlue);
  }

  static TextStyle labelTextStyleUnderline(BuildContext context) {
    return TextStyle(fontStyle: FontStyle.normal, fontWeight: FontWeight.bold, fontSize: 18.0, decoration: TextDecoration.underline);
  }

  static TextStyle labelTextStyleUnderlineBlueText(BuildContext context) {
    return TextStyle(fontStyle: FontStyle.normal, fontWeight: FontWeight.bold, fontSize: 18.0,
        decoration: TextDecoration.underline, color: CupertinoColors.activeBlue);
  }

  static TextStyle labelTextStyleUnderlineBlueText14(BuildContext context) {
    return TextStyle(fontStyle: FontStyle.normal, fontWeight: FontWeight.bold, fontSize: 14.0,
        decoration: TextDecoration.underline, color: CupertinoColors.activeBlue);
  }

  static TextStyle labelTextStyleUnderlineNormal(BuildContext context) {
    return TextStyle(fontStyle: FontStyle.normal, fontSize: 16.0, decoration: TextDecoration.underline);
  }

  static TextStyle labelTextStyleBlackNormal(BuildContext context) {
    return TextStyle(fontStyle: FontStyle.normal, fontSize: 16.0, fontWeight: FontWeight.normal);
  }

  static TextStyle labelTextStyleUnderlined(BuildContext context) {
    return TextStyle(fontStyle: FontStyle.normal, fontWeight: FontWeight.bold, fontSize: 16.0,
        decoration: TextDecoration.underline);
  }

  static TextStyle labelTextStyleWhiteBold(BuildContext context) {
    return TextStyle(fontStyle: FontStyle.normal, fontWeight: FontWeight.bold, fontSize: 16.0,
        color: Colors.white, backgroundColor: Colors.blueAccent);
  }

  static TextStyle labelTextStyleWhiteBold14(BuildContext context) {
    return TextStyle(fontStyle: FontStyle.normal, fontWeight: FontWeight.bold, fontSize: 14);
  }

  static TextStyle labelTextStyleRedBold14(BuildContext context) {
    return TextStyle(fontStyle: FontStyle.normal, fontWeight: FontWeight.bold, fontSize: 14, color: Colors.red);
  }

  static TextStyle labelTextStyleOrange4(BuildContext context) {
    return TextStyle(fontStyle: FontStyle.normal, fontWeight: FontWeight.w500, fontSize: 14, color: Colors.deepOrange);
  }

  static TextStyle labelTextStyleWhiteNoBackground(BuildContext context) {
    return TextStyle(fontStyle: FontStyle.normal, fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white);
  }

  static TextStyle labelTextStyleWhiteNoBackground14(BuildContext context) {
    return TextStyle(fontStyle: FontStyle.normal, fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.white);
  }

  static TextStyle labelTextStyleWhiteBoldBcg(BuildContext context) {
    return TextStyle(fontStyle: FontStyle.normal, fontWeight: FontWeight.bold,
        fontSize: 16.0, color: Colors.white, backgroundColor: Colors.blueAccent);
  }

  static TextStyle labelTextStyleWhiteBoldBcgIos(BuildContext context) {
    return TextStyle(fontStyle: FontStyle.normal, fontWeight: FontWeight.bold,
        fontSize: 16.0, color: Colors.white, backgroundColor: CupertinoColors.activeBlue);
  }

  static TextStyle labelTextStyleWhiteBoldBcg14(BuildContext context) {
    return TextStyle(fontStyle: FontStyle.normal, fontWeight: FontWeight.bold,
        fontSize: 14.0, color: Colors.white, backgroundColor: Colors.blueAccent);
  }

  static TextStyle labelTextStyleWhiteBoldBcg20(BuildContext context) {
    return TextStyle(fontStyle: FontStyle.normal, fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.blueAccent);
  }

  static TextStyle labelTextStyleLoading(BuildContext context) {
    return TextStyle(fontStyle: FontStyle.normal, fontWeight: FontWeight.bold,
        fontSize: 16.0, color: Colors.indigo);
  }

  static TextStyle labelTextStyleRed(BuildContext context) {
    return TextStyle(fontStyle: FontStyle.normal, fontWeight: FontWeight.w500,
        fontSize: 14.0, color:redButton, backgroundColor: Color(cardColor));
  }

  static TextStyle labelTextStyleRed16Bold(BuildContext context) {
    return TextStyle(fontStyle: FontStyle.normal, fontWeight: FontWeight.w500,
        fontSize: 16.0, color: redButton, backgroundColor: Color(cardColor));
  }

  static TextStyle labelTextStyleRed20Bold(BuildContext context) {
    return TextStyle(fontStyle: FontStyle.normal, fontWeight: FontWeight.bold,
        fontSize: 20.0, color:redButton, backgroundColor: Color(cardColor));
  }

  static TextStyle labelTextStyleRed16BoldNoBackground(BuildContext context) {
    return TextStyle(fontStyle: FontStyle.normal, fontWeight: FontWeight.bold, fontSize: 16.0, color: redButton);
  }

  static TextStyle labelTextValidationStyleRed(BuildContext context) {
    return TextStyle(fontStyle: FontStyle.normal, fontWeight: FontWeight.bold,
        fontSize: 14.0, color: redButton);
  }
}
