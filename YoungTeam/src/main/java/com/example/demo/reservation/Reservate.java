package com.example.demo.reservation;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;

public class Reservate {



	LocalDate now = LocalDate.now(); //포맷 정의 
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd"); //포맷 적용 
	String formatedNow = now.format(formatter); LocalDate nextDay = now.plusDays(1); LocalDate
			nNextDay = now.plusDays(2); String nextDaySt = nextDay.format(formatter);
			String nNextDaySt = nNextDay.format(formatter);

			public String getFormatedNow() { return this.formatedNow; }

			public String getNextDay() { return nextDaySt; }

			public String getNNextDay() { return nNextDaySt; }





}
