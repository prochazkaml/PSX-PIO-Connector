layer_h = .2;

w_body = 46;
d_body = 5.5;

h_body = 12;
h_top = .6;

h_total = h_body + h_top;

h_connector_part = 6;

connector_peg_w = 6;
connector_peg_d = 1.5;

side_w = 6;
side_h_start = h_connector_part + 3;

chin_d = 3;

top_h = 7;
top_hole_w = 6;

top_side_w_offset = (h_total - (side_h_start + side_w / 2)) / 2;

logo_h = 0.4;

module sidehole() {
	translate([side_w / 2, 0, side_h_start + side_w / 4]) rotate([0, -atan(0.5), 0]) cylinder(h = 20, d = 3.2, $fn = 256, center = true);
}
