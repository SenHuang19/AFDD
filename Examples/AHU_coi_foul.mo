within AFDD.Examples;
model AHU_coi_foul
  import BuildingControlEmulator;
  extends Modelica.Icons.Example;
  extends AHU(aHU(
        floor2(duaFanAirHanUnit(eps=0.8))));

end AHU_coi_foul;
