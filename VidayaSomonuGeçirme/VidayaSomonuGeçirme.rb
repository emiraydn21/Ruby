# Default code, use or delete...
mod = Sketchup.active_model # Open model
ents = mod.entities # All entities in model
sel = mod.selection # Current selection

#vida kafası yap
hex_curve=ents.add_circle [0,0,0],[0,0,1],4
hex_face=ents.add_face hex_curve
hex_face.pushpull -3

#vida yap
screw_curve=ents.add_circle [0,0,-8],[0,0,1],1.5
screw_face=ents.add_face screw_curve
screw_face.pushpull 8
bolt_group=ents.add_group ents.to_a
bolt_group.name="Hex Bolt"

#somon yap
nut_curve=ents.add_ngon [10,0,0],[0,0,1],3,6
nut_face=ents.add_face nut_curve
nut_face.reverse!
nut_face.pushpull 1.5
cut_curve=ents.add_circle [10,0,0],[0,0,1],1.5
cut_curve[0].faces[0].pushpull -1.5
nut_group=ents.add_group cut_curve[0].faces[1].all_connected
nut_group.name="Square Nut"
nut_group.transform! [-10,0,-7]

#somonu vidaya taşı
full_group=ents.add_group bolt_group,nut_group
full_group.name="Nut-Bolt Group"
t2=Geom::Transformation.translation [10,10,10]
t1=Geom::Transformation.rotation [0,0,0],[1,1,1],-45.degrees
full_group.transform! t1*t2
