include <dimensions.scad>
use <common/shapes.scad>

// produces picture of defined size
// x, y - size
// a - angle
// w - hole width
module hatch_tri(x=200, y=200, side=7, gap=1, center=false) {
	shift_x = center ? -x/2 : 0;
	shift_y = center ? -y/2 : 0;
	l_gap = gap/sin(60);
	step = side + l_gap;
	height = side*sin(60);
	x_steps = x / step + 1;
	y_steps = y / step;
	translate([shift_x, shift_y, 0]) {
		difference() {
			square([x, y]);
			for(i=[0:y_steps]) {
				y_ = i * step;
				for(j=[0:x_steps]) {
					x_ = (j - 0.5) * step - (i % 2) * step / 2 ;
					polygon([[x_,y_], [x_+side, y_], [x_ + side/2, y_+height]]);
					polygon(
						[
						 [x_+side+l_gap/2, y_+gap],
						 [x_+side*1.5+l_gap/2, y_+height+gap],
						 [x_ + side/2 + l_gap/2, y_+height+gap]
						]);
				}
			}
		}
	}
}

module plate() {
	full_top_height=top_height + tyre_outer + 1; // 1 - gap between tyre and top
	top_peg_height=full_height - peg_height + 3; // 2 - overlap
	peg_outer = peg_diameter + outer_wall*2;
	wheel_arch_diameter=tyre_outer + 2;
	wheel_holder_width=wheel_arch_diameter + 2; // 2 - margin
	wheel_holder_height=tyre_outer/2 + 1;
	wheel_holder_length=wheel_axle_length+2; // 2 - margin
	difference() {
		union() {
			// plate and outer wall
			difference() {
				cylinder(h=full_top_height, r=table_diameter/2+outer_wall, $fn=200);
				translate([0,0,top_height])
					cylinder(h=full_top_height, r=table_diameter/2, $fn=199);
				translate([0, 0, -0.5])
					linear_extrude(height=1)
						hatch_tri(x=200, y=200, side=7, gap=1, center=true);
			}
			// center column
			difference() {
				cylinder(h=top_peg_height, r=peg_outer/2, $fn=100);
				translate([0, 0, full_height - peg_height])
					cylinder(h=top_peg_height, r=peg_diameter/2, $fn=100);
			}
			// wheel supports
			for(angle = [0:90:359]) {
				rotate([0, 0, angle]) translate([0, track_diameter/2, wheel_holder_height/2+top_height])
					difference() {
						cube(
							[wheel_holder_width, 
						 	 wheel_holder_length,
						 	 wheel_holder_height],
					    	center=true);
						translate([0, 0, wheel_holder_height/2]) rotate([90, 0, 0])
							cylinder(h=wheel_axle_length, r=wheel_axle/2, center=true, $fn=100);
						translate([0, 0, wheel_holder_height/2]) rotate([90, 0, 0])
							cylinder(h=wheel_width+1, r=wheel_arch_diameter/2, center=true, $fn=100);
					}
			}
		}
		// bolt hole
		//rotate([0, 180, 0]) translate([0, 0, -bolt_height])
		//	bolt_hole(bolt_diameter, bolt_head, bolt_transition, $fn=50);
	}
}

plate();
