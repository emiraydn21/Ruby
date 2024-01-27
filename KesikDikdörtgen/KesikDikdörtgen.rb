# Default code, use or delete...
mod = Sketchup.active_model # Open model
ent = mod.entities # All entities in model
sel = mod.selection # Current selection

main_face=ent.add_face [0,0,0],[6,0,0],[6,8,0],[0,8,0]
main_face.reverse!
main_face.pushpull 5

cut=ent.add_line [6,6,5],[4,8,5] 
cut.faces[1].pushpull -5
