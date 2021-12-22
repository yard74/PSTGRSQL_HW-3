create table if not exists Сотрудники (
	Код serial primary key,
	Имя varchar(100) not null
);

create table if not exists Отделы (
	Код serial primary key,
	Название varchar(50) unique not null
);


create table if not exists НачальникиОтделов (
	КодСотрудника integer primary key references Сотрудники(Код),
	КодОтдела integer references Отделы(Код)
);

create table if not exists СотрудникиОтделов (
	КодСотрудника integer references Сотрудники(Код),
	КодОтдела integer references Отделы(Код),
	КодНачальникаОтдела integer references НачальникиОтделов(КодСотрудника),
	CHECK (КодНачальникаОтдела != КодСотрудника OR КодНачальникаОтдела = NULL)
);
