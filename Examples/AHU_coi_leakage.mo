within AFDD.Examples;
model AHU_coi_leakage
  import BuildingControlEmulator;
  extends Modelica.Icons.Example;
  extends AHU(aHU(floor2(duaFanAirHanUnit(cooCoil(redeclare BuildingControlEmulator.Devices.Fault.TwoWayLeak val(y_leak=0.1,FauTime=0))))));

end AHU_coi_leakage;
