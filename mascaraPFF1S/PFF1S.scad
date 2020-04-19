//Máscara PFF1 S

//Prendedor
l=43; //largura
p=20; //profundidade
e=2; //espessura
d=27; //distância entre prendedores
pp=6; //profundidade do prendedor

//prendedor(l,p,d,e,pp);

module prendedor(l,p,d,e,pp) {
    difference() {
    cube([l,p,e], center=true);
        translate([-d/2,pp-p/2,0]) cylinder(d=2, h=10, $fn=12, center=true);
        translate([d/2,pp-p/2,0]) cylinder(d=2, h=10, $fn=12, center=true);
        translate([-d/2,-p/2+25+pp,0]) cube([1,50,10], center=true);
    translate([d/2,-p/2+25+pp,0]) cube([1,50,10], center=true);
}
}

//Filtro
a=10; //altura
d=30; //diâmetro principal
b=4; //borda
e=2; //espessura
so=9; //separação dos orifícios
po=16; //profundidade dos orifícios
ao=6; //altura dos orifícios
dc=4; //diâmetro do pino central

de=6; //diâmetro do hub
bf=7; //borda inferior

filtro_int(e,de,bf);
//filtro_ext(a,d,b,e,so,po,ao,dc);

module filtro_ext(a,d,b,e,so,po,ao,dc) { //parte externa do filtro
difference() {
union() {
    difference() {
    union() {
    cylinder(d=d+2*b, h=1, $fn=36);
    cylinder(d=d, h=a, $fn=36);
    }
    translate([0,0,-1]) cylinder(d=d-2*e, h=a, $fn=36);
    translate([d/2-po,so/2,a-ao-1]) cube([20,20,ao]);
    translate([d/2-po,-so/2-20,a-ao-1]) cube([20,20,ao]);
}
translate([0,0,a-ao-1]) cylinder(d=dc, h=ao+1, $fn=36);
}
cylinder(d=2, h=a-e, $fn=12);
}
}

module filtro_int (e,de,bf) { //parte interna
cylinder(d=2, h=a-e, $fn=12);
cylinder(d=de, h=e, $fn=12);
translate([0,0,e/2]) cube([d+2*b,1,e], center=true);    
    translate([0,0,e/2]) rotate(60) cube([d+2*b,1,e], center=true);    
    translate([0,0,e/2]) rotate(-60) cube([d+2*b,1,e], center=true);    
    difference() {
    cylinder(d=d+2*b, h=e, $fn=36);
        cylinder(d=d+2*b-2*bf, h=e, $fn=36);
        }
}