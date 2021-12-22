create table if not exists Жанры (
	Код serial primary key,
	Название varchar(50) not null
);

create table if not exists Исполнители (
	Код serial primary key,
	Псевдоним varchar(100) not null
);

create table if not exists ЖанрыИсполнителей (
	КодИсполнителя integer references Исполнители(Код),
	КодЖанра integer references Жанры(Код),
	constraint pk_ЖанрыИсполнителей primary key (КодИсполнителя, КодЖанра)
);

create table if not exists Альбомы (
	Код serial primary key,
	Название varchar(100) not null,
	ГодВыпуска varchar(10)
);

create table if not exists ИсполнителиАльбомов (
	КодИсполнителя integer references Исполнители(Код),
	КодАльбома integer references Альбомы(Код),
	constraint pk_ИсполнителиАльбомов primary key (КодИсполнителя, КодАльбома)
);

create table if not exists Треки (
	Код serial primary key,
	Название varchar(100) not null,
	Длительность varchar(100) not null,
	КодАльбома integer references Альбомы(Код)
);

create table if not exists Сборники (
	Код serial primary key,
	Название varchar(100) not null,
	ГодВыпуска varchar(10)
);

create table if not exists ТрекиСборников (
	КодТрека integer references Треки(Код),
	КодСборника integer references Сборники(Код),
	constraint pk_ТрекиСборников primary key (КодТрека, КодСборника)
);