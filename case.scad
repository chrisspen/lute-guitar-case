inch_to_mm = 25.4;

module make_lute_guitar(){
    total_scale = 1.2;
    scale([total_scale,total_scale,total_scale]){
        intersection(){
        if(1)
        linear_extrude(height=130)
        import("top.svg");
        
        side_scale = 1.35;
        side_length = 230;
        color("blue")
        translate([-side_length/2-31,-5,65+0])
        scale([side_scale,side_scale,side_scale])
        rotate([0,0,90])
        rotate([90,0,0])
        linear_extrude(height=side_length)
        import("side.svg");
        }
        
        rear_scale = 1.48;
        rear_length = 200;
        color("orange")
        scale([rear_scale,rear_scale,rear_scale])
        translate([0,rear_length/2,47])
        rotate([90,0,0])
        linear_extrude(height=rear_length)
        import("rear.svg");
    }
}

module make_lute_guitar_bb(){
    color("gray")
    translate([0,0,0])
    cube([990.6,330,165.1], center=true);
}

module make_plank_big(length_feet=4){
    translate([0,0,0])
    cube([length_feet*12*inch_to_mm,5.5*inch_to_mm,.5*inch_to_mm], center=true);
}
module make_plank_small(length_feet=4){
    translate([0,0,0])
    cube([length_feet*12*inch_to_mm,3.5*inch_to_mm,.5*inch_to_mm], center=true);
}

module make_plank_big_end(){
    color("orange")
    make_plank_big(length_feet=(5.5+5.5+3.5+.5+.5)/12);
}

module make_plank_small_end(){
    color("yellow")
    make_plank_small(length_feet=(5.5+5.5+3.5+.5+.5)/12);
}

module make_top_panel(){
    color("green")
    for(i=[-1:2:1]){
    translate([0,(5.5*inch_to_mm/2+3.5*inch_to_mm/2)*i,0])
    make_plank_big();
    }
    color("purple")
    translate([0,0,0])
    make_plank_small();
}

make_lute_guitar_bb();

// lid
translate([0,0,50])
translate([0,0,0.5*inch_to_mm/2+8*inch_to_mm/2]){
    make_top_panel();
    
    color("blue")
    for(i=[-1:2:1])
    translate([-1,(5.5+3.5/2+.5/2)*inch_to_mm*i,-3.5*inch_to_mm/2+0.5*inch_to_mm/2])
    rotate([90,0,0])
    make_plank_small();
    
    if(1)
    for(i=[-1:2:1])
    translate([(4*12+.5)*inch_to_mm/2*i,0,-(3.5-.5)*inch_to_mm/2])
    rotate([90,0,90])
    make_plank_small_end();
}

// bottom
translate([0,0,-(0.5*inch_to_mm/2+8*inch_to_mm/2)]){
    make_top_panel();
    
    for(i=[-1:2:1])
    translate([-1,(5.5+3.5/2+.5/2)*inch_to_mm*i,5.5*inch_to_mm/2-0.5*inch_to_mm/2])
    rotate([90,0,0])
    make_plank_big();
    
    for(i=[-1:2:1])
    translate([(4*12+.5)*inch_to_mm/2*i,0,(5.5-.5)*inch_to_mm/2])
    rotate([90,0,90])
    make_plank_big_end();
}

if(0){
make_lute_guitar();

//bowl height
color("gray")
translate([500/2+165/2,0,165/2])
cube([165,165,165], center=true);

//bowl length
color("gray")
translate([0,0,-500/2])
cube([50,500,500], center=true);

//bowl width
color("gray")
translate([0,0,-330/2])
cube([330,50,330], center=true);
}