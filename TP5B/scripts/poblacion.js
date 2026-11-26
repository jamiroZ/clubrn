db.Persona.insertMany([
  {
    _id: { tipoDni: "DNI", nroDni: "30000001" },
    nombre: "Marcos",
    apellido: "Sosa",
    telefono: "2995000001",
    fechaNacimiento: new Date("1995-03-10T00:00:00Z"),
    tipos: ["socio", "profesor"],
    fechaIngreso: new Date("2016-03-10T00:00:00Z"),
    usuario: {
      nombreUsuario: "DNI30000001",
      roles: [
        {
          nombreRol: "Tesorero",
          fechaInicioRol: new Date("2020-01-01T00:00:00Z"),
        },
      ],
    },
    cargos: [
      {
        idCargo: "1",
        fechaInicioCargo: new Date("2026-01-01T00:00:00Z"),
        fechaFinCargo: new Date("2026-12-31T00:00:00Z"),
      },
    ],
  },
  {
    _id: { tipoDni: "DNI", nroDni: "30000002" },
    nombre: "Micaela",
    apellido: "Castro",
    telefono: "2995000002",
    fechaNacimiento: new Date("1998-08-01T00:00:00Z"),
    tipos: ["socio"],
    usuario: {
      nombreUsuario: "DNI30000002",
      roles: [
        {
          nombreRol: "Recepcionista",
          fechaInicioRol: new Date("2021-05-01T00:00:00Z"),
        },
      ],
    },
    cargos: [
      {
        idCargo: "2",
        fechaInicioCargo: new Date("2026-01-01T00:00:00Z"),
        fechaFinCargo: new Date("2026-12-31T00:00:00Z"),
      },
    ],
  },
  {
    _id: { tipoDni: "LC", nroDni: "30000003" },
    nombre: "Lucía",
    apellido: "Pérez",
    telefono: "2995000003",
    fechaNacimiento: new Date("1993-07-10T00:00:00Z"),
    tipos: ["profesor"],
    fechaIngreso: new Date("2018-07-10T00:00:00Z"),
    usuario: {
      nombreUsuario: "LC30000003",
      roles: [
        {
          nombreRol: "Profesor",
          fechaInicioRol: new Date("2018-07-10T00:00:00Z"),
        },
      ],
    },
  },
]);
db.Persona.insertMany([
  {
    _id: { tipoDni: "DNI", nroDni: "30000004" },
    nombre: "Matías",
    apellido: "Lozano",
    telefono: "2995000004",
    fechaNacimiento: new Date("2003-01-30T00:00:00Z"),
    tipos: ["socio"],
    usuario: {
      nombreUsuario: "DNI30000004",
      roles: [
        {
          nombreRol: "Administrativo General",
          fechaInicioRol: new Date("2022-03-01T00:00:00Z"),
        },
      ],
    },
    cargos: [
      {
        idCargo: "3",
        fechaInicioCargo: new Date("2026-01-01T00:00:00Z"),
        fechaFinCargo: new Date("2026-12-31T00:00:00Z"),
      },
    ],
  },
  {
    _id: { tipoDni: "CI", nroDni: "30000007" },
    nombre: "Marina",
    apellido: "Duarte",
    telefono: "2995000007",
    fechaNacimiento: new Date("1997-04-15T00:00:00Z"),
    tipos: ["socio"],
    usuario: {
      nombreUsuario: "CI30000007",
      roles: [
        {
          nombreRol: "Socio",
          fechaInicioRol: new Date("2017-04-20T00:00:00Z"),
        },
      ],
    },
  },
  {
    _id: { tipoDni: "PASAPORTE", nroDni: "30000008" },
    nombre: "Sofía",
    apellido: "Ríos",
    telefono: "2995000008",
    fechaNacimiento: new Date("2005-06-01T00:00:00Z"),
    tipos: ["socio"],
    usuario: {
      nombreUsuario: "PASAPORTE30000008",
      roles: [
        {
          nombreRol: "Socio",
          fechaInicioRol: new Date("2020-06-01T00:00:00Z"),
        },
      ],
    },
  },
]);
db.Disciplina.insertMany([
  {
    _id: "Voley",
    categorias: [
      {
        nombreCategoria: "Infantiles",
        enfoque: "Formativo",
        rangoEtario: { edadMin: NumberInt(8), edadMax: NumberInt(12) },
        profesores: [
          {
            rolProfesor: "Director Técnico",
            profesor: { tipoDni: "DNI", nroDni: "30000001" },
          },
          {
            rolProfesor: "Preparador Físico",
            profesor: { tipoDni: "LC", nroDni: "30000003" },
          },
        ],
      },
      {
        nombreCategoria: "Juveniles",
        enfoque: "Competitivo",
        rangoEtario: { edadMin: NumberInt(13), edadMax: NumberInt(17) },
        profesores: [
          {
            rolProfesor: "Director Técnico",
            profesor: { tipoDni: "LC", nroDni: "30000003" },
          },
          {
            rolProfesor: "Preparador Físico",
            profesor: { tipoDni: "DNI", nroDni: "30000001" },
          },
        ],
      },
      {
        nombreCategoria: "Adultos",
        enfoque: "Recreativo",
        rangoEtario: { edadMin: NumberInt(18), edadMax: NumberInt(65) },
        profesores: [],
      },
    ],
  },
  {
    _id: "Handball",
    categorias: [
      {
        nombreCategoria: "Infantiles",
        enfoque: "Formativo",
        rangoEtario: { edadMin: NumberInt(8), edadMax: NumberInt(12) },
        profesores: [
          {
            rolProfesor: "Director Técnico",
            profesor: { tipoDni: "LC", nroDni: "30000003" },
          },
          {
            rolProfesor: "Preparador Físico",
            profesor: { tipoDni: "DNI", nroDni: "30000001" },
          },
        ],
      },
      {
        nombreCategoria: "Juveniles",
        enfoque: "Competitivo",
        rangoEtario: { edadMin: NumberInt(13), edadMax: NumberInt(17) },
        profesores: [
          {
            rolProfesor: "Director Técnico",
            profesor: { tipoDni: "DNI", nroDni: "30000001" },
          },
          {
            rolProfesor: "Preparador Físico",
            profesor: { tipoDni: "LC", nroDni: "30000003" },
          },
        ],
      },
      {
        nombreCategoria: "Adultos",
        enfoque: "Competitivo",
        rangoEtario: { edadMin: NumberInt(18), edadMax: NumberInt(60) },
        profesores: [],
      },
    ],
  },
]);
db.Disciplina.insertMany([
  {
    _id: "Basquet",
    categorias: [
      {
        nombreCategoria: "Juveniles",
        enfoque: "Competitivo",
        rangoEtario: { edadMin: NumberInt(13), edadMax: NumberInt(17) },
        profesores: [],
      },
    ],
  },
  {
    _id: "Natacion",
    categorias: [
      {
        nombreCategoria: "Adultos",
        enfoque: "Recreativo",
        rangoEtario: { edadMin: NumberInt(18), edadMax: NumberInt(70) },
        profesores: [],
      },
    ],
  },
  {
    _id: "Futbol",
    categorias: [
      {
        nombreCategoria: "Infantiles",
        enfoque: "Formativo",
        rangoEtario: { edadMin: NumberInt(7), edadMax: NumberInt(12) },
        profesores: [],
      },
    ],
  },
  {
    _id: "Hockey",
    categorias: [
      {
        nombreCategoria: "Juveniles",
        enfoque: "Competitivo",
        rangoEtario: { edadMin: NumberInt(13), edadMax: NumberInt(17) },
        profesores: [],
      },
    ],
  },
]);
db.Rol.insertMany([
  { _id: "Socio", permisos: ["ver_perfil", "ver_asistencias", "ver_cuotas"] },
  {
    _id: "Profesor",
    permisos: ["cargar_asistencia", "notificar_potencial_socio"],
  },
  {
    _id: "Tesorero",
    permisos: ["ver_deudores", "registrar_pago", "baja_seguro"],
  },
  {
    _id: "Recepcionista",
    permisos: ["registrar_potencial_socio", "ver_no_aptos"],
  },
  {
    _id: "Administrativo General",
    permisos: [
      "aprobar_socio",
      "cargar_certificado",
      "alta_seguro",
      "actualizar_estado",
    ],
  },
  { _id: "Coordinador", permisos: ["ver_reportes", "gestionar_categorias"] },
]);
db.CargoAdministrativo.insertMany([
  { _id: "1", descripcion: "Tesorero" },
  { _id: "2", descripcion: "Recepcionista" },
  { _id: "3", descripcion: "Administrativo General" },
  { _id: "4", descripcion: "Presidente" },
  { _id: "5", descripcion: "Secretario" },
  { _id: "6", descripcion: "Vocal" },
]);
db.Medico.insertMany([
  {
    _id: "MP-501",
    nombre: "Marina",
    apellido: "Duarte",
    telefono: "2994100501",
  },
  {
    _id: "MP-502",
    nombre: "Hernán",
    apellido: "Silva",
    telefono: "2994100502",
  },
  {
    _id: "MP-503",
    nombre: "Carla",
    apellido: "Molina",
    telefono: "2994100503",
  },
  { _id: "MP-504", nombre: "Pablo", apellido: "Rojas", telefono: "2994100504" },
  {
    _id: "MP-505",
    nombre: "Lucía",
    apellido: "Vargas",
    telefono: "2994100505",
  },
  {
    _id: "MP-506",
    nombre: "Andrés",
    apellido: "Herrera",
    telefono: "2994100506",
  },
]);
db.Notificacion.insertMany([
  {
    fecha: new Date("2026-07-05T14:15:00Z"),
    tipo: "Confirmacion",
    mensaje: "Se registró el pago de la cuota de julio.",
    nombreUsuario: "DNI30000001",
  },
  {
    fecha: new Date("2026-08-18T11:30:00Z"),
    tipo: "Aviso",
    mensaje: "Marina Duarte alcanzó ausencias consecutivas.",
    nombreUsuario: "CI30000007",
  },
  {
    fecha: new Date("2026-08-20T09:00:00Z"),
    tipo: "Recordatorio",
    mensaje: "Hay registros pendientes de alta.",
    nombreUsuario: "DNI30000004",
  },
  {
    fecha: new Date("2026-09-10T10:00:00Z"),
    tipo: "Recordatorio",
    mensaje: "Cuota mensual pendiente de pago.",
    nombreUsuario: "DNI30000002",
  },
  {
    fecha: new Date("2026-10-12T16:45:00Z"),
    tipo: "Aviso",
    mensaje: "Certificado médico próximo a vencer.",
    nombreUsuario: "PASAPORTE30000008",
  },
  {
    fecha: new Date("2026-11-15T08:30:00Z"),
    tipo: "Confirmacion",
    mensaje: "Alta de categoría confirmada.",
    nombreUsuario: "LC30000003",
  },
]);
db.Clase.insertMany([
  {
    fecha: new Date("2026-08-03T17:00:00Z"),
    horaInicio: "17:00",
    horaFin: "18:30",
    categoria: { nombreDisciplina: "Voley", nombreCategoria: "Infantiles" },
    planilla: {
      profesor: { tipoDni: "DNI", nroDni: "30000001" },
      asistencias: [
        {
          estadoAsistencia: "Presente",
          socio: { tipoDni: "DNI", nroDni: "30000002" },
        },
        {
          estadoAsistencia: "Ausente",
          socio: { tipoDni: "DNI", nroDni: "30000004" },
        },
      ],
    },
  },
  {
    fecha: new Date("2026-08-03T18:30:00Z"),
    horaInicio: "18:30",
    horaFin: "20:00",
    categoria: { nombreDisciplina: "Voley", nombreCategoria: "Juveniles" },
    planilla: {
      profesor: { tipoDni: "LC", nroDni: "30000003" },
      asistencias: [
        {
          estadoAsistencia: "Presente",
          socio: { tipoDni: "DNI", nroDni: "30000004" },
        },
        {
          estadoAsistencia: "Ausente con justificacion",
          socio: { tipoDni: "CI", nroDni: "30000007" },
        },
      ],
    },
  },
  {
    fecha: new Date("2026-08-04T20:00:00Z"),
    horaInicio: "20:00",
    horaFin: "21:30",
    categoria: { nombreDisciplina: "Voley", nombreCategoria: "Adultos" },
    planilla: {
      profesor: { tipoDni: "DNI", nroDni: "30000001" },
      asistencias: [
        {
          estadoAsistencia: "Presente",
          socio: { tipoDni: "DNI", nroDni: "30000001" },
        },
        {
          estadoAsistencia: "Presente",
          socio: { tipoDni: "DNI", nroDni: "30000002" },
        },
      ],
    },
  },
]);
db.Clase.insertMany([
  {
    fecha: new Date("2026-08-05T17:00:00Z"),
    horaInicio: "17:00",
    horaFin: "18:30",
    categoria: { nombreDisciplina: "Handball", nombreCategoria: "Infantiles" },
    planilla: {
      profesor: { tipoDni: "LC", nroDni: "30000003" },
      asistencias: [
        {
          estadoAsistencia: "Presente",
          socio: { tipoDni: "CI", nroDni: "30000007" },
        },
        {
          estadoAsistencia: "Ausente",
          socio: { tipoDni: "PASAPORTE", nroDni: "30000008" },
        },
      ],
    },
  },
  {
    fecha: new Date("2026-08-05T18:30:00Z"),
    horaInicio: "18:30",
    horaFin: "20:00",
    categoria: { nombreDisciplina: "Handball", nombreCategoria: "Juveniles" },
    planilla: {
      profesor: { tipoDni: "DNI", nroDni: "30000001" },
      asistencias: [
        {
          estadoAsistencia: "Presente",
          socio: { tipoDni: "DNI", nroDni: "30000004" },
        },
        {
          estadoAsistencia: "Presente",
          socio: { tipoDni: "PASAPORTE", nroDni: "30000008" },
        },
      ],
    },
  },
  {
    fecha: new Date("2026-11-24T19:00:00Z"),
    horaInicio: "19:00",
    horaFin: "20:30",
    categoria: { nombreDisciplina: "Handball", nombreCategoria: "Adultos" },
    planilla: {
      profesor: { tipoDni: "LC", nroDni: "30000003" },
      asistencias: [
        {
          estadoAsistencia: "Ausente con justificacion",
          socio: { tipoDni: "DNI", nroDni: "30000002" },
        },
        {
          estadoAsistencia: "Presente",
          socio: { tipoDni: "CI", nroDni: "30000007" },
        },
      ],
    },
  },
]);
db.Cuota.insertMany([
  {
    socio: { tipoDni: "DNI", nroDni: "30000001" },
    periodo: "2026-11",
    tipo: "mensual",
    fecha: new Date("2026-11-05T10:00:00Z"),
    monto: 20000,
    estadoDePago: "No saldada",
  },
  {
    socio: { tipoDni: "DNI", nroDni: "30000002" },
    periodo: "2026-11",
    tipo: "mensual",
    fecha: new Date("2026-11-05T10:00:00Z"),
    monto: 20000,
    estadoDePago: "Saldada",
    pago: { fecha: new Date("2026-11-05T15:00:00Z"), monto: 20000 },
  },
  {
    socio: { tipoDni: "DNI", nroDni: "30000004" },
    periodo: "2026-11",
    tipo: "mensual",
    fecha: new Date("2026-11-05T10:00:00Z"),
    monto: 20000,
    estadoDePago: "No saldada",
  },
  {
    socio: { tipoDni: "CI", nroDni: "30000007" },
    periodo: "2026-11",
    tipo: "mensual",
    fecha: new Date("2026-11-05T10:00:00Z"),
    monto: 20000,
    estadoDePago: "No saldada",
  },
]);
db.Cuota.insertMany([
  {
    socio: { tipoDni: "DNI", nroDni: "30000001" },
    periodo: "2026-11",
    tipo: "mensual",
    fecha: new Date("2026-11-05T10:00:00Z"),
    monto: 20000,
    estadoDePago: "No saldada",
  },
  {
    socio: { tipoDni: "DNI", nroDni: "30000002" },
    periodo: "2026-11",
    tipo: "mensual",
    fecha: new Date("2026-11-05T10:00:00Z"),
    monto: 20000,
    estadoDePago: "Saldada",
    pago: { fecha: new Date("2026-11-05T15:00:00Z"), monto: 20000 },
  },
  {
    socio: { tipoDni: "DNI", nroDni: "30000004" },
    periodo: "2026-11",
    tipo: "mensual",
    fecha: new Date("2026-11-05T10:00:00Z"),
    monto: 20000,
    estadoDePago: "No saldada",
  },
  {
    socio: { tipoDni: "CI", nroDni: "30000007" },
    periodo: "2026-11",
    tipo: "mensual",
    fecha: new Date("2026-11-05T10:00:00Z"),
    monto: 20000,
    estadoDePago: "No saldada",
  },
]);
db.Cuota.insertMany([
  {
    socio: { tipoDni: "PASAPORTE", nroDni: "30000008" },
    periodo: "2026-11",
    tipo: "mensual",
    fecha: new Date("2026-11-05T10:00:00Z"),
    monto: 20000,
    estadoDePago: "Saldada",
    pago: { fecha: new Date("2026-11-07T09:00:00Z"), monto: 20000 },
  },
  {
    socio: { tipoDni: "DNI", nroDni: "30000001" },
    periodo: "2026-11",
    tipo: "federacion",
    fecha: new Date("2026-11-24T11:00:00Z"),
    monto: 30000,
    estadoDePago: "No saldada",
  },
  {
    socio: { tipoDni: "DNI", nroDni: "30000004" },
    periodo: "2026-10",
    tipo: "mensual",
    fecha: new Date("2026-10-05T10:00:00Z"),
    monto: 18000,
    estadoDePago: "No saldada",
  },
]);
