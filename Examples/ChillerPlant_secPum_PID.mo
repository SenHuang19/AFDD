within AFDD.Examples;
model ChillerPlant_secPum_PID
  import BuildingControlEmulator;
  extends Modelica.Icons.Example;
  extends ChillerPlant(chillerPlant(chillerPlant(secPumCon(conPI(Ti=2400)))));

end ChillerPlant_secPum_PID;
