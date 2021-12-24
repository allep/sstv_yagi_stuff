// Spacer for 144 MHz Yagi antenna
// Author: Alessandro Paganelli (alessandro.paganelli@gmail.com)

// Measures: in mm

// Constants
$fn = 50;
CYLINDER_H = 30;

// Radius + 1% tolerance
HOLE_RADIUS = 2.53;
EXTERNAL_RADIUS = 10.0;

THICKNESS = 5.0;
SEPARATION = 25.4;

// Modules
module spacer_base(external_radius, separation, height)
{
    union()
    {
        translate([-separation/2, 0, 0])
        cylinder(h = height, r = external_radius);

        translate([separation/2, 0, 0])
        cylinder(h = height, r = external_radius);
        
        translate([-separation/2, - external_radius, 0])
        cube([separation, 2 * external_radius, height]);
    }
}

module radiator_holes(hole_radius, separation, height)
{
    union()
    {
        translate([-separation/2, 0, 0])
        cylinder(h = height, r = hole_radius);
        
        translate([separation/2, 0, 0])
        cylinder(h = height, r = hole_radius);
    }
}

// Actual script
difference()
{
    spacer_base(EXTERNAL_RADIUS, SEPARATION, THICKNESS);
    radiator_holes(HOLE_RADIUS, SEPARATION, THICKNESS);
}