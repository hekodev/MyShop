class HttException implements Exception{
  final String message;

  HttException(this.message);

  @override
  String toString() {
  return message;
  // return super.toString();
  }
}