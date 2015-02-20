

// https://www.sparkfun.com/products/11231

// 1.03" x 0.95"
pcb = [22.86, 25.4, 1.3];

battery_plug = [5, 6, 5];

module chargeController() {
	import("PowerCell-v13.dxf");
	
	translate([pcb[0] - battery_plug[0], pcb[1]/2 - battery_plug[1]/2, pcb[2]/2])
		color([0.3, 0.3, 0.3]) cube(battery_plug);
}

chargeController();