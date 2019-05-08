include <common.scad>

module wheel() {
	difference() {
		ring(h=wheel_width, r1=wheel_diameter/2, r2=wheel_axle/2, center=true, $fn=50);
		doughnut(r1=tyre_outer/2, r2=tyre_inner/2, $fn=100);
	}
};

wheel();