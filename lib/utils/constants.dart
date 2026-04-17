import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

const String TOTAL_STATISTIC_DOC_ID = "20xyAppTotalStatisticY";
const bool FAKE_BOOL = true;
const String MY_ACTIVE_ORDERS = "myActiveOrders";
const String USER_ACTIVE_ORDERS_LIST_PAYLOAD = "userActiveOrdersListPayload";
const String FOR_TEST_ONLY = "FOR TEST";

const String googleMapsApiKey = "AIzaSyA2JW9ukQ0f4dhPo6kj3V_TlOzjIjK1yUg";//"AIzaSyA0piSyIhEBjToNXl0OKrZNxhQZHujtMUk";

final testReference = FirebaseFirestore.instance.collection(FirebaseCollections.test.value);

enum FirebaseCollections {
  test("test");

  final String value;

  const FirebaseCollections(this.value);
}

enum UserAction {
  NEW_ORDER,
  CHANGE_ORDER,
  REPEAT_ORDER,
  DONE_ORDER,
  NO_CHANGED_ORDER_STATE,
  DELETE_ORDER,
  PROFILE_NEEDS_UPDATING,
  PROFILE_UPDATED,
  DELETE_NOTIFICATION,
  DELETE_ALL_NOTIFICATIONS,
  DELETE_HISTORICAL_ORDER,
  DELETE_COMPLETE_ORDER_HISTORY,
  CHANGED_PASSWORD,
  DELETE_ACCOUNT,
  LOGOUT
}

const bool printInfoToConsole = true;
const bool showDebugBanner = false;

const double locChangeDistance = 100;//zmena polohy o N metru
const double locChangeDistanceMarkers = 200;//zmena polohy o N metru
const double locChangeDistanceFreeOrders = 20;//zmena polohy o N metru

const int maxListSize = 50;

//lazy loading
const int notifListSize = 10;
const int notifIncrement = 10;

const int historicalOrderListSize = 10;
const int historicalOrderIncrement = 10;

const int freeOrdersToDeliverIncrement = 5;
const int freeOrdersToDeliverEndIndex = 5;

const int randomStringLength = 20;

const double paddingLeftCard = 18.0;
const double paddingTopCard = 5.0;

const int cardColor = 0xFFFFF3E0;//0xFFFFFFFF;
const int cardColor2 = 0xFFFFE5CC;//0xFFFFFFFF;
const int cardBorderColor = 0xFF7c3f00;
const int cardBorderColor2 = 0xFFEF5350;//0xFFFFFFFF;
const int lightBlueBgColor = 0xFFE3F2FD;
const int scaffoldBGColor = 0xFFE3F2FD;//0xffacc9f6;//0xFFF5F5F5;
const int grad1Color = 0xFF3366FF;
const int grad2Color = 0xFF00CCFF;
const int lightGreyColor1 = 0xFFF5F5F5;
const int lightGreyColor2 =0xFF212121;
const Color cardBGColor = Colors.white;
const Color appBarTextColor = Color(0xFF212121);

const double borderRadius12 = 12;
const double borderRadius2 = 2;


const int greenColor = 0xFF4CAF50; // zelenÃ¡ (Material green 500)
const int redColor = 0xFFF44336; // ÄervenÃ¡ (Material red 500)
const Color redButton = Color(0xFFD32F2F); // tmavÅ¡Ã­, ale kultivovanÃ¡ ÄervenÃ¡
const Color greenButton = Color(0xFF388E3C); // tmavÅ¡Ã­ a klidnÃ¡ zelenÃ¡
const Color greyColor = Color(0xFF9E9E9E); // neutrÃ¡lnÃ­ stÅ™ednÄ› Å¡edÃ¡
const screenBackgroundColor = 0xFFF5F5F5; // pozadÃ­ obrazovky
const whiteColor = 0xFFFFFFFF; // bÃ­lÃ¡ pro karty
const primaryTextColor = 0xFF212121; // primÃ¡rnÃ­ text
const secondaryTextColor = 0xFF757575; // sekundÃ¡rnÃ­ text


const double radioButtonScale = 1;
const double radioButtonXOffset = -30;
const double radioButtonYOffset = -10;
const double cardElevation = 3;

/// Textove konstanty
const String totalStatistic = "Celkova statistika";
const String menuItemAllOrders = "Vsechny obj.";
const String sendEmail = "Posli email";
const String deviceInfo = "Device info";

const String textFieldNotFilledValue = "";

//GUI konstanty
const double spaceAtTheEndOfList = 75;

const double sizeBox5 = 5;
const double sizeBox10 = 10;
const double sizeBox15 = 15;
const double sizeBox20 = 20;
const double sizeBox25 = 25;
const double sizeBox30 = 30;
const double sizeBox35 = 35;

const double height45 = 45;

const double padding5 = 5;
const double padding8 = 8;
const double padding10 = 10.0;
const double padding20 = 20;
const double padding30 = 30;

const double borderRadius5 = 5;
const double greenButtonHeigh = 45;
const double textFormFieldHeigh40 = 40;
const double textFormFieldHeigh60 = 60;

const double maxWidth = 600;
const double maxHeight = 1200;

const double iconSize = 24.0;

const double ios_12 = 12;
const double ios_40 = 40;
const double ios_70 = 70;
const double ios_10 = 10;
const double ios_8 = 8;
const double ios_6 = 6;
const double ios_app_button_width = 0.78;