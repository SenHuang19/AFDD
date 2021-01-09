within AFDD.Examples;
model ChillerPlant_chiller_PID
  import BuildingControlEmulator;
  extends Modelica.Icons.Example;
  extends ChillerPlant(chillerPlant(  chillerPlant(redeclare BuildingControlEmulator.Subsystems.Chiller.MultiHeterChillers mulChiSys(n=1,m=2,
        ch1(redeclare BuildingControlEmulator.Devices.Fault.conPI conPI(fauFac=10))))));

end ChillerPlant_chiller_PID;
