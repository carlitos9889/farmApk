// To parse required this JSON data, do
//
//     final data = dataFromJson(jsonString);

import 'dart:convert';

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    required this.nombreApk,
    required this.temas,
    required this.orientaciones,
    required this.medicamentos,
  });

  String nombreApk;
  List<DataTema> temas;
  Orientaciones orientaciones;
  List<Medicamento> medicamentos;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        nombreApk: json["nombreApk"],
        temas:
            List<DataTema>.from(json["temas"].map((x) => DataTema.fromJson(x))),
        orientaciones: Orientaciones.fromJson(json["orientaciones"]),
        medicamentos: List<Medicamento>.from(
            json["medicamentos"].map((x) => Medicamento.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "nombreApk": nombreApk,
        "temas": List<dynamic>.from(temas.map((x) => x.toJson())),
        "orientaciones": orientaciones.toJson(),
        "medicamentos": List<dynamic>.from(medicamentos.map((x) => x.toJson())),
      };
}

class Medicamento {
  Medicamento({
    required this.med,
    required this.cap,
    required this.ind,
    required this.cont,
    required this.pre,
    required this.ra,
    required this.medicamentoInt,
    required this.pos,
    required this.sobredosis,
  });

  String med;
  String cap;
  String ind;
  String cont;
  String pre;
  String ra;
  String medicamentoInt;
  String pos;
  String sobredosis;

  factory Medicamento.fromJson(Map<String, dynamic> json) => Medicamento(
        med: json["med"],
        cap: json["cap"],
        ind: json["ind"],
        cont: json["cont"],
        pre: json["pre"],
        ra: json["ra"],
        medicamentoInt: json["int"],
        pos: json["pos"],
        sobredosis: json["sobredosis"],
      );

  Map<String, dynamic> toJson() => {
        "med": med,
        "cap": cap,
        "ind": ind,
        "cont": cont,
        "pre": pre,
        "ra": ra,
        "int": medicamentoInt,
        "pos": pos,
        "sobredosis": sobredosis,
      };
}

class Orientaciones {
  Orientaciones({
    required this.preliminares,
    required this.guia,
    required this.objetivos,
  });

  List<Preliminare> preliminares;
  List<OrientacionesGuia> guia;
  List<String> objetivos;

  factory Orientaciones.fromJson(Map<String, dynamic> json) => Orientaciones(
        preliminares: List<Preliminare>.from(
            json["preliminares"].map((x) => Preliminare.fromJson(x))),
        guia: List<OrientacionesGuia>.from(
            json["guia"].map((x) => OrientacionesGuia.fromJson(x))),
        objetivos: List<String>.from(json["objetivos"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "preliminares": List<dynamic>.from(preliminares.map((x) => x.toJson())),
        "guia": List<dynamic>.from(guia.map((x) => x.toJson())),
        "objetivos": List<dynamic>.from(objetivos.map((x) => x)),
      };
}

class OrientacionesGuia {
  OrientacionesGuia({
    required this.header,
    required this.info,
  });

  String header;
  String info;

  factory OrientacionesGuia.fromJson(Map<String, dynamic> json) =>
      OrientacionesGuia(
        header: json["header"],
        info: json["info"],
      );

  Map<String, dynamic> toJson() => {
        "header": header,
        "info": info,
      };
}

class Preliminare {
  Preliminare({
    required this.icon,
    required this.preliminar,
    required this.info,
  });

  String icon;
  String preliminar;
  String info;

  factory Preliminare.fromJson(Map<String, dynamic> json) => Preliminare(
        icon: json["icon"],
        preliminar: json["preliminar"],
        info: json["info"],
      );

  Map<String, dynamic> toJson() => {
        "icon": icon,
        "preliminar": preliminar,
        "info": info,
      };
}

class DataTema {
  DataTema({
    required this.tema,
    required this.img,
    required this.objetivo,
    required this.temas,
    required this.guias,
    required this.quiz,
  });

  String tema;
  String img;
  String objetivo;
  List<TemaTema> temas;
  List<TemaGuia> guias;
  List<Quiz> quiz;

  factory DataTema.fromJson(Map<String, dynamic> json) => DataTema(
        tema: json["tema"],
        img: json["img"],
        objetivo: json["objetivo"],
        temas:
            List<TemaTema>.from(json["temas"].map((x) => TemaTema.fromJson(x))),
        guias:
            List<TemaGuia>.from(json["guias"].map((x) => TemaGuia.fromJson(x))),
        quiz: List<Quiz>.from(json["quiz"].map((x) => Quiz.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "tema": tema,
        "img": img,
        "objetivo": objetivo,
        "temas": List<dynamic>.from(temas.map((x) => x.toJson())),
        "guias": List<dynamic>.from(guias.map((x) => x.toJson())),
        "quiz": List<dynamic>.from(quiz.map((x) => x.toJson())),
      };
}

class TemaGuia {
  TemaGuia({
    required this.temaGuia,
    required this.introduccion,
    required this.objetivos,
    required this.enestetema,
    required this.bibliografia,
    required this.estudio,
  });

  String temaGuia;
  String introduccion;
  List<String> objetivos;
  List<String> enestetema;
  Bibliografia bibliografia;
  Estudio estudio;

  factory TemaGuia.fromJson(Map<String, dynamic> json) => TemaGuia(
        temaGuia: json["temaGuia"],
        introduccion: json["introduccion"],
        objetivos: List<String>.from(json["objetivos"].map((x) => x)),
        enestetema: List<String>.from(json["enestetema"].map((x) => x)),
        bibliografia: Bibliografia.fromJson(json["bibliografia"]),
        estudio: Estudio.fromJson(json["estudio"]),
      );

  Map<String, dynamic> toJson() => {
        "temaGuia": temaGuia,
        "introduccion": introduccion,
        "objetivos": List<dynamic>.from(objetivos.map((x) => x)),
        "enestetema": List<dynamic>.from(enestetema.map((x) => x)),
        "bibliografia": bibliografia.toJson(),
        "estudio": estudio.toJson(),
      };
}

class Bibliografia {
  Bibliografia({
    required this.basica,
    required this.complementaria,
    required this.consulta,
  });

  List<String> basica;
  List<String> complementaria;
  List<String> consulta;

  factory Bibliografia.fromJson(Map<String, dynamic> json) => Bibliografia(
        basica: List<String>.from(json["basica"].map((x) => x)),
        complementaria: List<String>.from(json["complementaria"].map((x) => x)),
        consulta: List<String>.from(json["consulta"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "basica": List<dynamic>.from(basica.map((x) => x)),
        "complementaria": List<dynamic>.from(complementaria.map((x) => x)),
        "consulta": List<dynamic>.from(consulta.map((x) => x)),
      };
}

class Estudio {
  Estudio({
    required this.info,
    required this.puntos,
  });

  String info;
  List<String> puntos;

  factory Estudio.fromJson(Map<String, dynamic> json) => Estudio(
        info: json["info"],
        puntos: List<String>.from(json["puntos"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "info": info,
        "puntos": List<dynamic>.from(puntos.map((x) => x)),
      };
}

class Quiz {
  Quiz({
    required this.ejercicio,
    required this.orden,
    required this.tipo,
    required this.respuestasposibles,
    required this.respuestascorrectas,
  });

  int ejercicio;
  String orden;
  String tipo;
  List<String> respuestasposibles;
  List<String> respuestascorrectas;

  factory Quiz.fromJson(Map<String, dynamic> json) => Quiz(
        ejercicio: json["ejercicio"],
        orden: json["orden"],
        tipo: json["tipo"],
        respuestasposibles:
            List<String>.from(json["respuestasposibles"].map((x) => x)),
        respuestascorrectas:
            List<String>.from(json["respuestascorrectas"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "ejercicio": ejercicio,
        "orden": orden,
        "tipo": tipo,
        "respuestasposibles":
            List<dynamic>.from(respuestasposibles.map((x) => x)),
        "respuestascorrectas":
            List<dynamic>.from(respuestascorrectas.map((x) => x)),
      };
}

class TemaTema {
  TemaTema({
    required this.tema,
    required this.puntos,
  });

  String tema;
  List<String> puntos;

  factory TemaTema.fromJson(Map<String, dynamic> json) => TemaTema(
        tema: json["tema"],
        puntos: List<String>.from(json["puntos"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "tema": tema,
        "puntos": List<dynamic>.from(puntos.map((x) => x)),
      };
}
