/****************** Created By Prashant ***************************************
******************* Created Date - 04/06/2017 *********************************
******************* Method : Crrent month check *******************************
*******/

public without sharing class DateUtility {

public static boolean getCurrentMonth() {
List<Integer> noOfMonths = new List<Integer>();
noOfMonths.add(9);
noOfMonths.add(6);
  System.debug('Current Month is ' + Date.Today().Month());
  for(Integer currentMonth: noOfMonths) {
    if(Date.Today().Month() == currentMonth)
    return true;
  }
    return false;
}

}