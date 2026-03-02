import '../basic/methods.dart';

const _propertyName = "readerScrollByScreenPercentage";

late int _readerScrollByScreenPercentage;

Future initReaderScrollByScreenPercentage() async {
  final value = await methods.loadProperty(k: _propertyName);
  _readerScrollByScreenPercentage = int.tryParse(value) ?? 80;
}

double get readerScrollByScreenPercentage => _readerScrollByScreenPercentage / 100;

int get currentReaderScrollByScreenPercentage => _readerScrollByScreenPercentage;

Future<void> setReaderScrollByScreenPercentage(int value) async {
  _readerScrollByScreenPercentage = value;
  await methods.saveProperty(k: _propertyName, v: "$value");
}
