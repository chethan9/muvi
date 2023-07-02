import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetmovieCall {
  static Future<ApiCallResponse> call({
    String? name = '2023',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Getmovie',
      apiUrl: 'https://proxy.vizsoft.in/https://backend.vizsoft.in/movie',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'name': name,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic movie(dynamic response) => getJsonField(
        response,
        r'''$.movies''',
        true,
      );
}

class DownloadLinkCall {
  static Future<ApiCallResponse> call({
    String? downlink = '',
  }) {
    final body = '''
{
  "magnet_link": "${downlink}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Download Link',
      apiUrl: 'https://proxy.vizsoft.in/https://backend.vizsoft.in/freebird',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic debird(dynamic response) => getJsonField(
        response,
        r'''$.download_links''',
      );
}

class MagnetCall {
  static Future<ApiCallResponse> call({
    String? magnet = 'test',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Magnet',
      apiUrl: 'https://proxy.vizsoft.in/https://backend.vizsoft.in/magnet',
      callType: ApiCallType.GET,
      headers: {
        'x-requested-with': 'https://backend.vizsoft.in',
      },
      params: {
        'url': magnet,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic link(dynamic response) => getJsonField(
        response,
        r'''$.magnet_link''',
      );
}

class OnethreeCall {
  static Future<ApiCallResponse> call({
    String? tor = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Onethree',
      apiUrl: 'https://proxy.vizsoft.in/https://backend.vizsoft.in/1337',
      callType: ApiCallType.GET,
      headers: {
        'origin': 'https://backend.vizsoft.in',
      },
      params: {
        'name': tor,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
    );
  }

  static dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.movies''',
        true,
      );
}

class TmdbCall {
  static Future<ApiCallResponse> call({
    String? tmdbquery = 'inception',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'tmdb',
      apiUrl:
          'https://proxy.vizsoft.in/https://api.themoviedb.org/3/search/multi',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'api_key': "0308f0a9278f09cbd10fe7441ccc6664",
        'query': tmdbquery,
        'sort_by': "popularity.desc",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic page(dynamic response) => getJsonField(
        response,
        r'''$.page''',
      );
  static dynamic tmdbresult(dynamic response) => getJsonField(
        response,
        r'''$.results''',
        true,
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
