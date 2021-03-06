﻿
&НаКлиенте
Процедура ОбработкаКоманды(ПараметрКоманды, ПараметрыВыполненияКоманды)
	
	Если ПроверкаЗаполненияТЧ(ПараметрКоманды) = 0 Тогда 
		Сообщить("Есть пустые документы, печать отменяется");
		Возврат;
	КонецЕсли;
	
	
	ТабДок = Новый ТабличныйДокумент;
	Печать2(ТабДок, ПараметрКоманды);

	ТабДок.ОтображатьСетку = Ложь;
	ТабДок.Защита = Истина;
	ТабДок.ТолькоПросмотр = Истина;
	ТабДок.ОтображатьЗаголовки = Ложь;
	ТабДок.Показать();
	
КонецПроцедуры

&НаСервере
Процедура Печать2(ТабДок, ПараметрКоманды)
	Документы.СчетНаОплату.Печать2(ТабДок, ПараметрКоманды);
КонецПроцедуры

&НаСервере
Функция ПроверкаЗаполненияТЧ(ПараметрКоманды)
	Для Каждого Документ из ПараметрКоманды Цикл 
		Если Документ.Товары.Количество() = 0 Тогда 
			Возврат 0;
		КонецЕсли;
	КонецЦикла;
КонецФункции

