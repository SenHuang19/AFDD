within AFDD.Examples;
model ChillerPlant_condenser_foul
  import BuildingControlEmulator;
  extends Modelica.Icons.Example;
  extends ChillerPlant(chillerPlant( chillerPlant(redeclare BuildingControlEmulator.Subsystems.Chiller.MultiHeterChillers mulChiSys(n=1,m=2,
        ch1(chi(epsCon=epsCon))))));

  parameter Real epsCon=0.8;
end ChillerPlant_condenser_foul;
