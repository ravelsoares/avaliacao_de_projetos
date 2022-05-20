class Result {
  final String avaliado;
  final double media;
  final int avaliacoes;

  Result({
    required this.avaliado,
    this.media = 0,
    this.avaliacoes = 0,
  });
  @override
  String toString() {
    print('Avaliado: $avaliado; média: $media; avaliações: $avaliacoes');
    return super.toString();
  }
}
