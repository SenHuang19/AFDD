within AFDD.Examples;
model AHU_coi_PI
  import BuildingControlEmulator;
  extends Modelica.Icons.Example;
  extends AHU(aHU(floor2(duaFanAirHanUnit(cooCoil(redeclare BuildingControlEmulator.Devices.Fault.conPI pI(fauFac=1))))));

end AHU_coi_PI;
