within AFDD.Examples;
model ChillerPlant_bypass_leakage
  import BuildingControlEmulator;
  extends Modelica.Icons.Example;
  extends ChillerPlant(chillerPlant(       chillerPlant(cooTowWithByp(byp(redeclare BuildingControlEmulator.Devices.Fault.TwoWayLeak valByp(
    y_leak=y_leak,
    FauTime=0))))), cooLoa(tsta=0, tend=365*86400));

  parameter Real y_leak=0.5;
  annotation (experiment(StopTime=3.1536e+007, __Dymola_NumberOfIntervals=
          525699));
end ChillerPlant_bypass_leakage;
