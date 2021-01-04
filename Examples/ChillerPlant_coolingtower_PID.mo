within AFDD.Examples;
model ChillerPlant_coolingtower_PID
  import BuildingControlEmulator;
  extends Modelica.Icons.Example;
  extends ChillerPlant(chillerPlant(     chillerPlant(cooTowWithByp(redeclare BuildingControlEmulator.Subsystems.CoolingTower.MultiHeterCoolingTowers mulCooTowSys(n=1,m=2,ct1(conPI(
                Ti=24000)))))));

end ChillerPlant_coolingtower_PID;
