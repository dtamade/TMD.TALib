program Example;

{$mode objfpc}{$H+}

uses {$IFDEF UNIX} {$IFDEF UseCThreads}
  cthreads, {$ENDIF} {$ENDIF}
  Classes,
  SysUtils,
  Math,
  CustApp,
  TMD.TALib.Defs,
  TMD.TALib;

type

  { TMyApplication }

  TMyApplication = class(TCustomApplication)
  protected
    procedure DoRun; override;
  public
    constructor Create(TheOwner: TComponent); override;
    destructor Destroy; override;
    procedure WriteHelp; virtual;
  end;

const
  TestData: array[0..30] of double = (0.14, 0.6, 1.2, 2, 0.5, 0.77, 2, 2.3, 4, 1.687,
    1.2, 2.2, 2.3, 3, 1.6, 2.9, 3.2, 4.12, 3, 3.2,
    4, 3.89, 2.33, 5, 4.23, 6, 6.1, 4.1834, 3.214, 4.1, 2.8);

  procedure TestRSI;
  const
    LTimePeriod = 14;
  var
    LLen, LOutBegIdx, LOutNBElement: integer;
    LOut: TDoubleArray;
    LOutValue: double;
  begin
    LLen := Length(TestData);
    SetLength(LOut, LLen);
    try
      if not TASuccess(TA_RSI(0, LLen - 1, @TestData[0], LTimePeriod, @LOutBegIdx, @LOutNBElement, @LOut[0])) then
        raise Exception.Create('RSI Failed!');

      SetLength(LOut, LOutNBElement);

      for LOutValue in LOut do
        WriteLn(FormatFloat('0.####', LOutValue));
    finally
      SetLength(LOut, 0);
    end;
  end;

  procedure TestACOS;
  var
    LLen, LOutBegIdx, LOutNBElement: integer;
    LOut: TDoubleArray;
    LOutValue: double;
  begin
    LLen := Length(TestData);
    SetLength(LOut, LLen);
    try
      if not TASuccess(TA_ACOS(0, LLen - 1, @TestData[0], @LOutBegIdx, @LOutNBElement, @LOut[0])) then
        raise Exception.Create('ACOS Failed!');

      for LOutValue in LOut do
        WriteLn(FormatFloat('0.####', LOutValue));
    finally
      SetLength(LOut, 0);
    end;
  end;

  procedure TestMA;
  const
    LTimePeriod = 14;
  var
    LLen, LOutBegIdx, LOutNBElement: integer;
    LOut: TDoubleArray;
    LOutValue: double;
  begin
    LLen := Length(TestData);
    SetLength(LOut, LLen);
    try
      if not TASuccess(TA_MA(0, LLen - 1, @TestData[0], LTimePeriod, TA_MAType.TA_MAType_SMA, @LOutBegIdx, @LOutNBElement, @LOut[0])) then
        raise Exception.Create('MA Failed!');
      SetLength(LOut, LOutNBElement);
      for LOutValue in LOut do
        WriteLn(FormatFloat('0.####', LOutValue));
    finally
      SetLength(LOut, 0);
    end;
  end;

  procedure TestAPO;
  var
    LLen, LOutBegIdx, LOutNBElement: integer;
    LOut: TDoubleArray;
    LOutValue: double;
  begin
    LLen := Length(TestData);
    SetLength(LOut, LLen);
    try
      if not TASuccess(TA_APO(0, LLen, @TestData[0], 12, 4, TA_MAType.TA_MAType_SMA, @LOutBegIdx, @LOutNBElement, @LOut[0])) then
        raise Exception.Create('APO Failed!');
      SetLength(LOut, LOutNBElement);
      for LOutValue in LOut do
        WriteLn(FormatFloat('0.####', LOutValue));
    finally
      SetLength(LOut, 0);
    end;
  end;

  procedure TestTEMA;
  var
    LLen, LOutBegIdx, LOutNBElement: integer;
    LOut: TDoubleArray;
    LOutValue: double;
  begin
    LLen := Length(TestData);
    SetLength(LOut, LLen);
    try
      if not TASuccess(TA_TEMA(0, LLen, @TestData[0], 4, @LOutBegIdx, @LOutNBElement, @LOut[0])) then
        raise Exception.Create('APO Failed!');
      SetLength(LOut, LOutNBElement);
      for LOutValue in LOut do
        WriteLn(FormatFloat('0.####', LOutValue));
    finally
      SetLength(LOut, 0);
    end;
  end;

  procedure TestSMA;
  var
    LLen, LOutBegIdx, LOutNBElement: integer;
    LOut: TDoubleArray;
    LOutValue: double;
  begin
    LLen := Length(TestData);
    SetLength(LOut, LLen);
    try
      if not TASuccess(TA_SMA(0, LLen, @TestData[0], 4, @LOutBegIdx, @LOutNBElement, @LOut[0])) then
        raise Exception.Create('SMA Failed!');
      SetLength(LOut, LOutNBElement);
      for LOutValue in LOut do
        WriteLn(FormatFloat('0.####', LOutValue));
    finally
      SetLength(LOut, 0);
    end;
  end;

  procedure TestTRIMA;
  var
    LLen, LOutBegIdx, LOutNBElement: integer;
    LOut: TDoubleArray;
    LOutValue: double;
  begin
    LLen := Length(TestData);
    SetLength(LOut, LLen);
    try
      if not TASuccess(TA_TRIMA(0, LLen, @TestData[0], 4, @LOutBegIdx, @LOutNBElement, @LOut[0])) then
        raise Exception.Create('TRIMA Failed!');
      SetLength(LOut, LOutNBElement);
      for LOutValue in LOut do
        WriteLn(FormatFloat('0.####', LOutValue));
    finally
      SetLength(LOut, 0);
    end;
  end;

  procedure TestWMA;
  var
    LLen, LOutBegIdx, LOutNBElement: integer;
    LOut: TDoubleArray;
    LOutValue: double;
  begin
    LLen := Length(TestData);
    SetLength(LOut, LLen);
    try
      if not TASuccess(TA_WMA(0, LLen, @TestData[0], 4, @LOutBegIdx, @LOutNBElement, @LOut[0])) then
        raise Exception.Create('WMA Failed!');
      SetLength(LOut, LOutNBElement);
      for LOutValue in LOut do
        WriteLn(FormatFloat('0.####', LOutValue));
    finally
      SetLength(LOut, 0);
    end;
  end;

  { TMyApplication }

  procedure TMyApplication.DoRun;
  begin
    TA_Initialize;
    try
      WriteLn('TALib V', TA_GetVersionString());
      WriteLn('RSI');
      TestRSI();
      WriteLn('ACOS');
      TestACOS();
      //WriteLn('MA');
      //  TestMA;
      WriteLn('SMA');
      TestSMA();
      WriteLn('TRIMA');
      TestTRIMA;
      WriteLn('WMA');
      TestWMA;
       //WriteLn('APO');
       //TestAPO();
      WriteLn('TEMA');
      TestTEMA();
    finally
      TA_Shutdown;
    end;
    ReadLn;


    // stop program loop
    Terminate;
  end;

  constructor TMyApplication.Create(TheOwner: TComponent);
  begin
    inherited Create(TheOwner);
    StopOnException := True;
  end;

  destructor TMyApplication.Destroy;
  begin
    inherited Destroy;
  end;

  procedure TMyApplication.WriteHelp;
  begin
    { add your help code here }
    writeln('Usage: ', ExeName, ' -h');
  end;

var
  Application: TMyApplication;
begin
  Application := TMyApplication.Create(nil);
  Application.Title := 'My Application';

  Application.Run;
  Application.Free;
end.
