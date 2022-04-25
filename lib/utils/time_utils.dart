extension TimeUtils on int{
  String timeFormatApp(){
    const nameMonth = ['Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'];
    
    //need from milliseconds because data from server js return miliseconds
    final date = DateTime.fromMillisecondsSinceEpoch(this); 
    final day = date.day;
    final month = nameMonth[date.month-1];
    final year = date.year;
    return '$month $day, $year';
  }
}