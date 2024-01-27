# Default code, use or delete...
mod = Sketchup.active_model # Open model
ent = mod.entities # All entities in model
sel = mod.selection # Current selection

center=[0,0,0]
radius=5
circle=ent.add_circle center,[0,0,1],radius
cf=ent.add_face circle
path=ent.add_circle center,[0,1,0],radius+1
cf.followme path
ent.erase_entities path
