within AFDD.Examples;
model ChillerPlant_secondary_chilled_water_flow_bias
  import BuildingControlEmulator;
  extends Modelica.Icons.Example;
  extends ChillerPlant(chillerPlant(chillerPlant(redeclare BuildingControlEmulator.Devices.Fault.FloSensorDev senMasFloSecCHW(
          dm=dm, FauTime=20000))));

  parameter Real dm=-1;
end ChillerPlant_secondary_chilled_water_flow_bias;
