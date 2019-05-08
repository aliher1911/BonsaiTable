include <common.scad>

module base() {
	track_width=tyre_width * 1.5;
	bottom_height_full = bottom_height + track_depth;
	union() {
	// base
	difference() {
		union() {
			cylinder(h=bottom_height_full, r=table_diameter/2, $fn=200);
			// peg to hold top and screw
			cylinder(h=peg_height, r=peg_diameter/2, $fn=50);
		}
		translate([0, 0, bottom_height])
			ring(h=4,
			     r1=(track_diameter+track_width)/2,
			     r2=(track_diameter-track_width)/2,
			     r3=track_diameter/2+track_width,
			     r4=track_diameter/2-track_width,
			     $fn=200);
		rotate([0, 180, 0]) translate([0, 0, -bolt_height])
			bolt_hole(bolt_diameter, bolt_head, bolt_transition, $fn=50);
	}
	}
};

base();