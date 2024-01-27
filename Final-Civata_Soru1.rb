mod = Sketchup.active_model # Open model
ents = mod.entities # All entities in model
sel = mod.selection # Current selection
#vida kafası yap
hex_curve=ents.add_circle [0,0,0],[0,0,1],4 #Merkezi [0,0,0], normali [0,0,1] ve yarıçapı 4 birim olan bir daire ekler. Bu, vida başının alt yüzeyini temsil eder.
hex_face=ents.add_face hex_curve #Dairenin yüzeyini temsil eden bir yüzey (hex_face) ekler.
hex_face.pushpull -1 #Yüzeyi -3 birim iterek, vida başını oluşturur.
#vida yap
screw_curve=ents.add_circle [0,0,-8],[0,0,1],1.5 #Merkezi [0,0,-8], normali [0,0,1] ve yarıçapı 1.5 birim olan başka bir daire ekler. Bu, vida gövdesini temsil eder.
screw_face=ents.add_face screw_curve #Dairenin yüzeyini temsil eden bir yüzey (screw_face) ekler.
screw_face.pushpull 8 #Yüzeyi 8 birim itererek, vida gövdesini oluşturur.
bolt_group=ents.add_group ents.to_a #Modeldeki tüm varlıkları içeren bir grup oluşturur.
bolt_group.name="Hex Bolt" #Oluşturulan grup için adını "Hex Bolt" olarak ayarlar.
#somon yap
nut_curve=ents.add_ngon [10,0,0],[0,0,1],3,6 #Merkezi [10,0,0], normali [0,0,1] olan ve 6 kenarı olan bir altıgen ekler. Bu, somonun alt yüzeyini temsil eder.
nut_face=ents.add_face nut_curve #Altıgenin yüzeyini temsil eden bir yüzey (nut_face) ekler.
nut_face.reverse! #Yüzeyin normalini tersine çevirir. Bu, somonun doğru tarafının yukarı bakmasını sağlar.
nut_face.pushpull 1.5 #Yüzeyi 1.5 birim itererek, somonun yüksekliğini belirler.
cut_curve=ents.add_circle [10,0,0],[0,0,1],1.5 #Merkezi [10,0,0], normali [0,0,1] ve yarıçapı 1.5 birim olan bir daire ekler. Bu, somonun içindeki deliği temsil eder.
cut_curve[0].faces[0].pushpull -1.5 #Deliği temsil eden yüzeyi -1.5 birim itererek, somonun içinde bir boşluk oluşturur.
nut_group=ents.add_group cut_curve[0].faces[1].all_connected #Somonu temsil eden yüzeyi içeren bir grup oluşturur.
nut_group.name="Square Nut" #Oluşturulan grup için adını "Square Nut" olarak ayarlar.
nut_group.transform! [-10,0,-7] #Somon grubunu belirtilen ölçülerde hareket ettirir.
#somonu vidaya taşı
full_group=ents.add_group bolt_group,nut_group #Vida başı ve somon gruplarını içeren bir grup oluşturur.
full_group.name="Nut-Bolt Group" #Oluşturulan grup için adını "Nut-Bolt Group" olarak ayarlar.
t2=Geom::Transformation.translation [10,10,10] #Bir translasyon dönüşümü oluşturur.
t1=Geom::Transformation.rotation [0,0,0],[1,1,1],-45.degrees #Bir döndürme dönüşümü oluşturur. Bu dönüşüm, -45 derece açıyla yapılır.
full_group.transform! t1*t2 #İki dönüşümü kombinleyerek, tüm grup üzerine uygular
