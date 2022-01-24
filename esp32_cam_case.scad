// ESP32-Cam case
// Peng Yao
// 2022.01.21

// esp32 cam module size
width = 18;
heigtht = 30;
depth = 40;
// case thickness
tk = 2; 

// main case
translate([0,0,20]){
  difference(){
    cube([width, depth+tk*2, heigtht+tk*2]);
    translate([tk,tk,tk]) {
      color("green")cube([width, depth, heigtht]);
    }
    // cam cube window
    translate([-1, tk+5,tk+9]) {
      color("red")cube([4, 9, 9]);
    }
    // flash window
    translate([-1, tk+27,tk]) {
      color("red")cube([tk+2, 3, 3]);
    }
    // micro usb window
    translate([tk+11,depth,tk+10]){
      color("red")cube([3,tk+3,8]);
    }
    // side cooling holes  
    for(i=[0:2]) {
      translate([tk+5, -tk, 5+i*3]){
        $fn=100;
        rotate([30,0,0])color("red")
        minkowski() {
          cube([6,tk*4,1]);
          rotate([90,0,0])cylinder(r=0.2,h=1);
        }
      }
    }
    // top cooling holes
    for(j=[0:3]) {
      translate([5+tk, (tk+24)+j*3, heigtht]){
        $fn=100;
        rotate([-30,0,0])color("red")
        minkowski() {
          cube([6,1,tk*4]);
          rotate([0,0,90])cylinder(r=0.2,h=1);
        }
      }
    }  
  }
  // cam extension
  translate([-4, tk+5+4.5, tk+9+4.5]) {
    $fn=100;
    rotate([0,90,0])
    difference(){
      color("red")cylinder(h=6,d=14);
      translate([0,0,-1]) {
        color("blue")cylinder(h=8, d=9);
      }
    }
  }
  // mounting joint
  translate([3,16,-20]){
    $fn=100;
    // joint
    difference(){
      translate([6,6,6]){
        difference(){
        sphere(d=12);
        color("red")sphere(d=10);}
      }
      color("green")cube([12,12,3]);
      translate([6,16,6]){
        rotate([90,90,0])color("blue")
        cylinder(d=5,h=20);
      }
      translate([3.5,-4,1]){
        color("red")cube([5,20,5]);
      }
    }
    // ring locker
    difference(){
      translate([6,6,3]){
        color("green")cylinder(d=12, h=1);
      }
      translate([6,6,2]){
        color("red")cylinder(d=10, h=3);
      }
      translate([3.5,-4,2]){
        color("blue")cube([5,20,3]);    
      }
    }
    // stick
    translate([6,6,11]){
      cylinder(d=5, h=10);
    }
  }
}

// back cover
translate([60, 60,0]) {
  cube([tk, depth+tk*2, heigtht+tk*2]);
  difference(){
    translate([tk, tk, tk]) {
      color("green")cube([1, depth, heigtht]);
    }
    translate([tk-1, tk+1,tk+1]) {
      color("red")cube([4, depth-2, heigtht-2]);
    }
  }
}

// mounting support base
translate([100,0,0]) {
  $fn=100;
  translate([12.5,25,0]){  
    cylinder(d=5, h=20);
  }
  translate([12.5,25,20]){
    sphere(d=10);
  }
  translate([0,0,0]){
    minkowski(){
      cube([25,60,2]);
      cylinder(r=2,h=1);
    }    
  }
}

// lock ring
$fn=100;
difference(){
  translate([0, -20, 0])cylinder(d=14,h=3);
  translate([0, -20, -1])cylinder(d=12,h=5);
}
