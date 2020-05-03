// Cânula Orotraqueal

e = 2; // espessura das paredes

le = 50; //largura
ae = 50; //altura
rotate([-90,0,0]) 
    externo(le, ae);

lb = le/2; //largura
ab = ae/2; //altura
pb = 40; //profundidade
rotate([-90,0,0])
    boca(lb, ab, pb); 

dt = lb/2; //diâmetro do tubo
pbt = pb; //profundidade a partir da parte da boca
ptt = pb/2; //profundidade dentro da traqueia
translate([-lb/2,pb-e,0])
rotate([-90,0,0])
    traqueia(dt, pbt, ptt);

module traqueia(d, b, t) { //parte interna à traqueia
    /*intersection() {
        cachimbo(d,b,t);
        translate([0,0,b-d/2]) rotate([0,90,0]) cylinder(d=d, h=d+e, center=true);
    }*/
    // cylinder(d=d, h=b); 
    tubo(d=d, p=b, e=e); //boca
    //traqueia
    translate([0,b/2-d/2,b-e]) rotate([0,90,0]) cachimbo(d-e,b,t);
}
 
module tubo(d, p, e) {
    difference() {
    cylinder(d=d, h=p);
        cylinder(d=d-2*e, h=p+e);
    }
}

module cachimbo(d,b,t) { //parte curva
    difference() {
    cylinder(d=2*t, h=d, center=true);
            cylinder(d=2*t-2*e, h=d-2*e, center=true);
            cylinder(d=t, h=d+e, center=true);
            translate([0,2*t,0]) cube(4*t, center=true); 
            translate([2*t,0,0]) cube(4*t, center=true);   
    }
}
module boca(l, a, p) { //parte interna à boca
    translate([0,0,p/2]) cube([l/2,a,p], center=true);
    translate([l/4,0,0]) cylinder(h=p, d=a);
    translate([-l/4,0,0]) cylinder(h=p, d=a);
}

module externo(l, a) { // parte externa
    alfa = 15; //ângulo de inclinação
    
    cube([l,a,e], center=true);
    translate([l/2,0,0]) rotate([0,-alfa,0]) alca(ae);
    translate([-l/2,0,0]) rotate([0,-alfa,180]) alca(ae);
}

module alca(da) {
    b = 8; //bitola da alça
    abe = 6; // altura do botão para prender elástico
    difference() {
    cylinder(h=e, d=da, center=true);
        cylinder(h=e, d=da-2*b, center=true);
        translate([-da-e,0,0]) cube(da*2, center=true);
        }        
    translate([da/2-b/2,0,0]) botao(b, abe);
}

module botao(b, abe) {
    
    translate([0,0,-0.6*abe-e]) cylinder(d=b/2, h=0.75*abe);
    translate([0,0,-abe-e]) cylinder(d=1.5*b, h=0.5*abe);
    
}