layer_h = .2;

w_body = 46;
d_body = 5.5;

h_body = 12;
h_top = .6;

h_total = h_body + h_top;

h_connector_part = 6;

connector_peg_w = 6;
connector_peg_d = 7;

side_w = 3;
side_hole_d = d_body / 2;
side_hole_w = 2;

chin_d = 2;

module chin() {
	rotate([90, 0, -90]) linear_extrude(w_body, center = true) 
		polygon([
			[0, h_connector_part],
			[chin_d, h_connector_part + chin_d],
			[chin_d, h_total],
			[0, h_total]
		]);
}

module side() {
	difference() {
		rotate([90, 0, 0]) linear_extrude(d_body, center = true) 
			polygon([
				[0, h_connector_part],
				[side_w, h_connector_part + side_w],
				[side_w, h_total],
				[0, h_total]
			]);
			
		translate([side_w - side_hole_w, -(d_body - side_hole_d) / 2, h_connector_part]) cube([side_hole_w, side_hole_d, side_w]);
	}
}

// A small pad that prevents the pins from falling out + makes it easier to print!

linear_extrude(.4) difference() {
	square([w_body, d_body]);
	translate([0, 1.6]) square([w_body, d_body - 2 - .6 * 2]);
}

// Key for the PlayStation connector

//linear_extrude(h_connector_part) {
linear_extrude(h_connector_part + chin_d) { // To make it look nicer
	translate([0, -connector_peg_d + d_body]) square([connector_peg_w, connector_peg_d - d_body]);
	translate([w_body - connector_peg_w, -connector_peg_d + d_body]) square([connector_peg_w, connector_peg_d - d_body]);
}

// Main body

difference() {
	union() {
		cube([w_body, d_body, h_total]);
		translate([w_body / 2, 0]) chin();
		translate([w_body / 2, d_body]) rotate([0, 0, 180]) chin();
	}
	translate([1, 1.6]) cube([w_body - 2, d_body - 1.6 * 2, h_connector_part]);

	for(i = [-16.5 : 1 : 16.5]) {
		translate([w_body / 2 + 1.27 * i - 0.8 / 2, 0.9]) cube([0.8, d_body - 1.8, h_total]);
		translate([w_body / 2 + 1.27 * i - 0.8 / 2, -chin_d, h_body]) cube([0.8, d_body + chin_d * 2, h_total]);
	}
}

// Long middle bit that prevents the pins from flying around

translate([0, (d_body - 2) / 2, h_connector_part + layer_h]) cube([w_body, 2, h_total - (h_connector_part + layer_h)]);

// Sides (with the hooks)

translate([0, d_body / 2, 0]) rotate([0, 0, 180]) side();
translate([w_body, d_body / 2, 0]) side();
