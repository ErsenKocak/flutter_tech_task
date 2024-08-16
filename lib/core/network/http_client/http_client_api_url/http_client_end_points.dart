enum HttpClientEndPoints {
  GetBooks('/books'),
  GetBookDetail('/book'),
  RefreshToken('');

  const HttpClientEndPoints(this.URL);
  final String URL;
}
