import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:flutter/services.dart';
import 'package:protobuf/protobuf.dart' as $pb;
import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:wax/configs/host.dart';
import 'package:wax/protos/properties.pb.dart';

final methods = Methods._();

class Methods {
  Methods._();

  static const MethodChannel _channel = MethodChannel("methods");

  Future<Uint8List> _flatInvoke(
    String method,
    $pb.GeneratedMessage params,
  ) async {
    String hexString = await _channel.invokeMethod("flatInvoke", {
      "method": method,
      "params": params.writeToBuffer(),
    });
    return Uint8List.fromList(hex.decode(hexString));
  }

  Future saveProperty({required String k, required String v}) async {
    return _flatInvoke(
      "saveProperty",
      SavePropertyQuery(k: k, v: v),
    );
  }

  Future<String> loadProperty({required String k}) async {
    return LoadPropertyResult.fromBuffer(await _flatInvoke(
      "loadProperty",
      LoadPropertyQuery(k: k),
    ))
        .v;
  }

  Future<FetchComicResult> fetchComic(
    String filterName,
    String filterValue,
    int pageNumber,
  ) async {
    final buff = await _flatInvoke(
        "fetchComic",
        FetchComicQuery(
          host: host,
          filterName: filterName,
          filterValue: filterValue,
          pageNumber: $fixnum.Int64.fromInts(0, pageNumber),
        ));
    return FetchComicResult.fromBuffer(buff);
  }

  Future<FetchComicResult> searchComic(String keyword, int page) async {
    final buff = await _flatInvoke(
        "searchComic",
        ComicSearchQuery(
          host: host,
          query: keyword,
          pageNumber: $fixnum.Int64.fromInts(0, page),
        ));
    return FetchComicResult.fromBuffer(buff);
  }

  Future saveImageToGallery(String path) async {
    if (Platform.isAndroid || Platform.isIOS) {
      return await _channel.invokeMethod("saveImageToGallery", {'path': path});
    }
    throw "没有适配的平台";
  }

  Future<int> androidGetVersion() async {
    if (Platform.isAndroid) {
      return await _channel.invokeMethod("androidGetVersion");
    }
    return 0;
  }

  Future<List<String>> loadAndroidModes() async {
    return List.of(await _channel.invokeMethod("androidGetModes"))
        .map((e) => "$e")
        .toList();
  }

  Future setAndroidMode(String androidDisplayMode) {
    return _channel.invokeMethod(
      "androidSetMode",
      {
        "mode": androidDisplayMode,
      },
    );
  }

  Future autoClean({required int time}) async {
    return _flatInvoke(
      "autoClean",
      AutoCleanQuery(
        expire: $fixnum.Int64.fromInts(0, time),
      ),
    );
  }

  Future<String> httpGet({required String url}) async {
    final buff = await _flatInvoke(
        "httpGet",
        HttpGetQuery(
          url: url,
        ));
    return HttpGetResult.fromBuffer(buff).content;
  }

  Future cleanAllCache() async {
    // todo
  }

  Future<CacheImageResult> cacheImage(String url,
      {bool ignoreFormat = false}) async {
    final buff = await _flatInvoke(
        "cacheImage",
        CacheImageQuery(
          host: host,
          url: url,
          ignoreFormat: ignoreFormat,
        ));
    return CacheImageResult.fromBuffer(buff);
  }

  Future<ComicInfoResult> comicInfo($fixnum.Int64 id) async {
    final buff = await _flatInvoke(
        "comicInfo",
        ComicInfoQuery(
          host: host,
          id: id,
        ));
    return ComicInfoResult.fromBuffer(buff);
  }

  Future<ComicPagesResult> comicPages($fixnum.Int64 id) async {
    final buff = await _flatInvoke(
        "comicPages",
        ComicInfoQuery(
          host: host,
          id: id,
        ));
    return ComicPagesResult.fromBuffer(buff);
  }

  Future login(String username, String password) {
    return _flatInvoke(
        "login",
        UserLoginQuery(
          host: host,
          username: username,
          password: password,
        ));
  }

  Future register({
    required String username,
    required String nickname,
    required String email,
    required String sex,
    required String pass,
    required String passAgain,
  }) {
    return _flatInvoke(
      "register",
      UserRegisterQuery(
        host: host,
        username: username,
        nickname: nickname,
        email: email,
        sex: sex,
        pass: pass,
        passAgain: passAgain,
      ),
    );
  }

  Future<IsPro> isPro() async {
    return IsPro.fromBuffer(await _flatInvoke(
      "isPro",
      Empty(),
    ));
  }

  Future<IsPro> reloadPro() async {
    return IsPro.fromBuffer(await _flatInvoke(
      "reloadPro",
      Empty(),
    ));
  }

  Future inputCdKey(String k) {
    return _flatInvoke("inputCdKey", Puff(value: k));
  }

  Future saveViewInfo(ComicSimple simple) async {
    return _flatInvoke(
      "initComicViewLog",
      simple,
    );
  }

  Future<bool> hasDownload($fixnum.Int64 comicId) async {
    return BoolValue.fromBuffer(await _flatInvoke(
      "hasDownload",
      DownloadInfoQuery(
        id: comicId,
      ),
    ))
        .value;
  }

  Future updateViewLog($fixnum.Int64 id, int initRank) async {
    return _flatInvoke(
      "saveComicViewLog",
      ComicViewLogDto(
        comicId: id,
        position: $fixnum.Int64(initRank),
      ),
    );
  }

  Future<int> loadViewLog($fixnum.Int64 id) async {
    var buffer = await _flatInvoke(
      "loadComicViewLog",
      ComicViewLogDto(
        comicId: id,
      ),
    );
    var result = ComicViewLogDto.fromBuffer(buffer);
    return result.position.toInt();
  }

  Future autoClearViewLog({required int time}) async {
    return _flatInvoke("autoClearViewLog",
      AutoCleanQuery(
        expire: $fixnum.Int64.fromInts(0, time),
      ),
    );
  }

  Future pushToDownloads(List<ComicSimple> list) {
    return _flatInvoke(
      "pushToDownloads",
      PushToDownloads(
        host: host,
        comics: list,
      ),
    );
  }

  Future<ComicDownloadsRes> downloads() async {
    return ComicDownloadsRes.fromBuffer(await _flatInvoke(
      "downloads",
      Empty(),
    ));
  }

  Future<ComicDownloadInfoDto> downloadInfo($fixnum.Int64 id) async {
    return ComicDownloadInfoDto.fromBuffer(await _flatInvoke(
      "downloadInfo",
      DownloadInfoQuery(
        id: id,
      ),
    ));
  }

  Future<DownloadComicPages> downloadPages($fixnum.Int64 id) async {
    return DownloadComicPages.fromBuffer(await _flatInvoke(
      "downloadPages",
      DownloadInfoQuery(
        id: id,
      ),
    ));
  }

  Future resetDownload() {
    return _flatInvoke(
      "resetDownload",
      Empty(),
    );
  }

  Future setDownloadThread(int count) {
    return _flatInvoke(
      "setDownloadThread",
      IntValue(
        value: $fixnum.Int64.fromInts(0, count),
      ),
    );
  }

  Future<int> getDownloadThread() async {
    return IntValue.fromBuffer(await _flatInvoke(
      "getDownloadThread",
      Empty(),
    ))
        .value
        .toInt();
  }

  Future deleteDownloadById($fixnum.Int64 comicId) {
    return _flatInvoke(
      "deleteDownloadById",
      IntValue(
        value: comicId,
      ),
    );
  }

  Future<LoginUser> loginUser() async {
    final buff = await _flatInvoke(
        "loginUser",
        LoginUserQuery(
          host: host,
        ));
    return LoginUser.fromBuffer(buff);
  }

  Future<FetchComicResult> favoriteList(int partitionId, int page) async {
    final buff = await _flatInvoke(
        "favoriteList",
        FavoriteListQuery(
          host: host,
          partitionId: $fixnum.Int64.fromInts(0, partitionId),
          page: $fixnum.Int64.fromInts(0, page),
        ));
    return FetchComicResult.fromBuffer(buff);
  }

  Future deleteFavourite($fixnum.Int64 favouriteId) async {
    return _flatInvoke(
      "deleteFavourite",
      DeleteFavoriteQuery(
        host: host,
        favouriteId: favouriteId,
      ),
    );
  }

  Future<FavoritesPartitionResult> favoritesPartitions() async {
    final buff = await _flatInvoke(
        "favoritesPartitions",
        FavoritesPartitionsQuery(
          host: host,
        ));
    return FavoritesPartitionResult.fromBuffer(buff);
  }

  Future createFavoritesPartition(String name) async {
    return _flatInvoke(
      "createFavoritesPartition",
      CreateFavoritesPartitionQuery(
        host: host,
        name: name,
      ),
    );
  }

  Future favoriteComic(
    $fixnum.Int64? comicId,
    $fixnum.Int64? partitionId,
  ) async {
    return _flatInvoke(
      "favoriteComic",
      FavoriteComicQuery(
        host: host,
        comicId: comicId,
        partitionId: partitionId,
      ),
    );
  }

  Future exportToDir(
    String folder,
    List<$fixnum.Int64> comicIds,
    int exportType,
  ) {
    return _flatInvoke(
      "exportToDir",
      ExportComicsQuery(
        comicIds: comicIds,
        folder: folder,
        exportType: exportType,
      ),
    );
  }

  Future<String> iosGetDocumentDir() async {
    return await _channel.invokeMethod('iosGetDocumentDir', '');
  }

  Future<String> getProServerName() async {
    final buff = await _flatInvoke(
        "getProServerName",
        FavoritesPartitionsQuery(
          host: host,
        ));
    return StringValue.fromBuffer(buff).value;
  }

  Future<String> setProServerName(String severName) async {
    final buff = await _flatInvoke(
        "setProServerName",
        StringValue(
          value: severName,
        ));
    return StringValue.fromBuffer(buff).value;
  }

  Future<FetchComicResult> fetchHistory(int id) async {
    final buff = await _flatInvoke(
        "fetchHistory",
        PageQuery(
          pageNumber: $fixnum.Int64(id),
        ));
    return FetchComicResult.fromBuffer(buff);
  }
}
