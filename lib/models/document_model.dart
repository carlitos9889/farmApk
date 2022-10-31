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
      'Farmacologia\nClinica',
      'Francisco J. Moron Rodriguez',
      '1era Edicion',
      'assets/imgs/book_moron.png',
      'assets/books/moron.pdf',
      761,
    ),
    Book(
      'Farmacologia\nGeneral',
      'Mayra Levy Rodríguez',
      '1era Edicion',
      'assets/imgs/farmacologia general moron.jpg',
      'assets/books/FG.pdf',
      761,
    ),
    Book(
      'Farmacologia\nHumana',
      'Jesús Florez',
      '3era Edicion',
      'assets/imgs/farmacologia-humana.jpg',
      'assets/books/FH.pdf',
      761,
    ),
    Book(
      'Las Bases\nFarmacologicas',
      'GoodMan & Gilman',
      '1era Edicion',
      'assets/imgs/goodman.jpg',
      'assets/books/GG.pdf',
      761,
    ),
    Book(
      'Guia Cubana',
      'Manuel Delfín Pérez Caballero',
      '1era Edicion',
      'assets/imgs/guia-cubana.jpg',
      'assets/books/GC.pdf',
      761,
    ),
  ];
}
