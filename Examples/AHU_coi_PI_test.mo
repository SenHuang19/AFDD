within AFDD.Examples;
model AHU_coi_PI_test
  import BuildingControlEmulator;
  extends Modelica.Icons.Example;
  extends AHU(aHU(floor2(duaFanAirHanUnit(Coi_k=1))));

end AHU_coi_PI_test;
