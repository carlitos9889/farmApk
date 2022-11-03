// Clase para tener la informacion de los libros
class Book {
  String docTitle;
  String docPath;
  int pageNum;
  String autor;
  String edicion;
  String imagen;

  Book(this.docTitle, this.autor, this.edicion, this.imagen, this.docPath,
      this.pageNum);

// Funcion estatica para devolver la lista de todos los libros
  static List<Book> docList = [
    Book(
      'Farmacología\nClínica',
      'Francisco J. Morón Rodríguez',
      '1era Edición',
      'assets/imgs/book_moron.png',
      'assets/books/moron.pdf',
      761,
    ),
    Book(
      'Farmacología\nGeneral',
      'Mayra Levy Rodríguez',
      '1era Edición',
      'assets/imgs/farmacologia general moron.jpg',
      'assets/books/FG.pdf',
      761,
    ),
    Book(
      'Farmacología\nHumana',
      'Jesús Flórez',
      '3era Edición',
      'assets/imgs/farmacologia-humana.jpg',
      'assets/books/FH.pdf',
      761,
    ),
    Book(
      'Las Bases\nFarmacológicas',
      'GoodMan & Gilman',
      '1era Edición',
      'assets/imgs/goodman.jpg',
      'assets/books/GG.pdf',
      761,
    ),
    Book(
      'Guía Cubana',
      'Manuel Delfín Pérez Caballero',
      '1era Edición',
      'assets/imgs/guia-cubana.jpg',
      'assets/books/GC.pdf',
      761,
    ),
  ];
}
