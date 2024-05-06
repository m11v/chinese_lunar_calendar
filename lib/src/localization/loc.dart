import 'cns.dart';
import 'cnt.dart';

class Loc {
  Loc._internal();

  late bool _isSimplifiedCN;
  static Loc? _instance;

  factory Loc.create({bool isSimplifiedCN = true}) {
    _instance ??= Loc._internal();

    _instance!._isSimplifiedCN = isSimplifiedCN;
    return _instance!;
  }

  factory Loc.get() {
    if (_instance == null) {
      throw NoLocError();
    }
    return _instance!;
  }

  static dispose() {
    _instance = null;
  }
}

extension LocX on Loc {
  String get run => _isSimplifiedCN ? CNS.run : CNT.run;

  String get xiong => _isSimplifiedCN ? CNS.xiong : CNT.xiong;

  /// 月相名
  List<String> get phaseOfMoon =>
      _isSimplifiedCN ? CNS.phaseOfMoon : CNT.phaseOfMoon;

  /// 月份汉字
  List<String> get lunarMonthNameList =>
      _isSimplifiedCN ? CNS.lunarMonthNameList : CNT.lunarMonthNameList;

  /// 生肖
  List<String> get chineseZodiacNameList =>
      _isSimplifiedCN ? CNS.chineseZodiacNameList : CNT.chineseZodiacNameList;

  /// 十二时辰汉代命名
  List<String> get twoHourPeriodHanName =>
      _isSimplifiedCN ? CNS.twoHourPeriodHanName : CNT.twoHourPeriodHanName;

  /// 时辰经络
  List<String> get meridiansName =>
      _isSimplifiedCN ? CNS.meridiansName : CNT.meridiansName;
}

class NoLocError extends Error {
  NoLocError();

  @override
  String toString() =>
      'NoLocError: The Loc is not created. Call Loc.create() to create one';
}
