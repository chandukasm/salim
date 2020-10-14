class  Percentage{
  static List<int> percentage = new List();

  static double getPercentage(){
    int i = 0;
    int up = 0;
    for(i; i < 6; i++) up += percentage[i];
    double totalUP = up / 6;

    int down = 0;
    for(i; i < percentage.length; i++) down += percentage[i];
    double totalDown = (down / 4) + 1;
    return (totalUP / totalDown);
  }

  static String getMinutes(){
    double per = getPercentage();
    const String minute = 'دقائق';
    const String minutes = 'دقيقة';
    if(per > 70) return " 4 " + minute;
    if(per <= 70 && per > 50) return " 15 " + minutes;
    if(per <= 50 && per > 30) return " 20 " + minutes;
    return " 45 " + minutes;
  }
}