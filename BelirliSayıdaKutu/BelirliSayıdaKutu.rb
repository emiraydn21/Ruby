# Default code, use or delete...
mod = Sketchup.active_model # Open model
ent = mod.entities # All entities in model
sel = mod.selection # Current selection

n=5 #Kutu Sayısı
s=100 #Boşluk
w=20 #Genişlik

(0..n-1).each {|i|
(0..n-1).each {|k|
(0..n-1).each {|j|

#1.yüzeyin oluşturulması
face=ent.add_face [i*s,j*s,k*s],[i*s,j*s+w,k*s],[i*s+w,j*s+w,k*s],
[i*s+w,j*s,k*s]
face.pushpull -w

}
}
}
