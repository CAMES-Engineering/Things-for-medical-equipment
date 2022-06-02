


//End piece - device
center_diameter = 4;
center_l = 8;
outer_diameter = 8;
fit_margin = .5;


//Characteristics cap

wall_thickness = 2;
total_l = 20;


module endpiece_device(){
    // Approximate measurements. Margin has been removed to ensure tight fit
    union(){
        cylinder(center_l,center_diameter/2.0 - fit_margin,center_diameter/2.0 - fit_margin,$fn=150);
        
        translate([0,0,center_l])
            cylinder(center_l+5,outer_diameter/2.0 - fit_margin,outer_diameter/2.0 - fit_margin,$fn=150);      
    };

};



module cap_owndesign(){
    difference(){
        translate([0,0,-3]) // Z change determines thickness end
            color("pink")
            cylinder(total_l,outer_diameter/2.0 + wall_thickness,outer_diameter/2.0 + + wall_thickness,$fn=150);

        endpiece_device();
    };
};




module mold(){
    difference(){
        cube([125,125,20]);
        for (i = [0:5]) {
            for (j = [0:5]) {

            translate([12 + i*20,12+j*20,1.95])
                cap_owndesign();
            };
        };
    };
    translate([0,0,-5])
    cube([125,5,5]);
    translate([0,0,-5])
    cube([5,125,5]);
    translate([0,120,-5])
    cube([125,5,5]);
    translate([120,0,-5])
    cube([5,125,5]);
};



mold();




