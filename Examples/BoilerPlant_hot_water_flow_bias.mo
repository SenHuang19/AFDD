within AFDD.Examples;
model BoilerPlant_hot_water_flow_bias
  import BuildingControlEmulator;
  extends Modelica.Icons.Example;
  extends BoilerPlant(boilerPlant(boilerPlant(redeclare BuildingControlEmulator.Devices.Fault.FloSensorDev senMasFlo(
          dm=dm, FauTime=0))));
  parameter Real  dm=-1;
end BoilerPlant_hot_water_flow_bias;
