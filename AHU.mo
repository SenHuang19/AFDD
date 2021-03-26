within AFDD;
model AHU "\"air sidesystem\""
  import BuildingControlEmulator;

  package MediumAir = IBPSA.Media.Air "Medium model for air";
  package MediumCHW = IBPSA.Media.Water
    "Medium model";

  package MediumHeaWat = IBPSA.Media.Water "Medium model for heating water";

  parameter Integer n =  3  "Number of floors";
  parameter Real alpha =  0.75  "Sizing factor";
  parameter Modelica.SIunits.Pressure PreDroCoiAir =  50  "Pressure drop in the air side";
  parameter Modelica.SIunits.Pressure PreDroMixingBoxAir =  50 "Pressure drop in the air side";
  parameter Modelica.SIunits.Pressure PreDroCooWat = 79712 "Pressure drop in the water side";

  parameter Modelica.SIunits.Temperature TemEcoHig = 273.15 + 15.58 "the highest temeprature when the economizer is on";
  parameter Modelica.SIunits.Temperature TemEcoLow = 273.15 + 0 "the lowest temeprature when the economizer is on";
  parameter Real MixingBoxDamMin = 0.1 "the minimum damper postion";

  parameter Modelica.SIunits.VolumeFlowRate VolFloCur[n,:] = {{(mAirFloRat1[1] + mAirFloRat2[1] + mAirFloRat3[1] + mAirFloRat4[1] + mAirFloRat5[1])/1.2*0.5,(mAirFloRat1[1] + mAirFloRat2[1]+ mAirFloRat3[1] + mAirFloRat4[1] + mAirFloRat5[1])/1.2*0.7,(mAirFloRat1[1] + mAirFloRat2[1] + mAirFloRat3[1] + mAirFloRat4[1] + mAirFloRat5[1])/1.2,(mAirFloRat1[1] + mAirFloRat2[1] + mAirFloRat3[1] + mAirFloRat4[1] + mAirFloRat5[1])/1.2*2},{(mAirFloRat1[2] + mAirFloRat2[2] + mAirFloRat3[2] + mAirFloRat4[2] + mAirFloRat5[2])/1.2*0.5,(mAirFloRat1[2] + mAirFloRat2[2]+ mAirFloRat3[2] + mAirFloRat4[2] + mAirFloRat5[2])/1.2*0.7,(mAirFloRat1[2] + mAirFloRat2[2] + mAirFloRat3[2] + mAirFloRat4[2] + mAirFloRat5[2])/1.2,(mAirFloRat1[2] + mAirFloRat2[2] + mAirFloRat3[2] + mAirFloRat4[2] + mAirFloRat5[2])/1.2*2},{(mAirFloRat1[3] + mAirFloRat2[3] + mAirFloRat3[3] + mAirFloRat4[3] + mAirFloRat5[3])/1.2*0.5,(mAirFloRat1[3] + mAirFloRat2[3] + mAirFloRat3[3] + mAirFloRat4[3] + mAirFloRat5[3])/1.2*0.7,(mAirFloRat1[3] + mAirFloRat2[3] + mAirFloRat3[3] + mAirFloRat4[3] + mAirFloRat5[3])/1.2,(mAirFloRat1[3] + mAirFloRat2[3] + mAirFloRat3[3] + mAirFloRat4[3] + mAirFloRat5[3])/1.2*2}} "Volume flow rate curve";
   parameter Real HydEff[n,:] = {{0.93*0.65,0.93*0.7,0.93,0.93*0.6} for i in linspace(1,n,n)} "Hydraulic efficiency";
  parameter Real MotEff[n,:] = {{0.6045*0.65,0.6045*0.7,0.6045,0.6045*0.6} for i in linspace(1,n,n)} "Motor efficiency";

  parameter Modelica.SIunits.Pressure SupPreCur[n,:] = {{1400,1000,700,700*0.5} for i in linspace(1,n,n)} "Pressure curve";
  parameter Modelica.SIunits.Pressure RetPreCur[n,:] = {{600,400,200,100} for i in linspace(1,n,n)} "Pressure curve";

parameter Modelica.SIunits.Pressure PreAirDroMai1 = 140 "Pressure drop 1 across the duct";

  parameter Modelica.SIunits.Pressure PreAirDroMai2 = 140 "Pressure drop 2 across the main duct";

  parameter Modelica.SIunits.Pressure PreAirDroMai3 = 120 "Pressure drop 3 across the main duct";

  parameter Modelica.SIunits.Pressure PreAirDroMai4 = 152 "Pressure drop 4 across the main duct";

  parameter Modelica.SIunits.Pressure PreAirDroBra1 = 0 "Pressure drop 1 across the duct branch 1";

  parameter Modelica.SIunits.Pressure PreAirDroBra2 = 0 "Pressure drop 1 across the duct branch 2";

  parameter Modelica.SIunits.Pressure PreAirDroBra3 = 0 "Pressure drop 1 across the duct branch 3";

  parameter Modelica.SIunits.Pressure PreAirDroBra4 = 0 "Pressure drop 1 across the duct branch 4";

  parameter Modelica.SIunits.Pressure PreAirDroBra5 = 0 "Pressure drop 1 across the duct branch 5";

  parameter Modelica.SIunits.Pressure PreWatDroMai1 = 79712*0.1 "Pressure drop 1 across the pipe";

  parameter Modelica.SIunits.Pressure PreWatDroMai2 = 79712*0.1 "Pressure drop 2 across the main pipe";

  parameter Modelica.SIunits.Pressure PreWatDroMai3 = 79712*0.1 "Pressure drop 3 across the main pipe";

  parameter Modelica.SIunits.Pressure PreWatDroMai4 = 79712*0.1 "Pressure drop 4 across the main pipe";

  parameter Modelica.SIunits.Pressure PreWatDroBra1 = 79712*0.3 "Pressure drop 1 across the pipe branch 1";

  parameter Modelica.SIunits.Pressure PreWatDroBra2 =  79712*0.2 "Pressure drop 1 across the pipe branch 2";

  parameter Modelica.SIunits.Pressure PreWatDroBra3 =  79712*0.1 "Pressure drop 1 across the pipe branch 3";

  parameter Modelica.SIunits.Pressure PreWatDroBra4 =  0 "Pressure drop 1 across the pipe branch 4";

  parameter Modelica.SIunits.Pressure PreWatDroBra5 =  0 "Pressure drop 1 across the pipe branch 5";

  parameter Modelica.SIunits.MassFlowRate mAirFloRat1[n] = {10.92*1.2*alpha,10.92*1.2*10*alpha,10.92*1.2*alpha}*3 "mass flow rate for vav 1";

  parameter Modelica.SIunits.MassFlowRate mAirFloRat2[n] = {2.25*1.2*alpha,2.25*1.2*10*alpha,2.25*1.2*alpha}*3 "mass flow rate for vav 2";

  parameter Modelica.SIunits.MassFlowRate mAirFloRat3[n] = {1.49*1.2*alpha,1.49*1.2*10*alpha,1.49*1.2*alpha}*3 "mass flow rate for vav 3";

  parameter Modelica.SIunits.MassFlowRate mAirFloRat4[n] = {1.9*1.2*alpha,1.9*1.2*10*alpha,1.9*1.2*alpha}*3 "mass flow rate for vav 4";

  parameter Modelica.SIunits.MassFlowRate mAirFloRat5[n] = {1.73*1.2*alpha,1.73*1.2*10*alpha,1.73*1.2*alpha}*3 "mass flow rate for vav 5";

  parameter Modelica.SIunits.MassFlowRate mWatFloRat1[n] = {mAirFloRat1[1]*0.3*(35-12.88)/4.2/20,mAirFloRat1[2]*0.3*(35-12.88)/4.2/20,mAirFloRat1[3]*0.3*(35-12.88)/4.2/20} "mass flow rate for vav 1";

  parameter Modelica.SIunits.MassFlowRate mWatFloRat2[n] = {mAirFloRat2[1]*0.3*(35-12.88)/4.2/20,mAirFloRat2[2]*0.3*(35-12.88)/4.2/20,mAirFloRat2[3]*0.3*(35-12.88)/4.2/20}
                                                                                                                                                                        "mass flow rate for vav 2";
  parameter Modelica.SIunits.MassFlowRate mWatFloRat3[n] = {mAirFloRat3[1]*0.3*(35-12.88)/4.2/20,mAirFloRat3[2]*0.3*(35-12.88)/4.2/20,mAirFloRat3[3]*0.3*(35-12.88)/4.2/20} "mass flow rate for vav 3";

  parameter Modelica.SIunits.MassFlowRate mWatFloRat4[n] = {mAirFloRat4[1]*0.3*(35-12.88)/4.2/20,mAirFloRat4[2]*0.3*(35-12.88)/4.2/20,mAirFloRat4[3]*0.3*(35-12.88)/4.2/20} "mass flow rate for vav 4";

  parameter Modelica.SIunits.MassFlowRate mWatFloRat5[n] = {mAirFloRat5[1]*0.3*(35-12.88)/4.2/20,mAirFloRat5[2]*0.3*(35-12.88)/4.2/20,mAirFloRat5[3]*0.3*(35-12.88)/4.2/20} "mass flow rate for vav 5";

  parameter Modelica.SIunits.Pressure PreDroAir1 = 200 "Pressure drop in the air side of vav 1";
  parameter Modelica.SIunits.Pressure PreDroWat1 = 79712/2
                                                      "Pressure drop in the water side of vav 1";
  parameter Modelica.SIunits.Efficiency eps1(max=1) = 0.8
    "Heat exchanger effectiveness of vav 1";

  parameter Modelica.SIunits.Pressure PreDroAir2 = 124
                                                      "Pressure drop in the air side of vav 2";
  parameter Modelica.SIunits.Pressure PreDroWat2 = 79712/2
                                                      "Pressure drop in the water side of vav 2";
  parameter Modelica.SIunits.Efficiency eps2(max=1) = 0.8
    "Heat exchanger effectiveness of vav 2";

  parameter Modelica.SIunits.Pressure PreDroAir3 = 124
                                                      "Pressure drop in the air side of vav 3";
  parameter Modelica.SIunits.Pressure PreDroWat3 = 79712/2 "Pressure drop in the water side of vav 3";
  parameter Modelica.SIunits.Efficiency eps3(max=1) = 0.8
    "Heat exchanger effectiveness of vav 1";

  parameter Modelica.SIunits.Pressure PreDroAir4 = 124 "Pressure drop in the air side of vav 4";
  parameter Modelica.SIunits.Pressure PreDroWat4 = 79712/2
                                                      "Pressure drop in the water side of vav 4";
  parameter Modelica.SIunits.Efficiency eps4(max=1) = 0.8
    "Heat exchanger effectiveness of vav 1";

  parameter Modelica.SIunits.Pressure PreDroAir5 = 124
                                                      "Pressure drop in the air side of vav 1";
  parameter Modelica.SIunits.Pressure PreDroWat5 = 79712/2
                                                      "Pressure drop in the water side of vav 1";
  parameter Modelica.SIunits.Efficiency eps5(max=1) = 0.8
    "Heat exchanger effectiveness of vav 1";

  BuildingControlEmulator.Systems.Floor floor1(
    fivZonVAV(vol(V=200000)),
    redeclare package MediumAir = MediumAir,
    redeclare package MediumHeaWat = MediumHeaWat,
    PreDroCoiAir=PreDroCoiAir,
    PreDroMixingBoxAir=PreDroMixingBoxAir,
    PreDroCooWat=PreDroCooWat,
    TemEcoHig=TemEcoHig,
    TemEcoLow=TemEcoLow,
    MixingBoxDamMin=MixingBoxDamMin,
    waitTime=900,
    HydEff=HydEff[1, :],
    MotEff=MotEff[1, :],
    VolFloCur=VolFloCur[1, :],
    SupPreCur=SupPreCur[1, :],
    RetPreCur=RetPreCur[1, :],
    PreAirDroMai1=PreAirDroMai1,
    PreAirDroMai2=PreAirDroMai2,
    PreAirDroMai3=PreAirDroMai3,
    PreAirDroMai4=PreAirDroMai4,
    PreAirDroBra1=PreAirDroBra1,
    PreAirDroBra2=PreAirDroBra2,
    PreAirDroBra3=PreAirDroBra3,
    PreAirDroBra4=PreAirDroBra4,
    PreAirDroBra5=PreAirDroBra5,
    PreWatDroMai1=PreWatDroMai1,
    PreWatDroMai2=PreWatDroMai2,
    PreWatDroMai3=PreWatDroMai3,
    PreWatDroMai4=PreWatDroMai4,
    PreWatDroBra1=PreWatDroBra1,
    PreWatDroBra2=PreWatDroBra2,
    PreWatDroBra3=PreWatDroBra3,
    PreWatDroBra4=PreWatDroBra4,
    PreWatDroBra5=PreWatDroBra5,
    mAirFloRat1=mAirFloRat1[1],
    mAirFloRat2=mAirFloRat2[1],
    mAirFloRat3=mAirFloRat3[1],
    mAirFloRat4=mAirFloRat4[1],
    mAirFloRat5=mAirFloRat5[1],
    mWatFloRat1=mWatFloRat1[1],
    mWatFloRat2=mWatFloRat2[1],
    mWatFloRat3=mWatFloRat3[1],
    mWatFloRat4=mWatFloRat4[1],
    mWatFloRat5=mWatFloRat5[1],
    PreDroAir1=PreDroAir1,
    PreDroWat1=PreDroWat1,
    eps1=eps1,
    PreDroAir2=PreDroAir2,
    PreDroWat2=PreDroWat2,
    eps2=eps2,
    PreDroAir3=PreDroAir3,
    PreDroWat3=PreDroWat3,
    eps3=eps3,
    PreDroAir4=PreDroAir4,
    PreDroWat4=PreDroWat4,
    eps4=eps4,
    PreDroAir5=PreDroAir5,
    PreDroWat5=PreDroWat5,
    eps5=eps5,
    duaFanAirHanUnit(
      Coi_k=0.1,
      MixingBox_k=0.1,
      MixingBox_Ti=600,
      Fan_k=0.001,
      Fan_Ti=600),
    redeclare package MediumCooWat = MediumCHW)
    annotation (Placement(transformation(extent={{-26,6},{18,40}})));

  BuildingControlEmulator.Systems.Floor floor2(
    fivZonVAV(vol(V=200000)),
    redeclare package MediumAir = MediumAir,
    redeclare package MediumHeaWat = MediumHeaWat,
    PreDroCoiAir=PreDroCoiAir,
    PreDroMixingBoxAir=PreDroMixingBoxAir,
    PreDroCooWat=PreDroCooWat,
    TemEcoHig=TemEcoHig,
    TemEcoLow=TemEcoLow,
    MixingBoxDamMin=MixingBoxDamMin,
    waitTime=900,
    HydEff=HydEff[2, :],
    MotEff=MotEff[2, :],
    VolFloCur=VolFloCur[2, :],
    SupPreCur=SupPreCur[2, :],
    RetPreCur=RetPreCur[2, :],
    PreAirDroMai1=PreAirDroMai1,
    PreAirDroMai2=PreAirDroMai2,
    PreAirDroMai3=PreAirDroMai3,
    PreAirDroMai4=PreAirDroMai4,
    PreAirDroBra1=PreAirDroBra1,
    PreAirDroBra2=PreAirDroBra2,
    PreAirDroBra3=PreAirDroBra3,
    PreAirDroBra4=PreAirDroBra4,
    PreAirDroBra5=PreAirDroBra5,
    PreWatDroMai1=PreWatDroMai1,
    PreWatDroMai2=PreWatDroMai2,
    PreWatDroMai3=PreWatDroMai3,
    PreWatDroMai4=PreWatDroMai4,
    PreWatDroBra1=PreWatDroBra1,
    PreWatDroBra2=PreWatDroBra2,
    PreWatDroBra3=PreWatDroBra3,
    PreWatDroBra4=PreWatDroBra4,
    PreWatDroBra5=PreWatDroBra5,
    mAirFloRat1=mAirFloRat1[2],
    mAirFloRat2=mAirFloRat2[2],
    mAirFloRat3=mAirFloRat3[2],
    mAirFloRat4=mAirFloRat4[2],
    mAirFloRat5=mAirFloRat5[2],
    mWatFloRat1=mWatFloRat1[2],
    mWatFloRat2=mWatFloRat2[2],
    mWatFloRat3=mWatFloRat3[2],
    mWatFloRat4=mWatFloRat4[2],
    mWatFloRat5=mWatFloRat5[2],
    PreDroAir1=PreDroAir1,
    PreDroWat1=PreDroWat1,
    eps1=eps1,
    PreDroAir2=PreDroAir2,
    PreDroWat2=PreDroWat2,
    eps2=eps2,
    PreDroAir3=PreDroAir3,
    PreDroWat3=PreDroWat3,
    eps3=eps3,
    PreDroAir4=PreDroAir4,
    PreDroWat4=PreDroWat4,
    eps4=eps4,
    PreDroAir5=PreDroAir5,
    PreDroWat5=PreDroWat5,
    eps5=eps5,
    duaFanAirHanUnit(
      Coi_k=0.1,
      MixingBox_k=0.1,
      MixingBox_Ti=600,
      Fan_k=0.001,
      Fan_Ti=600),
    redeclare package MediumCooWat = MediumCHW)
    annotation (Placement(transformation(extent={{-26,-38},{18,-4}})));

  BuildingControlEmulator.Systems.Floor floor3(
    fivZonVAV(vol(V=200000)),
    redeclare package MediumAir = MediumAir,
    redeclare package MediumHeaWat = MediumHeaWat,
    PreDroCoiAir=PreDroCoiAir,
    PreDroMixingBoxAir=PreDroMixingBoxAir,
    PreDroCooWat=PreDroCooWat,
    TemEcoHig=TemEcoHig,
    TemEcoLow=TemEcoLow,
    MixingBoxDamMin=MixingBoxDamMin,
    waitTime=900,
    HydEff=HydEff[3, :],
    MotEff=MotEff[3, :],
    VolFloCur=VolFloCur[3, :],
    SupPreCur=SupPreCur[3, :],
    RetPreCur=RetPreCur[3, :],
    PreAirDroMai1=PreAirDroMai1,
    PreAirDroMai2=PreAirDroMai2,
    PreAirDroMai3=PreAirDroMai3,
    PreAirDroMai4=PreAirDroMai4,
    PreAirDroBra1=PreAirDroBra1,
    PreAirDroBra2=PreAirDroBra2,
    PreAirDroBra3=PreAirDroBra3,
    PreAirDroBra4=PreAirDroBra4,
    PreAirDroBra5=PreAirDroBra5,
    PreWatDroMai1=PreWatDroMai1,
    PreWatDroMai2=PreWatDroMai2,
    PreWatDroMai3=PreWatDroMai3,
    PreWatDroMai4=PreWatDroMai4,
    PreWatDroBra1=PreWatDroBra1,
    PreWatDroBra2=PreWatDroBra2,
    PreWatDroBra3=PreWatDroBra3,
    PreWatDroBra4=PreWatDroBra4,
    PreWatDroBra5=PreWatDroBra5,
    mAirFloRat1=mAirFloRat1[3],
    mAirFloRat2=mAirFloRat2[3],
    mAirFloRat3=mAirFloRat3[3],
    mAirFloRat4=mAirFloRat4[3],
    mAirFloRat5=mAirFloRat5[3],
    mWatFloRat1=mWatFloRat1[3],
    mWatFloRat2=mWatFloRat2[3],
    mWatFloRat3=mWatFloRat3[3],
    mWatFloRat4=mWatFloRat4[3],
    mWatFloRat5=mWatFloRat5[3],
    PreDroAir1=PreDroAir1,
    PreDroWat1=PreDroWat1,
    eps1=eps1,
    PreDroAir2=PreDroAir2,
    PreDroWat2=PreDroWat2,
    eps2=eps2,
    PreDroAir3=PreDroAir3,
    PreDroWat3=PreDroWat3,
    eps3=eps3,
    PreDroAir4=PreDroAir4,
    PreDroWat4=PreDroWat4,
    eps4=eps4,
    PreDroAir5=PreDroAir5,
    PreDroWat5=PreDroWat5,
    eps5=eps5,
    duaFanAirHanUnit(
      Coi_k=0.1,
      MixingBox_k=0.1,
      MixingBox_Ti=600,
      Fan_k=0.001,
      Fan_Ti=600),
    redeclare package MediumCooWat = MediumCHW)
    annotation (Placement(transformation(extent={{-26,-84},{20,-48}})));




  IBPSA.Fluid.Sources.Boundary_pT   sou[n](
    nPorts=3,
    redeclare package Medium = MediumAir,
    p(displayUnit="Pa") = 100000,
    use_T_in=true)
    annotation (Placement(transformation(extent={{-94,-12},{-74,8}})));

  Modelica.Blocks.Sources.Constant const1[n](k=273.15 + 12.88)
    annotation (Placement(transformation(extent={{-100,-40},{-80,-20}})));
  Modelica.Blocks.Sources.Constant const2[n](k=400)
    annotation (Placement(transformation(extent={{-100,-80},{-80,-60}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression[n](y=true)
    annotation (Placement(transformation(extent={{-100,-106},{-80,-86}})));
  BuildingControlEmulator.Devices.AirSide.Terminal.Controls.ZonCon
                                                           zonCon[15](
    MinFlowRateSetPoi=0.3,
    HeatingFlowRateSetPoi=0.5,
    heaCon(Ti=60,
      k=0.01,
      yMin=0.01),
    cooCon(k=0.01,Ti=60),
    oveTCooSet(uExt(y=TCooSetPoi),activate(y=TCooSetPoi_activate)),
    oveTHeaSet(uExt(y=THeaSetPoi),activate(y=THeaSetPoi_activate)),
    oveAirFlowSetPoi(uExt(y=mAirFlow),activate(y=mAirFlow_activate)),
    oveyValPos(uExt(y=yPos),activate(y=yPos_activate)))
    annotation (Placement(transformation(extent={{60,-40},{80,-20}})));
  Modelica.Blocks.Interfaces.RealInput Load[15] annotation (Placement(transformation(extent={{-128,-66},{-100,-38}})));
  Modelica.Blocks.Interfaces.RealOutput TZon[15] "Temperature of the passing fluid" annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Interfaces.RealOutput TZonSen[15] "Temperature of the passing fluid" annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Interfaces.RealInput TDryBul "Entering air wet bulb temperature" annotation (Placement(transformation(extent={{-126,-12},{-100,14}})));
  Modelica.Blocks.Interfaces.RealInput TCooSetPoi[15];
  Modelica.Blocks.Interfaces.BooleanInput TCooSetPoi_activate[15];
  Modelica.Blocks.Interfaces.RealInput THeaSetPoi[15];
  Modelica.Blocks.Interfaces.BooleanInput THeaSetPoi_activate[15];
  Modelica.Blocks.Interfaces.RealInput mAirFlow[15];
  Modelica.Blocks.Interfaces.BooleanInput mAirFlow_activate[15];
  Modelica.Blocks.Interfaces.RealInput yPos[15];
  Modelica.Blocks.Interfaces.BooleanInput yPos_activate[15];

  BuildingControlEmulator.Subsystems.AirHanUnit.BaseClasses.SetPoi setPoi[15](
    n=2,
    setpoint_on={{273.15 + 22,273.15 + 20} for i in linspace(1, 15, 15)},
    setpoint_off={{273.15 + 26.7,273.15 + 15.6} for i in linspace(1, 15, 15)}) annotation (Placement(transformation(extent={{80,0},{
            60,20}})));
  Modelica.Blocks.Routing.BooleanReplicator booleanReplicator(nout=15) annotation (Placement(transformation(extent={{70,60},{90,80}})));
  Modelica.Blocks.Interfaces.RealInput Occ "Entering air wet bulb temperature"
    annotation (Placement(transformation(extent={{-126,26},{-100,52}})));
  Modelica.Blocks.Math.RealToBoolean realToBoolean
    annotation (Placement(transformation(extent={{34,30},{54,50}})));
  IBPSA.Fluid.Sources.Boundary_pT souCooWat[n](
    redeclare package Medium = MediumCHW,
    nPorts=1,
    p(displayUnit="Pa") = 100000 + PreDroCooWat,
    T=279.15) annotation (Placement(transformation(extent={{-24,70},{-44,90}})));
  IBPSA.Fluid.Sources.Boundary_pT sinCooWat[n](
    nPorts=1,
    redeclare package Medium = MediumCHW,
    p(displayUnit="Pa") = 100000,
    T=279.15) annotation (Placement(transformation(extent={{-86,70},{-66,90}})));
  IBPSA.Fluid.Sources.Boundary_pT souHeaWat[n](
    nPorts=1,
    p(displayUnit="Pa") = 100000 + PreWatDroMai1 + PreWatDroMai2 +
      PreWatDroMai3 + PreWatDroMai4 + PreWatDroBra5 + PreDroWat5,
    redeclare package Medium = MediumHeaWat,
    T=353.15) annotation (Placement(transformation(extent={{-6,70},{14,90}})));
  IBPSA.Fluid.Sources.Boundary_pT sinHeaWat[n](
    nPorts=1,
    p(displayUnit="Pa") = 100000,
    redeclare package Medium = MediumHeaWat)
    annotation (Placement(transformation(extent={{54,70},{34,90}})));
  IBPSA.Utilities.IO.SignalExchange.Overwrite oveFloor1TDisAir
    annotation (Placement(transformation(extent={{-60,-40},{-40,-20}})));
  IBPSA.Utilities.IO.SignalExchange.Overwrite oveFloor2TDisAir
    annotation (Placement(transformation(extent={{-60,-68},{-40,-48}})));
  IBPSA.Utilities.IO.SignalExchange.Overwrite oveFloor3TDisAir
    annotation (Placement(transformation(extent={{-60,-94},{-40,-74}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(T=1)
    annotation (Placement(transformation(extent={{-58,44},{-44,58}})));
equation

   connect(sou[1].T_in, TDryBul);
   connect(sinCooWat[1].ports[1], floor1.port_b_CooWat);
   connect(floor1.port_Exh_Air, sou[1].ports[1]);
   connect(floor1.port_Fre_Air, sou[1].ports[2]);
   connect(floor1.port_a_CooWat, souCooWat[1].ports[1]);
   connect(floor1.port_a_HeaWat, souHeaWat[1].ports[1]);
   connect(floor1.port_b_HeaWat, sinHeaWat[1].ports[1]);

   connect(const2[1].y, floor1.PreSetPoi);
    connect(oveFloor1TDisAir.y, floor1.DisTemPSetPoi);
   connect(realToBoolean.y, floor1.OnFan);
    connect(floor1.OnZon, booleanExpression[1].y);
   for j in 1:5 loop
      connect(floor1.TZonSen[j], zonCon[(1 - 1)*5 + j].T);
    connect(zonCon[(1-1)*5+j].yAirFlowSetPoi, floor1.AirFlowRatSetPoi[j]);
    connect(zonCon[(1-1)*5+j].yValPos, floor1.yVal[j]);
    connect(Load[(1-1)*5+j], floor1.Q_flow[j]);
    connect(floor1.TZon[j], TZon[(1-1)*5+j]);
    connect(floor1.TZonSen[j], TZonSen[(1-1)*5+j]);
    connect(setPoi[(1-1)*5+j].SetPoi[1], zonCon[(1-1)*5+j].TCooSetPoi);
    connect(setPoi[(1-1)*5+j].SetPoi[2], zonCon[(1-1)*5+j].THeaSetPoi);
    connect(setPoi[(1-1)*5+j].SetPoi[1], floor1.ZonCooTempSetPoi[j]);
    connect(setPoi[(1-1)*5+j].SetPoi[2], floor1.ZonHeaTempSetPoi[j]);
   end for;


   connect(sou[2].T_in, TDryBul);
   connect(sinCooWat[2].ports[1], floor2.port_b_CooWat);
   connect(floor2.port_Exh_Air, sou[2].ports[1]);
   connect(floor2.port_Fre_Air, sou[2].ports[2]);
   connect(floor2.port_a_CooWat, souCooWat[2].ports[1]);
   connect(floor2.port_a_HeaWat, souHeaWat[2].ports[1]);
   connect(floor2.port_b_HeaWat, sinHeaWat[2].ports[1]);

   connect(const2[2].y, floor2.PreSetPoi);
    connect(oveFloor2TDisAir.y, floor2.DisTemPSetPoi);
   connect(realToBoolean.y, floor2.OnFan);
    connect(floor2.OnZon, booleanExpression[2].y);
   for j in 1:5 loop
      connect(floor2.TZonSen[j], zonCon[(2 - 1)*5 + j].T);
    connect(zonCon[(2-1)*5+j].yAirFlowSetPoi, floor2.AirFlowRatSetPoi[j]);
    connect(zonCon[(2-1)*5+j].yValPos, floor2.yVal[j]);
    connect(Load[(2-1)*5+j], floor2.Q_flow[j]);
    connect(floor2.TZon[j], TZon[(2-1)*5+j]);
    connect(floor2.TZonSen[j], TZonSen[(2-1)*5+j]);	
    connect(setPoi[(2-1)*5+j].SetPoi[1], zonCon[(2-1)*5+j].TCooSetPoi);
    connect(setPoi[(2-1)*5+j].SetPoi[2], zonCon[(2-1)*5+j].THeaSetPoi);
    connect(setPoi[(2-1)*5+j].SetPoi[1], floor2.ZonCooTempSetPoi[j]);
    connect(setPoi[(2-1)*5+j].SetPoi[2], floor2.ZonHeaTempSetPoi[j]);
   end for;

   connect(sou[3].T_in, TDryBul);
   connect(sinCooWat[3].ports[1], floor3.port_b_CooWat);
   connect(floor3.port_Exh_Air, sou[3].ports[1]);
   connect(floor3.port_Fre_Air, sou[3].ports[2]);
   connect(floor3.port_a_CooWat, souCooWat[3].ports[1]);
   connect(floor3.port_a_HeaWat, souHeaWat[3].ports[1]);
   connect(floor3.port_b_HeaWat, sinHeaWat[3].ports[1]);

   connect(const2[3].y, floor3.PreSetPoi);
    connect(oveFloor3TDisAir.y, floor3.DisTemPSetPoi);
   connect(realToBoolean.y, floor3.OnFan);
    connect(floor3.OnZon, booleanExpression[3].y);
   for j in 1:5 loop
      connect(floor3.TZonSen[j], zonCon[(3 - 1)*5 + j].T);
    connect(zonCon[(3-1)*5+j].yAirFlowSetPoi, floor3.AirFlowRatSetPoi[j]);
    connect(zonCon[(3-1)*5+j].yValPos, floor3.yVal[j]);
    connect(Load[(3-1)*5+j], floor3.Q_flow[j]);
    connect(floor3.TZon[j], TZon[(3-1)*5+j]);
    connect(floor3.TZonSen[j], TZonSen[(3-1)*5+j]);
    connect(setPoi[(3-1)*5+j].SetPoi[1], zonCon[(3-1)*5+j].TCooSetPoi);
    connect(setPoi[(3-1)*5+j].SetPoi[2], zonCon[(3-1)*5+j].THeaSetPoi);
    connect(setPoi[(3-1)*5+j].SetPoi[1], floor3.ZonCooTempSetPoi[j]);
    connect(setPoi[(3-1)*5+j].SetPoi[2], floor3.ZonHeaTempSetPoi[j]);
   end for;


  connect(booleanReplicator.y, setPoi.Occ) annotation (Line(points={{91,70},{96,
          70},{96,10},{82,10}},                                                                       color={255,0,255}));

  connect(realToBoolean.y, booleanReplicator.u)
    annotation (Line(points={{55,40},{62,40},{62,70},{68,70}},
                                               color={255,0,255}));
  connect(floor1.TOut, TDryBul);
  connect(floor2.TOut, TDryBul);
  connect(floor3.TOut, TDryBul);
  connect(const1[1].y, oveFloor1TDisAir.u) annotation (Line(
      points={{-79,-30},{-62,-30}},
      color={0,0,127},
      pattern=LinePattern.Dash));
  connect(const1[2].y, oveFloor2TDisAir.u) annotation (Line(
      points={{-79,-30},{-70,-30},{-70,-58},{-62,-58}},
      color={0,0,127},
      pattern=LinePattern.Dash));
  connect(const1[3].y, oveFloor3TDisAir.u) annotation (Line(
      points={{-79,-30},{-70,-30},{-70,-84},{-62,-84}},
      color={0,0,127},
      pattern=LinePattern.Dash));
  connect(firstOrder.y, realToBoolean.u) annotation (Line(points={{-43.3,51},{
          18,51},{18,40},{32,40}}, color={0,0,127},
      pattern=LinePattern.Dash));
  connect(firstOrder.u, Occ) annotation (Line(points={{-59.4,51},{-80,51},{-80,
          39},{-113,39}}, color={0,0,127},
      pattern=LinePattern.Dash));
   annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid)}),                       Diagram(coordinateSystem(
          preserveAspectRatio=false)),
    experiment(
      StartTime=17280000,
      StopTime=17452800,
      __Dymola_NumberOfIntervals=2880,
      __Dymola_Algorithm="Dassl"));
end AHU;
