import 'package:flutter/material.dart';
import 'package:wax/basic/commons.dart';
import 'package:wax/screens/browser_screen.dart';

const catesNvMap = {
  "全部漫画": "",
  "同人誌": "5",
  "同人誌 - 漢化": "1",
  "同人誌 - 日語": "12",
  "同人誌 - English": "16",
  "同人誌 - CG畫集": "2",
  "同人誌 - 3D漫畫": "22",
  "同人誌 - Cosplay": "3",
  "同人誌 - AI圖集": "37",
  "單行本": "6",
  "單行本 - 漢化": "9",
  "單行本 - 日語": "13",
  "單行本 - English": "17",
  "雜誌&短篇": "7",
  "雜誌&短篇 - 漢化": "10",
  "雜誌&短篇 - 日語": "14",
  "雜誌&短篇 - English": "18",
  "韓漫": "19",
  "韓漫 - 漢化": "20",
  "韓漫 - 生肉": "21",
};

const catesVnMap = {
  "": "全部漫画",
  "5": "同人誌",
  "1": "同人誌 - 漢化",
  "12": "同人誌 - 日語",
  "16": "同人誌 - English",
  "2": "同人誌 - CG畫集",
  "22": "同人誌 - 3D漫畫",
  "37": "同人誌 - AI圖集",
  "3": "同人誌 - Cosplay",
  "6": "單行本",
  "9": "單行本 - 漢化",
  "13": "單行本 - 日語",
  "17": "單行本 - English",
  "7": "雜誌&短篇",
  "10": "雜誌&短篇 - 漢化",
  "14": "雜誌&短篇 - 日語",
  "18": "雜誌&短篇 - English",
  "19": "韓漫",
  "20": "韓漫 - 漢化",
  "21": "韓漫 - 生肉",
};

Future chooseCate(BuildContext context) async {
  return chooseMapDialog(context, title: "选择分类", values: catesNvMap);
}
