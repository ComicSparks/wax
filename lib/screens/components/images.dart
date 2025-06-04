import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wax/protos/properties.pb.dart';
import 'dart:io';
import 'dart:ui' as ui show Codec;
import '../../basic/commons.dart';
import '../../basic/methods.dart';
import '../file_photo_view_screen.dart';

const coverWidth = 300;
const coverHeight = 400;

class ComicImageProvider extends ImageProvider<ComicImageProvider> {
  final String url;
  final double scale;

  ComicImageProvider({required this.url, this.scale = 1.0});

  @override
  ImageStreamCompleter load(ComicImageProvider key, DecoderCallback decode) {
    return MultiFrameImageStreamCompleter(
      codec: _loadAsync(key),
      scale: key.scale,
    );
  }

  @override
  Future<ComicImageProvider> obtainKey(ImageConfiguration configuration) {
    return SynchronousFuture<ComicImageProvider>(this);
  }

  Future<ui.Codec> _loadAsync(ComicImageProvider key) async {
    assert(key == this);
    var lc = (await methods.cacheImage(url)).localPath;
    return PaintingBinding.instance!.instantiateImageCodec(
      await File(lc).readAsBytes(),
    );
  }

  @override
  bool operator ==(dynamic other) {
    if (other.runtimeType != runtimeType) return false;
    final ComicImageProvider typedOther = other;
    return url == typedOther.url && scale == typedOther.scale;
  }

  @override
  int get hashCode => hashValues(url, scale);

  @override
  String toString() => '$runtimeType('
      ' comicId: ${describeIdentity(url)},'
      ' scale: $scale'
      ')';
}

//
class ComicImage extends StatefulWidget {
  final String url;
  final double? width;
  final double? height;
  final Function(Size size)? onTrueSize;
  final List<TextMenu>? addLongPressMenus;
  final bool ignoreFormat;

  const ComicImage({
    required this.url,
    this.width,
    this.height,
    this.onTrueSize,
    this.addLongPressMenus,
    this.ignoreFormat = false, 
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ComicImageState();
}

class _ComicImageState extends State<ComicImage> {
  late Future<String> _future;

  @override
  void initState() {
    _future = _init();
    super.initState();
  }

  Future<String> _init() async {
    final cache = await methods.cacheImage(widget.url, ignoreFormat: widget.ignoreFormat);
    if (widget.onTrueSize != null) {
      widget.onTrueSize!(Size(cache.width.toDouble(), cache.height.toDouble()));
    }
    return cache.localPath;
  }

  @override
  Widget build(BuildContext context) {
    return pathFutureImage(_future, widget.width, widget.height,
        addLongPressMenus: widget.addLongPressMenus);
  }
}

class TextMenu {
  final String text;
  final void Function() action;

  TextMenu(this.text, this.action);
}

Widget pathFutureImage(Future<String> future, double? width, double? height,
    {BoxFit fit = BoxFit.cover,
    BuildContext? context,
    List<TextMenu>? addLongPressMenus}) {
  return FutureBuilder(
      future: future,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasError) {
          print("${snapshot.error}");
          print("${snapshot.stackTrace}");
          return buildError(width, height);
        }
        if (snapshot.connectionState != ConnectionState.done) {
          return buildLoading(width, height);
        }
        return buildFile(
          snapshot.data!,
          width,
          height,
          fit: fit,
          context: context,
          addLongPressMenus: addLongPressMenus,
        );
      });
}

// 通用方法

Widget buildSvg(String source, double? width, double? height,
    {Color? color, double? margin}) {
  var widget = Container(
    width: width,
    height: height,
    padding: margin != null ? EdgeInsets.all(10) : null,
    child: Center(
      child: SvgPicture.asset(
        source,
        width: width,
        height: height,
        color: color,
      ),
    ),
  );
  return GestureDetector(onLongPress: () {}, child: widget);
}

Widget buildMock(double? width, double? height) {
  var widget = Container(
    width: width,
    height: height,
    padding: EdgeInsets.all(10),
    child: Center(
      child: SvgPicture.asset(
        'lib/assets/unknown.svg',
        width: width,
        height: height,
        color: Colors.grey.shade600,
      ),
    ),
  );
  return GestureDetector(onLongPress: () {}, child: widget);
}

Widget buildError(double? width, double? height) {
  double? size;
  if (width != null && height != null) {
    size = width < height ? width : height;
  }
  return SizedBox(
    width: width,
    height: height,
    child: Center(
      child: Icon(
        Icons.error_outline,
        size: size,
        color: Colors.grey,
      ),
    ),
  );
}

Widget buildLoading(double? width, double? height) {
  double? size;
  if (width != null && height != null) {
    size = width < height ? width : height;
  }
  return SizedBox(
    width: width,
    height: height,
    child: Center(
      child: Icon(
        Icons.downloading,
        size: size,
        color: Colors.grey.withAlpha(150),
      ),
    ),
  );
}

Widget buildFile(String file, double? width, double? height,
    {BoxFit fit = BoxFit.cover,
    BuildContext? context,
    List<TextMenu>? addLongPressMenus}) {
  var image = Image(
    image: FileImage(File(file)),
    width: width,
    height: height,
    errorBuilder: (a, b, c) {
      print("$b");
      print("$c");
      return buildError(width, height);
    },
    fit: fit,
  );
  if (context == null) return image;
  return GestureDetector(
    onLongPress: () async {
      var chooseList = ['预览图片', '保存图片'];
      if (addLongPressMenus != null) {
        for (var value in addLongPressMenus) {
          chooseList.add(value.text);
        }
      }
      String? choose = await chooseListDialog(
        context,
        title: '请选择',
        values: chooseList,
      );
      if (choose == null) {
        return;
      }
      switch (choose) {
        case '预览图片':
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => FilePhotoViewScreen(file),
          ));
          return;
        case '保存图片':
          saveImageFileToGallery(context, file);
          return;
      }
      if (addLongPressMenus != null) {
        for (var value in addLongPressMenus) {
          if (value.text == choose) {
            value.action();
            return;
          }
        }
      }
    },
    child: image,
  );
}

class HorizontalStretchComicImage extends StatelessWidget {
  final String url;
  final Size originSize;

  const HorizontalStretchComicImage(
      {required this.url, required this.originSize, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        var width = constraints.maxWidth;
        var height =
            constraints.maxWidth * originSize.height / originSize.width;
        return ComicImage(url: url, width: width, height: height);
      },
    );
  }
}
