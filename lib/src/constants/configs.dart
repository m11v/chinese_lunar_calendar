const startYear = 1901;
const monthDayBit = 12;
const leapMonthNumBit = 13;

/// 农历数据 每个元素的存储格式如下：
/// *17~14    13          12~1
/// 闰几月 闰月日数  12-1 月份农历日数 0=29天 1=30天

const lunarMonthData = [
  0x00752, 0x00ea5, 0x0ab2a, 0x0064b, 0x00a9b, 0x09aa6, 0x0056a, 0x00b59,
  0x04baa, 0x00752, // 1901 ~ 1910
  0x0cda5, 0x00b25, 0x00a4b, 0x0ba4b, 0x002ad, 0x0056b, 0x045b5, 0x00da9,
  0x0fe92, 0x00e92, // 1911 ~ 1920
  0x00d25, 0x0ad2d, 0x00a56, 0x002b6, 0x09ad5, 0x006d4, 0x00ea9, 0x04f4a,
  0x00e92, 0x0c6a6, // 1921 ~ 1930
  0x0052b, 0x00a57, 0x0b956, 0x00b5a, 0x006d4, 0x07761, 0x00749, 0x0fb13,
  0x00a93, 0x0052b, // 1931 ~ 1940
  0x0d51b, 0x00aad, 0x0056a, 0x09da5, 0x00ba4, 0x00b49, 0x04d4b, 0x00a95,
  0x0eaad, 0x00536, // 1941 ~ 1950
  0x00aad, 0x0baca, 0x005b2, 0x00da5, 0x07ea2, 0x00d4a, 0x10595, 0x00a97,
  0x00556, 0x0c575, // 1951 ~ 1960
  0x00ad5, 0x006d2, 0x08755, 0x00ea5, 0x0064a, 0x0664f, 0x00a9b, 0x0eada,
  0x0056a, 0x00b69, // 1961 ~ 1970
  0x0abb2, 0x00b52, 0x00b25, 0x08b2b, 0x00a4b, 0x10aab, 0x002ad, 0x0056d,
  0x0d5a9, 0x00da9, // 1971 ~ 1980
  0x00d92, 0x08e95, 0x00d25, 0x14e4d, 0x00a56, 0x002b6, 0x0c2f5, 0x006d5,
  0x00ea9, 0x0af52, // 1981 ~ 1990
  0x00e92, 0x00d26, 0x0652e, 0x00a57, 0x10ad6, 0x0035a, 0x006d5, 0x0ab69,
  0x00749, 0x00693, // 1991 ~ 2000
  0x08a9b, 0x0052b, 0x00a5b, 0x04aae, 0x0056a, 0x0edd5, 0x00ba4, 0x00b49,
  0x0ad53, 0x00a95, // 2001 ~ 2010
  0x0052d, 0x0855d, 0x00ab5, 0x12baa, 0x005d2, 0x00da5, 0x0de8a, 0x00d4a,
  0x00c95, 0x08a9e, // 2011 ~ 2020
  0x00556, 0x00ab5, 0x04ada, 0x006d2, 0x0c765, 0x00725, 0x0064b, 0x0a657,
  0x00cab, 0x0055a, // 2021 ~ 2030
  0x0656e, 0x00b69, 0x16f52, 0x00b52, 0x00b25, 0x0dd0b, 0x00a4b, 0x004ab,
  0x0a2bb, 0x005ad, // 2031 ~ 2040
  0x00b6a, 0x04daa, 0x00d92, 0x0eea5, 0x00d25, 0x00a55, 0x0ba4d, 0x004b6,
  0x005b5, 0x076d2, // 2041 ~ 2050
  0x00ec9, 0x10f92, 0x00e92, 0x00d26, 0x0d516, 0x00a57, 0x00556, 0x09365,
  0x00755, 0x00749, // 2051 ~ 2060
  0x0674b, 0x00693, 0x0eaab, 0x0052b, 0x00a5b, 0x0aaba, 0x0056a, 0x00b65,
  0x08baa, 0x00b4a, // 2061 ~ 2070
  0x10d95, 0x00a95, 0x0052d, 0x0c56d, 0x00ab5, 0x005aa, 0x085d5, 0x00da5,
  0x00d4a, 0x06e4d, // 2071 ~ 2080
  0x00c96, 0x0ecce, 0x00556, 0x00ab5, 0x0bad2, 0x006d2, 0x00ea5, 0x0872a,
  0x0068b, 0x10697, // 2081 ~ 2090
  0x004ab, 0x0055b, 0x0d556, 0x00b6a, 0x00752, 0x08b95, 0x00b45, 0x00a8b,
  0x04a4f,
];

/// 农历数据 每个元素的存储格式如下：
/// 7~6    5~1
/// 春节月  春节日

const lunarNewYearList = [
  0x53, 0x48, 0x3d, 0x50, 0x44, 0x39, 0x4d, 0x42, 0x36, 0x4a, // 1901 ~ 1910
  0x3e, 0x52, 0x46, 0x3a, 0x4e, 0x43, 0x37, 0x4b, 0x41, 0x54, // 1911 ~ 1920
  0x48, 0x3c, 0x50, 0x45, 0x38, 0x4d, 0x42, 0x37, 0x4a, 0x3e, // 1921 ~ 1930
  0x51, 0x46, 0x3a, 0x4e, 0x44, 0x38, 0x4b, 0x3f, 0x53, 0x48, // 1931 ~ 1940
  0x3b, 0x4f, 0x45, 0x39, 0x4d, 0x42, 0x36, 0x4a, 0x3d, 0x51, // 1941 ~ 1950
  0x46, 0x3b, 0x4e, 0x43, 0x38, 0x4c, 0x3f, 0x52, 0x48, 0x3c, // 1951 ~ 1960
  0x4f, 0x45, 0x39, 0x4d, 0x42, 0x35, 0x49, 0x3e, 0x51, 0x46, // 1961 ~ 1970
  0x3b, 0x4f, 0x43, 0x37, 0x4b, 0x3f, 0x52, 0x47, 0x3c, 0x50, // 1971 ~ 1980
  0x45, 0x39, 0x4d, 0x42, 0x54, 0x49, 0x3d, 0x51, 0x46, 0x3b, // 1981 ~ 1990
  0x4f, 0x44, 0x37, 0x4a, 0x3f, 0x53, 0x47, 0x3c, 0x50, 0x45, // 1991 ~ 2000
  0x38, 0x4c, 0x41, 0x36, 0x49, 0x3d, 0x52, 0x47, 0x3a, 0x4e, // 2001 ~ 2010
  0x43, 0x37, 0x4a, 0x3f, 0x53, 0x48, 0x3c, 0x50, 0x45, 0x39, // 2011 ~ 2020
  0x4c, 0x41, 0x36, 0x4a, 0x3d, 0x51, 0x46, 0x3a, 0x4d, 0x43, // 2021 ~ 2030
  0x37, 0x4b, 0x3f, 0x53, 0x48, 0x3c, 0x4f, 0x44, 0x38, 0x4c, // 2031 ~ 2040
  0x41, 0x36, 0x4a, 0x3e, 0x51, 0x46, 0x3a, 0x4e, 0x42, 0x37, // 2041 ~ 2050
  0x4b, 0x41, 0x53, 0x48, 0x3c, 0x4f, 0x44, 0x38, 0x4c, 0x42, // 2051 ~ 2060
  0x35, 0x49, 0x3d, 0x51, 0x45, 0x3a, 0x4e, 0x43, 0x37, 0x4b, // 2061 ~ 2070
  0x3f, 0x53, 0x47, 0x3b, 0x4f, 0x45, 0x38, 0x4c, 0x42, 0x36, // 2071 ~ 2080
  0x49, 0x3d, 0x51, 0x46, 0x3a, 0x4e, 0x43, 0x38, 0x4a, 0x3e, // 2081 ~ 2090
  0x52, 0x47, 0x3b, 0x4f, 0x45, 0x39, 0x4c, 0x41, 0x35, 0x49, // 2091 ~ 2100
];
