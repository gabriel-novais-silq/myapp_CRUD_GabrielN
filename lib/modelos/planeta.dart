class Planeta {
   int? id;
   String nome;
   double tamanho;
   double distancia;
   String? apelido;


// Construtor da classe Planeta
   Planeta({
    this.id,
    required this.nome,
    required this.tamanho,
    required this.distancia,
    this.apelido,
  });
//
   Planeta.vazio()
      : nome = '',
        tamanho = 0.0,
        distancia = 0.0,
        apelido = '';
}
