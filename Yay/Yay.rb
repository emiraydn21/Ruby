# Default code, use or delete...
mod = Sketchup.active_model # Open model
ent = mod.entities # All entities in model
sel = mod.selection # Current selection
ent.add_arc [0,0,0],[0,1,0],[0,0,1],5,0,90.degrees

