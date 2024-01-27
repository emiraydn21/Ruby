# Default code, use or delete...
mod = Sketchup.active_model # Open model
ent = mod.entities # All entities in model
sel = mod.selection # Current selection

face=ent.add_face [0,0,0],[1,0,0],[1,1,0],[0,1,0]
face.reverse!
face.pushpull 1
group1=ent.add_group face.all_connected
ent_g=group1.entities
circle = ent_g.add_circle [0.5,0.5,1],[0,0,1],0.25
circle[0].faces[0].pushpull -1
group2 = group1.copy
tran=Geom::Transformation.translation [10,0,0]
group2.transform! tran
