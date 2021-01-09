within AFDD.Examples;
model ChillerPlant_secondary_chilled_water_pressure_bias
  import BuildingControlEmulator;
  extends Modelica.Icons.Example;
  extends ChillerPlant(chillerPlant(     bui(redeclare BuildingControlEmulator.Devices.Fault.dPreSensorDev senRelPre(
          dp=dp, FauTime=20000))), cooLoa(tsta=0, tend=365*86400));

  parameter Real dp=0.1;

end ChillerPlant_secondary_chilled_water_pressure_bias;
