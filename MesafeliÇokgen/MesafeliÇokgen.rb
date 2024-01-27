# Default code, use or delete...
mod = Sketchup.active_model # Open model
ent = mod.entities # All entities in model
sel = mod.selection # Current selection
mf=ent.add_face [0,0,0],[5,0,0],[5,8,0],[0,8,0]
mf.reverse!
mf.pushpull 6,true
cut=ent.add_line [5,7,6],[5,8,5]

cut.faces[0].followme mf.edges
