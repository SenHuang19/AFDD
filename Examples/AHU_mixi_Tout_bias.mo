within AFDD.Examples;
model AHU_mixi_Tout_bias
  import BuildingControlEmulator;
  extends Modelica.Icons.Example;
  extends AHU(aHU(floor2(duaFanAirHanUnit(mixingBox(mixBox(redeclare BuildingControlEmulator.Devices.Fault.TemSensorDev temOut(dt=-4, FauTime=0)))))));

end AHU_mixi_Tout_bias;
