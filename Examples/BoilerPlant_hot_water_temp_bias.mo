within AFDD.Examples;
model BoilerPlant_hot_water_temp_bias
  import BuildingControlEmulator;
  extends Modelica.Icons.Example;
  extends BoilerPlant(boilerPlant(boilerPlant(redeclare BuildingControlEmulator.Devices.Fault.TemSensorDev senTHWBuiLea(
          dt=dt, FauTime=0))));
  parameter Real dt=2;
end BoilerPlant_hot_water_temp_bias;
