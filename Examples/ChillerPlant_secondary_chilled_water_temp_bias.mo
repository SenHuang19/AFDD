within AFDD.Examples;
model ChillerPlant_secondary_chilled_water_temp_bias
  import BuildingControlEmulator;
  extends Modelica.Icons.Example;
  extends ChillerPlant(chillerPlant(chillerPlant(redeclare BuildingControlEmulator.Devices.Fault.TemSensorDev senTCHWBuiLea(
          dt=dt, FauTime=0))), cooLoa(tsta=0, tend=365*86400));

  parameter Real dt=-4;

  annotation (experiment(
      StopTime=31536000,
      __Dymola_NumberOfIntervals=1440,
      __Dymola_Algorithm="Dassl"));
end ChillerPlant_secondary_chilled_water_temp_bias;
