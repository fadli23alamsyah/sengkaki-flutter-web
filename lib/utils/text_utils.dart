extension TextUtils on String{
  String ucWords(){
    return split(' ').map((word) =>
      word[0].toUpperCase()+word.substring(1)
    ).join(' ');
  }
}