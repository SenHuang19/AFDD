within AFDD.Examples;
model BoilerPlant_boiler_foul
  import BuildingControlEmulator;
  extends Modelica.Icons.Example;
  extends BoilerPlant(boilerPlant(boilerPlant(redeclare BuildingControlEmulator.Subsystems.Boiler.MultiHeterBoilers multiBoiler(n=1,m=1,boi1(boi(eps=
                  eps))))));
  parameter Real eps=0.8;
end BoilerPlant_boiler_foul;
