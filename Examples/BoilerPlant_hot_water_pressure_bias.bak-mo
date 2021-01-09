within AFDD.Examples;
model BoilerPlant_hot_water_pressure_bias
  import BuildingControlEmulator;
  extends Modelica.Icons.Example;
  extends BoilerPlant(boilerPlant(bui(redeclare BuildingControlEmulator.Devices.Fault.dPreSensorDev senRelPre(
          dp=dp, FauTime=0))));
  parameter Real dp=-1;
end BoilerPlant_hot_water_pressure_bias;
