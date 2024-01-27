# Default code, use or delete...
mod = Sketchup.active_model # Open model
ents = mod.entities # All entities in model
sel = mod.selection # Current selection

candle_curve=ents.add_curve(
[0,0,0], [0.625,0,0],
[0.625,0,2.815], [0.208,0,2.815],
[0.208,0,3.173], [0.249,0,3.180],
[0.288,0,3.194], [0.325,0,3.214],
[0.358,0,3.239], [0.388,0,3.269],
[0.412,0,3.303], [0.431,0,3.340],
[0.444,0,3.380], [0.450,0,3.422],
[0.450,0,3.463], [0.444,0,3.505],
[0,0,4.2], [0,0,0])

candle_face=ents.add_face candle_curve

path=ents.add_circle [0,0,0],[0,0,1],1
candle_face.followme path
ents.erase_entities path
