
bool isNumeric( String value ){

  if( value.isEmpty ) return false;
  // if value can´t parse to int return false 
  return  int.tryParse(value) == null ? false : true;

}