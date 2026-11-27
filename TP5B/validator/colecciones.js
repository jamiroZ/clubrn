db.createCollection("Cuota", {
  validator: { $jsonSchema: {
    bsonType: "object",
    required: ["socio", "periodo", "tipo", "fecha", "monto", "estadoDePago"],
    properties: {
      socio: { bsonType: "object", required: ["tipoDni", "nroDni"],
               properties: { tipoDni: { bsonType: "string" }, nroDni: { bsonType: "string" } } },
      periodo: { bsonType: "string" },
      tipo: { enum: ["mensual", "federacion"] },
      fecha: { bsonType: "date" },
      monto: { bsonType: "number", minimum: 0 },
      estadoDePago: { enum: ["No saldada", "Saldada", "Anulada"] },
      pago: { bsonType: "object", required: ["fecha", "monto"],
              properties: { fecha: { bsonType: "date" }, monto: { bsonType: "number" } } }
    }
  } }
})

db.Cuota.createIndex({ "socio.tipoDni": 1, "socio.nroDni": 1, periodo: 1, tipo: 1 }, { unique: true })

db.createCollection("Persona", {
  validator: { $jsonSchema: {
    bsonType: "object",
    required: ["_id", "nombre", "apellido", "tipos"],
    properties: {
      _id: { bsonType: "object", required: ["tipoDni", "nroDni"],
             properties: { tipoDni: { bsonType: "string" }, nroDni: { bsonType: "string" } } },
      nombre: { bsonType: "string" },
      apellido: { bsonType: "string" },
      tipos: { bsonType: "array", minItems: 1, items: { enum: ["socio", "profesor"] } }
    }
  } }
})

db.createCollection("Rol", {
  validator: { $jsonSchema: {
    bsonType: "object",
    required: ["_id", "permisos"],
    properties: {
      _id: { bsonType: "string" },
      permisos: { bsonType: "array", items: { bsonType: "string" } }
    }
  } }
})

db.createCollection("Medico", {
  validator: { $jsonSchema: {
    bsonType: "object",
    required: ["_id", "nombre", "apellido"],
    properties: {
      _id: { bsonType: "string" },
      nombre: { bsonType: "string" },
      apellido: { bsonType: "string" },
      telefono: { bsonType: "string" }
    }
  } }
})

db.createCollection("CargoAdministrativo", {
  validator: { $jsonSchema: {
    bsonType: "object",
    required: ["_id", "descripcion"],
    properties: {
      _id: { bsonType: "string" },
      descripcion: { bsonType: "string" }
    }
  } }
})

db.createCollection("Notificacion", {
  validator: { $jsonSchema: {
    bsonType: "object",
    required: ["fecha", "tipo", "mensaje", "nombreUsuario"],
    properties: {
      fecha: { bsonType: "date" },
      tipo: { bsonType: "string" },
      mensaje: { bsonType: "string" },
      nombreUsuario: { bsonType: "string" }
    }
  } }
})

db.createCollection("Disciplina", {
  validator: { $jsonSchema: {
    bsonType: "object",
    required: ["_id", "categorias"],
    properties: {
      _id: { bsonType: "string" },
      categorias: { bsonType: "array", items: {
        bsonType: "object",
        required: ["nombreCategoria", "rangoEtario"],
        properties: {
          nombreCategoria: { bsonType: "string" },
          enfoque: { bsonType: "string" },
          rangoEtario: { bsonType: "object", required: ["edadMin", "edadMax"],
                         properties: { edadMin: { bsonType: "int", minimum: 0 }, edadMax: { bsonType: "int", minimum: 0 } } },
          profesores: { bsonType: "array" }
        }
      } }
    }
  } }
})

db.createCollection("Clase", {
  validator: { $jsonSchema: {
    bsonType: "object",
    required: ["fecha", "horaInicio", "horaFin", "categoria", "planilla"],
    properties: {
      fecha: { bsonType: "date" },
      horaInicio: { bsonType: "string" },
      horaFin: { bsonType: "string" },
      categoria: { bsonType: "object", required: ["nombreDisciplina", "nombreCategoria"],
                   properties: { nombreDisciplina: { bsonType: "string" }, nombreCategoria: { bsonType: "string" } } },
      planilla: { bsonType: "object", required: ["profesor", "asistencias"],
                  properties: { profesor: { bsonType: "object", required: ["tipoDni", "nroDni"] },
                                asistencias: { bsonType: "array" } } }
    }
  } }
})
