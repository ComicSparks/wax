import '../basic/methods.dart';

const _propertyName = "gestureSpeed";

late double _gestureSpeed;

Future initGestureSpeed() async {
  final value = await methods.loadProperty(k: _propertyName);
  _gestureSpeed = double.tryParse(value) ?? 1.0;
}

double get currentGestureSpeed => _gestureSpeed;

Future<void> setGestureSpeed(double value) async {
  _gestureSpeed = value;
  await methods.saveProperty(k: _propertyName, v: "$value");
}
