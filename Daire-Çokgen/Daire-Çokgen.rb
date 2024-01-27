# Default code, use or delete...
mod = Sketchup.active_model # Open model
ent = mod.entities # All entities in model
sel = mod.selection # Current selection
normal=[0,0,1]
radius=1
#Polygon with 8 slides
ent.add_ngon [0,0,0],normal,radius,8
ent.add_circle [3,0,0],normal,radius,8
ent.add_ngon [6,0,0],normal,radius,24
ent.add_circle [9,0,0],normal,radius
