--Filtar por clase y nivel ordenados
db.personajes.find({clase: "Mago"}).sort({ nivel: 1})
--Filtar por Misiones con determianda cantidad de dinero
db.misiones.find({
  dificultad: "media",
  recompensa: { $gt: 200 }
});
Por clase y nivel
db.personajes.find({
  clase: "Mago",
  nivel: { $gte: 18 }
});

--Ver estructura trae un objeto
db.personajes.findOne()
--Cantidad de oro
db.personajes.find({ oro: { $gt: 1000 } })
