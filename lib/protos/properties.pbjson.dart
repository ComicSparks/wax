//
//  Generated code. Do not modify.
//  source: protos/properties.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use savePropertyQueryDescriptor instead')
const SavePropertyQuery$json = {
  '1': 'SavePropertyQuery',
  '2': [
    {'1': 'k', '3': 1, '4': 1, '5': 9, '10': 'k'},
    {'1': 'v', '3': 2, '4': 1, '5': 9, '10': 'v'},
  ],
};

/// Descriptor for `SavePropertyQuery`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List savePropertyQueryDescriptor = $convert.base64Decode(
    'ChFTYXZlUHJvcGVydHlRdWVyeRIMCgFrGAEgASgJUgFrEgwKAXYYAiABKAlSAXY=');

@$core.Deprecated('Use loadPropertyQueryDescriptor instead')
const LoadPropertyQuery$json = {
  '1': 'LoadPropertyQuery',
  '2': [
    {'1': 'k', '3': 1, '4': 1, '5': 9, '10': 'k'},
  ],
};

/// Descriptor for `LoadPropertyQuery`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loadPropertyQueryDescriptor = $convert.base64Decode(
    'ChFMb2FkUHJvcGVydHlRdWVyeRIMCgFrGAEgASgJUgFr');

@$core.Deprecated('Use loadPropertyResultDescriptor instead')
const LoadPropertyResult$json = {
  '1': 'LoadPropertyResult',
  '2': [
    {'1': 'v', '3': 1, '4': 1, '5': 9, '10': 'v'},
  ],
};

/// Descriptor for `LoadPropertyResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loadPropertyResultDescriptor = $convert.base64Decode(
    'ChJMb2FkUHJvcGVydHlSZXN1bHQSDAoBdhgBIAEoCVIBdg==');

@$core.Deprecated('Use fetchComicQueryDescriptor instead')
const FetchComicQuery$json = {
  '1': 'FetchComicQuery',
  '2': [
    {'1': 'host', '3': 1, '4': 1, '5': 9, '10': 'host'},
    {'1': 'filterName', '3': 2, '4': 1, '5': 9, '10': 'filterName'},
    {'1': 'filterValue', '3': 3, '4': 1, '5': 9, '10': 'filterValue'},
    {'1': 'pageNumber', '3': 4, '4': 1, '5': 3, '10': 'pageNumber'},
  ],
};

/// Descriptor for `FetchComicQuery`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchComicQueryDescriptor = $convert.base64Decode(
    'Cg9GZXRjaENvbWljUXVlcnkSEgoEaG9zdBgBIAEoCVIEaG9zdBIeCgpmaWx0ZXJOYW1lGAIgAS'
    'gJUgpmaWx0ZXJOYW1lEiAKC2ZpbHRlclZhbHVlGAMgASgJUgtmaWx0ZXJWYWx1ZRIeCgpwYWdl'
    'TnVtYmVyGAQgASgDUgpwYWdlTnVtYmVy');

@$core.Deprecated('Use fetchComicResultDescriptor instead')
const FetchComicResult$json = {
  '1': 'FetchComicResult',
  '2': [
    {'1': 'comics', '3': 1, '4': 3, '5': 11, '6': '.ComicSimple', '10': 'comics'},
    {'1': 'currentPage', '3': 2, '4': 1, '5': 3, '10': 'currentPage'},
    {'1': 'maxPage', '3': 3, '4': 1, '5': 3, '10': 'maxPage'},
  ],
};

/// Descriptor for `FetchComicResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchComicResultDescriptor = $convert.base64Decode(
    'ChBGZXRjaENvbWljUmVzdWx0EiQKBmNvbWljcxgBIAMoCzIMLkNvbWljU2ltcGxlUgZjb21pY3'
    'MSIAoLY3VycmVudFBhZ2UYAiABKANSC2N1cnJlbnRQYWdlEhgKB21heFBhZ2UYAyABKANSB21h'
    'eFBhZ2U=');

@$core.Deprecated('Use comicSimpleDescriptor instead')
const ComicSimple$json = {
  '1': 'ComicSimple',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'cover', '3': 2, '4': 1, '5': 9, '10': 'cover'},
    {'1': 'title', '3': 3, '4': 1, '5': 9, '10': 'title'},
    {'1': 'favouriteId', '3': 4, '4': 1, '5': 3, '10': 'favouriteId'},
  ],
};

/// Descriptor for `ComicSimple`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List comicSimpleDescriptor = $convert.base64Decode(
    'CgtDb21pY1NpbXBsZRIOCgJpZBgBIAEoA1ICaWQSFAoFY292ZXIYAiABKAlSBWNvdmVyEhQKBX'
    'RpdGxlGAMgASgJUgV0aXRsZRIgCgtmYXZvdXJpdGVJZBgEIAEoA1ILZmF2b3VyaXRlSWQ=');

@$core.Deprecated('Use comicInfoQueryDescriptor instead')
const ComicInfoQuery$json = {
  '1': 'ComicInfoQuery',
  '2': [
    {'1': 'host', '3': 1, '4': 1, '5': 9, '10': 'host'},
    {'1': 'id', '3': 2, '4': 1, '5': 3, '10': 'id'},
  ],
};

/// Descriptor for `ComicInfoQuery`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List comicInfoQueryDescriptor = $convert.base64Decode(
    'Cg5Db21pY0luZm9RdWVyeRISCgRob3N0GAEgASgJUgRob3N0Eg4KAmlkGAIgASgDUgJpZA==');

@$core.Deprecated('Use comicInfoResultDescriptor instead')
const ComicInfoResult$json = {
  '1': 'ComicInfoResult',
  '2': [
    {'1': 'comicInfo', '3': 1, '4': 1, '5': 11, '6': '.ComicInfo', '10': 'comicInfo'},
    {'1': 'uploader', '3': 2, '4': 1, '5': 11, '6': '.Uploader', '10': 'uploader'},
  ],
};

/// Descriptor for `ComicInfoResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List comicInfoResultDescriptor = $convert.base64Decode(
    'Cg9Db21pY0luZm9SZXN1bHQSKAoJY29taWNJbmZvGAEgASgLMgouQ29taWNJbmZvUgljb21pY0'
    'luZm8SJQoIdXBsb2FkZXIYAiABKAsyCS5VcGxvYWRlclIIdXBsb2FkZXI=');

@$core.Deprecated('Use comicInfoDescriptor instead')
const ComicInfo$json = {
  '1': 'ComicInfo',
  '2': [
    {'1': 'labels', '3': 1, '4': 3, '5': 9, '10': 'labels'},
    {'1': 'tags', '3': 2, '4': 3, '5': 9, '10': 'tags'},
    {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
  ],
};

/// Descriptor for `ComicInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List comicInfoDescriptor = $convert.base64Decode(
    'CglDb21pY0luZm8SFgoGbGFiZWxzGAEgAygJUgZsYWJlbHMSEgoEdGFncxgCIAMoCVIEdGFncx'
    'IgCgtkZXNjcmlwdGlvbhgDIAEoCVILZGVzY3JpcHRpb24=');

@$core.Deprecated('Use uploaderDescriptor instead')
const Uploader$json = {
  '1': 'Uploader',
};

/// Descriptor for `Uploader`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uploaderDescriptor = $convert.base64Decode(
    'CghVcGxvYWRlcg==');

@$core.Deprecated('Use comicPageDescriptor instead')
const ComicPage$json = {
  '1': 'ComicPage',
  '2': [
    {'1': 'caption', '3': 1, '4': 1, '5': 9, '10': 'caption'},
    {'1': 'url', '3': 2, '4': 1, '5': 9, '10': 'url'},
  ],
};

/// Descriptor for `ComicPage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List comicPageDescriptor = $convert.base64Decode(
    'CglDb21pY1BhZ2USGAoHY2FwdGlvbhgBIAEoCVIHY2FwdGlvbhIQCgN1cmwYAiABKAlSA3VybA'
    '==');

@$core.Deprecated('Use comicPagesResultDescriptor instead')
const ComicPagesResult$json = {
  '1': 'ComicPagesResult',
  '2': [
    {'1': 'pages', '3': 1, '4': 3, '5': 11, '6': '.ComicPage', '10': 'pages'},
  ],
};

/// Descriptor for `ComicPagesResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List comicPagesResultDescriptor = $convert.base64Decode(
    'ChBDb21pY1BhZ2VzUmVzdWx0EiAKBXBhZ2VzGAEgAygLMgouQ29taWNQYWdlUgVwYWdlcw==');

@$core.Deprecated('Use cacheImageQueryDescriptor instead')
const CacheImageQuery$json = {
  '1': 'CacheImageQuery',
  '2': [
    {'1': 'host', '3': 1, '4': 1, '5': 9, '10': 'host'},
    {'1': 'url', '3': 2, '4': 1, '5': 9, '10': 'url'},
    {'1': 'ignoreFormat', '3': 3, '4': 1, '5': 8, '10': 'ignoreFormat'},
  ],
};

/// Descriptor for `CacheImageQuery`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cacheImageQueryDescriptor = $convert.base64Decode(
    'Cg9DYWNoZUltYWdlUXVlcnkSEgoEaG9zdBgBIAEoCVIEaG9zdBIQCgN1cmwYAiABKAlSA3VybB'
    'IiCgxpZ25vcmVGb3JtYXQYAyABKAhSDGlnbm9yZUZvcm1hdA==');

@$core.Deprecated('Use cacheImageResultDescriptor instead')
const CacheImageResult$json = {
  '1': 'CacheImageResult',
  '2': [
    {'1': 'localPath', '3': 1, '4': 1, '5': 9, '10': 'localPath'},
    {'1': 'width', '3': 2, '4': 1, '5': 5, '10': 'width'},
    {'1': 'height', '3': 3, '4': 1, '5': 5, '10': 'height'},
  ],
};

/// Descriptor for `CacheImageResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cacheImageResultDescriptor = $convert.base64Decode(
    'ChBDYWNoZUltYWdlUmVzdWx0EhwKCWxvY2FsUGF0aBgBIAEoCVIJbG9jYWxQYXRoEhQKBXdpZH'
    'RoGAIgASgFUgV3aWR0aBIWCgZoZWlnaHQYAyABKAVSBmhlaWdodA==');

@$core.Deprecated('Use autoCleanQueryDescriptor instead')
const AutoCleanQuery$json = {
  '1': 'AutoCleanQuery',
  '2': [
    {'1': 'expire', '3': 1, '4': 1, '5': 3, '10': 'expire'},
  ],
};

/// Descriptor for `AutoCleanQuery`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List autoCleanQueryDescriptor = $convert.base64Decode(
    'Cg5BdXRvQ2xlYW5RdWVyeRIWCgZleHBpcmUYASABKANSBmV4cGlyZQ==');

@$core.Deprecated('Use httpGetQueryDescriptor instead')
const HttpGetQuery$json = {
  '1': 'HttpGetQuery',
  '2': [
    {'1': 'url', '3': 1, '4': 1, '5': 9, '10': 'url'},
  ],
};

/// Descriptor for `HttpGetQuery`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List httpGetQueryDescriptor = $convert.base64Decode(
    'CgxIdHRwR2V0UXVlcnkSEAoDdXJsGAEgASgJUgN1cmw=');

@$core.Deprecated('Use httpGetResultDescriptor instead')
const HttpGetResult$json = {
  '1': 'HttpGetResult',
  '2': [
    {'1': 'content', '3': 1, '4': 1, '5': 9, '10': 'content'},
  ],
};

/// Descriptor for `HttpGetResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List httpGetResultDescriptor = $convert.base64Decode(
    'Cg1IdHRwR2V0UmVzdWx0EhgKB2NvbnRlbnQYASABKAlSB2NvbnRlbnQ=');

@$core.Deprecated('Use comicSearchQueryDescriptor instead')
const ComicSearchQuery$json = {
  '1': 'ComicSearchQuery',
  '2': [
    {'1': 'host', '3': 1, '4': 1, '5': 9, '10': 'host'},
    {'1': 'query', '3': 2, '4': 1, '5': 9, '10': 'query'},
    {'1': 'pageNumber', '3': 3, '4': 1, '5': 3, '10': 'pageNumber'},
  ],
};

/// Descriptor for `ComicSearchQuery`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List comicSearchQueryDescriptor = $convert.base64Decode(
    'ChBDb21pY1NlYXJjaFF1ZXJ5EhIKBGhvc3QYASABKAlSBGhvc3QSFAoFcXVlcnkYAiABKAlSBX'
    'F1ZXJ5Eh4KCnBhZ2VOdW1iZXIYAyABKANSCnBhZ2VOdW1iZXI=');

@$core.Deprecated('Use userRegisterQueryDescriptor instead')
const UserRegisterQuery$json = {
  '1': 'UserRegisterQuery',
  '2': [
    {'1': 'host', '3': 1, '4': 1, '5': 9, '10': 'host'},
    {'1': 'username', '3': 2, '4': 1, '5': 9, '10': 'username'},
    {'1': 'nickname', '3': 3, '4': 1, '5': 9, '10': 'nickname'},
    {'1': 'email', '3': 4, '4': 1, '5': 9, '10': 'email'},
    {'1': 'sex', '3': 5, '4': 1, '5': 9, '10': 'sex'},
    {'1': 'pass', '3': 6, '4': 1, '5': 9, '10': 'pass'},
    {'1': 'passAgain', '3': 7, '4': 1, '5': 9, '10': 'passAgain'},
  ],
};

/// Descriptor for `UserRegisterQuery`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userRegisterQueryDescriptor = $convert.base64Decode(
    'ChFVc2VyUmVnaXN0ZXJRdWVyeRISCgRob3N0GAEgASgJUgRob3N0EhoKCHVzZXJuYW1lGAIgAS'
    'gJUgh1c2VybmFtZRIaCghuaWNrbmFtZRgDIAEoCVIIbmlja25hbWUSFAoFZW1haWwYBCABKAlS'
    'BWVtYWlsEhAKA3NleBgFIAEoCVIDc2V4EhIKBHBhc3MYBiABKAlSBHBhc3MSHAoJcGFzc0FnYW'
    'luGAcgASgJUglwYXNzQWdhaW4=');

@$core.Deprecated('Use userLoginQueryDescriptor instead')
const UserLoginQuery$json = {
  '1': 'UserLoginQuery',
  '2': [
    {'1': 'host', '3': 1, '4': 1, '5': 9, '10': 'host'},
    {'1': 'username', '3': 2, '4': 1, '5': 9, '10': 'username'},
    {'1': 'password', '3': 3, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `UserLoginQuery`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userLoginQueryDescriptor = $convert.base64Decode(
    'Cg5Vc2VyTG9naW5RdWVyeRISCgRob3N0GAEgASgJUgRob3N0EhoKCHVzZXJuYW1lGAIgASgJUg'
    'h1c2VybmFtZRIaCghwYXNzd29yZBgDIAEoCVIIcGFzc3dvcmQ=');

@$core.Deprecated('Use isProDescriptor instead')
const IsPro$json = {
  '1': 'IsPro',
  '2': [
    {'1': 'isPro', '3': 1, '4': 1, '5': 8, '10': 'isPro'},
    {'1': 'expire', '3': 2, '4': 1, '5': 3, '10': 'expire'},
  ],
};

/// Descriptor for `IsPro`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List isProDescriptor = $convert.base64Decode(
    'CgVJc1BybxIUCgVpc1BybxgBIAEoCFIFaXNQcm8SFgoGZXhwaXJlGAIgASgDUgZleHBpcmU=');

@$core.Deprecated('Use emptyDescriptor instead')
const Empty$json = {
  '1': 'Empty',
};

/// Descriptor for `Empty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyDescriptor = $convert.base64Decode(
    'CgVFbXB0eQ==');

@$core.Deprecated('Use puffDescriptor instead')
const Puff$json = {
  '1': 'Puff',
  '2': [
    {'1': 'value', '3': 1, '4': 1, '5': 9, '10': 'value'},
  ],
};

/// Descriptor for `Puff`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List puffDescriptor = $convert.base64Decode(
    'CgRQdWZmEhQKBXZhbHVlGAEgASgJUgV2YWx1ZQ==');

@$core.Deprecated('Use pushToDownloadsDescriptor instead')
const PushToDownloads$json = {
  '1': 'PushToDownloads',
  '2': [
    {'1': 'host', '3': 1, '4': 1, '5': 9, '10': 'host'},
    {'1': 'comics', '3': 2, '4': 3, '5': 11, '6': '.ComicSimple', '10': 'comics'},
  ],
};

/// Descriptor for `PushToDownloads`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pushToDownloadsDescriptor = $convert.base64Decode(
    'Cg9QdXNoVG9Eb3dubG9hZHMSEgoEaG9zdBgBIAEoCVIEaG9zdBIkCgZjb21pY3MYAiADKAsyDC'
    '5Db21pY1NpbXBsZVIGY29taWNz');

@$core.Deprecated('Use comicDownloadsResDescriptor instead')
const ComicDownloadsRes$json = {
  '1': 'ComicDownloadsRes',
  '2': [
    {'1': 'downloads', '3': 1, '4': 3, '5': 11, '6': '.ComicDownloadDto', '10': 'downloads'},
  ],
};

/// Descriptor for `ComicDownloadsRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List comicDownloadsResDescriptor = $convert.base64Decode(
    'ChFDb21pY0Rvd25sb2Fkc1JlcxIvCglkb3dubG9hZHMYASADKAsyES5Db21pY0Rvd25sb2FkRH'
    'RvUglkb3dubG9hZHM=');

@$core.Deprecated('Use comicDownloadDtoDescriptor instead')
const ComicDownloadDto$json = {
  '1': 'ComicDownloadDto',
  '2': [
    {'1': 'host', '3': 1, '4': 1, '5': 9, '10': 'host'},
    {'1': 'id', '3': 2, '4': 1, '5': 3, '10': 'id'},
    {'1': 'cover', '3': 3, '4': 1, '5': 9, '10': 'cover'},
    {'1': 'title', '3': 4, '4': 1, '5': 9, '10': 'title'},
    {'1': 'status', '3': 5, '4': 1, '5': 3, '10': 'status'},
    {'1': 'coverDownload', '3': 6, '4': 1, '5': 8, '10': 'coverDownload'},
    {'1': 'fetchedInfo', '3': 7, '4': 1, '5': 8, '10': 'fetchedInfo'},
    {'1': 'fetchPage', '3': 8, '4': 1, '5': 8, '10': 'fetchPage'},
    {'1': 'pageCount', '3': 9, '4': 1, '5': 3, '10': 'pageCount'},
    {'1': 'pageDown', '3': 10, '4': 1, '5': 3, '10': 'pageDown'},
    {'1': 'deleting', '3': 11, '4': 1, '5': 8, '10': 'deleting'},
    {'1': 'coverPath', '3': 12, '4': 1, '5': 9, '10': 'coverPath'},
  ],
};

/// Descriptor for `ComicDownloadDto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List comicDownloadDtoDescriptor = $convert.base64Decode(
    'ChBDb21pY0Rvd25sb2FkRHRvEhIKBGhvc3QYASABKAlSBGhvc3QSDgoCaWQYAiABKANSAmlkEh'
    'QKBWNvdmVyGAMgASgJUgVjb3ZlchIUCgV0aXRsZRgEIAEoCVIFdGl0bGUSFgoGc3RhdHVzGAUg'
    'ASgDUgZzdGF0dXMSJAoNY292ZXJEb3dubG9hZBgGIAEoCFINY292ZXJEb3dubG9hZBIgCgtmZX'
    'RjaGVkSW5mbxgHIAEoCFILZmV0Y2hlZEluZm8SHAoJZmV0Y2hQYWdlGAggASgIUglmZXRjaFBh'
    'Z2USHAoJcGFnZUNvdW50GAkgASgDUglwYWdlQ291bnQSGgoIcGFnZURvd24YCiABKANSCHBhZ2'
    'VEb3duEhoKCGRlbGV0aW5nGAsgASgIUghkZWxldGluZxIcCgljb3ZlclBhdGgYDCABKAlSCWNv'
    'dmVyUGF0aA==');

@$core.Deprecated('Use downloadInfoQueryDescriptor instead')
const DownloadInfoQuery$json = {
  '1': 'DownloadInfoQuery',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
  ],
};

/// Descriptor for `DownloadInfoQuery`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List downloadInfoQueryDescriptor = $convert.base64Decode(
    'ChFEb3dubG9hZEluZm9RdWVyeRIOCgJpZBgBIAEoA1ICaWQ=');

@$core.Deprecated('Use comicDownloadInfoDtoDescriptor instead')
const ComicDownloadInfoDto$json = {
  '1': 'ComicDownloadInfoDto',
  '2': [
    {'1': 'host', '3': 1, '4': 1, '5': 9, '10': 'host'},
    {'1': 'id', '3': 2, '4': 1, '5': 3, '10': 'id'},
    {'1': 'cover', '3': 3, '4': 1, '5': 9, '10': 'cover'},
    {'1': 'title', '3': 4, '4': 1, '5': 9, '10': 'title'},
    {'1': 'status', '3': 5, '4': 1, '5': 3, '10': 'status'},
    {'1': 'coverDownload', '3': 6, '4': 1, '5': 8, '10': 'coverDownload'},
    {'1': 'pageCount', '3': 7, '4': 1, '5': 3, '10': 'pageCount'},
    {'1': 'pageDown', '3': 8, '4': 1, '5': 3, '10': 'pageDown'},
    {'1': 'deleting', '3': 9, '4': 1, '5': 8, '10': 'deleting'},
    {'1': 'labels', '3': 10, '4': 3, '5': 9, '10': 'labels'},
    {'1': 'tags', '3': 11, '4': 3, '5': 9, '10': 'tags'},
    {'1': 'description', '3': 12, '4': 1, '5': 9, '10': 'description'},
  ],
};

/// Descriptor for `ComicDownloadInfoDto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List comicDownloadInfoDtoDescriptor = $convert.base64Decode(
    'ChRDb21pY0Rvd25sb2FkSW5mb0R0bxISCgRob3N0GAEgASgJUgRob3N0Eg4KAmlkGAIgASgDUg'
    'JpZBIUCgVjb3ZlchgDIAEoCVIFY292ZXISFAoFdGl0bGUYBCABKAlSBXRpdGxlEhYKBnN0YXR1'
    'cxgFIAEoA1IGc3RhdHVzEiQKDWNvdmVyRG93bmxvYWQYBiABKAhSDWNvdmVyRG93bmxvYWQSHA'
    'oJcGFnZUNvdW50GAcgASgDUglwYWdlQ291bnQSGgoIcGFnZURvd24YCCABKANSCHBhZ2VEb3du'
    'EhoKCGRlbGV0aW5nGAkgASgIUghkZWxldGluZxIWCgZsYWJlbHMYCiADKAlSBmxhYmVscxISCg'
    'R0YWdzGAsgAygJUgR0YWdzEiAKC2Rlc2NyaXB0aW9uGAwgASgJUgtkZXNjcmlwdGlvbg==');

@$core.Deprecated('Use downloadComicPagesDescriptor instead')
const DownloadComicPages$json = {
  '1': 'DownloadComicPages',
  '2': [
    {'1': 'pages', '3': 1, '4': 3, '5': 11, '6': '.DownloadComicPageDto', '10': 'pages'},
  ],
};

/// Descriptor for `DownloadComicPages`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List downloadComicPagesDescriptor = $convert.base64Decode(
    'ChJEb3dubG9hZENvbWljUGFnZXMSKwoFcGFnZXMYASADKAsyFS5Eb3dubG9hZENvbWljUGFnZU'
    'R0b1IFcGFnZXM=');

@$core.Deprecated('Use downloadComicPageDtoDescriptor instead')
const DownloadComicPageDto$json = {
  '1': 'DownloadComicPageDto',
  '2': [
    {'1': 'width', '3': 1, '4': 1, '5': 3, '10': 'width'},
    {'1': 'height', '3': 2, '4': 1, '5': 3, '10': 'height'},
    {'1': 'format', '3': 3, '4': 1, '5': 9, '10': 'format'},
    {'1': 'path', '3': 4, '4': 1, '5': 9, '10': 'path'},
    {'1': 'url', '3': 5, '4': 1, '5': 9, '10': 'url'},
    {'1': 'caption', '3': 6, '4': 1, '5': 9, '10': 'caption'},
  ],
};

/// Descriptor for `DownloadComicPageDto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List downloadComicPageDtoDescriptor = $convert.base64Decode(
    'ChREb3dubG9hZENvbWljUGFnZUR0bxIUCgV3aWR0aBgBIAEoA1IFd2lkdGgSFgoGaGVpZ2h0GA'
    'IgASgDUgZoZWlnaHQSFgoGZm9ybWF0GAMgASgJUgZmb3JtYXQSEgoEcGF0aBgEIAEoCVIEcGF0'
    'aBIQCgN1cmwYBSABKAlSA3VybBIYCgdjYXB0aW9uGAYgASgJUgdjYXB0aW9u');

@$core.Deprecated('Use stringValueDescriptor instead')
const StringValue$json = {
  '1': 'StringValue',
  '2': [
    {'1': 'value', '3': 1, '4': 1, '5': 9, '10': 'value'},
  ],
};

/// Descriptor for `StringValue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stringValueDescriptor = $convert.base64Decode(
    'CgtTdHJpbmdWYWx1ZRIUCgV2YWx1ZRgBIAEoCVIFdmFsdWU=');

@$core.Deprecated('Use intValueDescriptor instead')
const IntValue$json = {
  '1': 'IntValue',
  '2': [
    {'1': 'value', '3': 1, '4': 1, '5': 3, '10': 'value'},
  ],
};

/// Descriptor for `IntValue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List intValueDescriptor = $convert.base64Decode(
    'CghJbnRWYWx1ZRIUCgV2YWx1ZRgBIAEoA1IFdmFsdWU=');

@$core.Deprecated('Use boolValueDescriptor instead')
const BoolValue$json = {
  '1': 'BoolValue',
  '2': [
    {'1': 'value', '3': 1, '4': 1, '5': 8, '10': 'value'},
  ],
};

/// Descriptor for `BoolValue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List boolValueDescriptor = $convert.base64Decode(
    'CglCb29sVmFsdWUSFAoFdmFsdWUYASABKAhSBXZhbHVl');

@$core.Deprecated('Use createFavoritesPartitionQueryDescriptor instead')
const CreateFavoritesPartitionQuery$json = {
  '1': 'CreateFavoritesPartitionQuery',
  '2': [
    {'1': 'host', '3': 1, '4': 1, '5': 9, '10': 'host'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `CreateFavoritesPartitionQuery`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createFavoritesPartitionQueryDescriptor = $convert.base64Decode(
    'Ch1DcmVhdGVGYXZvcml0ZXNQYXJ0aXRpb25RdWVyeRISCgRob3N0GAEgASgJUgRob3N0EhIKBG'
    '5hbWUYAiABKAlSBG5hbWU=');

@$core.Deprecated('Use favoritesPartitionsQueryDescriptor instead')
const FavoritesPartitionsQuery$json = {
  '1': 'FavoritesPartitionsQuery',
  '2': [
    {'1': 'host', '3': 1, '4': 1, '5': 9, '10': 'host'},
  ],
};

/// Descriptor for `FavoritesPartitionsQuery`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List favoritesPartitionsQueryDescriptor = $convert.base64Decode(
    'ChhGYXZvcml0ZXNQYXJ0aXRpb25zUXVlcnkSEgoEaG9zdBgBIAEoCVIEaG9zdA==');

@$core.Deprecated('Use favoritesPartitionResultDescriptor instead')
const FavoritesPartitionResult$json = {
  '1': 'FavoritesPartitionResult',
  '2': [
    {'1': 'partitionList', '3': 1, '4': 3, '5': 11, '6': '.FavoritesPartitionDto', '10': 'partitionList'},
  ],
};

/// Descriptor for `FavoritesPartitionResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List favoritesPartitionResultDescriptor = $convert.base64Decode(
    'ChhGYXZvcml0ZXNQYXJ0aXRpb25SZXN1bHQSPAoNcGFydGl0aW9uTGlzdBgBIAMoCzIWLkZhdm'
    '9yaXRlc1BhcnRpdGlvbkR0b1INcGFydGl0aW9uTGlzdA==');

@$core.Deprecated('Use favoritesPartitionDtoDescriptor instead')
const FavoritesPartitionDto$json = {
  '1': 'FavoritesPartitionDto',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `FavoritesPartitionDto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List favoritesPartitionDtoDescriptor = $convert.base64Decode(
    'ChVGYXZvcml0ZXNQYXJ0aXRpb25EdG8SDgoCaWQYASABKANSAmlkEhIKBG5hbWUYAiABKAlSBG'
    '5hbWU=');

@$core.Deprecated('Use renameFavoritesPartitionQueryDescriptor instead')
const RenameFavoritesPartitionQuery$json = {
  '1': 'RenameFavoritesPartitionQuery',
  '2': [
    {'1': 'host', '3': 1, '4': 1, '5': 9, '10': 'host'},
    {'1': 'id', '3': 2, '4': 1, '5': 3, '10': 'id'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `RenameFavoritesPartitionQuery`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List renameFavoritesPartitionQueryDescriptor = $convert.base64Decode(
    'Ch1SZW5hbWVGYXZvcml0ZXNQYXJ0aXRpb25RdWVyeRISCgRob3N0GAEgASgJUgRob3N0Eg4KAm'
    'lkGAIgASgDUgJpZBISCgRuYW1lGAMgASgJUgRuYW1l');

@$core.Deprecated('Use favoriteComicQueryDescriptor instead')
const FavoriteComicQuery$json = {
  '1': 'FavoriteComicQuery',
  '2': [
    {'1': 'host', '3': 1, '4': 1, '5': 9, '10': 'host'},
    {'1': 'comicId', '3': 2, '4': 1, '5': 3, '10': 'comicId'},
    {'1': 'partitionId', '3': 3, '4': 1, '5': 3, '10': 'partitionId'},
  ],
};

/// Descriptor for `FavoriteComicQuery`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List favoriteComicQueryDescriptor = $convert.base64Decode(
    'ChJGYXZvcml0ZUNvbWljUXVlcnkSEgoEaG9zdBgBIAEoCVIEaG9zdBIYCgdjb21pY0lkGAIgAS'
    'gDUgdjb21pY0lkEiAKC3BhcnRpdGlvbklkGAMgASgDUgtwYXJ0aXRpb25JZA==');

@$core.Deprecated('Use favoriteListQueryDescriptor instead')
const FavoriteListQuery$json = {
  '1': 'FavoriteListQuery',
  '2': [
    {'1': 'host', '3': 1, '4': 1, '5': 9, '10': 'host'},
    {'1': 'partitionId', '3': 2, '4': 1, '5': 3, '10': 'partitionId'},
    {'1': 'page', '3': 3, '4': 1, '5': 3, '10': 'page'},
  ],
};

/// Descriptor for `FavoriteListQuery`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List favoriteListQueryDescriptor = $convert.base64Decode(
    'ChFGYXZvcml0ZUxpc3RRdWVyeRISCgRob3N0GAEgASgJUgRob3N0EiAKC3BhcnRpdGlvbklkGA'
    'IgASgDUgtwYXJ0aXRpb25JZBISCgRwYWdlGAMgASgDUgRwYWdl');

@$core.Deprecated('Use loginUserQueryDescriptor instead')
const LoginUserQuery$json = {
  '1': 'LoginUserQuery',
  '2': [
    {'1': 'host', '3': 1, '4': 1, '5': 9, '10': 'host'},
  ],
};

/// Descriptor for `LoginUserQuery`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginUserQueryDescriptor = $convert.base64Decode(
    'Cg5Mb2dpblVzZXJRdWVyeRISCgRob3N0GAEgASgJUgRob3N0');

@$core.Deprecated('Use loginUserDescriptor instead')
const LoginUser$json = {
  '1': 'LoginUser',
  '2': [
    {'1': 'nicename', '3': 1, '4': 1, '5': 9, '10': 'nicename'},
  ],
};

/// Descriptor for `LoginUser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginUserDescriptor = $convert.base64Decode(
    'CglMb2dpblVzZXISGgoIbmljZW5hbWUYASABKAlSCG5pY2VuYW1l');

@$core.Deprecated('Use deleteFavoriteQueryDescriptor instead')
const DeleteFavoriteQuery$json = {
  '1': 'DeleteFavoriteQuery',
  '2': [
    {'1': 'host', '3': 1, '4': 1, '5': 9, '10': 'host'},
    {'1': 'favouriteId', '3': 2, '4': 1, '5': 3, '10': 'favouriteId'},
  ],
};

/// Descriptor for `DeleteFavoriteQuery`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteFavoriteQueryDescriptor = $convert.base64Decode(
    'ChNEZWxldGVGYXZvcml0ZVF1ZXJ5EhIKBGhvc3QYASABKAlSBGhvc3QSIAoLZmF2b3VyaXRlSW'
    'QYAiABKANSC2Zhdm91cml0ZUlk');

@$core.Deprecated('Use exportComicsQueryDescriptor instead')
const ExportComicsQuery$json = {
  '1': 'ExportComicsQuery',
  '2': [
    {'1': 'comicIds', '3': 1, '4': 3, '5': 3, '10': 'comicIds'},
    {'1': 'folder', '3': 2, '4': 1, '5': 9, '10': 'folder'},
    {'1': 'exportType', '3': 3, '4': 1, '5': 5, '10': 'exportType'},
  ],
};

/// Descriptor for `ExportComicsQuery`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exportComicsQueryDescriptor = $convert.base64Decode(
    'ChFFeHBvcnRDb21pY3NRdWVyeRIaCghjb21pY0lkcxgBIAMoA1IIY29taWNJZHMSFgoGZm9sZG'
    'VyGAIgASgJUgZmb2xkZXISHgoKZXhwb3J0VHlwZRgDIAEoBVIKZXhwb3J0VHlwZQ==');

@$core.Deprecated('Use comicViewLogDtoDescriptor instead')
const ComicViewLogDto$json = {
  '1': 'ComicViewLogDto',
  '2': [
    {'1': 'comicId', '3': 1, '4': 1, '5': 3, '10': 'comicId'},
    {'1': 'position', '3': 2, '4': 1, '5': 3, '10': 'position'},
  ],
};

/// Descriptor for `ComicViewLogDto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List comicViewLogDtoDescriptor = $convert.base64Decode(
    'Cg9Db21pY1ZpZXdMb2dEdG8SGAoHY29taWNJZBgBIAEoA1IHY29taWNJZBIaCghwb3NpdGlvbh'
    'gCIAEoA1IIcG9zaXRpb24=');

@$core.Deprecated('Use pageQueryDescriptor instead')
const PageQuery$json = {
  '1': 'PageQuery',
  '2': [
    {'1': 'pageNumber', '3': 1, '4': 1, '5': 3, '10': 'pageNumber'},
  ],
};

/// Descriptor for `PageQuery`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pageQueryDescriptor = $convert.base64Decode(
    'CglQYWdlUXVlcnkSHgoKcGFnZU51bWJlchgBIAEoA1IKcGFnZU51bWJlcg==');

@$core.Deprecated('Use modifyPasswordDescriptor instead')
const ModifyPassword$json = {
  '1': 'ModifyPassword',
  '2': [
    {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
    {'1': 'oldPassword', '3': 2, '4': 1, '5': 9, '10': 'oldPassword'},
    {'1': 'newPassword', '3': 3, '4': 1, '5': 9, '10': 'newPassword'},
  ],
};

/// Descriptor for `ModifyPassword`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List modifyPasswordDescriptor = $convert.base64Decode(
    'Cg5Nb2RpZnlQYXNzd29yZBIaCgh1c2VybmFtZRgBIAEoCVIIdXNlcm5hbWUSIAoLb2xkUGFzc3'
    'dvcmQYAiABKAlSC29sZFBhc3N3b3JkEiAKC25ld1Bhc3N3b3JkGAMgASgJUgtuZXdQYXNzd29y'
    'ZA==');

@$core.Deprecated('Use proInfoAllDescriptor instead')
const ProInfoAll$json = {
  '1': 'ProInfoAll',
  '2': [
    {'1': 'proInfoAf', '3': 1, '4': 1, '5': 11, '6': '.ProInfoAf', '10': 'proInfoAf'},
    {'1': 'proInfoPat', '3': 2, '4': 1, '5': 11, '6': '.ProInfoPat', '10': 'proInfoPat'},
  ],
};

/// Descriptor for `ProInfoAll`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List proInfoAllDescriptor = $convert.base64Decode(
    'CgpQcm9JbmZvQWxsEigKCXByb0luZm9BZhgBIAEoCzIKLlByb0luZm9BZlIJcHJvSW5mb0FmEi'
    'sKCnByb0luZm9QYXQYAiABKAsyCy5Qcm9JbmZvUGF0Ugpwcm9JbmZvUGF0');

@$core.Deprecated('Use proInfoAfDescriptor instead')
const ProInfoAf$json = {
  '1': 'ProInfoAf',
  '2': [
    {'1': 'isPro', '3': 1, '4': 1, '5': 8, '10': 'isPro'},
    {'1': 'expire', '3': 2, '4': 1, '5': 3, '10': 'expire'},
  ],
};

/// Descriptor for `ProInfoAf`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List proInfoAfDescriptor = $convert.base64Decode(
    'CglQcm9JbmZvQWYSFAoFaXNQcm8YASABKAhSBWlzUHJvEhYKBmV4cGlyZRgCIAEoA1IGZXhwaX'
    'Jl');

@$core.Deprecated('Use proInfoPatDescriptor instead')
const ProInfoPat$json = {
  '1': 'ProInfoPat',
  '2': [
    {'1': 'isPro', '3': 1, '4': 1, '5': 8, '10': 'isPro'},
    {'1': 'patId', '3': 2, '4': 1, '5': 9, '10': 'patId'},
    {'1': 'bindUid', '3': 3, '4': 1, '5': 9, '10': 'bindUid'},
    {'1': 'requestDelete', '3': 4, '4': 1, '5': 3, '10': 'requestDelete'},
    {'1': 'reBind', '3': 5, '4': 1, '5': 3, '10': 'reBind'},
    {'1': 'errorType', '3': 6, '4': 1, '5': 5, '10': 'errorType'},
    {'1': 'errorMsg', '3': 7, '4': 1, '5': 9, '10': 'errorMsg'},
    {'1': 'accessKey', '3': 8, '4': 1, '5': 9, '10': 'accessKey'},
  ],
};

/// Descriptor for `ProInfoPat`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List proInfoPatDescriptor = $convert.base64Decode(
    'CgpQcm9JbmZvUGF0EhQKBWlzUHJvGAEgASgIUgVpc1BybxIUCgVwYXRJZBgCIAEoCVIFcGF0SW'
    'QSGAoHYmluZFVpZBgDIAEoCVIHYmluZFVpZBIkCg1yZXF1ZXN0RGVsZXRlGAQgASgDUg1yZXF1'
    'ZXN0RGVsZXRlEhYKBnJlQmluZBgFIAEoA1IGcmVCaW5kEhwKCWVycm9yVHlwZRgGIAEoBVIJZX'
    'Jyb3JUeXBlEhoKCGVycm9yTXNnGAcgASgJUghlcnJvck1zZxIcCglhY2Nlc3NLZXkYCCABKAlS'
    'CWFjY2Vzc0tleQ==');

