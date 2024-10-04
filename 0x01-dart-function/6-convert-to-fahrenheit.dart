List<double> convertToF(List<double> temperaturesInC) {
  return temperaturesInC.map((tempC) {
    double tempF = (tempC * 9 / 5) + 32;
    return double.parse(tempF.toStringAsFixed(2));
  }).toList();
}