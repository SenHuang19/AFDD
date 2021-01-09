within AFDD.Examples;
model ChillerPlant_fmu
  import BuildingControlEmulator;
  extends Modelica.Icons.Example;

  parameter
    Buildings.Fluid.Chillers.Data.ElectricEIR.ElectricEIRChiller_Trane_CVHE_1442kW_6_61COP_VSD
    datChi[3] annotation (Placement(transformation(extent={{18,60},{38,80}})));

  BuildingControlEmulator.Applications.AFDD.ChillerPlant     chillerPlant(datChi=datChi,
    n=3,
    thrhol={0.9,0.9})
    annotation (Placement(transformation(extent={{-10,-8},{10,12}})));
  Modelica.Blocks.Sources.RealExpression TCWSet(y=TWetBul + chillerPlant.chillerPlant.dTApp)
    annotation (Placement(transformation(extent={{-100,-30},{-80,-10}})));
  Modelica.Blocks.Discrete.Sampler TCWSetsampler(samplePeriod=3600)
    annotation (Placement(transformation(extent={{-54,-24},{-46,-16}})));
  Modelica.Blocks.Nonlinear.Limiter TCWSetlimiter(uMax=chillerPlant.chillerPlant.TCW_nominal,
      uMin=273.15 + 15.56)
    annotation (Placement(transformation(extent={{-72,-26},{-60,-14}})));
  Modelica.Blocks.Sources.RealExpression TCHWSet(y=285.372 - (TDryBul - 288.706)
        /(299.817 - 288.706)*(285.372 - 279.817))
    annotation (Placement(transformation(extent={{-100,2},{-80,22}})));
  Modelica.Blocks.Discrete.Sampler TCHWSetsampler(samplePeriod=3600)
    annotation (Placement(transformation(extent={{-54,8},{-46,16}})));
  Modelica.Blocks.Nonlinear.Limiter TCHWSetlimiter(uMax=285.372, uMin=279.817)
    annotation (Placement(transformation(extent={{-72,6},{-60,18}})));
  Modelica.Blocks.Interfaces.RealOutput T
    "Temperature of the supply chilled water"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Interfaces.RealInput TWetBul
    "Entering air wet bulb temperature"
    annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));
  Modelica.Blocks.Interfaces.RealInput Loa "Cooling load"
    annotation (Placement(transformation(extent={{-140,20},{-100,60}})));
  Modelica.Blocks.Interfaces.RealInput TDryBul
    "Entering air wet bulb temperature"
    annotation (Placement(transformation(extent={{-140,60},{-100,100}})));
equation
  connect(TCWSet.y, TCWSetlimiter.u) annotation (Line(
      points={{-79,-20},{-73.2,-20}},
      color={0,0,127},
      pattern=LinePattern.Dash));
  connect(TCWSetlimiter.y, TCWSetsampler.u) annotation (Line(
      points={{-59.4,-20},{-54.8,-20}},
      color={0,0,127},
      pattern=LinePattern.Dash));
  connect(TCWSetsampler.y, chillerPlant.TCWSet) annotation (Line(
      points={{-45.6,-20},{-24,-20},{-24,-2},{-11.2,-2}},
      color={0,0,127},
      pattern=LinePattern.Dash));
  connect(TCHWSet.y, TCHWSetlimiter.u) annotation (Line(
      points={{-79,12},{-76,12},{-74,12},{-73.2,12}},
      color={0,0,127},
      pattern=LinePattern.Dash));
  connect(TCHWSetlimiter.y, TCHWSetsampler.u) annotation (Line(
      points={{-59.4,12},{-56,12},{-54.8,12}},
      color={0,0,127},
      pattern=LinePattern.Dash));
  connect(TCHWSetsampler.y, chillerPlant.TCHWSet) annotation (Line(
      points={{-45.6,12},{-20,12},{-20,4},{-11.2,4}},
      color={0,0,127},
      pattern=LinePattern.Dash));
  connect(chillerPlant.T, T)
    annotation (Line(points={{11,2},{60,2},{60,0},{110,0}},
                                              color={0,0,127}));
  connect(chillerPlant.TWetBul, TWetBul) annotation (Line(
      points={{-11.2,-6},{-20,-6},{-20,-60},{-120,-60}},
      color={0,0,127},
      pattern=LinePattern.Dash));
  connect(chillerPlant.Loa, Loa) annotation (Line(
      points={{-11.1,8.1},{-16,8.1},{-16,40},{-120,40}},
      color={0,0,127},
      pattern=LinePattern.Dash));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StartTime=1.69344e+007,
      StopTime=1.70208e+007,
      __Dymola_NumberOfIntervals=1440));
end ChillerPlant_fmu;
