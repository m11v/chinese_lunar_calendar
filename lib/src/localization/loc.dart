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
  String get chu => _isSimplifiedCN ? CNS.chu : CNT.chu;
  String get zheng => _isSimplifiedCN ? CNS.zheng : CNT.zheng;
  String get ke => _isSimplifiedCN ? CNS.ke : CNT.ke;
  String get nian => _isSimplifiedCN ? CNS.nian : CNT.nian;
  String get yue => _isSimplifiedCN ? CNS.yue : CNT.yue;
  String get ri => _isSimplifiedCN ? CNS.ri : CNT.ri;
  String get run => _isSimplifiedCN ? CNS.run : CNT.run;
  String get da => _isSimplifiedCN ? CNS.da : CNT.da;
  String get xiao => _isSimplifiedCN ? CNS.xiao : CNT.xiao;
  String get ji => _isSimplifiedCN ? CNS.ji : CNT.ji;
  String get xiong => _isSimplifiedCN ? CNS.xiong : CNT.xiong;

  /// 月相名
  List<String> get phaseOfMoon =>
      _isSimplifiedCN ? CNS.phaseOfMoon : CNT.phaseOfMoon;

  /// 数字汉字
  List<String> get upperCNNum =>
      _isSimplifiedCN ? CNS.upperCNNum : CNT.upperCNNum;

  /// 星期汉字
  List<String> get weekDayCN => _isSimplifiedCN ? CNS.weekDayCN : CNT.weekDayCN;

  /// 月份汉字
  List<String> get lunarMonthNameList =>
      _isSimplifiedCN ? CNS.lunarMonthNameList : CNT.lunarMonthNameList;

  /// 日期汉字
  List<String> get lunarDayNameList =>
      _isSimplifiedCN ? CNS.lunarDayNameList : CNT.lunarDayNameList;

  /// 生肖
  List<String> get chineseZodiacNameList =>
      _isSimplifiedCN ? CNS.chineseZodiacNameList : CNT.chineseZodiacNameList;

  /// 天干
  List<String> get the10HeavenlyStems =>
      _isSimplifiedCN ? CNS.the10HeavenlyStems : CNT.the10HeavenlyStems;

  /// 地支
  List<String> get the12EarthlyBranches =>
      _isSimplifiedCN ? CNS.the12EarthlyBranches : CNT.the12EarthlyBranches;

  /// 六十天干地支组合
  List<String> get the10HeavenlyStemsAnd12EarthlyBranches => _isSimplifiedCN
      ? CNS.the10HeavenlyStemsAnd12EarthlyBranches
      : CNT.the10HeavenlyStemsAnd12EarthlyBranches;

  /// 年干月干对应表
  Map<String, List<String>> get yearStemToMonthStemChart => _isSimplifiedCN
      ? CNS.yearStemToMonthStemChart
      : CNT.yearStemToMonthStemChart;

  /// 日干时干对应表
  Map<String, List<String>> get dayStemToTwoHoursStemChart => _isSimplifiedCN
      ? CNS.dayStemToTwoHoursStemChart
      : CNT.dayStemToTwoHoursStemChart;

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
