within AFDD.Examples;
model AHU_coi_bias
  import BuildingControlEmulator;
  extends Modelica.Icons.Example;
  extends AHU(aHU(floor2(duaFanAirHanUnit(cooCoil(coi(redeclare BuildingControlEmulator.Devices.Fault.TemSensorDev temLeaAir(dt=1, FauTime=0)))))));


end AHU_coi_bias;
