//
//  Generated code. Do not modify.
//  source: protos/properties.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class SavePropertyQuery extends $pb.GeneratedMessage {
  factory SavePropertyQuery({
    $core.String? k,
    $core.String? v,
  }) {
    final $result = create();
    if (k != null) {
      $result.k = k;
    }
    if (v != null) {
      $result.v = v;
    }
    return $result;
  }
  SavePropertyQuery._() : super();
  factory SavePropertyQuery.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SavePropertyQuery.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SavePropertyQuery', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'k')
    ..aOS(2, _omitFieldNames ? '' : 'v')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SavePropertyQuery clone() => SavePropertyQuery()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SavePropertyQuery copyWith(void Function(SavePropertyQuery) updates) => super.copyWith((message) => updates(message as SavePropertyQuery)) as SavePropertyQuery;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SavePropertyQuery create() => SavePropertyQuery._();
  SavePropertyQuery createEmptyInstance() => create();
  static $pb.PbList<SavePropertyQuery> createRepeated() => $pb.PbList<SavePropertyQuery>();
  @$core.pragma('dart2js:noInline')
  static SavePropertyQuery getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SavePropertyQuery>(create);
  static SavePropertyQuery? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get k => $_getSZ(0);
  @$pb.TagNumber(1)
  set k($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasK() => $_has(0);
  @$pb.TagNumber(1)
  void clearK() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get v => $_getSZ(1);
  @$pb.TagNumber(2)
  set v($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasV() => $_has(1);
  @$pb.TagNumber(2)
  void clearV() => clearField(2);
}

class LoadPropertyQuery extends $pb.GeneratedMessage {
  factory LoadPropertyQuery({
    $core.String? k,
  }) {
    final $result = create();
    if (k != null) {
      $result.k = k;
    }
    return $result;
  }
  LoadPropertyQuery._() : super();
  factory LoadPropertyQuery.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoadPropertyQuery.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LoadPropertyQuery', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'k')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoadPropertyQuery clone() => LoadPropertyQuery()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoadPropertyQuery copyWith(void Function(LoadPropertyQuery) updates) => super.copyWith((message) => updates(message as LoadPropertyQuery)) as LoadPropertyQuery;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LoadPropertyQuery create() => LoadPropertyQuery._();
  LoadPropertyQuery createEmptyInstance() => create();
  static $pb.PbList<LoadPropertyQuery> createRepeated() => $pb.PbList<LoadPropertyQuery>();
  @$core.pragma('dart2js:noInline')
  static LoadPropertyQuery getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoadPropertyQuery>(create);
  static LoadPropertyQuery? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get k => $_getSZ(0);
  @$pb.TagNumber(1)
  set k($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasK() => $_has(0);
  @$pb.TagNumber(1)
  void clearK() => clearField(1);
}

class LoadPropertyResult extends $pb.GeneratedMessage {
  factory LoadPropertyResult({
    $core.String? v,
  }) {
    final $result = create();
    if (v != null) {
      $result.v = v;
    }
    return $result;
  }
  LoadPropertyResult._() : super();
  factory LoadPropertyResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoadPropertyResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LoadPropertyResult', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'v')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoadPropertyResult clone() => LoadPropertyResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoadPropertyResult copyWith(void Function(LoadPropertyResult) updates) => super.copyWith((message) => updates(message as LoadPropertyResult)) as LoadPropertyResult;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LoadPropertyResult create() => LoadPropertyResult._();
  LoadPropertyResult createEmptyInstance() => create();
  static $pb.PbList<LoadPropertyResult> createRepeated() => $pb.PbList<LoadPropertyResult>();
  @$core.pragma('dart2js:noInline')
  static LoadPropertyResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoadPropertyResult>(create);
  static LoadPropertyResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get v => $_getSZ(0);
  @$pb.TagNumber(1)
  set v($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasV() => $_has(0);
  @$pb.TagNumber(1)
  void clearV() => clearField(1);
}

class FetchComicQuery extends $pb.GeneratedMessage {
  factory FetchComicQuery({
    $core.String? host,
    $core.String? filterName,
    $core.String? filterValue,
    $fixnum.Int64? pageNumber,
  }) {
    final $result = create();
    if (host != null) {
      $result.host = host;
    }
    if (filterName != null) {
      $result.filterName = filterName;
    }
    if (filterValue != null) {
      $result.filterValue = filterValue;
    }
    if (pageNumber != null) {
      $result.pageNumber = pageNumber;
    }
    return $result;
  }
  FetchComicQuery._() : super();
  factory FetchComicQuery.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchComicQuery.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FetchComicQuery', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'host')
    ..aOS(2, _omitFieldNames ? '' : 'filterName', protoName: 'filterName')
    ..aOS(3, _omitFieldNames ? '' : 'filterValue', protoName: 'filterValue')
    ..aInt64(4, _omitFieldNames ? '' : 'pageNumber', protoName: 'pageNumber')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchComicQuery clone() => FetchComicQuery()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchComicQuery copyWith(void Function(FetchComicQuery) updates) => super.copyWith((message) => updates(message as FetchComicQuery)) as FetchComicQuery;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FetchComicQuery create() => FetchComicQuery._();
  FetchComicQuery createEmptyInstance() => create();
  static $pb.PbList<FetchComicQuery> createRepeated() => $pb.PbList<FetchComicQuery>();
  @$core.pragma('dart2js:noInline')
  static FetchComicQuery getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchComicQuery>(create);
  static FetchComicQuery? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get host => $_getSZ(0);
  @$pb.TagNumber(1)
  set host($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHost() => $_has(0);
  @$pb.TagNumber(1)
  void clearHost() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get filterName => $_getSZ(1);
  @$pb.TagNumber(2)
  set filterName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFilterName() => $_has(1);
  @$pb.TagNumber(2)
  void clearFilterName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get filterValue => $_getSZ(2);
  @$pb.TagNumber(3)
  set filterValue($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFilterValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearFilterValue() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get pageNumber => $_getI64(3);
  @$pb.TagNumber(4)
  set pageNumber($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPageNumber() => $_has(3);
  @$pb.TagNumber(4)
  void clearPageNumber() => clearField(4);
}

class FetchComicResult extends $pb.GeneratedMessage {
  factory FetchComicResult({
    $core.Iterable<ComicSimple>? comics,
    $fixnum.Int64? currentPage,
    $fixnum.Int64? maxPage,
  }) {
    final $result = create();
    if (comics != null) {
      $result.comics.addAll(comics);
    }
    if (currentPage != null) {
      $result.currentPage = currentPage;
    }
    if (maxPage != null) {
      $result.maxPage = maxPage;
    }
    return $result;
  }
  FetchComicResult._() : super();
  factory FetchComicResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchComicResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FetchComicResult', createEmptyInstance: create)
    ..pc<ComicSimple>(1, _omitFieldNames ? '' : 'comics', $pb.PbFieldType.PM, subBuilder: ComicSimple.create)
    ..aInt64(2, _omitFieldNames ? '' : 'currentPage', protoName: 'currentPage')
    ..aInt64(3, _omitFieldNames ? '' : 'maxPage', protoName: 'maxPage')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchComicResult clone() => FetchComicResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchComicResult copyWith(void Function(FetchComicResult) updates) => super.copyWith((message) => updates(message as FetchComicResult)) as FetchComicResult;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FetchComicResult create() => FetchComicResult._();
  FetchComicResult createEmptyInstance() => create();
  static $pb.PbList<FetchComicResult> createRepeated() => $pb.PbList<FetchComicResult>();
  @$core.pragma('dart2js:noInline')
  static FetchComicResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchComicResult>(create);
  static FetchComicResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ComicSimple> get comics => $_getList(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get currentPage => $_getI64(1);
  @$pb.TagNumber(2)
  set currentPage($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCurrentPage() => $_has(1);
  @$pb.TagNumber(2)
  void clearCurrentPage() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get maxPage => $_getI64(2);
  @$pb.TagNumber(3)
  set maxPage($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMaxPage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMaxPage() => clearField(3);
}

class ComicSimple extends $pb.GeneratedMessage {
  factory ComicSimple({
    $fixnum.Int64? id,
    $core.String? cover,
    $core.String? title,
    $fixnum.Int64? favouriteId,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (cover != null) {
      $result.cover = cover;
    }
    if (title != null) {
      $result.title = title;
    }
    if (favouriteId != null) {
      $result.favouriteId = favouriteId;
    }
    return $result;
  }
  ComicSimple._() : super();
  factory ComicSimple.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ComicSimple.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ComicSimple', createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'cover')
    ..aOS(3, _omitFieldNames ? '' : 'title')
    ..aInt64(4, _omitFieldNames ? '' : 'favouriteId', protoName: 'favouriteId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ComicSimple clone() => ComicSimple()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ComicSimple copyWith(void Function(ComicSimple) updates) => super.copyWith((message) => updates(message as ComicSimple)) as ComicSimple;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ComicSimple create() => ComicSimple._();
  ComicSimple createEmptyInstance() => create();
  static $pb.PbList<ComicSimple> createRepeated() => $pb.PbList<ComicSimple>();
  @$core.pragma('dart2js:noInline')
  static ComicSimple getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ComicSimple>(create);
  static ComicSimple? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get cover => $_getSZ(1);
  @$pb.TagNumber(2)
  set cover($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCover() => $_has(1);
  @$pb.TagNumber(2)
  void clearCover() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get title => $_getSZ(2);
  @$pb.TagNumber(3)
  set title($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTitle() => $_has(2);
  @$pb.TagNumber(3)
  void clearTitle() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get favouriteId => $_getI64(3);
  @$pb.TagNumber(4)
  set favouriteId($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFavouriteId() => $_has(3);
  @$pb.TagNumber(4)
  void clearFavouriteId() => clearField(4);
}

class ComicInfoQuery extends $pb.GeneratedMessage {
  factory ComicInfoQuery({
    $core.String? host,
    $fixnum.Int64? id,
  }) {
    final $result = create();
    if (host != null) {
      $result.host = host;
    }
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  ComicInfoQuery._() : super();
  factory ComicInfoQuery.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ComicInfoQuery.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ComicInfoQuery', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'host')
    ..aInt64(2, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ComicInfoQuery clone() => ComicInfoQuery()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ComicInfoQuery copyWith(void Function(ComicInfoQuery) updates) => super.copyWith((message) => updates(message as ComicInfoQuery)) as ComicInfoQuery;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ComicInfoQuery create() => ComicInfoQuery._();
  ComicInfoQuery createEmptyInstance() => create();
  static $pb.PbList<ComicInfoQuery> createRepeated() => $pb.PbList<ComicInfoQuery>();
  @$core.pragma('dart2js:noInline')
  static ComicInfoQuery getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ComicInfoQuery>(create);
  static ComicInfoQuery? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get host => $_getSZ(0);
  @$pb.TagNumber(1)
  set host($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHost() => $_has(0);
  @$pb.TagNumber(1)
  void clearHost() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get id => $_getI64(1);
  @$pb.TagNumber(2)
  set id($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);
}

class ComicInfoResult extends $pb.GeneratedMessage {
  factory ComicInfoResult({
    ComicInfo? comicInfo,
    Uploader? uploader,
  }) {
    final $result = create();
    if (comicInfo != null) {
      $result.comicInfo = comicInfo;
    }
    if (uploader != null) {
      $result.uploader = uploader;
    }
    return $result;
  }
  ComicInfoResult._() : super();
  factory ComicInfoResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ComicInfoResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ComicInfoResult', createEmptyInstance: create)
    ..aOM<ComicInfo>(1, _omitFieldNames ? '' : 'comicInfo', protoName: 'comicInfo', subBuilder: ComicInfo.create)
    ..aOM<Uploader>(2, _omitFieldNames ? '' : 'uploader', subBuilder: Uploader.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ComicInfoResult clone() => ComicInfoResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ComicInfoResult copyWith(void Function(ComicInfoResult) updates) => super.copyWith((message) => updates(message as ComicInfoResult)) as ComicInfoResult;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ComicInfoResult create() => ComicInfoResult._();
  ComicInfoResult createEmptyInstance() => create();
  static $pb.PbList<ComicInfoResult> createRepeated() => $pb.PbList<ComicInfoResult>();
  @$core.pragma('dart2js:noInline')
  static ComicInfoResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ComicInfoResult>(create);
  static ComicInfoResult? _defaultInstance;

  @$pb.TagNumber(1)
  ComicInfo get comicInfo => $_getN(0);
  @$pb.TagNumber(1)
  set comicInfo(ComicInfo v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasComicInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearComicInfo() => clearField(1);
  @$pb.TagNumber(1)
  ComicInfo ensureComicInfo() => $_ensure(0);

  @$pb.TagNumber(2)
  Uploader get uploader => $_getN(1);
  @$pb.TagNumber(2)
  set uploader(Uploader v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasUploader() => $_has(1);
  @$pb.TagNumber(2)
  void clearUploader() => clearField(2);
  @$pb.TagNumber(2)
  Uploader ensureUploader() => $_ensure(1);
}

class ComicInfo extends $pb.GeneratedMessage {
  factory ComicInfo({
    $core.Iterable<$core.String>? labels,
    $core.Iterable<$core.String>? tags,
    $core.String? description,
  }) {
    final $result = create();
    if (labels != null) {
      $result.labels.addAll(labels);
    }
    if (tags != null) {
      $result.tags.addAll(tags);
    }
    if (description != null) {
      $result.description = description;
    }
    return $result;
  }
  ComicInfo._() : super();
  factory ComicInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ComicInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ComicInfo', createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'labels')
    ..pPS(2, _omitFieldNames ? '' : 'tags')
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ComicInfo clone() => ComicInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ComicInfo copyWith(void Function(ComicInfo) updates) => super.copyWith((message) => updates(message as ComicInfo)) as ComicInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ComicInfo create() => ComicInfo._();
  ComicInfo createEmptyInstance() => create();
  static $pb.PbList<ComicInfo> createRepeated() => $pb.PbList<ComicInfo>();
  @$core.pragma('dart2js:noInline')
  static ComicInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ComicInfo>(create);
  static ComicInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get labels => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$core.String> get tags => $_getList(1);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);
}

class Uploader extends $pb.GeneratedMessage {
  factory Uploader() => create();
  Uploader._() : super();
  factory Uploader.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Uploader.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Uploader', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Uploader clone() => Uploader()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Uploader copyWith(void Function(Uploader) updates) => super.copyWith((message) => updates(message as Uploader)) as Uploader;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Uploader create() => Uploader._();
  Uploader createEmptyInstance() => create();
  static $pb.PbList<Uploader> createRepeated() => $pb.PbList<Uploader>();
  @$core.pragma('dart2js:noInline')
  static Uploader getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Uploader>(create);
  static Uploader? _defaultInstance;
}

class ComicPage extends $pb.GeneratedMessage {
  factory ComicPage({
    $core.String? caption,
    $core.String? url,
  }) {
    final $result = create();
    if (caption != null) {
      $result.caption = caption;
    }
    if (url != null) {
      $result.url = url;
    }
    return $result;
  }
  ComicPage._() : super();
  factory ComicPage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ComicPage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ComicPage', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'caption')
    ..aOS(2, _omitFieldNames ? '' : 'url')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ComicPage clone() => ComicPage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ComicPage copyWith(void Function(ComicPage) updates) => super.copyWith((message) => updates(message as ComicPage)) as ComicPage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ComicPage create() => ComicPage._();
  ComicPage createEmptyInstance() => create();
  static $pb.PbList<ComicPage> createRepeated() => $pb.PbList<ComicPage>();
  @$core.pragma('dart2js:noInline')
  static ComicPage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ComicPage>(create);
  static ComicPage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get caption => $_getSZ(0);
  @$pb.TagNumber(1)
  set caption($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCaption() => $_has(0);
  @$pb.TagNumber(1)
  void clearCaption() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get url => $_getSZ(1);
  @$pb.TagNumber(2)
  set url($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearUrl() => clearField(2);
}

class ComicPagesResult extends $pb.GeneratedMessage {
  factory ComicPagesResult({
    $core.Iterable<ComicPage>? pages,
  }) {
    final $result = create();
    if (pages != null) {
      $result.pages.addAll(pages);
    }
    return $result;
  }
  ComicPagesResult._() : super();
  factory ComicPagesResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ComicPagesResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ComicPagesResult', createEmptyInstance: create)
    ..pc<ComicPage>(1, _omitFieldNames ? '' : 'pages', $pb.PbFieldType.PM, subBuilder: ComicPage.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ComicPagesResult clone() => ComicPagesResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ComicPagesResult copyWith(void Function(ComicPagesResult) updates) => super.copyWith((message) => updates(message as ComicPagesResult)) as ComicPagesResult;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ComicPagesResult create() => ComicPagesResult._();
  ComicPagesResult createEmptyInstance() => create();
  static $pb.PbList<ComicPagesResult> createRepeated() => $pb.PbList<ComicPagesResult>();
  @$core.pragma('dart2js:noInline')
  static ComicPagesResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ComicPagesResult>(create);
  static ComicPagesResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ComicPage> get pages => $_getList(0);
}

class CacheImageQuery extends $pb.GeneratedMessage {
  factory CacheImageQuery({
    $core.String? host,
    $core.String? url,
    $core.bool? ignoreFormat,
  }) {
    final $result = create();
    if (host != null) {
      $result.host = host;
    }
    if (url != null) {
      $result.url = url;
    }
    if (ignoreFormat != null) {
      $result.ignoreFormat = ignoreFormat;
    }
    return $result;
  }
  CacheImageQuery._() : super();
  factory CacheImageQuery.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CacheImageQuery.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CacheImageQuery', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'host')
    ..aOS(2, _omitFieldNames ? '' : 'url')
    ..aOB(3, _omitFieldNames ? '' : 'ignoreFormat', protoName: 'ignoreFormat')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CacheImageQuery clone() => CacheImageQuery()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CacheImageQuery copyWith(void Function(CacheImageQuery) updates) => super.copyWith((message) => updates(message as CacheImageQuery)) as CacheImageQuery;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CacheImageQuery create() => CacheImageQuery._();
  CacheImageQuery createEmptyInstance() => create();
  static $pb.PbList<CacheImageQuery> createRepeated() => $pb.PbList<CacheImageQuery>();
  @$core.pragma('dart2js:noInline')
  static CacheImageQuery getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CacheImageQuery>(create);
  static CacheImageQuery? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get host => $_getSZ(0);
  @$pb.TagNumber(1)
  set host($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHost() => $_has(0);
  @$pb.TagNumber(1)
  void clearHost() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get url => $_getSZ(1);
  @$pb.TagNumber(2)
  set url($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearUrl() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get ignoreFormat => $_getBF(2);
  @$pb.TagNumber(3)
  set ignoreFormat($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIgnoreFormat() => $_has(2);
  @$pb.TagNumber(3)
  void clearIgnoreFormat() => clearField(3);
}

class CacheImageResult extends $pb.GeneratedMessage {
  factory CacheImageResult({
    $core.String? localPath,
    $core.int? width,
    $core.int? height,
  }) {
    final $result = create();
    if (localPath != null) {
      $result.localPath = localPath;
    }
    if (width != null) {
      $result.width = width;
    }
    if (height != null) {
      $result.height = height;
    }
    return $result;
  }
  CacheImageResult._() : super();
  factory CacheImageResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CacheImageResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CacheImageResult', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'localPath', protoName: 'localPath')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'width', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'height', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CacheImageResult clone() => CacheImageResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CacheImageResult copyWith(void Function(CacheImageResult) updates) => super.copyWith((message) => updates(message as CacheImageResult)) as CacheImageResult;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CacheImageResult create() => CacheImageResult._();
  CacheImageResult createEmptyInstance() => create();
  static $pb.PbList<CacheImageResult> createRepeated() => $pb.PbList<CacheImageResult>();
  @$core.pragma('dart2js:noInline')
  static CacheImageResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CacheImageResult>(create);
  static CacheImageResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get localPath => $_getSZ(0);
  @$pb.TagNumber(1)
  set localPath($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLocalPath() => $_has(0);
  @$pb.TagNumber(1)
  void clearLocalPath() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get width => $_getIZ(1);
  @$pb.TagNumber(2)
  set width($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasWidth() => $_has(1);
  @$pb.TagNumber(2)
  void clearWidth() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get height => $_getIZ(2);
  @$pb.TagNumber(3)
  set height($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasHeight() => $_has(2);
  @$pb.TagNumber(3)
  void clearHeight() => clearField(3);
}

class AutoCleanQuery extends $pb.GeneratedMessage {
  factory AutoCleanQuery({
    $fixnum.Int64? expire,
  }) {
    final $result = create();
    if (expire != null) {
      $result.expire = expire;
    }
    return $result;
  }
  AutoCleanQuery._() : super();
  factory AutoCleanQuery.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AutoCleanQuery.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AutoCleanQuery', createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'expire')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AutoCleanQuery clone() => AutoCleanQuery()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AutoCleanQuery copyWith(void Function(AutoCleanQuery) updates) => super.copyWith((message) => updates(message as AutoCleanQuery)) as AutoCleanQuery;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AutoCleanQuery create() => AutoCleanQuery._();
  AutoCleanQuery createEmptyInstance() => create();
  static $pb.PbList<AutoCleanQuery> createRepeated() => $pb.PbList<AutoCleanQuery>();
  @$core.pragma('dart2js:noInline')
  static AutoCleanQuery getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AutoCleanQuery>(create);
  static AutoCleanQuery? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get expire => $_getI64(0);
  @$pb.TagNumber(1)
  set expire($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasExpire() => $_has(0);
  @$pb.TagNumber(1)
  void clearExpire() => clearField(1);
}

class HttpGetQuery extends $pb.GeneratedMessage {
  factory HttpGetQuery({
    $core.String? url,
  }) {
    final $result = create();
    if (url != null) {
      $result.url = url;
    }
    return $result;
  }
  HttpGetQuery._() : super();
  factory HttpGetQuery.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HttpGetQuery.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'HttpGetQuery', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'url')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HttpGetQuery clone() => HttpGetQuery()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HttpGetQuery copyWith(void Function(HttpGetQuery) updates) => super.copyWith((message) => updates(message as HttpGetQuery)) as HttpGetQuery;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HttpGetQuery create() => HttpGetQuery._();
  HttpGetQuery createEmptyInstance() => create();
  static $pb.PbList<HttpGetQuery> createRepeated() => $pb.PbList<HttpGetQuery>();
  @$core.pragma('dart2js:noInline')
  static HttpGetQuery getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HttpGetQuery>(create);
  static HttpGetQuery? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get url => $_getSZ(0);
  @$pb.TagNumber(1)
  set url($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrl() => clearField(1);
}

class HttpGetResult extends $pb.GeneratedMessage {
  factory HttpGetResult({
    $core.String? content,
  }) {
    final $result = create();
    if (content != null) {
      $result.content = content;
    }
    return $result;
  }
  HttpGetResult._() : super();
  factory HttpGetResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HttpGetResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'HttpGetResult', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'content')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HttpGetResult clone() => HttpGetResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HttpGetResult copyWith(void Function(HttpGetResult) updates) => super.copyWith((message) => updates(message as HttpGetResult)) as HttpGetResult;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HttpGetResult create() => HttpGetResult._();
  HttpGetResult createEmptyInstance() => create();
  static $pb.PbList<HttpGetResult> createRepeated() => $pb.PbList<HttpGetResult>();
  @$core.pragma('dart2js:noInline')
  static HttpGetResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HttpGetResult>(create);
  static HttpGetResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get content => $_getSZ(0);
  @$pb.TagNumber(1)
  set content($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasContent() => $_has(0);
  @$pb.TagNumber(1)
  void clearContent() => clearField(1);
}

class ComicSearchQuery extends $pb.GeneratedMessage {
  factory ComicSearchQuery({
    $core.String? host,
    $core.String? query,
    $fixnum.Int64? pageNumber,
  }) {
    final $result = create();
    if (host != null) {
      $result.host = host;
    }
    if (query != null) {
      $result.query = query;
    }
    if (pageNumber != null) {
      $result.pageNumber = pageNumber;
    }
    return $result;
  }
  ComicSearchQuery._() : super();
  factory ComicSearchQuery.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ComicSearchQuery.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ComicSearchQuery', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'host')
    ..aOS(2, _omitFieldNames ? '' : 'query')
    ..aInt64(3, _omitFieldNames ? '' : 'pageNumber', protoName: 'pageNumber')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ComicSearchQuery clone() => ComicSearchQuery()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ComicSearchQuery copyWith(void Function(ComicSearchQuery) updates) => super.copyWith((message) => updates(message as ComicSearchQuery)) as ComicSearchQuery;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ComicSearchQuery create() => ComicSearchQuery._();
  ComicSearchQuery createEmptyInstance() => create();
  static $pb.PbList<ComicSearchQuery> createRepeated() => $pb.PbList<ComicSearchQuery>();
  @$core.pragma('dart2js:noInline')
  static ComicSearchQuery getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ComicSearchQuery>(create);
  static ComicSearchQuery? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get host => $_getSZ(0);
  @$pb.TagNumber(1)
  set host($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHost() => $_has(0);
  @$pb.TagNumber(1)
  void clearHost() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get query => $_getSZ(1);
  @$pb.TagNumber(2)
  set query($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasQuery() => $_has(1);
  @$pb.TagNumber(2)
  void clearQuery() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get pageNumber => $_getI64(2);
  @$pb.TagNumber(3)
  set pageNumber($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPageNumber() => $_has(2);
  @$pb.TagNumber(3)
  void clearPageNumber() => clearField(3);
}

class UserRegisterQuery extends $pb.GeneratedMessage {
  factory UserRegisterQuery({
    $core.String? host,
    $core.String? username,
    $core.String? nickname,
    $core.String? email,
    $core.String? sex,
    $core.String? pass,
    $core.String? passAgain,
  }) {
    final $result = create();
    if (host != null) {
      $result.host = host;
    }
    if (username != null) {
      $result.username = username;
    }
    if (nickname != null) {
      $result.nickname = nickname;
    }
    if (email != null) {
      $result.email = email;
    }
    if (sex != null) {
      $result.sex = sex;
    }
    if (pass != null) {
      $result.pass = pass;
    }
    if (passAgain != null) {
      $result.passAgain = passAgain;
    }
    return $result;
  }
  UserRegisterQuery._() : super();
  factory UserRegisterQuery.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserRegisterQuery.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserRegisterQuery', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'host')
    ..aOS(2, _omitFieldNames ? '' : 'username')
    ..aOS(3, _omitFieldNames ? '' : 'nickname')
    ..aOS(4, _omitFieldNames ? '' : 'email')
    ..aOS(5, _omitFieldNames ? '' : 'sex')
    ..aOS(6, _omitFieldNames ? '' : 'pass')
    ..aOS(7, _omitFieldNames ? '' : 'passAgain', protoName: 'passAgain')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserRegisterQuery clone() => UserRegisterQuery()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserRegisterQuery copyWith(void Function(UserRegisterQuery) updates) => super.copyWith((message) => updates(message as UserRegisterQuery)) as UserRegisterQuery;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserRegisterQuery create() => UserRegisterQuery._();
  UserRegisterQuery createEmptyInstance() => create();
  static $pb.PbList<UserRegisterQuery> createRepeated() => $pb.PbList<UserRegisterQuery>();
  @$core.pragma('dart2js:noInline')
  static UserRegisterQuery getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserRegisterQuery>(create);
  static UserRegisterQuery? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get host => $_getSZ(0);
  @$pb.TagNumber(1)
  set host($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHost() => $_has(0);
  @$pb.TagNumber(1)
  void clearHost() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get username => $_getSZ(1);
  @$pb.TagNumber(2)
  set username($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUsername() => $_has(1);
  @$pb.TagNumber(2)
  void clearUsername() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get nickname => $_getSZ(2);
  @$pb.TagNumber(3)
  set nickname($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNickname() => $_has(2);
  @$pb.TagNumber(3)
  void clearNickname() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get email => $_getSZ(3);
  @$pb.TagNumber(4)
  set email($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasEmail() => $_has(3);
  @$pb.TagNumber(4)
  void clearEmail() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get sex => $_getSZ(4);
  @$pb.TagNumber(5)
  set sex($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSex() => $_has(4);
  @$pb.TagNumber(5)
  void clearSex() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get pass => $_getSZ(5);
  @$pb.TagNumber(6)
  set pass($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasPass() => $_has(5);
  @$pb.TagNumber(6)
  void clearPass() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get passAgain => $_getSZ(6);
  @$pb.TagNumber(7)
  set passAgain($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasPassAgain() => $_has(6);
  @$pb.TagNumber(7)
  void clearPassAgain() => clearField(7);
}

class UserLoginQuery extends $pb.GeneratedMessage {
  factory UserLoginQuery({
    $core.String? host,
    $core.String? username,
    $core.String? password,
  }) {
    final $result = create();
    if (host != null) {
      $result.host = host;
    }
    if (username != null) {
      $result.username = username;
    }
    if (password != null) {
      $result.password = password;
    }
    return $result;
  }
  UserLoginQuery._() : super();
  factory UserLoginQuery.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserLoginQuery.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserLoginQuery', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'host')
    ..aOS(2, _omitFieldNames ? '' : 'username')
    ..aOS(3, _omitFieldNames ? '' : 'password')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserLoginQuery clone() => UserLoginQuery()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserLoginQuery copyWith(void Function(UserLoginQuery) updates) => super.copyWith((message) => updates(message as UserLoginQuery)) as UserLoginQuery;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserLoginQuery create() => UserLoginQuery._();
  UserLoginQuery createEmptyInstance() => create();
  static $pb.PbList<UserLoginQuery> createRepeated() => $pb.PbList<UserLoginQuery>();
  @$core.pragma('dart2js:noInline')
  static UserLoginQuery getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserLoginQuery>(create);
  static UserLoginQuery? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get host => $_getSZ(0);
  @$pb.TagNumber(1)
  set host($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHost() => $_has(0);
  @$pb.TagNumber(1)
  void clearHost() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get username => $_getSZ(1);
  @$pb.TagNumber(2)
  set username($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUsername() => $_has(1);
  @$pb.TagNumber(2)
  void clearUsername() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get password => $_getSZ(2);
  @$pb.TagNumber(3)
  set password($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPassword() => $_has(2);
  @$pb.TagNumber(3)
  void clearPassword() => clearField(3);
}

class IsPro extends $pb.GeneratedMessage {
  factory IsPro({
    $core.bool? isPro,
    $fixnum.Int64? expire,
  }) {
    final $result = create();
    if (isPro != null) {
      $result.isPro = isPro;
    }
    if (expire != null) {
      $result.expire = expire;
    }
    return $result;
  }
  IsPro._() : super();
  factory IsPro.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IsPro.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'IsPro', createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isPro', protoName: 'isPro')
    ..aInt64(2, _omitFieldNames ? '' : 'expire')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IsPro clone() => IsPro()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IsPro copyWith(void Function(IsPro) updates) => super.copyWith((message) => updates(message as IsPro)) as IsPro;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IsPro create() => IsPro._();
  IsPro createEmptyInstance() => create();
  static $pb.PbList<IsPro> createRepeated() => $pb.PbList<IsPro>();
  @$core.pragma('dart2js:noInline')
  static IsPro getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IsPro>(create);
  static IsPro? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isPro => $_getBF(0);
  @$pb.TagNumber(1)
  set isPro($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsPro() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsPro() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get expire => $_getI64(1);
  @$pb.TagNumber(2)
  set expire($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasExpire() => $_has(1);
  @$pb.TagNumber(2)
  void clearExpire() => clearField(2);
}

class Empty extends $pb.GeneratedMessage {
  factory Empty() => create();
  Empty._() : super();
  factory Empty.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Empty.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Empty', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Empty clone() => Empty()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Empty copyWith(void Function(Empty) updates) => super.copyWith((message) => updates(message as Empty)) as Empty;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Empty create() => Empty._();
  Empty createEmptyInstance() => create();
  static $pb.PbList<Empty> createRepeated() => $pb.PbList<Empty>();
  @$core.pragma('dart2js:noInline')
  static Empty getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Empty>(create);
  static Empty? _defaultInstance;
}

class Puff extends $pb.GeneratedMessage {
  factory Puff({
    $core.String? value,
  }) {
    final $result = create();
    if (value != null) {
      $result.value = value;
    }
    return $result;
  }
  Puff._() : super();
  factory Puff.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Puff.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Puff', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'value')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Puff clone() => Puff()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Puff copyWith(void Function(Puff) updates) => super.copyWith((message) => updates(message as Puff)) as Puff;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Puff create() => Puff._();
  Puff createEmptyInstance() => create();
  static $pb.PbList<Puff> createRepeated() => $pb.PbList<Puff>();
  @$core.pragma('dart2js:noInline')
  static Puff getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Puff>(create);
  static Puff? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get value => $_getSZ(0);
  @$pb.TagNumber(1)
  set value($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

class PushToDownloads extends $pb.GeneratedMessage {
  factory PushToDownloads({
    $core.String? host,
    $core.Iterable<ComicSimple>? comics,
  }) {
    final $result = create();
    if (host != null) {
      $result.host = host;
    }
    if (comics != null) {
      $result.comics.addAll(comics);
    }
    return $result;
  }
  PushToDownloads._() : super();
  factory PushToDownloads.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PushToDownloads.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PushToDownloads', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'host')
    ..pc<ComicSimple>(2, _omitFieldNames ? '' : 'comics', $pb.PbFieldType.PM, subBuilder: ComicSimple.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PushToDownloads clone() => PushToDownloads()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PushToDownloads copyWith(void Function(PushToDownloads) updates) => super.copyWith((message) => updates(message as PushToDownloads)) as PushToDownloads;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PushToDownloads create() => PushToDownloads._();
  PushToDownloads createEmptyInstance() => create();
  static $pb.PbList<PushToDownloads> createRepeated() => $pb.PbList<PushToDownloads>();
  @$core.pragma('dart2js:noInline')
  static PushToDownloads getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PushToDownloads>(create);
  static PushToDownloads? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get host => $_getSZ(0);
  @$pb.TagNumber(1)
  set host($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHost() => $_has(0);
  @$pb.TagNumber(1)
  void clearHost() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<ComicSimple> get comics => $_getList(1);
}

class ComicDownloadsRes extends $pb.GeneratedMessage {
  factory ComicDownloadsRes({
    $core.Iterable<ComicDownloadDto>? downloads,
  }) {
    final $result = create();
    if (downloads != null) {
      $result.downloads.addAll(downloads);
    }
    return $result;
  }
  ComicDownloadsRes._() : super();
  factory ComicDownloadsRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ComicDownloadsRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ComicDownloadsRes', createEmptyInstance: create)
    ..pc<ComicDownloadDto>(1, _omitFieldNames ? '' : 'downloads', $pb.PbFieldType.PM, subBuilder: ComicDownloadDto.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ComicDownloadsRes clone() => ComicDownloadsRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ComicDownloadsRes copyWith(void Function(ComicDownloadsRes) updates) => super.copyWith((message) => updates(message as ComicDownloadsRes)) as ComicDownloadsRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ComicDownloadsRes create() => ComicDownloadsRes._();
  ComicDownloadsRes createEmptyInstance() => create();
  static $pb.PbList<ComicDownloadsRes> createRepeated() => $pb.PbList<ComicDownloadsRes>();
  @$core.pragma('dart2js:noInline')
  static ComicDownloadsRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ComicDownloadsRes>(create);
  static ComicDownloadsRes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ComicDownloadDto> get downloads => $_getList(0);
}

class ComicDownloadDto extends $pb.GeneratedMessage {
  factory ComicDownloadDto({
    $core.String? host,
    $fixnum.Int64? id,
    $core.String? cover,
    $core.String? title,
    $fixnum.Int64? status,
    $core.bool? coverDownload,
    $core.bool? fetchedInfo,
    $core.bool? fetchPage,
    $fixnum.Int64? pageCount,
    $fixnum.Int64? pageDown,
    $core.bool? deleting,
    $core.String? coverPath,
  }) {
    final $result = create();
    if (host != null) {
      $result.host = host;
    }
    if (id != null) {
      $result.id = id;
    }
    if (cover != null) {
      $result.cover = cover;
    }
    if (title != null) {
      $result.title = title;
    }
    if (status != null) {
      $result.status = status;
    }
    if (coverDownload != null) {
      $result.coverDownload = coverDownload;
    }
    if (fetchedInfo != null) {
      $result.fetchedInfo = fetchedInfo;
    }
    if (fetchPage != null) {
      $result.fetchPage = fetchPage;
    }
    if (pageCount != null) {
      $result.pageCount = pageCount;
    }
    if (pageDown != null) {
      $result.pageDown = pageDown;
    }
    if (deleting != null) {
      $result.deleting = deleting;
    }
    if (coverPath != null) {
      $result.coverPath = coverPath;
    }
    return $result;
  }
  ComicDownloadDto._() : super();
  factory ComicDownloadDto.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ComicDownloadDto.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ComicDownloadDto', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'host')
    ..aInt64(2, _omitFieldNames ? '' : 'id')
    ..aOS(3, _omitFieldNames ? '' : 'cover')
    ..aOS(4, _omitFieldNames ? '' : 'title')
    ..aInt64(5, _omitFieldNames ? '' : 'status')
    ..aOB(6, _omitFieldNames ? '' : 'coverDownload', protoName: 'coverDownload')
    ..aOB(7, _omitFieldNames ? '' : 'fetchedInfo', protoName: 'fetchedInfo')
    ..aOB(8, _omitFieldNames ? '' : 'fetchPage', protoName: 'fetchPage')
    ..aInt64(9, _omitFieldNames ? '' : 'pageCount', protoName: 'pageCount')
    ..aInt64(10, _omitFieldNames ? '' : 'pageDown', protoName: 'pageDown')
    ..aOB(11, _omitFieldNames ? '' : 'deleting')
    ..aOS(12, _omitFieldNames ? '' : 'coverPath', protoName: 'coverPath')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ComicDownloadDto clone() => ComicDownloadDto()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ComicDownloadDto copyWith(void Function(ComicDownloadDto) updates) => super.copyWith((message) => updates(message as ComicDownloadDto)) as ComicDownloadDto;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ComicDownloadDto create() => ComicDownloadDto._();
  ComicDownloadDto createEmptyInstance() => create();
  static $pb.PbList<ComicDownloadDto> createRepeated() => $pb.PbList<ComicDownloadDto>();
  @$core.pragma('dart2js:noInline')
  static ComicDownloadDto getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ComicDownloadDto>(create);
  static ComicDownloadDto? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get host => $_getSZ(0);
  @$pb.TagNumber(1)
  set host($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHost() => $_has(0);
  @$pb.TagNumber(1)
  void clearHost() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get id => $_getI64(1);
  @$pb.TagNumber(2)
  set id($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get cover => $_getSZ(2);
  @$pb.TagNumber(3)
  set cover($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCover() => $_has(2);
  @$pb.TagNumber(3)
  void clearCover() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get title => $_getSZ(3);
  @$pb.TagNumber(4)
  set title($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTitle() => $_has(3);
  @$pb.TagNumber(4)
  void clearTitle() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get status => $_getI64(4);
  @$pb.TagNumber(5)
  set status($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get coverDownload => $_getBF(5);
  @$pb.TagNumber(6)
  set coverDownload($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCoverDownload() => $_has(5);
  @$pb.TagNumber(6)
  void clearCoverDownload() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get fetchedInfo => $_getBF(6);
  @$pb.TagNumber(7)
  set fetchedInfo($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasFetchedInfo() => $_has(6);
  @$pb.TagNumber(7)
  void clearFetchedInfo() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get fetchPage => $_getBF(7);
  @$pb.TagNumber(8)
  set fetchPage($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasFetchPage() => $_has(7);
  @$pb.TagNumber(8)
  void clearFetchPage() => clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get pageCount => $_getI64(8);
  @$pb.TagNumber(9)
  set pageCount($fixnum.Int64 v) { $_setInt64(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasPageCount() => $_has(8);
  @$pb.TagNumber(9)
  void clearPageCount() => clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get pageDown => $_getI64(9);
  @$pb.TagNumber(10)
  set pageDown($fixnum.Int64 v) { $_setInt64(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasPageDown() => $_has(9);
  @$pb.TagNumber(10)
  void clearPageDown() => clearField(10);

  @$pb.TagNumber(11)
  $core.bool get deleting => $_getBF(10);
  @$pb.TagNumber(11)
  set deleting($core.bool v) { $_setBool(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasDeleting() => $_has(10);
  @$pb.TagNumber(11)
  void clearDeleting() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get coverPath => $_getSZ(11);
  @$pb.TagNumber(12)
  set coverPath($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasCoverPath() => $_has(11);
  @$pb.TagNumber(12)
  void clearCoverPath() => clearField(12);
}

class DownloadInfoQuery extends $pb.GeneratedMessage {
  factory DownloadInfoQuery({
    $fixnum.Int64? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  DownloadInfoQuery._() : super();
  factory DownloadInfoQuery.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DownloadInfoQuery.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DownloadInfoQuery', createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DownloadInfoQuery clone() => DownloadInfoQuery()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DownloadInfoQuery copyWith(void Function(DownloadInfoQuery) updates) => super.copyWith((message) => updates(message as DownloadInfoQuery)) as DownloadInfoQuery;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DownloadInfoQuery create() => DownloadInfoQuery._();
  DownloadInfoQuery createEmptyInstance() => create();
  static $pb.PbList<DownloadInfoQuery> createRepeated() => $pb.PbList<DownloadInfoQuery>();
  @$core.pragma('dart2js:noInline')
  static DownloadInfoQuery getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DownloadInfoQuery>(create);
  static DownloadInfoQuery? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class ComicDownloadInfoDto extends $pb.GeneratedMessage {
  factory ComicDownloadInfoDto({
    $core.String? host,
    $fixnum.Int64? id,
    $core.String? cover,
    $core.String? title,
    $fixnum.Int64? status,
    $core.bool? coverDownload,
    $fixnum.Int64? pageCount,
    $fixnum.Int64? pageDown,
    $core.bool? deleting,
    $core.Iterable<$core.String>? labels,
    $core.Iterable<$core.String>? tags,
    $core.String? description,
  }) {
    final $result = create();
    if (host != null) {
      $result.host = host;
    }
    if (id != null) {
      $result.id = id;
    }
    if (cover != null) {
      $result.cover = cover;
    }
    if (title != null) {
      $result.title = title;
    }
    if (status != null) {
      $result.status = status;
    }
    if (coverDownload != null) {
      $result.coverDownload = coverDownload;
    }
    if (pageCount != null) {
      $result.pageCount = pageCount;
    }
    if (pageDown != null) {
      $result.pageDown = pageDown;
    }
    if (deleting != null) {
      $result.deleting = deleting;
    }
    if (labels != null) {
      $result.labels.addAll(labels);
    }
    if (tags != null) {
      $result.tags.addAll(tags);
    }
    if (description != null) {
      $result.description = description;
    }
    return $result;
  }
  ComicDownloadInfoDto._() : super();
  factory ComicDownloadInfoDto.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ComicDownloadInfoDto.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ComicDownloadInfoDto', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'host')
    ..aInt64(2, _omitFieldNames ? '' : 'id')
    ..aOS(3, _omitFieldNames ? '' : 'cover')
    ..aOS(4, _omitFieldNames ? '' : 'title')
    ..aInt64(5, _omitFieldNames ? '' : 'status')
    ..aOB(6, _omitFieldNames ? '' : 'coverDownload', protoName: 'coverDownload')
    ..aInt64(7, _omitFieldNames ? '' : 'pageCount', protoName: 'pageCount')
    ..aInt64(8, _omitFieldNames ? '' : 'pageDown', protoName: 'pageDown')
    ..aOB(9, _omitFieldNames ? '' : 'deleting')
    ..pPS(10, _omitFieldNames ? '' : 'labels')
    ..pPS(11, _omitFieldNames ? '' : 'tags')
    ..aOS(12, _omitFieldNames ? '' : 'description')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ComicDownloadInfoDto clone() => ComicDownloadInfoDto()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ComicDownloadInfoDto copyWith(void Function(ComicDownloadInfoDto) updates) => super.copyWith((message) => updates(message as ComicDownloadInfoDto)) as ComicDownloadInfoDto;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ComicDownloadInfoDto create() => ComicDownloadInfoDto._();
  ComicDownloadInfoDto createEmptyInstance() => create();
  static $pb.PbList<ComicDownloadInfoDto> createRepeated() => $pb.PbList<ComicDownloadInfoDto>();
  @$core.pragma('dart2js:noInline')
  static ComicDownloadInfoDto getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ComicDownloadInfoDto>(create);
  static ComicDownloadInfoDto? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get host => $_getSZ(0);
  @$pb.TagNumber(1)
  set host($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHost() => $_has(0);
  @$pb.TagNumber(1)
  void clearHost() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get id => $_getI64(1);
  @$pb.TagNumber(2)
  set id($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get cover => $_getSZ(2);
  @$pb.TagNumber(3)
  set cover($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCover() => $_has(2);
  @$pb.TagNumber(3)
  void clearCover() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get title => $_getSZ(3);
  @$pb.TagNumber(4)
  set title($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTitle() => $_has(3);
  @$pb.TagNumber(4)
  void clearTitle() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get status => $_getI64(4);
  @$pb.TagNumber(5)
  set status($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get coverDownload => $_getBF(5);
  @$pb.TagNumber(6)
  set coverDownload($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCoverDownload() => $_has(5);
  @$pb.TagNumber(6)
  void clearCoverDownload() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get pageCount => $_getI64(6);
  @$pb.TagNumber(7)
  set pageCount($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasPageCount() => $_has(6);
  @$pb.TagNumber(7)
  void clearPageCount() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get pageDown => $_getI64(7);
  @$pb.TagNumber(8)
  set pageDown($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasPageDown() => $_has(7);
  @$pb.TagNumber(8)
  void clearPageDown() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get deleting => $_getBF(8);
  @$pb.TagNumber(9)
  set deleting($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasDeleting() => $_has(8);
  @$pb.TagNumber(9)
  void clearDeleting() => clearField(9);

  @$pb.TagNumber(10)
  $core.List<$core.String> get labels => $_getList(9);

  @$pb.TagNumber(11)
  $core.List<$core.String> get tags => $_getList(10);

  @$pb.TagNumber(12)
  $core.String get description => $_getSZ(11);
  @$pb.TagNumber(12)
  set description($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasDescription() => $_has(11);
  @$pb.TagNumber(12)
  void clearDescription() => clearField(12);
}

class DownloadComicPages extends $pb.GeneratedMessage {
  factory DownloadComicPages({
    $core.Iterable<DownloadComicPageDto>? pages,
  }) {
    final $result = create();
    if (pages != null) {
      $result.pages.addAll(pages);
    }
    return $result;
  }
  DownloadComicPages._() : super();
  factory DownloadComicPages.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DownloadComicPages.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DownloadComicPages', createEmptyInstance: create)
    ..pc<DownloadComicPageDto>(1, _omitFieldNames ? '' : 'pages', $pb.PbFieldType.PM, subBuilder: DownloadComicPageDto.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DownloadComicPages clone() => DownloadComicPages()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DownloadComicPages copyWith(void Function(DownloadComicPages) updates) => super.copyWith((message) => updates(message as DownloadComicPages)) as DownloadComicPages;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DownloadComicPages create() => DownloadComicPages._();
  DownloadComicPages createEmptyInstance() => create();
  static $pb.PbList<DownloadComicPages> createRepeated() => $pb.PbList<DownloadComicPages>();
  @$core.pragma('dart2js:noInline')
  static DownloadComicPages getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DownloadComicPages>(create);
  static DownloadComicPages? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<DownloadComicPageDto> get pages => $_getList(0);
}

class DownloadComicPageDto extends $pb.GeneratedMessage {
  factory DownloadComicPageDto({
    $fixnum.Int64? width,
    $fixnum.Int64? height,
    $core.String? format,
    $core.String? path,
    $core.String? url,
    $core.String? caption,
  }) {
    final $result = create();
    if (width != null) {
      $result.width = width;
    }
    if (height != null) {
      $result.height = height;
    }
    if (format != null) {
      $result.format = format;
    }
    if (path != null) {
      $result.path = path;
    }
    if (url != null) {
      $result.url = url;
    }
    if (caption != null) {
      $result.caption = caption;
    }
    return $result;
  }
  DownloadComicPageDto._() : super();
  factory DownloadComicPageDto.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DownloadComicPageDto.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DownloadComicPageDto', createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'width')
    ..aInt64(2, _omitFieldNames ? '' : 'height')
    ..aOS(3, _omitFieldNames ? '' : 'format')
    ..aOS(4, _omitFieldNames ? '' : 'path')
    ..aOS(5, _omitFieldNames ? '' : 'url')
    ..aOS(6, _omitFieldNames ? '' : 'caption')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DownloadComicPageDto clone() => DownloadComicPageDto()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DownloadComicPageDto copyWith(void Function(DownloadComicPageDto) updates) => super.copyWith((message) => updates(message as DownloadComicPageDto)) as DownloadComicPageDto;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DownloadComicPageDto create() => DownloadComicPageDto._();
  DownloadComicPageDto createEmptyInstance() => create();
  static $pb.PbList<DownloadComicPageDto> createRepeated() => $pb.PbList<DownloadComicPageDto>();
  @$core.pragma('dart2js:noInline')
  static DownloadComicPageDto getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DownloadComicPageDto>(create);
  static DownloadComicPageDto? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get width => $_getI64(0);
  @$pb.TagNumber(1)
  set width($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasWidth() => $_has(0);
  @$pb.TagNumber(1)
  void clearWidth() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get height => $_getI64(1);
  @$pb.TagNumber(2)
  set height($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasHeight() => $_has(1);
  @$pb.TagNumber(2)
  void clearHeight() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get format => $_getSZ(2);
  @$pb.TagNumber(3)
  set format($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFormat() => $_has(2);
  @$pb.TagNumber(3)
  void clearFormat() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get path => $_getSZ(3);
  @$pb.TagNumber(4)
  set path($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPath() => $_has(3);
  @$pb.TagNumber(4)
  void clearPath() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get url => $_getSZ(4);
  @$pb.TagNumber(5)
  set url($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasUrl() => $_has(4);
  @$pb.TagNumber(5)
  void clearUrl() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get caption => $_getSZ(5);
  @$pb.TagNumber(6)
  set caption($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCaption() => $_has(5);
  @$pb.TagNumber(6)
  void clearCaption() => clearField(6);
}

class StringValue extends $pb.GeneratedMessage {
  factory StringValue({
    $core.String? value,
  }) {
    final $result = create();
    if (value != null) {
      $result.value = value;
    }
    return $result;
  }
  StringValue._() : super();
  factory StringValue.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StringValue.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StringValue', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'value')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StringValue clone() => StringValue()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StringValue copyWith(void Function(StringValue) updates) => super.copyWith((message) => updates(message as StringValue)) as StringValue;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StringValue create() => StringValue._();
  StringValue createEmptyInstance() => create();
  static $pb.PbList<StringValue> createRepeated() => $pb.PbList<StringValue>();
  @$core.pragma('dart2js:noInline')
  static StringValue getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StringValue>(create);
  static StringValue? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get value => $_getSZ(0);
  @$pb.TagNumber(1)
  set value($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

class IntValue extends $pb.GeneratedMessage {
  factory IntValue({
    $fixnum.Int64? value,
  }) {
    final $result = create();
    if (value != null) {
      $result.value = value;
    }
    return $result;
  }
  IntValue._() : super();
  factory IntValue.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IntValue.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'IntValue', createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'value')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IntValue clone() => IntValue()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IntValue copyWith(void Function(IntValue) updates) => super.copyWith((message) => updates(message as IntValue)) as IntValue;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IntValue create() => IntValue._();
  IntValue createEmptyInstance() => create();
  static $pb.PbList<IntValue> createRepeated() => $pb.PbList<IntValue>();
  @$core.pragma('dart2js:noInline')
  static IntValue getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IntValue>(create);
  static IntValue? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get value => $_getI64(0);
  @$pb.TagNumber(1)
  set value($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

class BoolValue extends $pb.GeneratedMessage {
  factory BoolValue({
    $core.bool? value,
  }) {
    final $result = create();
    if (value != null) {
      $result.value = value;
    }
    return $result;
  }
  BoolValue._() : super();
  factory BoolValue.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BoolValue.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BoolValue', createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'value')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BoolValue clone() => BoolValue()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BoolValue copyWith(void Function(BoolValue) updates) => super.copyWith((message) => updates(message as BoolValue)) as BoolValue;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BoolValue create() => BoolValue._();
  BoolValue createEmptyInstance() => create();
  static $pb.PbList<BoolValue> createRepeated() => $pb.PbList<BoolValue>();
  @$core.pragma('dart2js:noInline')
  static BoolValue getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BoolValue>(create);
  static BoolValue? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get value => $_getBF(0);
  @$pb.TagNumber(1)
  set value($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

class CreateFavoritesPartitionQuery extends $pb.GeneratedMessage {
  factory CreateFavoritesPartitionQuery({
    $core.String? host,
    $core.String? name,
  }) {
    final $result = create();
    if (host != null) {
      $result.host = host;
    }
    if (name != null) {
      $result.name = name;
    }
    return $result;
  }
  CreateFavoritesPartitionQuery._() : super();
  factory CreateFavoritesPartitionQuery.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateFavoritesPartitionQuery.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateFavoritesPartitionQuery', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'host')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateFavoritesPartitionQuery clone() => CreateFavoritesPartitionQuery()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateFavoritesPartitionQuery copyWith(void Function(CreateFavoritesPartitionQuery) updates) => super.copyWith((message) => updates(message as CreateFavoritesPartitionQuery)) as CreateFavoritesPartitionQuery;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateFavoritesPartitionQuery create() => CreateFavoritesPartitionQuery._();
  CreateFavoritesPartitionQuery createEmptyInstance() => create();
  static $pb.PbList<CreateFavoritesPartitionQuery> createRepeated() => $pb.PbList<CreateFavoritesPartitionQuery>();
  @$core.pragma('dart2js:noInline')
  static CreateFavoritesPartitionQuery getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateFavoritesPartitionQuery>(create);
  static CreateFavoritesPartitionQuery? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get host => $_getSZ(0);
  @$pb.TagNumber(1)
  set host($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHost() => $_has(0);
  @$pb.TagNumber(1)
  void clearHost() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);
}

class FavoritesPartitionsQuery extends $pb.GeneratedMessage {
  factory FavoritesPartitionsQuery({
    $core.String? host,
  }) {
    final $result = create();
    if (host != null) {
      $result.host = host;
    }
    return $result;
  }
  FavoritesPartitionsQuery._() : super();
  factory FavoritesPartitionsQuery.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FavoritesPartitionsQuery.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FavoritesPartitionsQuery', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'host')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FavoritesPartitionsQuery clone() => FavoritesPartitionsQuery()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FavoritesPartitionsQuery copyWith(void Function(FavoritesPartitionsQuery) updates) => super.copyWith((message) => updates(message as FavoritesPartitionsQuery)) as FavoritesPartitionsQuery;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FavoritesPartitionsQuery create() => FavoritesPartitionsQuery._();
  FavoritesPartitionsQuery createEmptyInstance() => create();
  static $pb.PbList<FavoritesPartitionsQuery> createRepeated() => $pb.PbList<FavoritesPartitionsQuery>();
  @$core.pragma('dart2js:noInline')
  static FavoritesPartitionsQuery getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FavoritesPartitionsQuery>(create);
  static FavoritesPartitionsQuery? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get host => $_getSZ(0);
  @$pb.TagNumber(1)
  set host($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHost() => $_has(0);
  @$pb.TagNumber(1)
  void clearHost() => clearField(1);
}

class FavoritesPartitionResult extends $pb.GeneratedMessage {
  factory FavoritesPartitionResult({
    $core.Iterable<FavoritesPartitionDto>? partitionList,
  }) {
    final $result = create();
    if (partitionList != null) {
      $result.partitionList.addAll(partitionList);
    }
    return $result;
  }
  FavoritesPartitionResult._() : super();
  factory FavoritesPartitionResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FavoritesPartitionResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FavoritesPartitionResult', createEmptyInstance: create)
    ..pc<FavoritesPartitionDto>(1, _omitFieldNames ? '' : 'partitionList', $pb.PbFieldType.PM, protoName: 'partitionList', subBuilder: FavoritesPartitionDto.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FavoritesPartitionResult clone() => FavoritesPartitionResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FavoritesPartitionResult copyWith(void Function(FavoritesPartitionResult) updates) => super.copyWith((message) => updates(message as FavoritesPartitionResult)) as FavoritesPartitionResult;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FavoritesPartitionResult create() => FavoritesPartitionResult._();
  FavoritesPartitionResult createEmptyInstance() => create();
  static $pb.PbList<FavoritesPartitionResult> createRepeated() => $pb.PbList<FavoritesPartitionResult>();
  @$core.pragma('dart2js:noInline')
  static FavoritesPartitionResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FavoritesPartitionResult>(create);
  static FavoritesPartitionResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<FavoritesPartitionDto> get partitionList => $_getList(0);
}

class FavoritesPartitionDto extends $pb.GeneratedMessage {
  factory FavoritesPartitionDto({
    $fixnum.Int64? id,
    $core.String? name,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (name != null) {
      $result.name = name;
    }
    return $result;
  }
  FavoritesPartitionDto._() : super();
  factory FavoritesPartitionDto.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FavoritesPartitionDto.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FavoritesPartitionDto', createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FavoritesPartitionDto clone() => FavoritesPartitionDto()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FavoritesPartitionDto copyWith(void Function(FavoritesPartitionDto) updates) => super.copyWith((message) => updates(message as FavoritesPartitionDto)) as FavoritesPartitionDto;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FavoritesPartitionDto create() => FavoritesPartitionDto._();
  FavoritesPartitionDto createEmptyInstance() => create();
  static $pb.PbList<FavoritesPartitionDto> createRepeated() => $pb.PbList<FavoritesPartitionDto>();
  @$core.pragma('dart2js:noInline')
  static FavoritesPartitionDto getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FavoritesPartitionDto>(create);
  static FavoritesPartitionDto? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);
}

class RenameFavoritesPartitionQuery extends $pb.GeneratedMessage {
  factory RenameFavoritesPartitionQuery({
    $core.String? host,
    $fixnum.Int64? id,
    $core.String? name,
  }) {
    final $result = create();
    if (host != null) {
      $result.host = host;
    }
    if (id != null) {
      $result.id = id;
    }
    if (name != null) {
      $result.name = name;
    }
    return $result;
  }
  RenameFavoritesPartitionQuery._() : super();
  factory RenameFavoritesPartitionQuery.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RenameFavoritesPartitionQuery.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RenameFavoritesPartitionQuery', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'host')
    ..aInt64(2, _omitFieldNames ? '' : 'id')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RenameFavoritesPartitionQuery clone() => RenameFavoritesPartitionQuery()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RenameFavoritesPartitionQuery copyWith(void Function(RenameFavoritesPartitionQuery) updates) => super.copyWith((message) => updates(message as RenameFavoritesPartitionQuery)) as RenameFavoritesPartitionQuery;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RenameFavoritesPartitionQuery create() => RenameFavoritesPartitionQuery._();
  RenameFavoritesPartitionQuery createEmptyInstance() => create();
  static $pb.PbList<RenameFavoritesPartitionQuery> createRepeated() => $pb.PbList<RenameFavoritesPartitionQuery>();
  @$core.pragma('dart2js:noInline')
  static RenameFavoritesPartitionQuery getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RenameFavoritesPartitionQuery>(create);
  static RenameFavoritesPartitionQuery? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get host => $_getSZ(0);
  @$pb.TagNumber(1)
  set host($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHost() => $_has(0);
  @$pb.TagNumber(1)
  void clearHost() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get id => $_getI64(1);
  @$pb.TagNumber(2)
  set id($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);
}

class FavoriteComicQuery extends $pb.GeneratedMessage {
  factory FavoriteComicQuery({
    $core.String? host,
    $fixnum.Int64? comicId,
    $fixnum.Int64? partitionId,
  }) {
    final $result = create();
    if (host != null) {
      $result.host = host;
    }
    if (comicId != null) {
      $result.comicId = comicId;
    }
    if (partitionId != null) {
      $result.partitionId = partitionId;
    }
    return $result;
  }
  FavoriteComicQuery._() : super();
  factory FavoriteComicQuery.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FavoriteComicQuery.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FavoriteComicQuery', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'host')
    ..aInt64(2, _omitFieldNames ? '' : 'comicId', protoName: 'comicId')
    ..aInt64(3, _omitFieldNames ? '' : 'partitionId', protoName: 'partitionId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FavoriteComicQuery clone() => FavoriteComicQuery()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FavoriteComicQuery copyWith(void Function(FavoriteComicQuery) updates) => super.copyWith((message) => updates(message as FavoriteComicQuery)) as FavoriteComicQuery;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FavoriteComicQuery create() => FavoriteComicQuery._();
  FavoriteComicQuery createEmptyInstance() => create();
  static $pb.PbList<FavoriteComicQuery> createRepeated() => $pb.PbList<FavoriteComicQuery>();
  @$core.pragma('dart2js:noInline')
  static FavoriteComicQuery getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FavoriteComicQuery>(create);
  static FavoriteComicQuery? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get host => $_getSZ(0);
  @$pb.TagNumber(1)
  set host($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHost() => $_has(0);
  @$pb.TagNumber(1)
  void clearHost() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get comicId => $_getI64(1);
  @$pb.TagNumber(2)
  set comicId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasComicId() => $_has(1);
  @$pb.TagNumber(2)
  void clearComicId() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get partitionId => $_getI64(2);
  @$pb.TagNumber(3)
  set partitionId($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPartitionId() => $_has(2);
  @$pb.TagNumber(3)
  void clearPartitionId() => clearField(3);
}

class FavoriteListQuery extends $pb.GeneratedMessage {
  factory FavoriteListQuery({
    $core.String? host,
    $fixnum.Int64? partitionId,
    $fixnum.Int64? page,
  }) {
    final $result = create();
    if (host != null) {
      $result.host = host;
    }
    if (partitionId != null) {
      $result.partitionId = partitionId;
    }
    if (page != null) {
      $result.page = page;
    }
    return $result;
  }
  FavoriteListQuery._() : super();
  factory FavoriteListQuery.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FavoriteListQuery.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FavoriteListQuery', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'host')
    ..aInt64(2, _omitFieldNames ? '' : 'partitionId', protoName: 'partitionId')
    ..aInt64(3, _omitFieldNames ? '' : 'page')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FavoriteListQuery clone() => FavoriteListQuery()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FavoriteListQuery copyWith(void Function(FavoriteListQuery) updates) => super.copyWith((message) => updates(message as FavoriteListQuery)) as FavoriteListQuery;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FavoriteListQuery create() => FavoriteListQuery._();
  FavoriteListQuery createEmptyInstance() => create();
  static $pb.PbList<FavoriteListQuery> createRepeated() => $pb.PbList<FavoriteListQuery>();
  @$core.pragma('dart2js:noInline')
  static FavoriteListQuery getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FavoriteListQuery>(create);
  static FavoriteListQuery? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get host => $_getSZ(0);
  @$pb.TagNumber(1)
  set host($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHost() => $_has(0);
  @$pb.TagNumber(1)
  void clearHost() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get partitionId => $_getI64(1);
  @$pb.TagNumber(2)
  set partitionId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPartitionId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPartitionId() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get page => $_getI64(2);
  @$pb.TagNumber(3)
  set page($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPage() => $_has(2);
  @$pb.TagNumber(3)
  void clearPage() => clearField(3);
}

class LoginUserQuery extends $pb.GeneratedMessage {
  factory LoginUserQuery({
    $core.String? host,
  }) {
    final $result = create();
    if (host != null) {
      $result.host = host;
    }
    return $result;
  }
  LoginUserQuery._() : super();
  factory LoginUserQuery.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoginUserQuery.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LoginUserQuery', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'host')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoginUserQuery clone() => LoginUserQuery()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoginUserQuery copyWith(void Function(LoginUserQuery) updates) => super.copyWith((message) => updates(message as LoginUserQuery)) as LoginUserQuery;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LoginUserQuery create() => LoginUserQuery._();
  LoginUserQuery createEmptyInstance() => create();
  static $pb.PbList<LoginUserQuery> createRepeated() => $pb.PbList<LoginUserQuery>();
  @$core.pragma('dart2js:noInline')
  static LoginUserQuery getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginUserQuery>(create);
  static LoginUserQuery? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get host => $_getSZ(0);
  @$pb.TagNumber(1)
  set host($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHost() => $_has(0);
  @$pb.TagNumber(1)
  void clearHost() => clearField(1);
}

class LoginUser extends $pb.GeneratedMessage {
  factory LoginUser({
    $core.String? nicename,
  }) {
    final $result = create();
    if (nicename != null) {
      $result.nicename = nicename;
    }
    return $result;
  }
  LoginUser._() : super();
  factory LoginUser.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoginUser.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LoginUser', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'nicename')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoginUser clone() => LoginUser()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoginUser copyWith(void Function(LoginUser) updates) => super.copyWith((message) => updates(message as LoginUser)) as LoginUser;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LoginUser create() => LoginUser._();
  LoginUser createEmptyInstance() => create();
  static $pb.PbList<LoginUser> createRepeated() => $pb.PbList<LoginUser>();
  @$core.pragma('dart2js:noInline')
  static LoginUser getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginUser>(create);
  static LoginUser? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get nicename => $_getSZ(0);
  @$pb.TagNumber(1)
  set nicename($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNicename() => $_has(0);
  @$pb.TagNumber(1)
  void clearNicename() => clearField(1);
}

class DeleteFavoriteQuery extends $pb.GeneratedMessage {
  factory DeleteFavoriteQuery({
    $core.String? host,
    $fixnum.Int64? favouriteId,
  }) {
    final $result = create();
    if (host != null) {
      $result.host = host;
    }
    if (favouriteId != null) {
      $result.favouriteId = favouriteId;
    }
    return $result;
  }
  DeleteFavoriteQuery._() : super();
  factory DeleteFavoriteQuery.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteFavoriteQuery.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteFavoriteQuery', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'host')
    ..aInt64(2, _omitFieldNames ? '' : 'favouriteId', protoName: 'favouriteId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteFavoriteQuery clone() => DeleteFavoriteQuery()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteFavoriteQuery copyWith(void Function(DeleteFavoriteQuery) updates) => super.copyWith((message) => updates(message as DeleteFavoriteQuery)) as DeleteFavoriteQuery;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteFavoriteQuery create() => DeleteFavoriteQuery._();
  DeleteFavoriteQuery createEmptyInstance() => create();
  static $pb.PbList<DeleteFavoriteQuery> createRepeated() => $pb.PbList<DeleteFavoriteQuery>();
  @$core.pragma('dart2js:noInline')
  static DeleteFavoriteQuery getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteFavoriteQuery>(create);
  static DeleteFavoriteQuery? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get host => $_getSZ(0);
  @$pb.TagNumber(1)
  set host($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHost() => $_has(0);
  @$pb.TagNumber(1)
  void clearHost() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get favouriteId => $_getI64(1);
  @$pb.TagNumber(2)
  set favouriteId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFavouriteId() => $_has(1);
  @$pb.TagNumber(2)
  void clearFavouriteId() => clearField(2);
}

class ExportComicsQuery extends $pb.GeneratedMessage {
  factory ExportComicsQuery({
    $core.Iterable<$fixnum.Int64>? comicIds,
    $core.String? folder,
    $core.int? exportType,
  }) {
    final $result = create();
    if (comicIds != null) {
      $result.comicIds.addAll(comicIds);
    }
    if (folder != null) {
      $result.folder = folder;
    }
    if (exportType != null) {
      $result.exportType = exportType;
    }
    return $result;
  }
  ExportComicsQuery._() : super();
  factory ExportComicsQuery.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ExportComicsQuery.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ExportComicsQuery', createEmptyInstance: create)
    ..p<$fixnum.Int64>(1, _omitFieldNames ? '' : 'comicIds', $pb.PbFieldType.K6, protoName: 'comicIds')
    ..aOS(2, _omitFieldNames ? '' : 'folder')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'exportType', $pb.PbFieldType.O3, protoName: 'exportType')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ExportComicsQuery clone() => ExportComicsQuery()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ExportComicsQuery copyWith(void Function(ExportComicsQuery) updates) => super.copyWith((message) => updates(message as ExportComicsQuery)) as ExportComicsQuery;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ExportComicsQuery create() => ExportComicsQuery._();
  ExportComicsQuery createEmptyInstance() => create();
  static $pb.PbList<ExportComicsQuery> createRepeated() => $pb.PbList<ExportComicsQuery>();
  @$core.pragma('dart2js:noInline')
  static ExportComicsQuery getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ExportComicsQuery>(create);
  static ExportComicsQuery? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$fixnum.Int64> get comicIds => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get folder => $_getSZ(1);
  @$pb.TagNumber(2)
  set folder($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFolder() => $_has(1);
  @$pb.TagNumber(2)
  void clearFolder() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get exportType => $_getIZ(2);
  @$pb.TagNumber(3)
  set exportType($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasExportType() => $_has(2);
  @$pb.TagNumber(3)
  void clearExportType() => clearField(3);
}

class ComicViewLogDto extends $pb.GeneratedMessage {
  factory ComicViewLogDto({
    $fixnum.Int64? comicId,
    $fixnum.Int64? position,
  }) {
    final $result = create();
    if (comicId != null) {
      $result.comicId = comicId;
    }
    if (position != null) {
      $result.position = position;
    }
    return $result;
  }
  ComicViewLogDto._() : super();
  factory ComicViewLogDto.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ComicViewLogDto.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ComicViewLogDto', createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'comicId', protoName: 'comicId')
    ..aInt64(2, _omitFieldNames ? '' : 'position')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ComicViewLogDto clone() => ComicViewLogDto()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ComicViewLogDto copyWith(void Function(ComicViewLogDto) updates) => super.copyWith((message) => updates(message as ComicViewLogDto)) as ComicViewLogDto;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ComicViewLogDto create() => ComicViewLogDto._();
  ComicViewLogDto createEmptyInstance() => create();
  static $pb.PbList<ComicViewLogDto> createRepeated() => $pb.PbList<ComicViewLogDto>();
  @$core.pragma('dart2js:noInline')
  static ComicViewLogDto getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ComicViewLogDto>(create);
  static ComicViewLogDto? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get comicId => $_getI64(0);
  @$pb.TagNumber(1)
  set comicId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasComicId() => $_has(0);
  @$pb.TagNumber(1)
  void clearComicId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get position => $_getI64(1);
  @$pb.TagNumber(2)
  set position($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPosition() => $_has(1);
  @$pb.TagNumber(2)
  void clearPosition() => clearField(2);
}

class PageQuery extends $pb.GeneratedMessage {
  factory PageQuery({
    $fixnum.Int64? pageNumber,
  }) {
    final $result = create();
    if (pageNumber != null) {
      $result.pageNumber = pageNumber;
    }
    return $result;
  }
  PageQuery._() : super();
  factory PageQuery.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PageQuery.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PageQuery', createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'pageNumber', protoName: 'pageNumber')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PageQuery clone() => PageQuery()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PageQuery copyWith(void Function(PageQuery) updates) => super.copyWith((message) => updates(message as PageQuery)) as PageQuery;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PageQuery create() => PageQuery._();
  PageQuery createEmptyInstance() => create();
  static $pb.PbList<PageQuery> createRepeated() => $pb.PbList<PageQuery>();
  @$core.pragma('dart2js:noInline')
  static PageQuery getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PageQuery>(create);
  static PageQuery? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get pageNumber => $_getI64(0);
  @$pb.TagNumber(1)
  set pageNumber($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPageNumber() => $_has(0);
  @$pb.TagNumber(1)
  void clearPageNumber() => clearField(1);
}

class ModifyPassword extends $pb.GeneratedMessage {
  factory ModifyPassword({
    $core.String? username,
    $core.String? oldPassword,
    $core.String? newPassword,
  }) {
    final $result = create();
    if (username != null) {
      $result.username = username;
    }
    if (oldPassword != null) {
      $result.oldPassword = oldPassword;
    }
    if (newPassword != null) {
      $result.newPassword = newPassword;
    }
    return $result;
  }
  ModifyPassword._() : super();
  factory ModifyPassword.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ModifyPassword.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ModifyPassword', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'username')
    ..aOS(2, _omitFieldNames ? '' : 'oldPassword', protoName: 'oldPassword')
    ..aOS(3, _omitFieldNames ? '' : 'newPassword', protoName: 'newPassword')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ModifyPassword clone() => ModifyPassword()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ModifyPassword copyWith(void Function(ModifyPassword) updates) => super.copyWith((message) => updates(message as ModifyPassword)) as ModifyPassword;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ModifyPassword create() => ModifyPassword._();
  ModifyPassword createEmptyInstance() => create();
  static $pb.PbList<ModifyPassword> createRepeated() => $pb.PbList<ModifyPassword>();
  @$core.pragma('dart2js:noInline')
  static ModifyPassword getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ModifyPassword>(create);
  static ModifyPassword? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get username => $_getSZ(0);
  @$pb.TagNumber(1)
  set username($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUsername() => $_has(0);
  @$pb.TagNumber(1)
  void clearUsername() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get oldPassword => $_getSZ(1);
  @$pb.TagNumber(2)
  set oldPassword($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOldPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearOldPassword() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get newPassword => $_getSZ(2);
  @$pb.TagNumber(3)
  set newPassword($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNewPassword() => $_has(2);
  @$pb.TagNumber(3)
  void clearNewPassword() => clearField(3);
}

class ProInfoAll extends $pb.GeneratedMessage {
  factory ProInfoAll({
    ProInfoAf? proInfoAf,
    ProInfoPat? proInfoPat,
  }) {
    final $result = create();
    if (proInfoAf != null) {
      $result.proInfoAf = proInfoAf;
    }
    if (proInfoPat != null) {
      $result.proInfoPat = proInfoPat;
    }
    return $result;
  }
  ProInfoAll._() : super();
  factory ProInfoAll.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ProInfoAll.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ProInfoAll', createEmptyInstance: create)
    ..aOM<ProInfoAf>(1, _omitFieldNames ? '' : 'proInfoAf', protoName: 'proInfoAf', subBuilder: ProInfoAf.create)
    ..aOM<ProInfoPat>(2, _omitFieldNames ? '' : 'proInfoPat', protoName: 'proInfoPat', subBuilder: ProInfoPat.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ProInfoAll clone() => ProInfoAll()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ProInfoAll copyWith(void Function(ProInfoAll) updates) => super.copyWith((message) => updates(message as ProInfoAll)) as ProInfoAll;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProInfoAll create() => ProInfoAll._();
  ProInfoAll createEmptyInstance() => create();
  static $pb.PbList<ProInfoAll> createRepeated() => $pb.PbList<ProInfoAll>();
  @$core.pragma('dart2js:noInline')
  static ProInfoAll getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ProInfoAll>(create);
  static ProInfoAll? _defaultInstance;

  @$pb.TagNumber(1)
  ProInfoAf get proInfoAf => $_getN(0);
  @$pb.TagNumber(1)
  set proInfoAf(ProInfoAf v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasProInfoAf() => $_has(0);
  @$pb.TagNumber(1)
  void clearProInfoAf() => clearField(1);
  @$pb.TagNumber(1)
  ProInfoAf ensureProInfoAf() => $_ensure(0);

  @$pb.TagNumber(2)
  ProInfoPat get proInfoPat => $_getN(1);
  @$pb.TagNumber(2)
  set proInfoPat(ProInfoPat v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasProInfoPat() => $_has(1);
  @$pb.TagNumber(2)
  void clearProInfoPat() => clearField(2);
  @$pb.TagNumber(2)
  ProInfoPat ensureProInfoPat() => $_ensure(1);
}

class ProInfoAf extends $pb.GeneratedMessage {
  factory ProInfoAf({
    $core.bool? isPro,
    $fixnum.Int64? expire,
  }) {
    final $result = create();
    if (isPro != null) {
      $result.isPro = isPro;
    }
    if (expire != null) {
      $result.expire = expire;
    }
    return $result;
  }
  ProInfoAf._() : super();
  factory ProInfoAf.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ProInfoAf.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ProInfoAf', createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isPro', protoName: 'isPro')
    ..aInt64(2, _omitFieldNames ? '' : 'expire')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ProInfoAf clone() => ProInfoAf()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ProInfoAf copyWith(void Function(ProInfoAf) updates) => super.copyWith((message) => updates(message as ProInfoAf)) as ProInfoAf;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProInfoAf create() => ProInfoAf._();
  ProInfoAf createEmptyInstance() => create();
  static $pb.PbList<ProInfoAf> createRepeated() => $pb.PbList<ProInfoAf>();
  @$core.pragma('dart2js:noInline')
  static ProInfoAf getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ProInfoAf>(create);
  static ProInfoAf? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isPro => $_getBF(0);
  @$pb.TagNumber(1)
  set isPro($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsPro() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsPro() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get expire => $_getI64(1);
  @$pb.TagNumber(2)
  set expire($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasExpire() => $_has(1);
  @$pb.TagNumber(2)
  void clearExpire() => clearField(2);
}

class ProInfoPat extends $pb.GeneratedMessage {
  factory ProInfoPat({
    $core.bool? isPro,
    $core.String? patId,
    $core.String? bindUid,
    $fixnum.Int64? requestDelete,
    $fixnum.Int64? reBind,
    $core.int? errorType,
    $core.String? errorMsg,
    $core.String? accessKey,
  }) {
    final $result = create();
    if (isPro != null) {
      $result.isPro = isPro;
    }
    if (patId != null) {
      $result.patId = patId;
    }
    if (bindUid != null) {
      $result.bindUid = bindUid;
    }
    if (requestDelete != null) {
      $result.requestDelete = requestDelete;
    }
    if (reBind != null) {
      $result.reBind = reBind;
    }
    if (errorType != null) {
      $result.errorType = errorType;
    }
    if (errorMsg != null) {
      $result.errorMsg = errorMsg;
    }
    if (accessKey != null) {
      $result.accessKey = accessKey;
    }
    return $result;
  }
  ProInfoPat._() : super();
  factory ProInfoPat.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ProInfoPat.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ProInfoPat', createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isPro', protoName: 'isPro')
    ..aOS(2, _omitFieldNames ? '' : 'patId', protoName: 'patId')
    ..aOS(3, _omitFieldNames ? '' : 'bindUid', protoName: 'bindUid')
    ..aInt64(4, _omitFieldNames ? '' : 'requestDelete', protoName: 'requestDelete')
    ..aInt64(5, _omitFieldNames ? '' : 'reBind', protoName: 'reBind')
    ..a<$core.int>(6, _omitFieldNames ? '' : 'errorType', $pb.PbFieldType.O3, protoName: 'errorType')
    ..aOS(7, _omitFieldNames ? '' : 'errorMsg', protoName: 'errorMsg')
    ..aOS(8, _omitFieldNames ? '' : 'accessKey', protoName: 'accessKey')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ProInfoPat clone() => ProInfoPat()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ProInfoPat copyWith(void Function(ProInfoPat) updates) => super.copyWith((message) => updates(message as ProInfoPat)) as ProInfoPat;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProInfoPat create() => ProInfoPat._();
  ProInfoPat createEmptyInstance() => create();
  static $pb.PbList<ProInfoPat> createRepeated() => $pb.PbList<ProInfoPat>();
  @$core.pragma('dart2js:noInline')
  static ProInfoPat getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ProInfoPat>(create);
  static ProInfoPat? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isPro => $_getBF(0);
  @$pb.TagNumber(1)
  set isPro($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsPro() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsPro() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get patId => $_getSZ(1);
  @$pb.TagNumber(2)
  set patId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPatId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPatId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get bindUid => $_getSZ(2);
  @$pb.TagNumber(3)
  set bindUid($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBindUid() => $_has(2);
  @$pb.TagNumber(3)
  void clearBindUid() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get requestDelete => $_getI64(3);
  @$pb.TagNumber(4)
  set requestDelete($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRequestDelete() => $_has(3);
  @$pb.TagNumber(4)
  void clearRequestDelete() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get reBind => $_getI64(4);
  @$pb.TagNumber(5)
  set reBind($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasReBind() => $_has(4);
  @$pb.TagNumber(5)
  void clearReBind() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get errorType => $_getIZ(5);
  @$pb.TagNumber(6)
  set errorType($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasErrorType() => $_has(5);
  @$pb.TagNumber(6)
  void clearErrorType() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get errorMsg => $_getSZ(6);
  @$pb.TagNumber(7)
  set errorMsg($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasErrorMsg() => $_has(6);
  @$pb.TagNumber(7)
  void clearErrorMsg() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get accessKey => $_getSZ(7);
  @$pb.TagNumber(8)
  set accessKey($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasAccessKey() => $_has(7);
  @$pb.TagNumber(8)
  void clearAccessKey() => clearField(8);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
