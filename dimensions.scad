/*

Full size:
 top plate
 tyre outer
 bottom plate
*/

top_height = 2;
bottom_height = 2;

table_diameter = 100;
outer_wall = 2;

wheel_axle = 2;  // fixed
wheel_diameter = 9; // tyre_inner + 1
wheel_width = 4;
wheel_axle_length = 10;

tyre_inner = 8;  // fixed
tyre_outer = 12; // fixed
tyre_width = 2;  // fixed

track_diameter = table_diameter * 0.75;
track_depth = 1;

// central column (bottom)
peg_height = 8;
peg_diameter = 20;

// needs size of bolt connecting top to bottom
// diameter
// head
// nut
// or whasher size
bolt_diameter = 5;
bolt_head = 8;
bolt_transition = (bolt_head - bolt_diameter) * 0.75;
bolt_height = 4;

full_height = top_height + bottom_height + tyre_outer;

module validate() {
	assert(3 < 5);
}
