within AFDD.Examples;
model BoilerPlant
  import BuildingControlEmulator;
  extends Modelica.Icons.Example;
  package MediumHW = IBPSA.Media.Water
    "Medium model";
  parameter Modelica.SIunits.Pressure dP_nominal=478250
    "Nominal pressure drop for the secondary chilled water pump ";

  parameter Modelica.SIunits.MassFlowRate mHW_flow_nominal[:] = {2762738.20/2/20/4200 for i in linspace(1,2,2)}
    "Nominal mass flow rate at the chilled water side";
  Modelica.Blocks.Sources.Constant On(k=1)
    annotation (Placement(transformation(extent={{-260,80},{-240,100}})));
  CoSim.HeaLoa                         heaLoa(tsta=0*86400, tend=365*86400)
    annotation (Placement(transformation(extent={{10,-58},{-10,-38}})));
  AFDD.BoilerPlant                                      boilerPlant
    annotation (Placement(transformation(extent={{-14,0},{6,20}})));
equation
  connect(heaLoa.HW_temp, boilerPlant.THWLea) annotation (Line(
      points={{12,-48},{36,-48},{36,10},{7,10}},
      color={0,0,127},
      pattern=LinePattern.Dash));
  connect(heaLoa.Loa, boilerPlant.Loa) annotation (Line(
      points={{-11,-48},{-40,-48},{-40,10},{-15.2,10}},
      color={0,0,127},
      pattern=LinePattern.Dash));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=31536000,
      __Dymola_NumberOfIntervals=1440,
      __Dymola_Algorithm="Dassl"));
end BoilerPlant;
