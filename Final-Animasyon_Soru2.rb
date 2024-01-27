mod = Sketchup.active_model # Open model
ent = mod.entities # All entities in model
sel = mod.selection # Current selection
# Birincil yüzü oluşturun
circle = ent.add_circle [0,0,1], [0,0,1], 2
circle_face = ent.add_face circle

circle = ent.add_circle [0,0,2], [0,0,1], 3
circle_face = ent.add_face circle

circle = ent.add_circle [0,0,3], [0,0,1], 4
circle_face = ent.add_face circle

circle = ent.add_circle [0,0,4], [0,0,1], 5
circle_face = ent.add_face circle

circle = ent.add_circle [0,0,5], [0,0,1], 6
circle_face = ent.add_face circle

circle = ent.add_circle [0,0,6], [0,0,1], 7
circle_face = ent.add_face circle

circle = ent.add_circle [0,0,7], [0,0,1], 8
circle_face = ent.add_face circle

circle = ent.add_circle [0,0,8], [0,0,1], 9
circle_face = ent.add_face circle

circle = ent.add_circle [0,0,9], [0,0,1], 10
circle_face = ent.add_face circle

circle = ent.add_circle [0,0,10], [0,0,1], 11
circle_face = ent.add_face circle

circle = ent.add_circle [0,0,11], [0,0,1], 12
circle_face = ent.add_face circle

circle = ent.add_circle [0,0,12], [0,0,1], 13
circle_face = ent.add_face circle

circle = ent.add_circle [0,0,13], [0,0,1], 14
circle_face = ent.add_face circle

c = Sketchup.active_model.active_view.camera
p = Sketchup.active_model.pages
e = c.eye
r = Geom::Transformation.rotation([0,0,0],[0,0,1],Math::PI / 180.0)
for i in 0...360
 c.set(e,[0,0,0],[0,0,1])
 p.add("Scene " + (i+1).to_s)
 e.transform!(r)
end
