class AlbumModel {
  String cantor;
  String nome;
  String img;

  AlbumModel({this.cantor, this.nome, this.img});
}


List<AlbumModel> albums = [
  AlbumModel(
    cantor: "H Baby",
    nome: "Quarentena Rija",
    img: "assets/hbaby.jpg"
  ),

  AlbumModel(
    cantor: "Migos",
    nome: "Culture II (2018)",
    img: "assets/Culture.jpg",
  ),

  AlbumModel(
    cantor: "Mobbers",
    nome: "Lockdown (Ep 2020)",
    img: "assets/Mobbers-Sem-Pressa.jpg" 
  ),

  AlbumModel(
    cantor: "Prodigio",
    nome: "Castelos (Álbum) 2019",
    img: "assets/Castelos.jpg"
  ),

  AlbumModel(
    cantor: "Calema",
    nome: "Yellow",
    img: "assets/Yellow.png"
  ),

  AlbumModel(
    cantor: "Toy Toy(T-Rex)",
    nome: "Chá de Camomila",
    img: "assets/toytoy.png"
  ),

  AlbumModel(
    cantor: "Tory Lanez",
    nome: "Chixtape",
    img: "assets/Chixtape4.png"
  ),

];
