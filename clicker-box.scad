//this is a modulare electronics box enclosure rounded and fit snap
//with snap fit enclosure
// you can eddit the remove() code to remove your custom holes
//james villeneuve
outside_box_lenth_mm = 85;
outside_box_width_mm =40;
outside_Box_height_mm =32;
inside_box_lenth_mm = 80;
inside_box_width_mm =35;
inside_Box_height_mm =31;
oversize =0.25;//this is wiggle room it oversizes entire box for room to fit electronics in
//assume 4 mount points for board. this is x/y position and post hieght in z
mount1_position_mm_x = inside_box_lenth_mm / 2 - 3;
mount1_position_mm_y = 10;
mount1_position_mm_z =15;

mount2_position_mm_x = inside_box_lenth_mm / 2 - 3 - 17.5;
mount2_position_mm_y = -10;
mount2_position_mm_z =15;

mount3_position_mm_x =10;
mount3_position_mm_y =-10;
mount3_position_mm_z =15;

mount4_position_mm_x =-10;
mount4_position_mm_y =10;
mount4_position_mm_z =15;

print=0 ;//0=both, 1=box, 2=lid
overlay=1;//if one then shows invisible other side.
module remove(){
//this is are to add objects to remove such as circles and square 
//cutouts

//i have includede an example it is remarked out.
translate([0,inside_box_width_mm/2 + 2,0])
cube([9,5,3],center=true);

translate([inside_box_lenth_mm/2+2,0,4])
cube([6,8,4], center=true);

}
module main(){
module outside(l,w,h){

cube(size=[l-1,w-1,h ],center=true);

translate([(l-1)/2,(w-1)/2,0])
cylinder(r1=1,r2=1,h=h,center=true,$fn=40);

translate([0-(l-1)/2,(w-1)/2,0])
cylinder(r1=1,r2=1,h=h,center=true,$fn=40);

translate([(l-1)/2,0-(w-1)/2,0])
cylinder(r1=1,r2=1,h=h,center=true,$fn=40);

translate([0-(l-1)/2,0-(w-1)/2,0])
cylinder(r1=1,r2=1,h=h,center=true,$fn=40);

translate([0,w/2,0])
cube(size=[l-1,1,h ],center=true);
translate([0,0-w/2,0])
cube(size=[l-1,1,h ],center=true);


translate([l/2,0,0])
cube(size=[1,w-1,h ],center=true);

translate([0-l/2,0,0])
cube(size=[1,w-1,h ],center=true);

translate([(l-2)/2,(w-2)/2,0])
cylinder(r1=1,r2=1,h=h,center=true,$fn=40);

translate([0-(l-1)/2,(w-1)/2,0])
cylinder(r1=1,r2=1,h=h,center=true,$fn=40);

translate([(l-1)/2,0-(w-1)/2,0])
cylinder(r1=1,r2=1,h=h,center=true,$fn=40);

translate([0-(l-1)/2,0-(w-1)/2,0])
cylinder(r1=1,r2=1,h=h,center=true,$fn=40);


}


module mount(x,y,z){
difference(){
translate([x,y,inside_Box_height_mm-outside_Box_height_mm+outside_Box_height_mm /2-z/2])
cylinder(r1=6/2,r2=6/2,h=z,center=true,$fn=40);
translate([x,y,inside_Box_height_mm-outside_Box_height_mm+outside_Box_height_mm /2-z/2])
cylinder(r1=2.5/2,r2=2.5/2,h=z+0.1,center=true,$fn=40);



}
}
if (print==0 || print==1){
//main shape and subtraction
difference(){
outside(outside_box_lenth_mm,outside_box_width_mm,outside_Box_height_mm);
translate([0,0,0-(outside_Box_height_mm/2)+(inside_Box_height_mm/2)])
outside(inside_box_lenth_mm+oversize,inside_box_width_mm++oversize,inside_Box_height_mm+oversize);
translate([(outside_box_lenth_mm-5)/2,(outside_box_width_mm-5)/2,-2])

cylinder(r1=2,r2=2,h=outside_Box_height_mm +1,center=true,$fn=40);
translate([(outside_box_lenth_mm-7)/2,(outside_box_width_mm-7)/2,-2])
rotate([0,0,45])
cube(size=[4,2,outside_Box_height_mm],center=true);

translate([0-(outside_box_lenth_mm-5)/2,(outside_box_width_mm-5)/2,-2])
cylinder(r1=2,r2=2,h=outside_Box_height_mm +1,center=true,$fn=40);
translate([0-(outside_box_lenth_mm-7)/2,(outside_box_width_mm-7)/2,-2])

rotate([0,0,-45])
cube(size=[4,2,outside_Box_height_mm],center=true);


translate([(outside_box_lenth_mm-5)/2,0-(outside_box_width_mm-5)/2,-2])
cylinder(r1=2,r2=2,h=outside_Box_height_mm +1,center=true,$fn=40);

translate([(outside_box_lenth_mm-7)/2,0-(outside_box_width_mm-7)/2,-2])
rotate([0,0,-45])
cube(size=[4,2,outside_Box_height_mm],center=true);



translate([0-(outside_box_lenth_mm-5)/2,0-(outside_box_width_mm-5)/2,-2])
cylinder(r1=2,r2=2,h=outside_Box_height_mm +1,center=true,$fn=40);

translate([0-(outside_box_lenth_mm-7)/2,0-(outside_box_width_mm-7)/2,-2])
rotate([0,0,45])
cube(size=[4,2,outside_Box_height_mm],center=true);
//this is side slots

translate([0,(outside_box_width_mm-7)/2,-2])
cube(size=[2,4,outside_Box_height_mm],center=true);
translate([0,(outside_box_width_mm-5)/2,-2])
cylinder(r1=2,r2=2,h=outside_Box_height_mm +1,center=true,$fn=40);


translate([0,0-(outside_box_width_mm-7)/2,-2])
cube(size=[2,4,outside_Box_height_mm],center=true);
translate([0,0-(outside_box_width_mm-5)/2,-2])
cylinder(r1=2,r2=2,h=outside_Box_height_mm +1,center=true,$fn=40);


translate([0-(outside_box_lenth_mm-7)/2,0,-2])
cube(size=[4,2,outside_Box_height_mm],center=true);
translate([0-(outside_box_lenth_mm-5)/2,0,-2])
cylinder(r1=2,r2=2,h=outside_Box_height_mm +1,center=true,$fn=40);


translate([(outside_box_lenth_mm-7)/2,0,-2])
cube(size=[4,2,outside_Box_height_mm],center=true);
translate([(outside_box_lenth_mm-5)/2,0,-2])
cylinder(r1=2,r2=2,h=outside_Box_height_mm +1,center=true,$fn=40);








}

//mounts
mount(mount1_position_mm_x,mount1_position_mm_y,mount1_position_mm_z );
mount(mount2_position_mm_x,mount2_position_mm_y,mount2_position_mm_z );
mount(mount3_position_mm_x,mount3_position_mm_y,mount3_position_mm_z );
mount(mount4_position_mm_x,mount4_position_mm_y,mount4_position_mm_z );

}
if (print==0 || print==2){
translate([0,0-outside_box_width_mm-5,outside_Box_height_mm/2-0.5]){
//this is outside lid
outside(outside_box_lenth_mm,outside_box_width_mm,1);
translate([(outside_box_lenth_mm-5)/2,(outside_box_width_mm-5)/2,-2]){
rotate([0,0,45])
cube(size=[3,1,outside_Box_height_mm/4],center=true);
rotate([0,0,-45])
cube(size=[3,1,outside_Box_height_mm/4],center=true);
}
translate([(outside_box_lenth_mm-5)/2,0-(outside_box_width_mm-5)/2,-2]){
rotate([0,0,45])
cube(size=[3,1,outside_Box_height_mm/4],center=true);
rotate([0,0,-45])
cube(size=[3,1,outside_Box_height_mm/4],center=true);
}

translate([0-(outside_box_lenth_mm-5)/2,(outside_box_width_mm-5)/2,-2]){
rotate([0,0,45])
cube(size=[3,1,outside_Box_height_mm/4],center=true);
rotate([0,0,-45])
cube(size=[3,1,outside_Box_height_mm/4],center=true);
}


translate([0-(outside_box_lenth_mm-5)/2,0-(outside_box_width_mm-5)/2,-2]){
rotate([0,0,45])
cube(size=[3,1,outside_Box_height_mm/4],center=true);
rotate([0,0,-45])
cube(size=[3,1,outside_Box_height_mm/4],center=true);
}



translate([0,0-(outside_box_width_mm-5)/2,-2]){
rotate([0,0,45])
cube(size=[3,1,outside_Box_height_mm/4],center=true);
rotate([0,0,-45])
cube(size=[3,1,outside_Box_height_mm/4],center=true);
}
translate([0,(outside_box_width_mm-5)/2,-2]){
rotate([0,0,45])
cube(size=[3,1,outside_Box_height_mm/4],center=true);
rotate([0,0,-45])
cube(size=[3,1,outside_Box_height_mm/4],center=true);
}
translate([0-(outside_box_lenth_mm-5)/2,0,-2]){
rotate([0,0,45])
cube(size=[3,1,outside_Box_height_mm/4],center=true);
rotate([0,0,-45])
cube(size=[3,1,outside_Box_height_mm/4],center=true);
}
translate([(outside_box_lenth_mm-5)/2,0,-2]){
rotate([0,0,45])
cube(size=[3,1,outside_Box_height_mm/4],center=true);
rotate([0,0,-45])
cube(size=[3,1,outside_Box_height_mm/4],center=true);
}


}

}
}

//structure

rotate([0,180,180]){
difference(){

main();


remove();
}
}
