include <psx-pio-common.scad>
use <psx-pio.scad>

difference() {
	translate([0, d_body + chin_d]) rotate([90, 0, 0]) linear_extrude(d_body + chin_d * 2) polygon([
		[-side_w + top_side_w_offset, 0],
		[-side_w + top_side_w_offset + top_h / 2, top_h],
		[-side_w + top_side_w_offset + top_h / 2 + top_hole_w, top_h - top_hole_w / 2],
		
		[w_body + side_w - top_side_w_offset - top_h / 2 - top_hole_w, top_h - top_hole_w / 2],
		[w_body + side_w - top_side_w_offset - top_h / 2, top_h],
		[w_body + side_w - top_side_w_offset, 0]
	]);

	translate([0, d_body / 2, -h_total]) rotate([0, 0, 180]) sidehole();
	translate([w_body, d_body / 2, -h_total]) sidehole();

	translate([w_body / 2, d_body / 2, top_h - top_hole_w / 2 - logo_h]) linear_extrude(logo_h + 1, convexity = 2) scale(.9) import("psx-logo.svg", center = true);
}