# Default code, use or delete...
mod = Sketchup.active_model # Open model
ent = mod.entities # All entities in model
sel = mod.selection # Current selection

circle=ent.add_circle [0,0,0],[0,0,1],2
circle_face = ent.add_face circle
path=ent.add_curve [10,0,0],[10,0,5],[10,5,5],[10,5,0],[10,0,0]

circle_face.followme path
