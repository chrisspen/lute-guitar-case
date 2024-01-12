
if(0)
translate([0,-16.5,0])
rotate([90,0,0])
import("CircSawAdapter.stl");

if(1)
import("Hose_to_DysonHose.stl");

if(0)
color("red")
translate([0,0,-10])
cylinder(d=42, h=1, $fn=50);

if(0)
color("red")
translate([0,0,90])
cylinder(d=32, h=1, $fn=50);

color("red")
translate([0,0,100])
cylinder(d=24, h=1, $fn=50);