within AFDD.Examples;
model ChillerPlant_bypass_bias
  import BuildingControlEmulator;
  extends Modelica.Icons.Example;
  extends ChillerPlant(chillerPlant(chillerPlant(cooTowWithByp(redeclare BuildingControlEmulator.Devices.Fault.TemSensorDev senTCWEntChi(
    dt=dt, FauTime=20000)))));

  parameter Real dt=-2;
end ChillerPlant_bypass_bias;
