import '../basic/methods.dart';

const _readerZoomMinPropertyName = "readerZoomMinScale";
const _readerZoomMaxPropertyName = "readerZoomMaxScale";
const _readerZoomDoubleTapPropertyName = "readerZoomDoubleTapScale";

late double _readerZoomMinScale;
late double _readerZoomMaxScale;
late double _readerZoomDoubleTapScale;

double get readerZoomMinScale => _readerZoomMinScale;
double get readerZoomMaxScale => _readerZoomMaxScale;
double get readerZoomDoubleTapScale => _readerZoomDoubleTapScale;

Future<void> initReaderZoomScale() async {
  _readerZoomMinScale = double.tryParse(
        await methods.loadProperty(k: _readerZoomMinPropertyName),
      ) ??
      1.0;
  _readerZoomMaxScale = double.tryParse(
        await methods.loadProperty(k: _readerZoomMaxPropertyName),
      ) ??
      2.0;
  _readerZoomDoubleTapScale = double.tryParse(
        await methods.loadProperty(k: _readerZoomDoubleTapPropertyName),
      ) ??
      2.0;
}

Future<void> setReaderZoomMinScale(double value) async {
  _readerZoomMinScale = value;
  await methods.saveProperty(
    k: _readerZoomMinPropertyName,
    v: value.toStringAsFixed(1),
  );
}

Future<void> setReaderZoomMaxScale(double value) async {
  _readerZoomMaxScale = value;
  await methods.saveProperty(
    k: _readerZoomMaxPropertyName,
    v: value.toStringAsFixed(1),
  );
}

Future<void> setReaderZoomDoubleTapScale(double value) async {
  _readerZoomDoubleTapScale = value;
  await methods.saveProperty(
    k: _readerZoomDoubleTapPropertyName,
    v: value.toStringAsFixed(1),
  );
}
