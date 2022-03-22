// To parse this JSON data, do
//
//     final photoModel = photoModelFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'photo_model.g.dart';

@JsonSerializable()
class PhotoModel extends INetworkModel<PhotoModel> {
  PhotoModel({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  @override
  PhotoModel fromJson(Map<String, dynamic> json) {
    return _$PhotoModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$PhotoModelToJson(this);
  }
}
