# Default code, use or delete...
mod = Sketchup.active_model # Open model
ent = mod.entities # All entities in model
sel = mod.selection # Current selection

$rows=25
$cols=15
$grid=Array.new($rows){Array.new($cols)}
i,j=15,4;
h=5;
pts=[]
pts[0]=[0,0,0]
pts[1]=[1,0,0]
pts[2]=[1,1,0]
pts[3]=[0,1,0]
grp=ent.add_group
face=grp.entities.add_face pts;
face.back_material=[200,(255/($cols-1)*j).round,(255/($cols-1)*i).round]
face.pushpull -h

z_scale =7;
st=Geom::Transformation.scaling(1,1,z_scale)
grp.transformation *=st;

rt=Geom::Transformation.rotation(ORIGIN,X_AXIS,30)
grp.transform!(rt);

$view.refresh
sleep 1
p "emir 21"





