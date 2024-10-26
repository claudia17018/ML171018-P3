--Limpiamos la dimension

delete DimAirline;

--Reiniciamos la clave autonumerica
dbcc checkident('DimAirline',RESEED,0)


-- Limpiamos las dimensiones y Reiniciamos las claves autonumericas
delete FactFlight
--Reiniciamos la clave autonumerica
dbcc checkident('FactFlight', RESEED, 0);

INSERT INTO DimTime (TimeKey, FlightDate, Month,Year,Quarter, DayOfMonth, DayOfWeek)
SELECT date_key, FORMAT(full_date, 'yyyy-MM-dd') , month, year, quarter,day_num_in_month ,day_of_week 
FROM Date_Dimension;
GO

