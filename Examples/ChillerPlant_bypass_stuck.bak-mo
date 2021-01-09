within AFDD.Examples;
model ChillerPlant_bypass_stuck
  import BuildingControlEmulator;
  extends Modelica.Icons.Example;
  extends ChillerPlant(chillerPlant(           chillerPlant(cooTowWithByp(byp(redeclare BuildingControlEmulator.Devices.Fault.TwoWayStuck valByp(
    y_stuck=y_stuck,
    FauTime=0))))));
  parameter Real y_stuck=0.75;
  annotation (experiment(
      StopTime=31536000,
      __Dymola_NumberOfIntervals=1440,
      __Dymola_Algorithm="Dassl"));
end ChillerPlant_bypass_stuck;
