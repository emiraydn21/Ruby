# Default code, use or delete...
mod = Sketchup.active_model # Open model
ent = mod.entities # All entities in model
sel = mod.selection # Current selection
pt1=[0,1,1]
pt2=[0.588,-0.809,1]
pt3=[-0.951,0.309,1]
pt4=[0.951,0.309,1]
pt5=[-0.588,-0.809,1]
ent.add_line pt1,pt2
ent.add_line pt2,pt3
ent.add_line pt3,pt4
ent.add_line pt4,pt5
ent.add_line pt5,pt1
