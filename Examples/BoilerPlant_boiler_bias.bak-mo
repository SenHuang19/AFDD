within AFDD.Examples;
model BoilerPlant_boiler_bias
  import BuildingControlEmulator;
  extends Modelica.Icons.Example;
  extends BoilerPlant(boilerPlant(boilerPlant(redeclare BuildingControlEmulator.Subsystems.Boiler.MultiHeterBoilers multiBoiler(n=1,m=1,boi1(redeclare BuildingControlEmulator.Devices.Fault.TemSensorDev senTHWLea(
          dt=dt, FauTime=0))))));
  parameter Real dt=-4;
end BoilerPlant_boiler_bias;
