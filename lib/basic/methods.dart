import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart' show Int64List;
import 'package:wax/configs/host.dart';
import 'package:wax/src/rust/api/types.dart';
import 'package:wax/src/rust/api/wax.dart' as rust;

final methods = Methods._();

const _waxConfigUrl = "https://cdn.comicsparks.work/cfg/wax";

class Methods {
  Methods._();

  static const MethodChannel _channel = MethodChannel("methods");

  Future saveProperty({required String k, required String v}) {
    return rust.saveProperty(k: k, v: v);
  }

  Future<String> loadProperty({required String k}) {
    return rust.loadProperty(k: k);
  }

  Future<FetchComicResult> fetchComic(
    String filterName,
    String filterValue,
    int pageNumber,
  ) {
    return rust.fetchComic(
      host: host,
      filterName: filterName,
      filterValue: filterValue,
      pageNumber: pageNumber,
    );
  }

  Future<FetchComicResult> searchComic(String keyword, int page) {
    return rust.searchComic(host: host, query: keyword, pageNumber: page);
  }

  Future<FetchComicResult> rankComic(String type, int page) {
    return rust.rankComic(host: host, query: type, pageNumber: page);
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
      {"mode": androidDisplayMode},
    );
  }

  Future<String> androidDataLocal() async {
    return await _channel.invokeMethod("dataLocal");
  }

  Future autoClean({required int time}) {
    return rust.autoClean(expire: time);
  }

  Future<String> httpGet({required String url}) {
    return rust.httpGet(url: url);
  }

  Future<Map<String, String>> configLinks() async {
    final config = await fetchWaxConfig();
    final links = config["links"];
    if (links is! Map) {
      return {};
    }
    final Map<String, String> result = {};
    links.forEach((key, value) {
      if (key != null && value != null) {
        result["$key"] = "$value";
      }
    });
    return result;
  }

  Future<Map<String, dynamic>> fetchWaxConfig() async {
    final content = (await httpGet(url: _waxConfigUrl)).trim();
    if (content.isEmpty) {
      return {};
    }
    final decoded = jsonDecode(content);
    if (decoded is! Map) {
      return {};
    }
    return Map<String, dynamic>.from(decoded);
  }

  Future cleanAllCache() async {}

  Future<CacheImageResult> cacheImage(String url, {bool ignoreFormat = false}) {
    return rust.cacheImage(host: host, url: url, ignoreFormat: ignoreFormat);
  }

  Future<ComicInfoResult> comicInfo(int id) {
    return rust.comicInfo(host: host, id: id);
  }

  Future<FetchComicResult> comicChapters(int id) {
    return rust.comicChapters(host: host, id: id);
  }

  Future<ComicPagesResult> comicPages(int id) {
    return rust.comicPages(host: host, id: id);
  }

  Future login(String username, String password) {
    return rust.login(host: host, username: username, password: password);
  }

  Future setCookies(String cookieString) {
    return rust.setCookies(host: host, cookie: cookieString);
  }

  Future register({
    required String username,
    required String nickname,
    required String email,
    required String sex,
    required String pass,
    required String passAgain,
  }) {
    return rust.register(
      host: host,
      username: username,
      nickname: nickname,
      email: email,
      sex: sex,
      pass: pass,
      passAgain: passAgain,
    );
  }

  Future<IsPro> isPro() => rust.isPro();

  Future<IsPro> reloadPro() async {
    await rust.reloadPro();
    return rust.isPro();
  }

  Future inputCdKey(String k) => rust.inputCdKey(value: k);

  Future<String> getProServerName() => rust.getProServerName();

  Future setProServerName(String serverName) {
    return rust.setProServerName(serverName: serverName);
  }

  Future saveViewInfo(ComicSimple simple) {
    return rust.initComicViewLog(comic: simple);
  }

  Future<bool> hasDownload(int comicId) {
    return rust.hasDownload(id: comicId);
  }

  Future updateViewLog(int id, int initRank) {
    return rust.saveComicViewLog(comicId: id, position: initRank);
  }

  Future saveChapterProgress(int id, int initRank) {
    return rust.saveChapterProgress(comicId: id, position: initRank);
  }

  Future<int> loadViewLog(int id) {
    return rust.loadComicViewLog(comicId: id);
  }

  Future<bool> hasViewLog(int id) {
    return rust.hasComicViewLog(comicId: id);
  }

  Future<Map<String, bool>> hasViewLogs(List<int> ids) async {
    final marks = await rust.hasComicViewLogs(ids: Int64List.fromList(ids));
    return {for (final item in marks) item.comicId.toString(): item.viewed};
  }

  Future autoClearViewLog({required int time}) {
    return rust.autoClearViewLog(expire: time);
  }

  Future pushToDownloads(List<ComicSimple> list) {
    return rust.pushToDownloads(host: host, comics: list);
  }

  Future<ComicDownloadsRes> downloads() => rust.downloads();

  Future<ComicDownloadInfoDto> downloadInfo(int id) {
    return rust.downloadInfo(id: id);
  }

  Future<DownloadComicPages> downloadPages(int id) {
    return rust.downloadPages(id: id);
  }

  Future resetDownload() => rust.resetDownload();

  Future setDownloadThread(int count) {
    return rust.setDownloadThread(count: count);
  }

  Future<int> getDownloadThread() => rust.getDownloadThread();

  Future deleteDownloadById(int comicId) {
    return rust.deleteDownloadById(id: comicId);
  }

  Future<LoginUser> loginUser() {
    return rust.loginUser(host: host);
  }

  Future<FetchComicResult> favoriteList(int partitionId, int page) {
    return rust.favoriteList(host: host, partitionId: partitionId, page: page);
  }

  Future deleteFavourite(int favouriteId) {
    return rust.deleteFavourite(host: host, favouriteId: favouriteId);
  }

  Future<FavoritesPartitionResult> favoritesPartitions() {
    return rust.favoritesPartitions(host: host);
  }

  Future createFavoritesPartition(String name) {
    return rust.createFavoritesPartition(host: host, name: name);
  }

  Future renameFavoritesPartition(int id, String name) {
    return rust.renameFavoritesPartition(host: host, id: id, name: name);
  }

  Future deleteFavoritesPartition(int id) {
    return rust.deleteFavoritesPartition(host: host, id: id);
  }

  Future favoriteComic(int comicId, int partitionId) {
    return rust.favoriteComic(
      host: host,
      comicId: comicId,
      partitionId: partitionId,
    );
  }

  Future exportToDir(String folder, List<int> comicIds, int exportType) {
    return rust.exportToDir(
      folder: folder,
      comicIds: Int64List.fromList(comicIds),
      exportType: exportType,
    );
  }

  Future<String> iosGetDocumentDir() async {
    return await _channel.invokeMethod('iosGetDocumentDir', '');
  }

  Future<String> iosGetApplicationSupportDir() async {
    return await _channel.invokeMethod('iosGetApplicationSupportDir');
  }

  Future<FetchComicResult> fetchHistory(int id) {
    return rust.fetchHistory(pageNumber: id);
  }

  Future clearHistory() => rust.clearHistory();

  Future clearHistoryById(int id) {
    return rust.clearHistoryById(id: id);
  }

  Future setPatAccessKey(String accessKey) {
    return rust.setPatAccessKey(accessKey: accessKey);
  }

  Future reloadPatAccount() => rust.reloadPatAccount();

  Future bindThisAccount() => rust.bindThisAccount();

  Future clearPat() => rust.clearPat();

  Future<ProInfoAll> proInfoAll() => rust.proInfoAll();
}
