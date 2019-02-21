﻿Процедура РассчитатьЗаписи(Регистратор) Экспорт 
	
	НаборЗаписей = РегистрыРасчета.ЖурналНачислений.СоздатьНаборЗаписей();
	НаборЗаписей.Отбор.Регистратор.Установить(Регистратор);
	НаборЗаписей.Прочитать();
	
	Для каждого Запись Из НаборЗаписей Цикл
		
		Если Запись.ВидРасчета = ПланыВидовРасчета.Начисления.ОкладСуммой Тогда
			Запись.Сумма = Запись.Параметр; 
		ИначеЕсли Запись.ВидРасчета = ПланыВидовРасчета.Начисления.ПремияПроцентом Тогда 
			МассивРесурсов = Новый Массив(1);
			МассивРесурсов[0] = "ЖурналНачислений.Сумма";
			
			СтруктураИзмерений = Новый Структура;
			СтруктураИзмерений.Вставить("Сотрудник", "ЖурналНачислений.Сотрудник");
			
			ТЗ_БАЗА = Запись.ПолучитьБазу(МассивРесурсов,СтруктураИзмерений);
			База = ТЗ_БАЗА[0].Сумма;
			Запись.Сумма = База * Запись.Параметр / 100;
		ИначеЕсли  Запись.ВидРасчета = ПланыВидовРасчета.Начисления.ПремияСуммой Тогда 
			 Запись.Сумма = Запись.Параметр;			
		КонецЕсли;
		
				
	КонецЦикла;
	
	НаборЗаписей.Записать();
	
		
КонецПроцедуры
