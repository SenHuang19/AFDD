within AFDD.Examples;
model AHU
  import BuildingControlEmulator;
  extends Modelica.Icons.Example;

  AFDD.AHU aHU
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  CoSim.LarOffWrapper larOffWrapper(StaTim=100*86400, EndTim=101*86400)
    annotation (Placement(transformation(extent={{10,-50},{-10,-30}})));
equation
  connect(aHU.TZon, larOffWrapper.Temp) annotation (Line(points={{11,0},{40,0},{
          40,-40},{12,-40}}, color={0,0,127}));
  connect(larOffWrapper.Occ, aHU.Occ) annotation (Line(points={{0,-29},{0,-20},{
          -20,-20},{-20,3.9},{-11.3,3.9}}, color={0,0,127}));
  connect(larOffWrapper.Drybulb, aHU.TDryBul) annotation (Line(points={{-11,-48},
          {-28,-48},{-28,0.1},{-11.3,0.1}}, color={0,0,127}));
  connect(larOffWrapper.Loa, aHU.Load) annotation (Line(points={{-11,-40.2},{-24,
          -40.2},{-24,-5.2},{-11.4,-5.2}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StartTime=8640000,
      StopTime=8726400,
      __Dymola_NumberOfIntervals=1440,
      __Dymola_Algorithm="Dassl"));
end AHU;
