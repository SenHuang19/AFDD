within AFDD.Examples;
model ChillerPlant_chiller_bias
  import BuildingControlEmulator;
  extends Modelica.Icons.Example;
  extends ChillerPlant(chillerPlant(chillerPlant(redeclare BuildingControlEmulator.Subsystems.Chiller.MultiHeterChillers mulChiSys(n=1,m=2,ch1(redeclare BuildingControlEmulator.Devices.Fault.TemSensorDev senTCHWLea(
          dt=dt, FauTime=0))))), cooLoa(tsta=0, tend=365*86400));
  parameter Real dt=-4;
  annotation (experiment(StopTime=3.1536e+007, __Dymola_NumberOfIntervals=
          525699));
end ChillerPlant_chiller_bias;
