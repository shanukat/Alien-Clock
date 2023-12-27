using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AlienClock
{
    public partial class Alien : System.Web.UI.Page
    {
        
        
        private static int[] DaysInAlien = new int[18]
        {
            44, 42, 48, 40, 48, 44, 40, 44, 42, 40, 40, 42, 44, 48, 42, 40, 44, 38
        };
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                EarthClock();
            }

        }
        private void EarthClock()
        {
            dvEarthClock.InnerText = $"Earth Clock: Year {DateTime.Now.Year}, Month {DateTime.Now.Month}, Day {DateTime.Now.Day}, " +
                                 $"Hour {DateTime.Now.Hour} : Minute {DateTime.Now.Minute} : Second {DateTime.Now.Second}";
        }

        /// <summary>
        /// To Get Alien Current time and set new Alien Time
        /// </summary>
       
        [WebMethod]
        public static string UpdateAlienTime(int year, int month, int day, int hr, int min, int sec)
        {
            string alien_time = string.Empty;
            try
            {
                if (year == 0)//To Get Alien Current time
                {
                    AlienTime at = new AlienTime(2804, 18, 31, 2, 2, 88);
                    DateTime earth_time = new DateTime(1970, 1, 1, 0, 0, 0);

                    double tot_alien_seconds = (DateTime.Now - earth_time).TotalSeconds * 2;
                    long aliean_seconds = Convert.ToInt64(tot_alien_seconds);
                    at.AddAlienSeconds(aliean_seconds);
                    alien_time = $"Alien Clock: Year {at.Year}, Month {at.Month}, Day {at.Day}, " +
                                        $"Hour {at.Hour} : Minute {at.Minute} : Second {at.Second}";
                }
                else // Set New Alien Time
                {
                    AlienTime al_time = new AlienTime(year, month, day, hr, min, sec);

                    DateTime earth_time = new DateTime(1970, 1, 1, 0, 0, 0);
                    double tot_alien_seconds = (DateTime.Now - earth_time).TotalSeconds * 2;
                    long aliean_seconds = Convert.ToInt64(tot_alien_seconds);
                    al_time.AddAlienSeconds(aliean_seconds);

                    alien_time = $"Alien Clock: Year {al_time.Year}, Month {al_time.Month}, Day {al_time.Day}, " +
                                              $"Hour {al_time.Hour} : Minute {al_time.Minute} : Second {al_time.Second}";
                }

            }
            catch (Exception ex)
            {
            }
            return alien_time;
        }

        public class AlienTime
        {
            public int Year { get; set; }
            public int Month { get; set; }
            public int Day { get; set; }
            public int Hour { get; set; }
            public int Minute { get; set; }
            public long Second { get; set; }

            public AlienTime(int year, int month, int day, int hour, int minute, long second)
            {
                Year = year;
                Month = month;
                Day = day;
                Hour = hour;
                Minute = minute;
                Second = second;
            }

            //Implement the logic for adding seconds to a custom DateTime
            public void AddAlienSeconds(long seconds)
            {
                try
                {
                    Second += seconds;

                    while (Second >= 90)
                    {
                        Second -= 60;
                        Minute++;

                        while (Minute >= 90)
                        {
                            Minute -= 60;
                            Hour++;

                            while (Hour >= 36)
                            {
                                Hour -= 24;
                                Day++;

                                int daysInMonth = DaysInAlien[Month - 1];

                                while (Day > daysInMonth)
                                {
                                    Day -= daysInMonth;
                                    Month++;

                                    if (Month > 18)
                                    {
                                        Month = 1;
                                        Year++;
                                    }

                                    daysInMonth = DaysInAlien[Month - 1];
                                }
                            }
                        }
                    }
                }
                catch (Exception ex)
                {

                }
            }
        }




    }
}