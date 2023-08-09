import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'uri.dart' as uri;

/// girls_request
/// @author: steadyuan
/// @date: 2023/8/9

Future<GirlsResponse?> fetchGirls(int page) async {
  final response = await http.get(
    Uri.parse("${uri.httpGirls}?page=${page.toString()}"),
    headers: uri.commonHeader,
  );

  if (response.statusCode == 200) {
    return compute(parseResponse, response.body);
  } else {
    return null;
  }
}

GirlsResponse parseResponse(String responseBody) {
  return GirlsResponse.fromJson(jsonDecode(responseBody));
}

class GirlsResponse {
  final int code;
  final String msg;
  final GirlsData data;

  GirlsResponse({
    required this.code,
    required this.msg,
    required this.data,
  });

  factory GirlsResponse.fromJson(Map<String, dynamic> json) {
    return GirlsResponse(
      code: json["code"],
      msg: json["msg"],
      data: GirlsData.fromJson(json["data"]),
    );
  }
}

class GirlsData {
  final int page;
  final int totalCount;
  final int limit;
  final List<GirlsBean> list;

  GirlsData({
    required this.page,
    required this.totalCount,
    required this.limit,
    required this.list,
  });

  factory GirlsData.fromJson(Map<String, dynamic> json) {
    return GirlsData(
      page: json["page"],
      totalCount: json["totalCount"],
      limit: json["limit"],
      list: json["list"]
          .map<GirlsBean>((json) => GirlsBean.fromJson(json))
          .toList(),
    );
  }
}

class GirlsBean {
  final String imageUrl;
  final String imageSize;
  final int imageFileLength;

  GirlsBean({
    required this.imageUrl,
    required this.imageSize,
    required this.imageFileLength,
  });

  factory GirlsBean.fromJson(Map<String, dynamic> json) {
    return GirlsBean(
      imageUrl: json["imageUrl"],
      imageSize: json["imageSize"],
      imageFileLength: json["imageFileLength"],
    );
  }
}
