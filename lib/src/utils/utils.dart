



String dosdecimales(double n) {
  return n.toStringAsFixed(n.truncateToDouble() == n ? 2 : 2);
}


String obtenerMes(int numero){

  if(numero == 1){
    return 'Enero';
  }else if(numero == 2){
    return 'Febrero';
  }else if(numero == 3){
    return 'Marzo';
  }else if(numero == 4){
    return 'Abril';
  }else if(numero == 5){
    return 'Mayo';
  }else if(numero == 6){
    return 'Junio';
  }else if(numero == 7){
    return 'Julio';
  }else if(numero == 8){
    return 'Agosto';
  }else if(numero == 9){
    return 'Septiembre';
  }else if(numero == 10){
    return 'Octubre';
  }else if(numero == 11){
    return 'Noviembre';
  }else if(numero == 12){
    return 'Diciembre';
  }
  return ' ';
}