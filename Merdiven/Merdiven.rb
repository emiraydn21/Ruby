# Default code, use or delete...
mod = Sketchup.active_model # Open model
ent = mod.entities # All entities in model
sel = mod.selection # Current selection

stairs=10
rise=8
run=12
width=100
thickness=3

for step in 1..stairs
x1=0
x2=width
y1=run*step
y2=run*(step+1)
z=rise*step

pt1=[x1,y1,z]
pt2=[x2,y1,z]
pt3=[x2,y2,z]
pt4=[x1,y2,z]

new_face=ent.add_face pt1,pt2,pt3,pt4
new_face.pushpull thickness
end
