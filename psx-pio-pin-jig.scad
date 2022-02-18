$fn = 256;

cube([20, 10, 2]);

linear_extrude(2.6) {
	square([20, 2]);

	difference() {
		union() {
			translate([16, 2]) circle(r = 1.25);
			translate([17, 0]) square([3, 10]);
		}
		
		translate([18, 2.0]) rotate([0, 0, -50]) square([10, .6], center = true);
	}
}

translate([0, -3, 2.6])
rotate([180, 0, 0]) {
linear_extrude(0.6) {
	difference() {
		translate([0, 2.75]) square([17, 7.25]);

		translate([16, 2])
			circle(r = 2);
	}
}

translate([0, 0, .6]) cube([20, 10, 2]);
}