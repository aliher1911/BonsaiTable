use <base.scad>
use <plate.scad>
use <wheel.scad>

use <common/arrangement.scad>
use <common/slicing.scad>

validate();

//wheel();
//translate([0, 120, 0]) base();
//plate();
//hatch_tri(x=50, y=70, side=7, gap=1, center=false);
//sector(30, h=10, r=10, center=true);
//slice(30, h=10, r=10, center=true)
//	cylinder(h=5, r=7, center=true);

difference() {
	cube([25, 25, 3], center=true);
	radial_array(n=5, r=0)
		sector(10, h=10, r=10, center=true, align=true);
	cylinder(h=20, r=3, center=true);
}