unit TMD.TALib.Defs;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

const

  TA_INTEGER_MIN = Low(integer) + 1;
  TA_INTEGER_MAX = MaxInt;

  TA_REAL_MIN = (-3e+37);
  TA_REAL_MAX = 3e+37;

  TA_INTEGER_DEFAULT = Low(integer);
  TA_REAL_DEFAULT = (-4e+37);

type

  TIntegerArray=array of integer;
  TDoubleArray = array of double;
  TSingleArray = array of single;

  RetCode = (TA_SUCCESS, TA_LIB_NOT_INITIALIZE, TA_BAD_PARAM, TA_ALLOC_ERR, TA_GROUP_NOT_FOUND, TA_FUNC_NOT_FOUND, TA_INVALID_HANDLE, TA_INVALID_PARAM_HOLDER,
    TA_INVALID_PARAM_HOLDER_TYPE, TA_INVALID_PARAM_FUNCTION, TA_INPUT_NOT_ALL_INITIALIZE, TA_OUTPUT_NOT_ALL_INITIALIZE, TA_OUT_OF_RANGE_START_INDEX,
    TA_OUT_OF_RANGE_END_INDEX, TA_INVALID_LIST_TYPE, TA_BAD_OBJECT, TA_NOT_SUPPORTED, TA_INTERNAL_ERROR = 5000, TA_UNKNOWN_ERR = $FFFF);
  TA_RetCode = RetCode;

  Compatibility = (TA_COMPATIBILITY_DEFAULT, TA_COMPATIBILITY_METASTOCK);
  TA_Compatibility = Compatibility;

  MAType = (TA_MAType_SMA, TA_MAType_EMA, TA_MAType_WMA, TA_MAType_DEMA, TA_MAType_TEMA, TA_MAType_TRIMA, TA_MAType_KAMA, TA_MAType_MAMA, TA_MAType_T3);
  TA_MAType = MAType;

  FuncUnstId = (TA_FUNC_UNST_ADX, TA_FUNC_UNST_ADXR, TA_FUNC_UNST_ATR, TA_FUNC_UNST_CMO, TA_FUNC_UNST_DX, TA_FUNC_UNST_EMA, TA_FUNC_UNST_HT_DCPERIOD,
    TA_FUNC_UNST_HT_DCPHASE, TA_FUNC_UNST_HT_PHASOR, TA_FUNC_UNST_HT_SINE, TA_FUNC_UNST_HT_TRENDLINE, TA_FUNC_UNST_HT_TRENDMODE, TA_FUNC_UNST_KAMA,
    TA_FUNC_UNST_MAMA, TA_FUNC_UNST_MFI, TA_FUNC_UNST_MINUS_DI, TA_FUNC_UNST_MINUS_DM, TA_FUNC_UNST_NATR, TA_FUNC_UNST_PLUS_DI, TA_FUNC_UNST_PLUS_DM,
    TA_FUNC_UNST_RSI, TA_FUNC_UNST_STOCHRSI, TA_FUNC_UNST_T3, TA_FUNC_UNST_ALL, TA_FUNC_UNST_NONE = -1);
  TA_FuncUnstId = FuncUnstId;

 (* The TA_RangeType enum specifies the types of range that can be considered
 * when to compare a part of a candle to other candles
 *)
  RangeType = (TA_RangeType_RealBody, TA_RangeType_HighLow, TA_RangeType_Shadows);
  TA_RangeType = RangeType;

(* The TA_CandleSettingType enum specifies which kind of setting to consider;
 * the settings are based on the parts of the candle and the common words
 * indicating the length (short, long, very long)
 *)
  CandleSettingType = (TA_BodyLong, TA_BodyVeryLong, TA_BodyShort, TA_BodyDoji, TA_ShadowLong, TA_ShadowVeryLong, TA_ShadowShort, TA_ShadowVeryShort,
    TA_Near, TA_Far, TA_Equal, TA_AllCandleSettings);
  TA_CandleSettingType = CandleSettingType;



implementation

end.
