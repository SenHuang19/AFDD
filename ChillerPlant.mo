within AFDD;
model ChillerPlant
  package MediumCHW = IBPSA.Media.Water
    "Medium model";

  package MediumCW = IBPSA.Media.Water
    "Medium model";
  parameter Integer n=3
    "Number of chillers";
  parameter Integer m=2
    "Number of secondary pumps";
  parameter Modelica.SIunits.Pressure dP_nominal=478250
    "Nominal pressure drop for the secondary chilled water pump ";
  parameter Real thrhol[n-1]
    "Threshold for chiller staging";
  parameter Modelica.SIunits.MassFlowRate mCHW_flow_nominal[:] = {-datChi[integer(i)].QEva_flow_nominal/4200/5.56 for i in linspace(1, n, n)}
    "Nominal mass flow rate at chilled water side";
  parameter Modelica.SIunits.MassFlowRate mCW_flow_nominal[:] = {mCHW_flow_nominal[integer(i)]*(datChi[integer(i)].COP_nominal+1)/datChi[integer(i)].COP_nominal for i in linspace(1, n, n)}
    "Nominal mass flow rate at condenser water wide";
  replaceable parameter Buildings.Fluid.Chillers.Data.ElectricEIR.ElectricEIRChiller_Trane_CVHE_1442kW_6_61COP_VSD datChi[n]
    annotation (Placement(transformation(extent={{20,64},{40,84}})));
  BuildingControlEmulator.Systems.ChillerPlant chillerPlant(
    datChi=datChi,
    redeclare package MediumCHW = MediumCHW,
    redeclare package MediumCW = MediumCW,
    Cap={-datChi[integer(i)].QEva_flow_nominal for i in linspace(
        1,
        n,
        n)},
    mCHW_flow_nominal=mCHW_flow_nominal,
    mCW_flow_nominal=mCW_flow_nominal,
    secPumCon(conPI(k=0.0001)),
    thrhol=thrhol,
    TCW_nominal=273.15 + 29.44)
    annotation (Placement(transformation(extent={{-14,-10},{6,10}})));
  BuildingControlEmulator.Devices.WaterSide.Building bui(
    redeclare package Medium = MediumCHW,
    TBuiSetPoi(displayUnit="K") = 285.372,
    dP_nominal=dP_nominal*0.5,
    GaiPi=0.1,
    tIntPi=60,
    m_flow_nominal=sum(mCHW_flow_nominal))
    annotation (Placement(transformation(extent={{60,16},{40,36}})));
  Modelica.Blocks.Interfaces.RealInput TWetBul
    "Entering air wet bulb temperature"
    annotation (Placement(transformation(extent={{-124,-92},{-100,-68}})));
  Modelica.Blocks.Interfaces.RealOutput T
    "Temperature of the supply chilled water"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Interfaces.RealInput Loa "Cooling load"
    annotation (Placement(transformation(extent={{-122,50},{-100,72}})));
  Modelica.Blocks.Interfaces.RealInput TCWSet
    "Temperature set point of the condenser water"
    annotation (Placement(transformation(extent={{-124,-52},{-100,-28}})));
  Modelica.Blocks.Interfaces.RealInput TCHWSet
    "Temperature set point of the condenser water"
    annotation (Placement(transformation(extent={{-124,8},{-100,32}})));
equation
  connect(chillerPlant.port_a,bui. port_b) annotation (Line(
      points={{10,12},{10,26},{40,26}},
      color={0,127,255},
      thickness=1));
  connect(bui.port_a,chillerPlant. port_b) annotation (Line(
      points={{60,26},{78,26},{78,-40},{10,-40},{10,-14.2}},
      color={0,127,255},
      thickness=1));
  connect(bui.dP,chillerPlant. dP) annotation (Line(
      points={{39,32},{22,32},{22,40},{-52,40},{-52,10},{-33.8,10}},
      color={0,0,127},
      pattern=LinePattern.Dash));
  connect(chillerPlant.TWetBul, TWetBul) annotation (Line(
      points={{-33.6,-12},{-60,-12},{-60,-80},{-112,-80}},
      color={0,0,127},
      pattern=LinePattern.Dash));
  connect(chillerPlant.T, T) annotation (Line(
      points={{21.2,-0.2},{30,-0.2},{30,-80},{92,-80},{92,0},{110,0}},
      color={0,0,127},
      pattern=LinePattern.Dash));
  connect(bui.Loa, Loa) annotation (Line(
      points={{60.9,30},{74,30},{74,61},{-111,61}},
      color={0,0,127},
      pattern=LinePattern.Dash));
  connect(chillerPlant.TCWSet, TCWSet) annotation (Line(
      points={{-33.6,-6.2},{-80,-6.2},{-80,-40},{-112,-40}},
      color={0,0,127},
      pattern=LinePattern.Dash));
  connect(chillerPlant.TCHWSet, TCHWSet) annotation (Line(
      points={{-33.6,0},{-80,0},{-80,20},{-112,20}},
      color={0,0,127},
      pattern=LinePattern.Dash));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid), Text(
          extent={{-54,38},{60,-48}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="ChillerPlant")}),                          Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end ChillerPlant;
