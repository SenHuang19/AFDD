within AFDD;
model BoilerPlant
  package MediumHW = IBPSA.Media.Water
    "Medium model";

  parameter Modelica.SIunits.Pressure dP_nominal=478250
    "Nominal pressure drop for the secondary chilled water pump ";

  parameter Modelica.SIunits.MassFlowRate mHW_flow_nominal[:] = {2762738.20/2/20/4200 for i in linspace(1,2,2)}
    "Nominal mass flow rate at the chilled water side";

  parameter Integer n=2
    "Number of boilers";
  parameter Integer m=2
    "Number of secondary pumps";
  BuildingControlEmulator.Systems.BoilerPlant boilerPlant(
    redeclare package MediumHW = MediumHW,
    n=n,
    m=m) annotation (Placement(transformation(extent={{-36,-8},{-18,10}})));
  BuildingControlEmulator.Devices.WaterSide.Building bui(
    tIntPi=60,
    m_flow_nominal=sum(mHW_flow_nominal),
    redeclare package Medium = MediumHW,
    TBuiSetPoi=273.15 + 60,
    dP_nominal=dP_nominal*0.25,
    GaiPi=0.1,
    conPI(reverseActing=true))
               annotation (Placement(transformation(extent={{44,30},{24,50}})));
  Modelica.Blocks.Interfaces.RealInput Loa "Cooling load"
    annotation (Placement(transformation(extent={{-124,-12},{-100,12}})));
  Modelica.Blocks.Interfaces.RealOutput THWLea "Temperature of the passing fluid"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
equation
  connect(boilerPlant.port_a, bui.port_b) annotation (Line(
      points={{-14.22,11.8},{-14.22,40},{24,40}},
      color={0,127,255},
      thickness=1));
  connect(bui.port_a, boilerPlant.port_b) annotation (Line(
      points={{44,40},{50,40},{50,-40},{-14.4,-40},{-14.4,-11.6}},
      color={0,127,255},
      thickness=1));
  connect(bui.dP, boilerPlant.dP) annotation (Line(
      points={{23,46},{0,46},{0,54},{-72,54},{-72,1},{-54,1}},
      color={0,0,127},
      pattern=LinePattern.Dash));
  connect(bui.Loa, Loa) annotation (Line(
      points={{44.9,44},{80,44},{80,-80},{-90,-80},{-90,0},{-112,0}},
      color={0,0,127},
      pattern=LinePattern.Dash));
  connect(boilerPlant.THWLea, THWLea) annotation (Line(
      points={{-4.5,1.18},{4,1.18},{4,-60},{92,-60},{92,0},{110,0}},
      color={0,0,127},
      pattern=LinePattern.Dash));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={Rectangle(
          extent={{-100,100},{100,-98}},
          lineColor={0,0,255},
          lineThickness=1,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid), Text(
          extent={{-54,38},{60,-48}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="BoilerPlant")}),                           Diagram(coordinateSystem(
          preserveAspectRatio=false)));
end BoilerPlant;
