class TimeUtil{
  //Convert seconds to hours minutes
  static String formatToHHMM(int seconds){
     var d=Duration(seconds: seconds);
     List<String> parts = d.toString().split(':');

     String hourString =parts[0]=='1'?'1 hour':'${parts[0]} hours';
     String minutesString= parts[1]=='1'?'1 minute':'${parts[1]} minutes';

     return '$hourString and $minutesString';

  }
}