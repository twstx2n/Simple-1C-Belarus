﻿
Процедура ОбработкаПроведения(Отказ, Режим)
	
	Движения.РегистрБухгалтерии.Записывать = Истина;
	Движение = Движения.РегистрБухгалтерии.Добавить();
	Движение.СчетДт = ПланыСчетов.ПланСчетов.С51;
	Движение.СчетКт = ПланыСчетов.ПланСчетов.С62;
	Движение.ЮрЛицо = ЮрЛицо;
	
	Движение.Период = Дата;
	Движение.Сумма = Сумма;

КонецПроцедуры
