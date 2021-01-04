within AFDD.Examples;
model ChillerPlant_coolingtower_foul
  import BuildingControlEmulator;
  extends Modelica.Icons.Example;
  extends ChillerPlant(chillerPlant(          chillerPlant(cooTowWithByp(redeclare BuildingControlEmulator.Subsystems.CoolingTower.MultiHeterCoolingTowers mulCooTowSys(n=1,m=2,ct1(yorkCalc(
                eps=eps)))))));

  parameter Real eps=0.8;

  annotation (experiment(StartTime=1.728e+007, StopTime=1.73664e+007));
end ChillerPlant_coolingtower_foul;
