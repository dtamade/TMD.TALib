unit TMD.TALib;

{$mode objfpc}{$H+}
{$Z1}

{ 如希望在项目中静态链接 TALib,请在项目选项中的 Custom Options 中输入 -dTALIB_STATICLINK }
{ 或者把下行注释取消(不建议) }
{$Define TALIB_STATICLINK}

interface

uses
  Classes, SysUtils, Math,
  //.
  TMD.TALib.Defs;

{$IfDef TALIB_STATICLINK}
  {$IfDef WINDOWS}
  {$IfDef CPU64}
    //{$L '..\3rd\ta-lib\libs\ta_global.obj'}
    {$SmartLink off}
    {$LinkLib ..\3rd\ta-lib\libs\libTALib.Windows.x64.a,static}
    {$LinkLib ..\3rd\ta-lib\libs\libmsvcrt.Windows.x64.a,static}

  {$Else}
    {$LinkLib ..\3rd\ta-lib\libs\libTALib.Windows.x86.a,static}
    {$LinkLib ..\3rd\ta-lib\libs\libmsvcrt.Windows.x86.a,static}
  {$EndIf}
  {$Else}
  // 暂时不考虑其他平台
  {$EndIf}
{$Else}
const
    {$IfDef WINDOWS}
       {$IfDef CPU64}
  TALibLib = 'TALib.Windows.x64.dll';
       {$Else}
  TALibLib = 'TALib.Windows.x86';
       {$EndIf}
     {$Else}
       {$IfDef CPU64}
  TALibLib = 'TALib.Windows.x64.so';
        {$Else}
  TALibLib = 'TALib.Windows.x86.so';
       {$EndIf}
     {$EndIf}
{$EndIf}


function TASuccess(aRetCode: TA_RetCode): boolean;

function TA_GetVersionString(): PChar; cdecl; external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_GetVersionString';
function TA_GetVersionMajor(): PChar; cdecl; external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_GetVersionMajor';
function TA_GetVersionMinor(): PChar; cdecl; external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_GetVersionMinor';
function TA_GetVersionBuild(): PChar; cdecl; external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_GetVersionBuild';
function TA_GetVersionDate(): PChar; cdecl; external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_GetVersionDate';
function TA_GetVersionTime(): PChar; cdecl; external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_GetVersionTime';

function TA_Initialize(): TA_RetCode; cdecl;external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} name  'TA_Initialize';
function TA_Shutdown(): TA_RetCode; cdecl;external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} name  'TA_Shutdown';

function TA_ACOS(startIdx: integer; endIdx: integer; inReal: PDouble; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode;
  cdecl; external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_ACOS';

function TA_S_ACOS(startIdx: integer; endIdx: integer; inReal: PSingle; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode;
  cdecl; external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_ACOS';

function TA_ACOS_Lookback(): integer; cdecl; external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_ACOS_Lookback';

function TA_AD(startIdx: integer; endIdx: integer; inHigh: PDouble; inLow: PDouble; inClose: PDouble; inVolume: PDouble; outBegIdx: PInteger;
  outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_AD';

function TA_S_AD(startIdx: integer; endIdx: integer; inHigh: PSingle; inLow: PSingle; inClose: PSingle; inVolume: PSingle; outBegIdx: PInteger;
  outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_AD';

function TA_AD_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_AD_Lookback';

function TA_ADD(startIdx: integer; endIdx: integer; inReal0: PDouble; inReal1: PDouble; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_ADD';

function TA_S_ADD(startIdx: integer; endIdx: integer; inReal0: PSingle; inReal1: PSingle; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_ADD';

function TA_ADD_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_ADD_Lookback';

function TA_ADOSC(startIdx: integer; endIdx: integer; inHigh: PDouble; inLow: PDouble; inClose: PDouble; inVolume: PDouble; optInFastPeriod: integer;
  optInSlowPeriod: integer; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_ADOSC';

function TA_S_ADOSC(startIdx: integer; endIdx: integer; inHigh: PSingle; inLow: PSingle; inClose: PSingle; inVolume: PSingle; optInFastPeriod: integer;
  optInSlowPeriod: integer; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_ADOSC';

function TA_ADOSC_Lookback(optInFastPeriod: integer; optInSlowPeriod: integer): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_ADOSC_Lookback';

function TA_ADX(startIdx: integer; endIdx: integer; inHigh: PDouble; inLow: PDouble; inClose: PDouble; optInTimePeriod: integer; outBegIdx: PInteger;
  outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_ADX';

function TA_S_ADX(startIdx: integer; endIdx: integer; inHigh: PSingle; inLow: PSingle; inClose: PSingle; optInTimePeriod: integer; outBegIdx: PInteger;
  outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_ADX';

function TA_ADX_Lookback(optInTimePeriod: integer): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_ADX_Lookback';

function TA_ADXR(startIdx: integer; endIdx: integer; inHigh: PDouble; inLow: PDouble; inClose: PDouble; optInTimePeriod: integer; outBegIdx: PInteger;
  outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_ADXR';

function TA_S_ADXR(startIdx: integer; endIdx: integer; inHigh: PSingle; inLow: PSingle; inClose: PSingle; optInTimePeriod: integer; outBegIdx: PInteger;
  outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_ADXR';

function TA_ADXR_Lookback(optInTimePeriod: integer): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_ADXR_Lookback';

function TA_APO(startIdx: integer; endIdx: integer; inReal: PDouble; optInFastPeriod: integer; optInSlowPeriod: integer; optInMAType: TA_MAType;
  outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_APO';

function TA_S_APO(startIdx: integer; endIdx: integer; inReal: PSingle; optInFastPeriod: integer; optInSlowPeriod: integer; optInMAType: TA_MAType;
  outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_APO';

function TA_APO_Lookback(optInFastPeriod: integer; optInSlowPeriod: integer; optInMAType: TA_MAType): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_APO_Lookback';

function TA_AROON(startIdx: integer; endIdx: integer; inHigh: PDouble; inLow: PDouble; optInTimePeriod: integer; outBegIdx: PInteger; outNBElement: PInteger;
  outAroonDown: PDouble; outAroonUp: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_AROON';

function TA_S_AROON(startIdx: integer; endIdx: integer; inHigh: PSingle; inLow: PSingle; optInTimePeriod: integer; outBegIdx: PInteger;
  outNBElement: PInteger; outAroonDown: PDouble; outAroonUp: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_AROON';

function TA_AROON_Lookback(optInTimePeriod: integer): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_AROON_Lookback';

function TA_AROONOSC(startIdx: integer; endIdx: integer; inHigh: PDouble; inLow: PDouble; optInTimePeriod: integer; outBegIdx: PInteger;
  outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_AROONOSC';

function TA_S_AROONOSC(startIdx: integer; endIdx: integer; inHigh: PSingle; inLow: PSingle; optInTimePeriod: integer; outBegIdx: PInteger;
  outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_AROONOSC';

function TA_AROONOSC_Lookback(optInTimePeriod: integer): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_AROONOSC_Lookback';

function TA_ASIN(startIdx: integer; endIdx: integer; inReal: PDouble; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_ASIN';

function TA_S_ASIN(startIdx: integer; endIdx: integer; inReal: PSingle; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_ASIN';

function TA_ASIN_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_ASIN_Lookback';

function TA_ATAN(startIdx: integer; endIdx: integer; inReal: PDouble; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_ATAN';

function TA_S_ATAN(startIdx: integer; endIdx: integer; inReal: PSingle; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_ATAN';

function TA_ATAN_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_ATAN_Lookback';

function TA_ATR(startIdx: integer; endIdx: integer; inHigh: PDouble; inLow: PDouble; inClose: PDouble; optInTimePeriod: integer; outBegIdx: PInteger;
  outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_ATR';

function TA_S_ATR(startIdx: integer; endIdx: integer; inHigh: PSingle; inLow: PSingle; inClose: PSingle; optInTimePeriod: integer; outBegIdx: PInteger;
  outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_ATR';

function TA_ATR_Lookback(optInTimePeriod: integer): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_ATR_Lookback';

function TA_AVGPRICE(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble; outBegIdx: PInteger;
  outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_AVGPRICE';

function TA_S_AVGPRICE(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle; outBegIdx: PInteger;
  outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_AVGPRICE';

function TA_AVGPRICE_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_AVGPRICE_Lookback';

function TA_BBANDS(startIdx: integer; endIdx: integer; inReal: PDouble; optInTimePeriod: integer; optInNbDevUp: double; optInNbDevDn: double;
  optInMAType: TA_MAType; outBegIdx: PInteger; outNBElement: PInteger; outRealUpperBand: PDouble; outRealMiddleBand: PDouble; outRealLowerBand: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_BBANDS';

function TA_S_BBANDS(startIdx: integer; endIdx: integer; inReal: PSingle; optInTimePeriod: integer; optInNbDevUp: double; optInNbDevDn: double;
  optInMAType: TA_MAType; outBegIdx: PInteger; outNBElement: PInteger; outRealUpperBand: PDouble; outRealMiddleBand: PDouble; outRealLowerBand: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_BBANDS';

function TA_BBANDS_Lookback(optInTimePeriod: integer; optInNbDevUp: double; optInNbDevDn: double; optInMAType: TA_MAType): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_BBANDS_Lookback';

function TA_BETA(startIdx: integer; endIdx: integer; inReal0: PDouble; inReal1: PDouble; optInTimePeriod: integer; outBegIdx: PInteger;
  outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_BETA';

function TA_S_BETA(startIdx: integer; endIdx: integer; inReal0: PSingle; inReal1: PSingle; optInTimePeriod: integer; outBegIdx: PInteger;
  outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_BETA';

function TA_BETA_Lookback(optInTimePeriod: integer): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_BETA_Lookback';

function TA_BOP(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble; outBegIdx: PInteger;
  outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_BOP';

function TA_S_BOP(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle; outBegIdx: PInteger;
  outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_BOP';

function TA_BOP_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_BOP_Lookback';

function TA_CCI(startIdx: integer; endIdx: integer; inHigh: PDouble; inLow: PDouble; inClose: PDouble; optInTimePeriod: integer; outBegIdx: PInteger;
  outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CCI';

function TA_S_CCI(startIdx: integer; endIdx: integer; inHigh: PSingle; inLow: PSingle; inClose: PSingle; optInTimePeriod: integer; outBegIdx: PInteger;
  outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CCI';

function TA_CCI_Lookback(optInTimePeriod: integer): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CCI_Lookback';

function TA_CDL2CROWS(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDL2CROWS';

function TA_S_CDL2CROWS(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDL2CROWS';

function TA_CDL2CROWS_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDL2CROWS_Lookback';

function TA_CDL3BLACKCROWS(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDL3BLACKCROWS';

function TA_S_CDL3BLACKCROWS(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDL3BLACKCROWS';

function TA_CDL3BLACKCROWS_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDL3BLACKCROWS_Lookback';

function TA_CDL3INSIDE(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDL3INSIDE';

function TA_S_CDL3INSIDE(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDL3INSIDE';

function TA_CDL3INSIDE_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDL3INSIDE_Lookback';

function TA_CDL3LINESTRIKE(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDL3LINESTRIKE';

function TA_S_CDL3LINESTRIKE(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDL3LINESTRIKE';

function TA_CDL3LINESTRIKE_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDL3LINESTRIKE_Lookback';

function TA_CDL3OUTSIDE(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDL3OUTSIDE';

function TA_S_CDL3OUTSIDE(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDL3OUTSIDE';

function TA_CDL3OUTSIDE_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDL3OUTSIDE_Lookback';

function TA_CDL3STARSINSOUTH(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDL3STARSINSOUTH';

function TA_S_CDL3STARSINSOUTH(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDL3STARSINSOUTH';

function TA_CDL3STARSINSOUTH_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDL3STARSINSOUTH_Lookback';

function TA_CDL3WHITESOLDIERS(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDL3WHITESOLDIERS';

function TA_S_CDL3WHITESOLDIERS(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle;
  outBegIdx: PInteger; outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDL3WHITESOLDIERS';

function TA_CDL3WHITESOLDIERS_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDL3WHITESOLDIERS_Lookback';

function TA_CDLABANDONEDBABY(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble; optInPenetration: double;
  outBegIdx: PInteger; outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLABANDONEDBABY';

function TA_S_CDLABANDONEDBABY(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle;
  optInPenetration: double; outBegIdx: PInteger; outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDLABANDONEDBABY';

function TA_CDLABANDONEDBABY_Lookback(optInPenetration: double): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLABANDONEDBABY_Lookback';

function TA_CDLADVANCEBLOCK(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLADVANCEBLOCK';

function TA_S_CDLADVANCEBLOCK(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDLADVANCEBLOCK';

function TA_CDLADVANCEBLOCK_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLADVANCEBLOCK_Lookback';

function TA_CDLBELTHOLD(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLBELTHOLD';

function TA_S_CDLBELTHOLD(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDLBELTHOLD';

function TA_CDLBELTHOLD_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLBELTHOLD_Lookback';

function TA_CDLBREAKAWAY(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLBREAKAWAY';

function TA_S_CDLBREAKAWAY(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDLBREAKAWAY';

function TA_CDLBREAKAWAY_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLBREAKAWAY_Lookback';

function TA_CDLCLOSINGMARUBOZU(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLCLOSINGMARUBOZU';

function TA_S_CDLCLOSINGMARUBOZU(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle;
  outBegIdx: PInteger; outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDLCLOSINGMARUBOZU';

function TA_CDLCLOSINGMARUBOZU_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLCLOSINGMARUBOZU_Lookback';

function TA_CDLCONCEALBABYSWALL(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble;
  outBegIdx: PInteger; outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLCONCEALBABYSWALL';

function TA_S_CDLCONCEALBABYSWALL(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle;
  outBegIdx: PInteger; outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDLCONCEALBABYSWALL';

function TA_CDLCONCEALBABYSWALL_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLCONCEALBABYSWALL_Lookback';

function TA_CDLCOUNTERATTACK(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLCOUNTERATTACK';

function TA_S_CDLCOUNTERATTACK(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDLCOUNTERATTACK';

function TA_CDLCOUNTERATTACK_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLCOUNTERATTACK_Lookback';

function TA_CDLDARKCLOUDCOVER(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble;
  optInPenetration: double; outBegIdx: PInteger; outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLDARKCLOUDCOVER';

function TA_S_CDLDARKCLOUDCOVER(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle;
  optInPenetration: double; outBegIdx: PInteger; outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDLDARKCLOUDCOVER';

function TA_CDLDARKCLOUDCOVER_Lookback(optInPenetration: double): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLDARKCLOUDCOVER_Lookback';

function TA_CDLDOJI(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLDOJI';

function TA_S_CDLDOJI(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDLDOJI';

function TA_CDLDOJI_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLDOJI_Lookback';

function TA_CDLDOJISTAR(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLDOJISTAR';

function TA_S_CDLDOJISTAR(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDLDOJISTAR';

function TA_CDLDOJISTAR_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLDOJISTAR_Lookback';

function TA_CDLDRAGONFLYDOJI(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLDRAGONFLYDOJI';

function TA_S_CDLDRAGONFLYDOJI(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDLDRAGONFLYDOJI';

function TA_CDLDRAGONFLYDOJI_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLDRAGONFLYDOJI_Lookback';

function TA_CDLENGULFING(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLENGULFING';

function TA_S_CDLENGULFING(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDLENGULFING';

function TA_CDLENGULFING_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLENGULFING_Lookback';

function TA_CDLEVENINGDOJISTAR(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble;
  optInPenetration: double; outBegIdx: PInteger; outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLEVENINGDOJISTAR';

function TA_S_CDLEVENINGDOJISTAR(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle;
  optInPenetration: double; outBegIdx: PInteger; outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDLEVENINGDOJISTAR';

function TA_CDLEVENINGDOJISTAR_Lookback(optInPenetration: double): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLEVENINGDOJISTAR_Lookback';

function TA_CDLEVENINGSTAR(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble; optInPenetration: double;
  outBegIdx: PInteger; outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLEVENINGSTAR';

function TA_S_CDLEVENINGSTAR(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle; optInPenetration: double;
  outBegIdx: PInteger; outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDLEVENINGSTAR';

function TA_CDLEVENINGSTAR_Lookback(optInPenetration: double): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLEVENINGSTAR_Lookback';

function TA_CDLGAPSIDESIDEWHITE(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble;
  outBegIdx: PInteger; outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLGAPSIDESIDEWHITE';

function TA_S_CDLGAPSIDESIDEWHITE(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle;
  outBegIdx: PInteger; outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDLGAPSIDESIDEWHITE';

function TA_CDLGAPSIDESIDEWHITE_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLGAPSIDESIDEWHITE_Lookback';

function TA_CDLGRAVESTONEDOJI(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLGRAVESTONEDOJI';

function TA_S_CDLGRAVESTONEDOJI(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle;
  outBegIdx: PInteger; outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDLGRAVESTONEDOJI';

function TA_CDLGRAVESTONEDOJI_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLGRAVESTONEDOJI_Lookback';

function TA_CDLHAMMER(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLHAMMER';

function TA_S_CDLHAMMER(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDLHAMMER';

function TA_CDLHAMMER_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLHAMMER_Lookback';

function TA_CDLHANGINGMAN(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLHANGINGMAN';

function TA_S_CDLHANGINGMAN(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDLHANGINGMAN';

function TA_CDLHANGINGMAN_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLHANGINGMAN_Lookback';

function TA_CDLHARAMI(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLHARAMI';

function TA_S_CDLHARAMI(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDLHARAMI';

function TA_CDLHARAMI_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLHARAMI_Lookback';

function TA_CDLHARAMICROSS(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLHARAMICROSS';

function TA_S_CDLHARAMICROSS(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDLHARAMICROSS';

function TA_CDLHARAMICROSS_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLHARAMICROSS_Lookback';

function TA_CDLHIGHWAVE(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLHIGHWAVE';

function TA_S_CDLHIGHWAVE(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDLHIGHWAVE';

function TA_CDLHIGHWAVE_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLHIGHWAVE_Lookback';

function TA_CDLHIKKAKE(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLHIKKAKE';

function TA_S_CDLHIKKAKE(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDLHIKKAKE';

function TA_CDLHIKKAKE_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLHIKKAKE_Lookback';

function TA_CDLHIKKAKEMOD(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLHIKKAKEMOD';

function TA_S_CDLHIKKAKEMOD(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDLHIKKAKEMOD';

function TA_CDLHIKKAKEMOD_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLHIKKAKEMOD_Lookback';

function TA_CDLHOMINGPIGEON(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLHOMINGPIGEON';

function TA_S_CDLHOMINGPIGEON(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDLHOMINGPIGEON';

function TA_CDLHOMINGPIGEON_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLHOMINGPIGEON_Lookback';

function TA_CDLIDENTICAL3CROWS(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLIDENTICAL3CROWS';

function TA_S_CDLIDENTICAL3CROWS(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle;
  outBegIdx: PInteger; outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDLIDENTICAL3CROWS';

function TA_CDLIDENTICAL3CROWS_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLIDENTICAL3CROWS_Lookback';

function TA_CDLINNECK(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLINNECK';

function TA_S_CDLINNECK(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDLINNECK';

function TA_CDLINNECK_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLINNECK_Lookback';

function TA_CDLINVERTEDHAMMER(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLINVERTEDHAMMER';

function TA_S_CDLINVERTEDHAMMER(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle;
  outBegIdx: PInteger; outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDLINVERTEDHAMMER';

function TA_CDLINVERTEDHAMMER_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLINVERTEDHAMMER_Lookback';

function TA_CDLKICKING(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLKICKING';

function TA_S_CDLKICKING(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDLKICKING';

function TA_CDLKICKING_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLKICKING_Lookback';

function TA_CDLKICKINGBYLENGTH(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLKICKINGBYLENGTH';

function TA_S_CDLKICKINGBYLENGTH(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle;
  outBegIdx: PInteger; outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDLKICKINGBYLENGTH';

function TA_CDLKICKINGBYLENGTH_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLKICKINGBYLENGTH_Lookback';

function TA_CDLLADDERBOTTOM(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLLADDERBOTTOM';

function TA_S_CDLLADDERBOTTOM(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDLLADDERBOTTOM';

function TA_CDLLADDERBOTTOM_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLLADDERBOTTOM_Lookback';

function TA_CDLLONGLEGGEDDOJI(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLLONGLEGGEDDOJI';

function TA_S_CDLLONGLEGGEDDOJI(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle;
  outBegIdx: PInteger; outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDLLONGLEGGEDDOJI';

function TA_CDLLONGLEGGEDDOJI_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLLONGLEGGEDDOJI_Lookback';

function TA_CDLLONGLINE(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLLONGLINE';

function TA_S_CDLLONGLINE(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDLLONGLINE';

function TA_CDLLONGLINE_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLLONGLINE_Lookback';

function TA_CDLMARUBOZU(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLMARUBOZU';

function TA_S_CDLMARUBOZU(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDLMARUBOZU';

function TA_CDLMARUBOZU_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLMARUBOZU_Lookback';

function TA_CDLMATCHINGLOW(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLMATCHINGLOW';

function TA_S_CDLMATCHINGLOW(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDLMATCHINGLOW';

function TA_CDLMATCHINGLOW_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLMATCHINGLOW_Lookback';

function TA_CDLMATHOLD(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble; optInPenetration: double;
  outBegIdx: PInteger; outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLMATHOLD';

function TA_S_CDLMATHOLD(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle; optInPenetration: double;
  outBegIdx: PInteger; outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDLMATHOLD';

function TA_CDLMATHOLD_Lookback(optInPenetration: double): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLMATHOLD_Lookback';

function TA_CDLMORNINGDOJISTAR(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble;
  optInPenetration: double; outBegIdx: PInteger; outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLMORNINGDOJISTAR';

function TA_S_CDLMORNINGDOJISTAR(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle;
  optInPenetration: double; outBegIdx: PInteger; outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDLMORNINGDOJISTAR';

function TA_CDLMORNINGDOJISTAR_Lookback(optInPenetration: double): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLMORNINGDOJISTAR_Lookback';

function TA_CDLMORNINGSTAR(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble; optInPenetration: double;
  outBegIdx: PInteger; outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLMORNINGSTAR';

function TA_S_CDLMORNINGSTAR(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle; optInPenetration: double;
  outBegIdx: PInteger; outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDLMORNINGSTAR';

function TA_CDLMORNINGSTAR_Lookback(optInPenetration: double): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLMORNINGSTAR_Lookback';

function TA_CDLONNECK(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLONNECK';

function TA_S_CDLONNECK(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDLONNECK';

function TA_CDLONNECK_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLONNECK_Lookback';

function TA_CDLPIERCING(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLPIERCING';

function TA_S_CDLPIERCING(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDLPIERCING';

function TA_CDLPIERCING_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLPIERCING_Lookback';

function TA_CDLRICKSHAWMAN(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLRICKSHAWMAN';

function TA_S_CDLRICKSHAWMAN(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDLRICKSHAWMAN';

function TA_CDLRICKSHAWMAN_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLRICKSHAWMAN_Lookback';

function TA_CDLRISEFALL3METHODS(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble;
  outBegIdx: PInteger; outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLRISEFALL3METHODS';

function TA_S_CDLRISEFALL3METHODS(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle;
  outBegIdx: PInteger; outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDLRISEFALL3METHODS';

function TA_CDLRISEFALL3METHODS_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLRISEFALL3METHODS_Lookback';

function TA_CDLSEPARATINGLINES(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLSEPARATINGLINES';

function TA_S_CDLSEPARATINGLINES(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle;
  outBegIdx: PInteger; outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDLSEPARATINGLINES';

function TA_CDLSEPARATINGLINES_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLSEPARATINGLINES_Lookback';

function TA_CDLSHOOTINGSTAR(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLSHOOTINGSTAR';

function TA_S_CDLSHOOTINGSTAR(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDLSHOOTINGSTAR';

function TA_CDLSHOOTINGSTAR_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLSHOOTINGSTAR_Lookback';

function TA_CDLSHORTLINE(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLSHORTLINE';

function TA_S_CDLSHORTLINE(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDLSHORTLINE';

function TA_CDLSHORTLINE_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLSHORTLINE_Lookback';

function TA_CDLSPINNINGTOP(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLSPINNINGTOP';

function TA_S_CDLSPINNINGTOP(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDLSPINNINGTOP';

function TA_CDLSPINNINGTOP_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLSPINNINGTOP_Lookback';

function TA_CDLSTALLEDPATTERN(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLSTALLEDPATTERN';

function TA_S_CDLSTALLEDPATTERN(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle;
  outBegIdx: PInteger; outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDLSTALLEDPATTERN';

function TA_CDLSTALLEDPATTERN_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLSTALLEDPATTERN_Lookback';

function TA_CDLSTICKSANDWICH(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLSTICKSANDWICH';

function TA_S_CDLSTICKSANDWICH(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDLSTICKSANDWICH';

function TA_CDLSTICKSANDWICH_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLSTICKSANDWICH_Lookback';

function TA_CDLTAKURI(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLTAKURI';

function TA_S_CDLTAKURI(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDLTAKURI';

function TA_CDLTAKURI_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLTAKURI_Lookback';

function TA_CDLTASUKIGAP(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLTASUKIGAP';

function TA_S_CDLTASUKIGAP(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDLTASUKIGAP';

function TA_CDLTASUKIGAP_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLTASUKIGAP_Lookback';

function TA_CDLTHRUSTING(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLTHRUSTING';

function TA_S_CDLTHRUSTING(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDLTHRUSTING';

function TA_CDLTHRUSTING_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLTHRUSTING_Lookback';

function TA_CDLTRISTAR(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLTRISTAR';

function TA_S_CDLTRISTAR(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDLTRISTAR';

function TA_CDLTRISTAR_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLTRISTAR_Lookback';

function TA_CDLUNIQUE3RIVER(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLUNIQUE3RIVER';

function TA_S_CDLUNIQUE3RIVER(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDLUNIQUE3RIVER';

function TA_CDLUNIQUE3RIVER_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLUNIQUE3RIVER_Lookback';

function TA_CDLUPSIDEGAP2CROWS(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble; outBegIdx: PInteger;
  outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLUPSIDEGAP2CROWS';

function TA_S_CDLUPSIDEGAP2CROWS(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle;
  outBegIdx: PInteger; outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDLUPSIDEGAP2CROWS';

function TA_CDLUPSIDEGAP2CROWS_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLUPSIDEGAP2CROWS_Lookback';

function TA_CDLXSIDEGAP3METHODS(startIdx: integer; endIdx: integer; inOpen: PDouble; inHigh: PDouble; inLow: PDouble; inClose: PDouble;
  outBegIdx: PInteger; outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLXSIDEGAP3METHODS';

function TA_S_CDLXSIDEGAP3METHODS(startIdx: integer; endIdx: integer; inOpen: PSingle; inHigh: PSingle; inLow: PSingle; inClose: PSingle;
  outBegIdx: PInteger; outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CDLXSIDEGAP3METHODS';

function TA_CDLXSIDEGAP3METHODS_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CDLXSIDEGAP3METHODS_Lookback';

function TA_CEIL(startIdx: integer; endIdx: integer; inReal: PDouble; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CEIL';

function TA_S_CEIL(startIdx: integer; endIdx: integer; inReal: PSingle; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CEIL';

function TA_CEIL_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CEIL_Lookback';

function TA_CMO(startIdx: integer; endIdx: integer; inReal: PDouble; optInTimePeriod: integer; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CMO';

function TA_S_CMO(startIdx: integer; endIdx: integer; inReal: PSingle; optInTimePeriod: integer; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CMO';

function TA_CMO_Lookback(optInTimePeriod: integer): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CMO_Lookback';

function TA_CORREL(startIdx: integer; endIdx: integer; inReal0: PDouble; inReal1: PDouble; optInTimePeriod: integer; outBegIdx: PInteger;
  outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CORREL';

function TA_S_CORREL(startIdx: integer; endIdx: integer; inReal0: PSingle; inReal1: PSingle; optInTimePeriod: integer; outBegIdx: PInteger;
  outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_CORREL';

function TA_CORREL_Lookback(optInTimePeriod: integer): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_CORREL_Lookback';

function TA_COS(startIdx: integer; endIdx: integer; inReal: PDouble; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_COS';

function TA_S_COS(startIdx: integer; endIdx: integer; inReal: PSingle; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_COS';

function TA_COS_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_COS_Lookback';

function TA_COSH(startIdx: integer; endIdx: integer; inReal: PDouble; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_COSH';

function TA_S_COSH(startIdx: integer; endIdx: integer; inReal: PSingle; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_COSH';

function TA_COSH_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_COSH_Lookback';

function TA_DEMA(startIdx: integer; endIdx: integer; inReal: PDouble; optInTimePeriod: integer; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_DEMA';

function TA_S_DEMA(startIdx: integer; endIdx: integer; inReal: PSingle; optInTimePeriod: integer; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_DEMA';

function TA_DEMA_Lookback(optInTimePeriod: integer): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_DEMA_Lookback';

function TA_DIV(startIdx: integer; endIdx: integer; inReal0: PDouble; inReal1: PDouble; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_DIV';

function TA_S_DIV(startIdx: integer; endIdx: integer; inReal0: PSingle; inReal1: PSingle; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_DIV';

function TA_DIV_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_DIV_Lookback';

function TA_DX(startIdx: integer; endIdx: integer; inHigh: PDouble; inLow: PDouble; inClose: PDouble; optInTimePeriod: integer; outBegIdx: PInteger;
  outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_DX';

function TA_S_DX(startIdx: integer; endIdx: integer; inHigh: PSingle; inLow: PSingle; inClose: PSingle; optInTimePeriod: integer; outBegIdx: PInteger;
  outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_DX';

function TA_DX_Lookback(optInTimePeriod: integer): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_DX_Lookback';

function TA_EMA(startIdx: integer; endIdx: integer; inReal: PDouble; optInTimePeriod: integer; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_EMA';

function TA_S_EMA(startIdx: integer; endIdx: integer; inReal: PSingle; optInTimePeriod: integer; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_EMA';

function TA_EMA_Lookback(optInTimePeriod: integer): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_EMA_Lookback';

function TA_EXP(startIdx: integer; endIdx: integer; inReal: PDouble; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_EXP';

function TA_S_EXP(startIdx: integer; endIdx: integer; inReal: PSingle; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_EXP';

function TA_EXP_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_EXP_Lookback';

function TA_FLOOR(startIdx: integer; endIdx: integer; inReal: PDouble; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_FLOOR';

function TA_S_FLOOR(startIdx: integer; endIdx: integer; inReal: PSingle; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_FLOOR';

function TA_FLOOR_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_FLOOR_Lookback';

function TA_HT_DCPERIOD(startIdx: integer; endIdx: integer; inReal: PDouble; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_HT_DCPERIOD';

function TA_S_HT_DCPERIOD(startIdx: integer; endIdx: integer; inReal: PSingle; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_HT_DCPERIOD';

function TA_HT_DCPERIOD_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_HT_DCPERIOD_Lookback';

function TA_HT_DCPHASE(startIdx: integer; endIdx: integer; inReal: PDouble; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_HT_DCPHASE';

function TA_S_HT_DCPHASE(startIdx: integer; endIdx: integer; inReal: PSingle; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_HT_DCPHASE';

function TA_HT_DCPHASE_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_HT_DCPHASE_Lookback';

function TA_HT_PHASOR(startIdx: integer; endIdx: integer; inReal: PDouble; outBegIdx: PInteger; outNBElement: PInteger; outInPhase: PDouble; outQuadrature: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_HT_PHASOR';

function TA_S_HT_PHASOR(startIdx: integer; endIdx: integer; inReal: PSingle; outBegIdx: PInteger; outNBElement: PInteger; outInPhase: PDouble; outQuadrature: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_HT_PHASOR';

function TA_HT_PHASOR_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_HT_PHASOR_Lookback';

function TA_HT_SINE(startIdx: integer; endIdx: integer; inReal: PDouble; outBegIdx: PInteger; outNBElement: PInteger; outSine: PDouble; outLeadSine: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_HT_SINE';

function TA_S_HT_SINE(startIdx: integer; endIdx: integer; inReal: PSingle; outBegIdx: PInteger; outNBElement: PInteger; outSine: PDouble; outLeadSine: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_HT_SINE';

function TA_HT_SINE_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_HT_SINE_Lookback';

function TA_HT_TRENDLINE(startIdx: integer; endIdx: integer; inReal: PDouble; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_HT_TRENDLINE';

function TA_S_HT_TRENDLINE(startIdx: integer; endIdx: integer; inReal: PSingle; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_HT_TRENDLINE';

function TA_HT_TRENDLINE_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_HT_TRENDLINE_Lookback';

function TA_HT_TRENDMODE(startIdx: integer; endIdx: integer; inReal: PDouble; outBegIdx: PInteger; outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_HT_TRENDMODE';

function TA_S_HT_TRENDMODE(startIdx: integer; endIdx: integer; inReal: PSingle; outBegIdx: PInteger; outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_HT_TRENDMODE';

function TA_HT_TRENDMODE_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_HT_TRENDMODE_Lookback';

function TA_KAMA(startIdx: integer; endIdx: integer; inReal: PDouble; optInTimePeriod: integer; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_KAMA';

function TA_S_KAMA(startIdx: integer; endIdx: integer; inReal: PSingle; optInTimePeriod: integer; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_KAMA';

function TA_KAMA_Lookback(optInTimePeriod: integer): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_KAMA_Lookback';

function TA_LINEARREG(startIdx: integer; endIdx: integer; inReal: PDouble; optInTimePeriod: integer; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_LINEARREG';

function TA_S_LINEARREG(startIdx: integer; endIdx: integer; inReal: PSingle; optInTimePeriod: integer; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_LINEARREG';

function TA_LINEARREG_Lookback(optInTimePeriod: integer): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_LINEARREG_Lookback';

function TA_LINEARREG_ANGLE(startIdx: integer; endIdx: integer; inReal: PDouble; optInTimePeriod: integer; outBegIdx: PInteger; outNBElement: PInteger;
  outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_LINEARREG_ANGLE';

function TA_S_LINEARREG_ANGLE(startIdx: integer; endIdx: integer; inReal: PSingle; optInTimePeriod: integer; outBegIdx: PInteger; outNBElement: PInteger;
  outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_LINEARREG_ANGLE';

function TA_LINEARREG_ANGLE_Lookback(optInTimePeriod: integer): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_LINEARREG_ANGLE_Lookback';

function TA_LINEARREG_INTERCEPT(startIdx: integer; endIdx: integer; inReal: PDouble; optInTimePeriod: integer; outBegIdx: PInteger; outNBElement: PInteger;
  outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_LINEARREG_INTERCEPT';

function TA_S_LINEARREG_INTERCEPT(startIdx: integer; endIdx: integer; inReal: PSingle; optInTimePeriod: integer; outBegIdx: PInteger; outNBElement: PInteger;
  outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_LINEARREG_INTERCEPT';

function TA_LINEARREG_INTERCEPT_Lookback(optInTimePeriod: integer): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_LINEARREG_INTERCEPT_Lookback';

function TA_LINEARREG_SLOPE(startIdx: integer; endIdx: integer; inReal: PDouble; optInTimePeriod: integer; outBegIdx: PInteger; outNBElement: PInteger;
  outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_LINEARREG_SLOPE';

function TA_S_LINEARREG_SLOPE(startIdx: integer; endIdx: integer; inReal: PSingle; optInTimePeriod: integer; outBegIdx: PInteger; outNBElement: PInteger;
  outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_LINEARREG_SLOPE';

function TA_LINEARREG_SLOPE_Lookback(optInTimePeriod: integer): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_LINEARREG_SLOPE_Lookback';

function TA_LN(startIdx: integer; endIdx: integer; inReal: PDouble; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_LN';

function TA_S_LN(startIdx: integer; endIdx: integer; inReal: PSingle; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_LN';

function TA_LN_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_LN_Lookback';

function TA_LOG10(startIdx: integer; endIdx: integer; inReal: PDouble; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_LOG10';

function TA_S_LOG10(startIdx: integer; endIdx: integer; inReal: PSingle; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_LOG10';

function TA_LOG10_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_LOG10_Lookback';

function TA_MA(startIdx: integer; endIdx: integer; inReal: PDouble; optInTimePeriod: integer; optInMAType: TA_MAType; outBegIdx: PInteger;
  outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_MA';

function TA_S_MA(startIdx: integer; endIdx: integer; inReal: PSingle; optInTimePeriod: integer; optInMAType: TA_MAType; outBegIdx: PInteger;
  outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_MA';

function TA_MA_Lookback(optInTimePeriod: integer; optInMAType: TA_MAType): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_MA_Lookback';

function TA_MACD(startIdx: integer; endIdx: integer; inReal: PDouble; optInFastPeriod: integer; optInSlowPeriod: integer; optInSignalPeriod: integer;
  outBegIdx: PInteger; outNBElement: PInteger; outMACD: PDouble; outMACDSignal: PDouble; outMACDHist: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_MACD';

function TA_S_MACD(startIdx: integer; endIdx: integer; inReal: PSingle; optInFastPeriod: integer; optInSlowPeriod: integer; optInSignalPeriod: integer;
  outBegIdx: PInteger; outNBElement: PInteger; outMACD: PDouble; outMACDSignal: PDouble; outMACDHist: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_MACD';

function TA_MACD_Lookback(optInFastPeriod: integer; optInSlowPeriod: integer; optInSignalPeriod: integer): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_MACD_Lookback';

function TA_MACDEXT(startIdx: integer; endIdx: integer; inReal: PDouble; optInFastPeriod: integer; optInFastMAType: TA_MAType; optInSlowPeriod: integer;
  optInSlowMAType: TA_MAType; optInSignalPeriod: integer; optInSignalMAType: TA_MAType; outBegIdx: PInteger; outNBElement: PInteger; outMACD: PDouble;
  outMACDSignal: PDouble; outMACDHist: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_MACDEXT';

function TA_S_MACDEXT(startIdx: integer; endIdx: integer; inReal: PSingle; optInFastPeriod: integer; optInFastMAType: TA_MAType; optInSlowPeriod: integer;
  optInSlowMAType: TA_MAType; optInSignalPeriod: integer; optInSignalMAType: TA_MAType; outBegIdx: PInteger; outNBElement: PInteger; outMACD: PDouble;
  outMACDSignal: PDouble; outMACDHist: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_MACDEXT';

function TA_MACDEXT_Lookback(optInFastPeriod: integer; optInFastMAType: TA_MAType; optInSlowPeriod: integer; optInSlowMAType: TA_MAType;
  optInSignalPeriod: integer; optInSignalMAType: TA_MAType): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_MACDEXT_Lookback';

function TA_MACDFIX(startIdx: integer; endIdx: integer; inReal: PDouble; optInSignalPeriod: integer; outBegIdx: PInteger; outNBElement: PInteger;
  outMACD: PDouble; outMACDSignal: PDouble; outMACDHist: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_MACDFIX';

function TA_S_MACDFIX(startIdx: integer; endIdx: integer; inReal: PSingle; optInSignalPeriod: integer; outBegIdx: PInteger; outNBElement: PInteger;
  outMACD: PDouble; outMACDSignal: PDouble; outMACDHist: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_MACDFIX';

function TA_MACDFIX_Lookback(optInSignalPeriod: integer): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_MACDFIX_Lookback';

function TA_MAMA(startIdx: integer; endIdx: integer; inReal: PDouble; optInFastLimit: double; optInSlowLimit: double; outBegIdx: PInteger;
  outNBElement: PInteger; outMAMA: PDouble; outFAMA: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_MAMA';

function TA_S_MAMA(startIdx: integer; endIdx: integer; inReal: PSingle; optInFastLimit: double; optInSlowLimit: double; outBegIdx: PInteger;
  outNBElement: PInteger; outMAMA: PDouble; outFAMA: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_MAMA';

function TA_MAMA_Lookback(optInFastLimit: double; optInSlowLimit: double): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_MAMA_Lookback';

function TA_MAVP(startIdx: integer; endIdx: integer; inReal: PDouble; inPeriods: PDouble; optInMinPeriod: integer; optInMaxPeriod: integer;
  optInMAType: TA_MAType; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_MAVP';

function TA_S_MAVP(startIdx: integer; endIdx: integer; inReal: PSingle; inPeriods: PSingle; optInMinPeriod: integer; optInMaxPeriod: integer;
  optInMAType: TA_MAType; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_MAVP';

function TA_MAVP_Lookback(optInMinPeriod: integer; optInMaxPeriod: integer; optInMAType: TA_MAType): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_MAVP_Lookback';

function TA_MAX(startIdx: integer; endIdx: integer; inReal: PDouble; optInTimePeriod: integer; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_MAX';

function TA_S_MAX(startIdx: integer; endIdx: integer; inReal: PSingle; optInTimePeriod: integer; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_MAX';

function TA_MAX_Lookback(optInTimePeriod: integer): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_MAX_Lookback';

function TA_MAXINDEX(startIdx: integer; endIdx: integer; inReal: PDouble; optInTimePeriod: integer; outBegIdx: PInteger; outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_MAXINDEX';

function TA_S_MAXINDEX(startIdx: integer; endIdx: integer; inReal: PSingle; optInTimePeriod: integer; outBegIdx: PInteger; outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_MAXINDEX';

function TA_MAXINDEX_Lookback(optInTimePeriod: integer): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_MAXINDEX_Lookback';

function TA_MEDPRICE(startIdx: integer; endIdx: integer; inHigh: PDouble; inLow: PDouble; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_MEDPRICE';

function TA_S_MEDPRICE(startIdx: integer; endIdx: integer; inHigh: PSingle; inLow: PSingle; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_MEDPRICE';

function TA_MEDPRICE_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_MEDPRICE_Lookback';

function TA_MFI(startIdx: integer; endIdx: integer; inHigh: PDouble; inLow: PDouble; inClose: PDouble; inVolume: PDouble; optInTimePeriod: integer;
  outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_MFI';

function TA_S_MFI(startIdx: integer; endIdx: integer; inHigh: PSingle; inLow: PSingle; inClose: PSingle; inVolume: PSingle; optInTimePeriod: integer;
  outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_MFI';

function TA_MFI_Lookback(optInTimePeriod: integer): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_MFI_Lookback';

function TA_MIDPOINT(startIdx: integer; endIdx: integer; inReal: PDouble; optInTimePeriod: integer; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_MIDPOINT';

function TA_S_MIDPOINT(startIdx: integer; endIdx: integer; inReal: PSingle; optInTimePeriod: integer; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_MIDPOINT';

function TA_MIDPOINT_Lookback(optInTimePeriod: integer): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_MIDPOINT_Lookback';

function TA_MIDPRICE(startIdx: integer; endIdx: integer; inHigh: PDouble; inLow: PDouble; optInTimePeriod: integer; outBegIdx: PInteger;
  outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_MIDPRICE';

function TA_S_MIDPRICE(startIdx: integer; endIdx: integer; inHigh: PSingle; inLow: PSingle; optInTimePeriod: integer; outBegIdx: PInteger;
  outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_MIDPRICE';

function TA_MIDPRICE_Lookback(optInTimePeriod: integer): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_MIDPRICE_Lookback';

function TA_MIN(startIdx: integer; endIdx: integer; inReal: PDouble; optInTimePeriod: integer; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_MIN';

function TA_S_MIN(startIdx: integer; endIdx: integer; inReal: PSingle; optInTimePeriod: integer; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_MIN';

function TA_MIN_Lookback(optInTimePeriod: integer): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_MIN_Lookback';

function TA_MININDEX(startIdx: integer; endIdx: integer; inReal: PDouble; optInTimePeriod: integer; outBegIdx: PInteger; outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_MININDEX';

function TA_S_MININDEX(startIdx: integer; endIdx: integer; inReal: PSingle; optInTimePeriod: integer; outBegIdx: PInteger; outNBElement: PInteger; outInteger: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_MININDEX';

function TA_MININDEX_Lookback(optInTimePeriod: integer): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_MININDEX_Lookback';

function TA_MINMAX(startIdx: integer; endIdx: integer; inReal: PDouble; optInTimePeriod: integer; outBegIdx: PInteger; outNBElement: PInteger;
  outMin: PDouble; outMax: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_MINMAX';

function TA_S_MINMAX(startIdx: integer; endIdx: integer; inReal: PSingle; optInTimePeriod: integer; outBegIdx: PInteger; outNBElement: PInteger;
  outMin: PDouble; outMax: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_MINMAX';

function TA_MINMAX_Lookback(optInTimePeriod: integer): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_MINMAX_Lookback';

function TA_MINMAXINDEX(startIdx: integer; endIdx: integer; inReal: PDouble; optInTimePeriod: integer; outBegIdx: PInteger; outNBElement: PInteger;
  outMinIdx: PInteger; outMaxIdx: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_MINMAXINDEX';

function TA_S_MINMAXINDEX(startIdx: integer; endIdx: integer; inReal: PSingle; optInTimePeriod: integer; outBegIdx: PInteger; outNBElement: PInteger;
  outMinIdx: PInteger; outMaxIdx: PInteger): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_MINMAXINDEX';

function TA_MINMAXINDEX_Lookback(optInTimePeriod: integer): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_MINMAXINDEX_Lookback';

function TA_MINUS_DI(startIdx: integer; endIdx: integer; inHigh: PDouble; inLow: PDouble; inClose: PDouble; optInTimePeriod: integer; outBegIdx: PInteger;
  outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_MINUS_DI';

function TA_S_MINUS_DI(startIdx: integer; endIdx: integer; inHigh: PSingle; inLow: PSingle; inClose: PSingle; optInTimePeriod: integer;
  outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_MINUS_DI';

function TA_MINUS_DI_Lookback(optInTimePeriod: integer): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_MINUS_DI_Lookback';

function TA_MINUS_DM(startIdx: integer; endIdx: integer; inHigh: PDouble; inLow: PDouble; optInTimePeriod: integer; outBegIdx: PInteger;
  outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_MINUS_DM';

function TA_S_MINUS_DM(startIdx: integer; endIdx: integer; inHigh: PSingle; inLow: PSingle; optInTimePeriod: integer; outBegIdx: PInteger;
  outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_MINUS_DM';

function TA_MINUS_DM_Lookback(optInTimePeriod: integer): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_MINUS_DM_Lookback';

function TA_MOM(startIdx: integer; endIdx: integer; inReal: PDouble; optInTimePeriod: integer; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_MOM';

function TA_S_MOM(startIdx: integer; endIdx: integer; inReal: PSingle; optInTimePeriod: integer; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_MOM';

function TA_MOM_Lookback(optInTimePeriod: integer): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_MOM_Lookback';

function TA_MULT(startIdx: integer; endIdx: integer; inReal0: PDouble; inReal1: PDouble; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_MULT';

function TA_S_MULT(startIdx: integer; endIdx: integer; inReal0: PSingle; inReal1: PSingle; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_MULT';

function TA_MULT_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_MULT_Lookback';

function TA_NATR(startIdx: integer; endIdx: integer; inHigh: PDouble; inLow: PDouble; inClose: PDouble; optInTimePeriod: integer; outBegIdx: PInteger;
  outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_NATR';

function TA_S_NATR(startIdx: integer; endIdx: integer; inHigh: PSingle; inLow: PSingle; inClose: PSingle; optInTimePeriod: integer; outBegIdx: PInteger;
  outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_NATR';

function TA_NATR_Lookback(optInTimePeriod: integer): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_NATR_Lookback';

function TA_OBV(startIdx: integer; endIdx: integer; inReal: PDouble; inVolume: PDouble; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_OBV';

function TA_S_OBV(startIdx: integer; endIdx: integer; inReal: PSingle; inVolume: PSingle; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_OBV';

function TA_OBV_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_OBV_Lookback';

function TA_PLUS_DI(startIdx: integer; endIdx: integer; inHigh: PDouble; inLow: PDouble; inClose: PDouble; optInTimePeriod: integer; outBegIdx: PInteger;
  outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_PLUS_DI';

function TA_S_PLUS_DI(startIdx: integer; endIdx: integer; inHigh: PSingle; inLow: PSingle; inClose: PSingle; optInTimePeriod: integer; outBegIdx: PInteger;
  outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_PLUS_DI';

function TA_PLUS_DI_Lookback(optInTimePeriod: integer): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_PLUS_DI_Lookback';

function TA_PLUS_DM(startIdx: integer; endIdx: integer; inHigh: PDouble; inLow: PDouble; optInTimePeriod: integer; outBegIdx: PInteger;
  outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_PLUS_DM';

function TA_S_PLUS_DM(startIdx: integer; endIdx: integer; inHigh: PSingle; inLow: PSingle; optInTimePeriod: integer; outBegIdx: PInteger;
  outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_PLUS_DM';

function TA_PLUS_DM_Lookback(optInTimePeriod: integer): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_PLUS_DM_Lookback';

function TA_PPO(startIdx: integer; endIdx: integer; inReal: PDouble; optInFastPeriod: integer; optInSlowPeriod: integer; optInMAType: TA_MAType;
  outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_PPO';

function TA_S_PPO(startIdx: integer; endIdx: integer; inReal: PSingle; optInFastPeriod: integer; optInSlowPeriod: integer; optInMAType: TA_MAType;
  outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_PPO';

function TA_PPO_Lookback(optInFastPeriod: integer; optInSlowPeriod: integer; optInMAType: TA_MAType): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_PPO_Lookback';

function TA_ROC(startIdx: integer; endIdx: integer; inReal: PDouble; optInTimePeriod: integer; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_ROC';

function TA_S_ROC(startIdx: integer; endIdx: integer; inReal: PSingle; optInTimePeriod: integer; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_ROC';

function TA_ROC_Lookback(optInTimePeriod: integer): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_ROC_Lookback';

function TA_ROCP(startIdx: integer; endIdx: integer; inReal: PDouble; optInTimePeriod: integer; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_ROCP';

function TA_S_ROCP(startIdx: integer; endIdx: integer; inReal: PSingle; optInTimePeriod: integer; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_ROCP';

function TA_ROCP_Lookback(optInTimePeriod: integer): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_ROCP_Lookback';

function TA_ROCR(startIdx: integer; endIdx: integer; inReal: PDouble; optInTimePeriod: integer; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_ROCR';

function TA_S_ROCR(startIdx: integer; endIdx: integer; inReal: PSingle; optInTimePeriod: integer; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_ROCR';

function TA_ROCR_Lookback(optInTimePeriod: integer): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_ROCR_Lookback';

function TA_ROCR100(startIdx: integer; endIdx: integer; inReal: PDouble; optInTimePeriod: integer; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_ROCR100';

function TA_S_ROCR100(startIdx: integer; endIdx: integer; inReal: PSingle; optInTimePeriod: integer; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_ROCR100';

function TA_ROCR100_Lookback(optInTimePeriod: integer): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_ROCR100_Lookback';

function TA_RSI(startIdx,endIdx: integer;inReal: PDouble; optInTimePeriod: integer;outBegIdx,outNBElement: PInteger;outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_RSI';

function TA_S_RSI(startIdx: integer; endIdx: integer; inReal: PSingle; optInTimePeriod: integer; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_RSI';

function TA_RSI_Lookback(optInTimePeriod: integer): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_RSI_Lookback';

function TA_SAR(startIdx: integer; endIdx: integer; inHigh: PDouble; inLow: PDouble; optInAcceleration: double; optInMaximum: double; outBegIdx: PInteger;
  outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_SAR';

function TA_S_SAR(startIdx: integer; endIdx: integer; inHigh: PSingle; inLow: PSingle; optInAcceleration: double; optInMaximum: double;
  outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_SAR';

function TA_SAR_Lookback(optInAcceleration: double; optInMaximum: double): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_SAR_Lookback';

function TA_SAREXT(startIdx: integer; endIdx: integer; inHigh: PDouble; inLow: PDouble; optInStartValue: double; optInOffsetOnReverse: double;
  optInAccelerationInitLong: double; optInAccelerationLong: double; optInAccelerationMaxLong: double; optInAccelerationInitShort: double;
  optInAccelerationShort: double; optInAccelerationMaxShort: double; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_SAREXT';

function TA_S_SAREXT(startIdx: integer; endIdx: integer; inHigh: PSingle; inLow: PSingle; optInStartValue: double; optInOffsetOnReverse: double;
  optInAccelerationInitLong: double; optInAccelerationLong: double; optInAccelerationMaxLong: double; optInAccelerationInitShort: double;
  optInAccelerationShort: double; optInAccelerationMaxShort: double; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_SAREXT';

function TA_SAREXT_Lookback(optInStartValue: double; optInOffsetOnReverse: double; optInAccelerationInitLong: double; optInAccelerationLong: double;
  optInAccelerationMaxLong: double; optInAccelerationInitShort: double; optInAccelerationShort: double; optInAccelerationMaxShort: double): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_SAREXT_Lookback';

function TA_SIN(startIdx: integer; endIdx: integer; inReal: PDouble; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_SIN';

function TA_S_SIN(startIdx: integer; endIdx: integer; inReal: PSingle; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_SIN';

function TA_SIN_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_SIN_Lookback';

function TA_SINH(startIdx: integer; endIdx: integer; inReal: PDouble; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_SINH';

function TA_S_SINH(startIdx: integer; endIdx: integer; inReal: PSingle; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_SINH';

function TA_SINH_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_SINH_Lookback';

function TA_SMA(startIdx: integer; endIdx: integer; inReal: PDouble; optInTimePeriod: integer; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_SMA';

function TA_S_SMA(startIdx: integer; endIdx: integer; inReal: PSingle; optInTimePeriod: integer; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_SMA';

function TA_SMA_Lookback(optInTimePeriod: integer): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_SMA_Lookback';

function TA_SQRT(startIdx: integer; endIdx: integer; inReal: PDouble; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_SQRT';

function TA_S_SQRT(startIdx: integer; endIdx: integer; inReal: PSingle; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_SQRT';

function TA_SQRT_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_SQRT_Lookback';

function TA_STDDEV(startIdx: integer; endIdx: integer; inReal: PDouble; optInTimePeriod: integer; optInNbDev: double; outBegIdx: PInteger;
  outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_STDDEV';

function TA_S_STDDEV(startIdx: integer; endIdx: integer; inReal: PSingle; optInTimePeriod: integer; optInNbDev: double; outBegIdx: PInteger;
  outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_STDDEV';

function TA_STDDEV_Lookback(optInTimePeriod: integer; optInNbDev: double): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_STDDEV_Lookback';

function TA_STOCH(startIdx: integer; endIdx: integer; inHigh: PDouble; inLow: PDouble; inClose: PDouble; optInFastK_Period: integer;
  optInSlowK_Period: integer; optInSlowK_MAType: TA_MAType; optInSlowD_Period: integer; optInSlowD_MAType: TA_MAType; outBegIdx: PInteger;
  outNBElement: PInteger; outSlowK: PDouble; outSlowD: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_STOCH';

function TA_S_STOCH(startIdx: integer; endIdx: integer; inHigh: PSingle; inLow: PSingle; inClose: PSingle; optInFastK_Period: integer;
  optInSlowK_Period: integer; optInSlowK_MAType: TA_MAType; optInSlowD_Period: integer; optInSlowD_MAType: TA_MAType; outBegIdx: PInteger;
  outNBElement: PInteger; outSlowK: PDouble; outSlowD: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_STOCH';

function TA_STOCH_Lookback(optInFastK_Period: integer; optInSlowK_Period: integer; optInSlowK_MAType: TA_MAType; optInSlowD_Period: integer; optInSlowD_MAType: TA_MAType): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_STOCH_Lookback';

function TA_STOCHF(startIdx: integer; endIdx: integer; inHigh: PDouble; inLow: PDouble; inClose: PDouble; optInFastK_Period: integer;
  optInFastD_Period: integer; optInFastD_MAType: TA_MAType; outBegIdx: PInteger; outNBElement: PInteger; outFastK: PDouble; outFastD: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_STOCHF';

function TA_S_STOCHF(startIdx: integer; endIdx: integer; inHigh: PSingle; inLow: PSingle; inClose: PSingle; optInFastK_Period: integer;
  optInFastD_Period: integer; optInFastD_MAType: TA_MAType; outBegIdx: PInteger; outNBElement: PInteger; outFastK: PDouble; outFastD: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_STOCHF';

function TA_STOCHF_Lookback(optInFastK_Period: integer; optInFastD_Period: integer; optInFastD_MAType: TA_MAType): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_STOCHF_Lookback';

function TA_STOCHRSI(startIdx: integer; endIdx: integer; inReal: PDouble; optInTimePeriod: integer; optInFastK_Period: integer; optInFastD_Period: integer;
  optInFastD_MAType: TA_MAType; outBegIdx: PInteger; outNBElement: PInteger; outFastK: PDouble; outFastD: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_STOCHRSI';

function TA_S_STOCHRSI(startIdx: integer; endIdx: integer; inReal: PSingle; optInTimePeriod: integer; optInFastK_Period: integer; optInFastD_Period: integer;
  optInFastD_MAType: TA_MAType; outBegIdx: PInteger; outNBElement: PInteger; outFastK: PDouble; outFastD: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_STOCHRSI';

function TA_STOCHRSI_Lookback(optInTimePeriod: integer; optInFastK_Period: integer; optInFastD_Period: integer; optInFastD_MAType: TA_MAType): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_STOCHRSI_Lookback';

function TA_SUB(startIdx: integer; endIdx: integer; inReal0: PDouble; inReal1: PDouble; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_SUB';

function TA_S_SUB(startIdx: integer; endIdx: integer; inReal0: PSingle; inReal1: PSingle; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_SUB';

function TA_SUB_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_SUB_Lookback';

function TA_SUM(startIdx: integer; endIdx: integer; inReal: PDouble; optInTimePeriod: integer; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_SUM';

function TA_S_SUM(startIdx: integer; endIdx: integer; inReal: PSingle; optInTimePeriod: integer; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_SUM';

function TA_SUM_Lookback(optInTimePeriod: integer): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_SUM_Lookback';

function TA_T3(startIdx: integer; endIdx: integer; inReal: PDouble; optInTimePeriod: integer; optInVFactor: double; outBegIdx: PInteger;
  outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_T3';

function TA_S_T3(startIdx: integer; endIdx: integer; inReal: PSingle; optInTimePeriod: integer; optInVFactor: double; outBegIdx: PInteger;
  outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_T3';

function TA_T3_Lookback(optInTimePeriod: integer; optInVFactor: double): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_T3_Lookback';

function TA_TAN(startIdx: integer; endIdx: integer; inReal: PDouble; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_TAN';

function TA_S_TAN(startIdx: integer; endIdx: integer; inReal: PSingle; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_TAN';

function TA_TAN_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_TAN_Lookback';

function TA_TANH(startIdx: integer; endIdx: integer; inReal: PDouble; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_TANH';

function TA_S_TANH(startIdx: integer; endIdx: integer; inReal: PSingle; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_TANH';

function TA_TANH_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_TANH_Lookback';

function TA_TEMA(startIdx: integer; endIdx: integer; inReal: PDouble; optInTimePeriod: integer; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_TEMA';

function TA_S_TEMA(startIdx: integer; endIdx: integer; inReal: PSingle; optInTimePeriod: integer; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_TEMA';

function TA_TEMA_Lookback(optInTimePeriod: integer): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_TEMA_Lookback';

function TA_TRANGE(startIdx: integer; endIdx: integer; inHigh: PDouble; inLow: PDouble; inClose: PDouble; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_TRANGE';

function TA_S_TRANGE(startIdx: integer; endIdx: integer; inHigh: PSingle; inLow: PSingle; inClose: PSingle; outBegIdx: PInteger; outNBElement: PInteger;
  outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_TRANGE';

function TA_TRANGE_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_TRANGE_Lookback';

function TA_TRIMA(startIdx: integer; endIdx: integer; inReal: PDouble; optInTimePeriod: integer; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_TRIMA';

function TA_S_TRIMA(startIdx: integer; endIdx: integer; inReal: PSingle; optInTimePeriod: integer; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_TRIMA';

function TA_TRIMA_Lookback(optInTimePeriod: integer): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_TRIMA_Lookback';

function TA_TRIX(startIdx: integer; endIdx: integer; inReal: PDouble; optInTimePeriod: integer; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_TRIX';

function TA_S_TRIX(startIdx: integer; endIdx: integer; inReal: PSingle; optInTimePeriod: integer; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_TRIX';

function TA_TRIX_Lookback(optInTimePeriod: integer): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_TRIX_Lookback';

function TA_TSF(startIdx: integer; endIdx: integer; inReal: PDouble; optInTimePeriod: integer; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_TSF';

function TA_S_TSF(startIdx: integer; endIdx: integer; inReal: PSingle; optInTimePeriod: integer; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_TSF';

function TA_TSF_Lookback(optInTimePeriod: integer): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_TSF_Lookback';

function TA_TYPPRICE(startIdx: integer; endIdx: integer; inHigh: PDouble; inLow: PDouble; inClose: PDouble; outBegIdx: PInteger; outNBElement: PInteger;
  outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_TYPPRICE';

function TA_S_TYPPRICE(startIdx: integer; endIdx: integer; inHigh: PSingle; inLow: PSingle; inClose: PSingle; outBegIdx: PInteger; outNBElement: PInteger;
  outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_TYPPRICE';

function TA_TYPPRICE_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_TYPPRICE_Lookback';

function TA_ULTOSC(startIdx: integer; endIdx: integer; inHigh: PDouble; inLow: PDouble; inClose: PDouble; optInTimePeriod1: integer;
  optInTimePeriod2: integer; optInTimePeriod3: integer; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_ULTOSC';

function TA_S_ULTOSC(startIdx: integer; endIdx: integer; inHigh: PSingle; inLow: PSingle; inClose: PSingle; optInTimePeriod1: integer;
  optInTimePeriod2: integer; optInTimePeriod3: integer; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_ULTOSC';

function TA_ULTOSC_Lookback(optInTimePeriod1: integer; optInTimePeriod2: integer; optInTimePeriod3: integer): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_ULTOSC_Lookback';

function TA_VAR(startIdx: integer; endIdx: integer; inReal: PDouble; optInTimePeriod: integer; optInNbDev: double; outBegIdx: PInteger;
  outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_VAR';

function TA_S_VAR(startIdx: integer; endIdx: integer; inReal: PSingle; optInTimePeriod: integer; optInNbDev: double; outBegIdx: PInteger;
  outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_VAR';

function TA_VAR_Lookback(optInTimePeriod: integer; optInNbDev: double): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_VAR_Lookback';

function TA_WCLPRICE(startIdx: integer; endIdx: integer; inHigh: PDouble; inLow: PDouble; inClose: PDouble; outBegIdx: PInteger; outNBElement: PInteger;
  outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_WCLPRICE';

function TA_S_WCLPRICE(startIdx: integer; endIdx: integer; inHigh: PSingle; inLow: PSingle; inClose: PSingle; outBegIdx: PInteger; outNBElement: PInteger;
  outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_WCLPRICE';

function TA_WCLPRICE_Lookback(): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_WCLPRICE_Lookback';

function TA_WILLR(startIdx: integer; endIdx: integer; inHigh: PDouble; inLow: PDouble; inClose: PDouble; optInTimePeriod: integer; outBegIdx: PInteger;
  outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_WILLR';

function TA_S_WILLR(startIdx: integer; endIdx: integer; inHigh: PSingle; inLow: PSingle; inClose: PSingle; optInTimePeriod: integer; outBegIdx: PInteger;
  outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_WILLR';

function TA_WILLR_Lookback(optInTimePeriod: integer): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_WILLR_Lookback';

function TA_WMA(startIdx: integer; endIdx: integer; inReal: PDouble; optInTimePeriod: integer; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_WMA';

function TA_S_WMA(startIdx: integer; endIdx: integer; inReal: PSingle; optInTimePeriod: integer; outBegIdx: PInteger; outNBElement: PInteger; outReal: PDouble): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_S_WMA';

function TA_WMA_Lookback(optInTimePeriod: integer): integer; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_WMA_Lookback';

function TA_SetUnstablePeriod(id: TA_FuncUnstId; unstablePeriod: cardinal): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_SetUnstablePeriod';

function TA_GetUnstablePeriod(id: TA_FuncUnstId): cardinal; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_GetUnstablePeriod';

function TA_SetCompatibility(Value: TA_Compatibility): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_SetCompatibility';

function TA_GetCompatibility(): TA_Compatibility; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_GetCompatibility';

function TA_SetCandleSettings(settingType: TA_CandleSettingType; rangeType: TA_RangeType; avgPeriod: integer; factor: double): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_SetCandleSettings';

function TA_RestoreCandleDefaultSettings(settingType: TA_CandleSettingType): TA_RetCode; cdecl;
  external {$IfNDef TALIB_STATICLINK}TALibLib{$EndIf} Name 'TA_RestoreCandleDefaultSettings';

function acos(x: double): double; cdecl;
function _sqrt(x:Double):Double;cdecl;

implementation

function TASuccess(aRetCode: TA_RetCode): boolean;
begin
  Result := (TA_SUCCESS = aRetCode);
end;

function acos(x: double): double; cdecl; [alias: 'acos'];
begin
  Result := Math.ArcCos(x);
end;

function _sqrt(x: Double): Double; cdecl;[alias: 'sqrt'];
begin
  Result:=sqrt(x);
end;

initialization
  SetExceptionMask([exInvalidOp, exDenormalized, exZeroDivide, exOverflow, exUnderflow, exPrecision]);

end.
