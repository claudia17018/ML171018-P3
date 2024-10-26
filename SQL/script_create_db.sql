USE FlightDW
GO

CREATE TABLE Date_Dimension
(
	date_key int not null,
	full_date smalldatetime,
	day_of_week tinyint,
	day_num_in_month tinyint,
	day_num_overall int,
	day_name varchar(15),
	day_abbrev char(3),
	weekday_flag char(1),
	week_num_in_year int,
	week_num_overall int,
	week_begin_date smalldatetime,
	week_begin_date_key int,
	month tinyint,
	month_num_overall int,
	month_name varchar(15),
	month_abbrev varchar(15),
	quarter tinyint,
	year int,
	yearmo int,
	fiscal_month tinyint,
	fiscal_quarter tinyint,
	fiscal_year int,
	last_day_in_month_flag varchar(15),
	same_day_year_ago_date smalldatetime,
	primary key (date_key)
);
GO

CREATE TABLE DimTime(
TimeKey int primary key,
FlightDate date not null,
Year tinyint not null,
Quarter tinyint not null,
Month tinyint not null,
DayOfMonth tinyint not null,
DayOfWeek tinyint not null
);
GO

CREATE TABLE DimAirline(
AirlineKey int IDENTITY(1,1) primary key,
AirlineCode varchar(25) not null,
AirlineName varchar(255) not null,
LastUpdateDate datetime
);
GO


CREATE TABLE FactFlight
(
    AirlineKey INT FOREIGN KEY REFERENCES DimAirline(AirlineKey) NOT NULL,
    FlightDateKey INT FOREIGN KEY REFERENCES DimTime(TimeKey) NOT NULL,
    FlightNumber INT NOT NULL,
	OriginCityName VARCHAR(255) NOT NULL,
	OriginStateName VARCHAR(255) NOT NULL,
	DestCityName VARCHAR(255) NOT NULL, 
	DestStateName VARCHAR(255) NOT NULL,
	Cancelled VARCHAR(50) NOT NULL, 
    Diverted VARCHAR(50) NOT NULL, 
    DepDelayMinutes VARCHAR(50) NOT NULL,
    ArrDelayMinutes VARCHAR(50) NOT NULL,
	Distance FLOAT NOT NULL, 
    CarrierDelay VARCHAR(50) NOT NULL,       -- Minutos de retraso por problemas de la aerolínea
    WeatherDelay VARCHAR(50) NOT NULL,       -- Minutos de retraso por condiciones meteorológicas
    NASDelay VARCHAR(50) NOT NULL,           -- Minutos de retraso por el Sistema Nacional del Espacio Aéreo (NAS)
    SecurityDelay VARCHAR(50) NOT NULL,      -- Minutos de retraso por razones de seguridad
    LateAircraftDelay VARCHAR(50) NOT NULL  -- Minutos de retraso por llegada tardía de la aeronave
);
GO










