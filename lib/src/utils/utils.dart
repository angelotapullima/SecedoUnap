



String dosdecimales(double n) {
  return n.toStringAsFixed(n.truncateToDouble() == n ? 2 : 2);
}