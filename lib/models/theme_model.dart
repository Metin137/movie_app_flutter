// To parse this JSON data, do
//
//     final themeModel = themeModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

ThemeModel themeModelFromJson(String str) =>
    ThemeModel.fromJson(json.decode(str));

String themeModelToJson(ThemeModel data) => json.encode(data.toJson());

class ThemeModel {
  ThemeModel({
    required this.name,
    required this.colors,
  });

  String name;
  ThemeColors colors;

  factory ThemeModel.fromJson(Map<String, dynamic> json) => ThemeModel(
        name: json["name"],
        colors: ThemeColors.fromJson(json["themeColors"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "themeColors": colors.toJson(),
      };
}

class ThemeColors {
  ThemeColors({
    this.accent,
    this.primary,
    this.secondary,
    this.thirth,
    this.fourth,
    this.fifth,
    this.black,
    this.white,
    this.gray,
    this.gray2,
    this.gray3,
    this.gray4,
    this.borderColor,
    this.textColor,
  });

  Color? accent;
  Color? primary;
  Color? secondary;
  Color? thirth;
  Color? fourth;
  Color? fifth;
  Color? black;
  Color? white;
  Color? gray;
  Color? gray2;
  Color? gray3;
  Color? gray4;
  Color? borderColor;
  Color? textColor;

  factory ThemeColors.fromJson(Map<String, dynamic> json) => ThemeColors(
        accent: json["accent"],
        primary: json["primary"],
        secondary: json["secondary"],
        thirth: json["thirth"],
        fourth: json["fourth"],
        fifth: json["fifth"],
        black: json["black"],
        white: json["white"],
        gray: json["gray"],
        gray2: json["gray2"],
        gray3: json["gray3"],
        gray4: json["gray4"],
        borderColor: json["borderColor"],
        textColor: json["textColor"],
      );

  Map<String, dynamic> toJson() => {
        "accent": accent,
        "primary": primary,
        "secondary": secondary,
        "thirth": thirth,
        "fourth": fourth,
        "fifth": fifth,
        "black": black,
        "white": white,
        "gray": gray,
        "gray2": gray2,
        "gray3": gray3,
        "gray4": gray4,
        "borderColor": borderColor,
        "textColor": textColor,
      };
}
