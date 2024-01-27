# Default code, use or delete...
mod = Sketchup.active_model # Open model
ent = mod.entities # All entities in model
sel = mod.selection # Current selection

# Create the cube
cube = Sketchup.active_model.entities.add_group
face = cube.entities.add_face [-0.5, -0.5, -0.5], [0.5, -0.5, -0.5],
[0.5, 0.5, -0.5], [-0.5, 0.5, -0.5]
face.pushpull 1
# Set timing parameters in seconds
Interval = 0.1
First_limit = 5
Second_limit = 15
Third_limit = 20
# Create the transformations
first_trans = Geom::Transformation.translation [5, 0, 0]
second_trans = Geom::Transformation.rotation [0, 0, 0], [0, 0, 1], -180.
degrees
third_trans = Geom::Transformation.translation [5, 0, 0]
# Create the interval translations
t1 = Geom::Transformation.new
first_int = Geom::Transformation.interpolate t1, first_trans,
(Interval/First_limit)
second_int = Geom::Transformation.interpolate t1, second_trans,
(Interval/(Second_limit - First_limit))
third_int = Geom::Transformation.interpolate t1, third_trans,
(Interval/(Third_limit - Second_limit))
# Initialize the clock and perform the first animation
clock = 0
timer = UI.start_timer(Interval, true) {
 # Increment clock and test if animation complete
 clock += Interval
 # Perform transformation depending on time
 case clock
 when 0..First_limit
 cube.transform! first_int
 when First_limit..Second_limit
 cube.transform! second_int
 when Second_limit..Third_limit
 cube.transform! third_int
 else UI.stop_timer timer
 end
}
