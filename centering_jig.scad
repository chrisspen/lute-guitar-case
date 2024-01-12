inch_to_mm = 25.4;

module make_rails(height=1000, buffer=0.5){
    for(i=[-1:2:1])
    translate([-11,20*i,0])
    rotate([0,0,45])
    cube([10+buffer, 10+buffer, height], center=true);
}

module make_tool_holder(offset=0, sight=0){
    
    difference(){
        color("blue")
        translate([0,0,30/2-3/2])
        make_rails(height=30, buffer=0);
            
        color("red")
        translate([0,0,50/2+3/2])
        cylinder(d=41, h=50, center=true, $fn=100);
    }

    difference(){
        cube([50, 50-.5, 3], center=true);

        translate([offset,0,0]){            
            color("red")
            cylinder(d=18.75, h=100, center=true, $fn=100);
            //cylinder(d=28, h=100, center=true, $fn=100);
        }
    }
        if(sight)
        translate([offset,0,0])
        cylinder(d=1, h=1000, center=true, $fn=100);
}

depth_buffer = 0;

module make_bracket(){
    // bracket
    translate([0,0,-50])
    difference(){
        union(){
            translate([-depth_buffer/2-15,0,50/2])
            cube([30+depth_buffer, 60, 100], center=true);

            for(i=[-1:2:1])
            translate([0,25*i,0]){
            difference(){
                scale([1.5,1,1])
                rotate([0,45,0])
                cube([10, 10, 10], center=true);
                
                translate([0,0,-50/2])
                cube([50, 50, 50], center=true);
            }
            }
        }

        // tool cutout
        color("red")
        translate([0,0,0])
        cube([30.1+20, 30.1+20, 100*2], center=true);   
        
        color("red")
        make_rails();
    }
}

if(0)
rotate([0,-90,0])
make_bracket();

if(1)
make_tool_holder(offset=0.5*inch_to_mm/2, sight=0);

// board bb
if(0)
color("gray")
translate([0.5*inch_to_mm/2,0,-100/2-50])
cube([0.5*inch_to_mm, 100, 100], center=true);
