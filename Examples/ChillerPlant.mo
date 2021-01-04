within AFDD.Examples;
model ChillerPlant
  import BuildingControlEmulator;
  extends Modelica.Icons.Example;

  parameter
    Buildings.Fluid.Chillers.Data.ElectricEIR.ElectricEIRChiller_Trane_CVHE_1442kW_6_61COP_VSD
    datChi[3] annotation (Placement(transformation(extent={{18,60},{38,80}})));

  AFDD.ChillerPlant     chillerPlant(datChi=datChi,
    n=3,
    thrhol={0.9,0.9})
    annotation (Placement(transformation(extent={{-8,-10},{12,10}})));
  AFDD.CoSim.CooLoa cooLoa(tsta=196*86400, tend=197*86400)
                                              annotation (Placement(transformation(extent={{10,-50},{-10,-30}})));
  Modelica.Blocks.Sources.RealExpression TCWSet(y=cooLoa.TOutWetBul +
        chillerPlant.chillerPlant.dTApp)
    annotation (Placement(transformation(extent={{-100,-30},{-80,-10}})));
  Modelica.Blocks.Discrete.Sampler TCWSetsampler(samplePeriod=3600)
    annotation (Placement(transformation(extent={{-54,-24},{-46,-16}})));
  Modelica.Blocks.Nonlinear.Limiter TCWSetlimiter(uMax=chillerPlant.chillerPlant.TCW_nominal,
      uMin=273.15 + 15.56)
    annotation (Placement(transformation(extent={{-72,-26},{-60,-14}})));
  Modelica.Blocks.Sources.RealExpression TCHWSet(y=285.372 - (cooLoa.TOutDryBul -
        288.706)/(299.817 - 288.706)*(285.372 - 279.817))
    annotation (Placement(transformation(extent={{-100,2},{-80,22}})));
  Modelica.Blocks.Discrete.Sampler TCHWSetsampler(samplePeriod=3600)
    annotation (Placement(transformation(extent={{-54,8},{-46,16}})));
  Modelica.Blocks.Nonlinear.Limiter TCHWSetlimiter(uMax=285.372, uMin=279.817)
    annotation (Placement(transformation(extent={{-72,6},{-60,18}})));
equation
  connect(cooLoa.CHW_temp, chillerPlant.T)
    annotation (Line(
      points={{12,-40},{40,-40},{40,0},{13,0}},
      color={0,0,127},
      pattern=LinePattern.Dash));
  connect(cooLoa.Loa, chillerPlant.Loa) annotation (Line(
      points={{-11,-40},{-30,-40},{-30,6.1},{-9.1,6.1}},
      color={0,0,127},
      pattern=LinePattern.Dash));
  connect(cooLoa.TOutWetBul, chillerPlant.TWetBul) annotation (Line(
      points={{-11,-44},{-20,-44},{-20,-8},{-9.2,-8}},
      color={0,0,127},
      pattern=LinePattern.Dash));
  connect(TCWSet.y, TCWSetlimiter.u) annotation (Line(
      points={{-79,-20},{-73.2,-20}},
      color={0,0,127},
      pattern=LinePattern.Dash));
  connect(TCWSetlimiter.y, TCWSetsampler.u) annotation (Line(
      points={{-59.4,-20},{-54.8,-20}},
      color={0,0,127},
      pattern=LinePattern.Dash));
  connect(TCWSetsampler.y, chillerPlant.TCWSet) annotation (Line(
      points={{-45.6,-20},{-24,-20},{-24,-4},{-9.2,-4}},
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
      points={{-45.6,12},{-20,12},{-20,2},{-9.2,2}},
      color={0,0,127},
      pattern=LinePattern.Dash));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StartTime=16934400,
      StopTime=17020800,
      __Dymola_NumberOfIntervals=1440,
      __Dymola_Algorithm="Dassl"));
end ChillerPlant;
