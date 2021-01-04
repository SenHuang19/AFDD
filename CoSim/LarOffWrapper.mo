within AFDD.CoSim;
model LarOffWrapper
  parameter Real StaTim "start time";
  parameter Real EndTim "end time";
  wholebuilding_fmu wholebuilding_fmu1(
    fmi_StartTime=StaTim,
    fmi_StopTime=EndTim,
    fmi_NumberOfSteps=(EndTim - StaTim)/60)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealInput Temp[15] "temperature vector"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealOutput Wetbulb "wet bulb temperature"
    annotation (Placement(transformation(extent={{100,70},{120,90}})));
  Modelica.Blocks.Interfaces.RealOutput Drybulb "wet bulb temperature"
    annotation (Placement(transformation(extent={{100,-90},{120,-70}})));
  Modelica.Blocks.Interfaces.RealOutput RelHum "relative humidity"
    annotation (Placement(transformation(extent={{100,-50},{120,-30}})));
  Modelica.Blocks.Interfaces.RealOutput NumOcc[15] "number of occupant"
    annotation (Placement(transformation(extent={{100,30},{120,50}})));
  Modelica.Blocks.Interfaces.RealOutput Loa[15] "total load"
    annotation (Placement(transformation(extent={{100,-12},{120,8}})));
  Modelica.Blocks.Math.Add3 add[15](k3=-1)
    annotation (Placement(transformation(extent={{58,20},{78,40}})));
  Buildings.Utilities.IO.BCVTB.To_degC froDegC[15]
    annotation (Placement(transformation(extent={{-72,-10},{-52,10}})));
  Buildings.Utilities.IO.BCVTB.From_degC fromDegC
    annotation (Placement(transformation(extent={{60,70},{80,90}})));
  Buildings.Utilities.IO.BCVTB.From_degC fromDegC1
    annotation (Placement(transformation(extent={{62,-90},{82,-70}})));
  Modelica.Blocks.Interfaces.RealOutput Occ "relative humidity" annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={0,110})));
equation
  connect(wholebuilding_fmu1.Outdoor_Humidity, RelHum) annotation (Line(points={{10,0},{
          10,0},{60,0},{60,-40},{110,-40}},         color={0,0,127},
      pattern=LinePattern.Dash));
  connect(froDegC[1].Celsius, wholebuilding_fmu1.Temp1_bot);
  connect(froDegC[2].Celsius, wholebuilding_fmu1.Temp2_bot);
  connect(froDegC[3].Celsius, wholebuilding_fmu1.Temp3_bot);
  connect(froDegC[4].Celsius, wholebuilding_fmu1.Temp4_bot);
  connect(froDegC[5].Celsius, wholebuilding_fmu1.Temp5_bot);
  connect(froDegC[6].Celsius, wholebuilding_fmu1.Temp1);
  connect(froDegC[7].Celsius, wholebuilding_fmu1.Temp2);
  connect(froDegC[8].Celsius, wholebuilding_fmu1.Temp3);
  connect(froDegC[9].Celsius, wholebuilding_fmu1.Temp4);
  connect(froDegC[10].Celsius, wholebuilding_fmu1.Temp5);
  connect(froDegC[11].Celsius, wholebuilding_fmu1.Temp1_top);
  connect(froDegC[12].Celsius, wholebuilding_fmu1.Temp2_top);
  connect(froDegC[13].Celsius, wholebuilding_fmu1.Temp3_top);
  connect(froDegC[14].Celsius, wholebuilding_fmu1.Temp4_top);
  connect(froDegC[15].Celsius, wholebuilding_fmu1.Temp5_top);
  connect(NumOcc[1], wholebuilding_fmu1.Zone1_bot_People);
  connect(NumOcc[2], wholebuilding_fmu1.Zone2_bot_People);
  connect(NumOcc[3], wholebuilding_fmu1.Zone3_bot_People);
  connect(NumOcc[4], wholebuilding_fmu1.Zone4_bot_People);
  connect(NumOcc[5], wholebuilding_fmu1.Zone5_bot_People);
  connect(NumOcc[6], wholebuilding_fmu1.Zone1_People);
  connect(NumOcc[7], wholebuilding_fmu1.Zone2_People);
  connect(NumOcc[8], wholebuilding_fmu1.Zone3_People);
  connect(NumOcc[9], wholebuilding_fmu1.Zone4_People);
  connect(NumOcc[10], wholebuilding_fmu1.Zone5_People);
  connect(NumOcc[11], wholebuilding_fmu1.Zone1_top_People);
  connect(NumOcc[12], wholebuilding_fmu1.Zone2_top_People);
  connect(NumOcc[13], wholebuilding_fmu1.Zone3_top_People);
  connect(NumOcc[14], wholebuilding_fmu1.Zone4_top_People);
  connect(NumOcc[15], wholebuilding_fmu1.Zone5_top_People);

  connect(add.y, Loa) annotation (Line(
      points={{79,30},{90,30},{90,-2},{110,-2}},
      color={0,0,127},
      pattern=LinePattern.Dash));
  connect(add[1].u1, wholebuilding_fmu1.Zone1_bot_Sensible_COOLING_LOAD);
  connect(add[1].u2, wholebuilding_fmu1.Zone1_bot_Latent_COOLING_LOAD);
  connect(add[1].u3, wholebuilding_fmu1.Zone1_bot_HEATING_LOAD);
  connect(add[2].u1, wholebuilding_fmu1.Zone2_bot_Sensible_COOLING_LOAD);
  connect(add[2].u2, wholebuilding_fmu1.Zone2_bot_Latent_COOLING_LOAD);
  connect(add[2].u3, wholebuilding_fmu1.Zone2_bot_HEATING_LOAD);
  connect(add[3].u1, wholebuilding_fmu1.Zone3_bot_Sensible_COOLING_LOAD);
  connect(add[3].u2, wholebuilding_fmu1.Zone3_bot_Latent_COOLING_LOAD);
  connect(add[3].u3, wholebuilding_fmu1.Zone3_bot_HEATING_LOAD);
  connect(add[4].u1, wholebuilding_fmu1.Zone4_bot_Sensible_COOLING_LOAD);
  connect(add[4].u2, wholebuilding_fmu1.Zone4_bot_Latent_COOLING_LOAD);
  connect(add[4].u3, wholebuilding_fmu1.Zone4_bot_HEATING_LOAD);
  connect(add[5].u1, wholebuilding_fmu1.Zone5_bot_Sensible_COOLING_LOAD);
  connect(add[5].u2, wholebuilding_fmu1.Zone5_bot_Latent_COOLING_LOAD);
  connect(add[5].u3, wholebuilding_fmu1.Zone5_bot_HEATING_LOAD);

  connect(add[6].u1, wholebuilding_fmu1.Zone1_Sensible_COOLING_LOAD);
  connect(add[6].u2, wholebuilding_fmu1.Zone1_Latent_COOLING_LOAD);
  connect(add[6].u3, wholebuilding_fmu1.Zone1_HEATING_LOAD);
  connect(add[7].u1, wholebuilding_fmu1.Zone2_Sensible_COOLING_LOAD);
  connect(add[7].u2, wholebuilding_fmu1.Zone2_Latent_COOLING_LOAD);
  connect(add[7].u3, wholebuilding_fmu1.Zone2_HEATING_LOAD);
  connect(add[8].u1, wholebuilding_fmu1.Zone3_Sensible_COOLING_LOAD);
  connect(add[8].u2, wholebuilding_fmu1.Zone3_Latent_COOLING_LOAD);
  connect(add[8].u3, wholebuilding_fmu1.Zone3_HEATING_LOAD);
  connect(add[9].u1, wholebuilding_fmu1.Zone4_Sensible_COOLING_LOAD);
  connect(add[9].u2, wholebuilding_fmu1.Zone4_Latent_COOLING_LOAD);
  connect(add[9].u3, wholebuilding_fmu1.Zone4_HEATING_LOAD);
  connect(add[10].u1, wholebuilding_fmu1.Zone5_Sensible_COOLING_LOAD);
  connect(add[10].u2, wholebuilding_fmu1.Zone5_Latent_COOLING_LOAD);
  connect(add[10].u3, wholebuilding_fmu1.Zone5_HEATING_LOAD);

  connect(add[11].u1, wholebuilding_fmu1.Zone1_top_Sensible_COOLING_LOAD);
  connect(add[11].u2, wholebuilding_fmu1.Zone1_top_Latent_COOLING_LOAD);
  connect(add[11].u3, wholebuilding_fmu1.Zone1_top_HEATING_LOAD);
  connect(add[12].u1, wholebuilding_fmu1.Zone2_top_Sensible_COOLING_LOAD);
  connect(add[12].u2, wholebuilding_fmu1.Zone2_top_Latent_COOLING_LOAD);
  connect(add[12].u3, wholebuilding_fmu1.Zone2_top_HEATING_LOAD);
  connect(add[13].u1, wholebuilding_fmu1.Zone3_top_Sensible_COOLING_LOAD);
  connect(add[13].u2, wholebuilding_fmu1.Zone3_top_Latent_COOLING_LOAD);
  connect(add[13].u3, wholebuilding_fmu1.Zone3_top_HEATING_LOAD);
  connect(add[14].u1, wholebuilding_fmu1.Zone4_top_Sensible_COOLING_LOAD);
  connect(add[14].u2, wholebuilding_fmu1.Zone4_top_Latent_COOLING_LOAD);
  connect(add[14].u3, wholebuilding_fmu1.Zone4_top_HEATING_LOAD);
  connect(add[15].u1, wholebuilding_fmu1.Zone5_top_Sensible_COOLING_LOAD);
  connect(add[15].u2, wholebuilding_fmu1.Zone5_top_Latent_COOLING_LOAD);
  connect(add[15].u3, wholebuilding_fmu1.Zone5_top_HEATING_LOAD);

  connect(froDegC.Kelvin, Temp)
    annotation (Line(points={{-74,0},{-120,0}},          color={0,0,127}));
  connect(wholebuilding_fmu1.Wetbulb, fromDegC.Celsius) annotation (Line(points=
         {{10,0},{40,0},{40,80},{58,79.6}}, color={0,0,127}));
  connect(fromDegC.Kelvin, Wetbulb) annotation (Line(points={{81,79.8},{95.5,
          79.8},{95.5,80},{110,80}}, color={0,0,127}));
  connect(wholebuilding_fmu1.Outdoor_Temperature, fromDegC1.Celsius)
    annotation (Line(points={{10,0},{40,0},{40,-80},{60,-80.4}}, color={0,0,127}));
  connect(fromDegC1.Kelvin, Drybulb) annotation (Line(points={{83,-80.2},{96.5,
          -80.2},{96.5,-80},{110,-80}}, color={0,0,127}));

  connect(wholebuilding_fmu1.Occ, Occ) annotation (Line(points={{10,0},{20,0},{20,
          60},{0,60},{0,110}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid), Text(
          extent={{-66,50},{62,-48}},
          lineColor={0,127,255},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="EPlus")}),                                 Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end LarOffWrapper;
