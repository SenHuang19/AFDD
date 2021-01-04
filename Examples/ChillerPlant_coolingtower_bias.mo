within AFDD.Examples;
model ChillerPlant_coolingtower_bias
  import BuildingControlEmulator;
  extends Modelica.Icons.Example;
  extends ChillerPlant(chillerPlant(chillerPlant(cooTowWithByp(redeclare BuildingControlEmulator.Subsystems.CoolingTower.MultiHeterCoolingTowers mulCooTowSys(n=1,m=2,ct1(redeclare BuildingControlEmulator.Devices.Fault.TemSensorDev senTCWLea(
          dt=dt, FauTime=20000)))))), cooLoa(tsta=0, tend=365*86400));
  parameter Real dt=2;

  annotation (experiment(
      StopTime=31536000,
      __Dymola_NumberOfIntervals=1440,
      __Dymola_Algorithm="Dassl"));
end ChillerPlant_coolingtower_bias;
