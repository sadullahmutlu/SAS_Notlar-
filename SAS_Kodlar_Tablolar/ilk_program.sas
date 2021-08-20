libname DENEME '/home/u59204182/sasuser.v94' ;

*Aşağıdaki kodda deneme adında tablo oluşturuldu.;
/*Açıklama satırları iki farklı yolla yapılabilir.
data: tablo oluşturur. run ise kodu çalıştırır.*/

/*datastep adımları*/

data DENEME.deneme2; /*denemenin altında deneme2 adı altında bir tablo yarat dedik*/

/*set: bir tabloyu başka bir tablonun üzerine yazmak istersek, tabloyu olduğu gibi yazmak istersek
yani herhangi bir şekilde tablo kullanmak istersek set komutunu kullanırız.*/
set SASHELP.air; /*SASHELP kütüphanesinin altındaki air tablosunu deneme2 dosyasına yazdırdık.*/
run;

/*
drop: sashelp.air tablosundan air kolonunu çıkar.
keep: sashelp.air tablosunda sadece keep kolonunu al.
*/

data DENEME.denemeDrop;
set SASHELP.AİR(drop=date);
run;

data DENEME.denemeKeep;
set SASHELP.AİR(keep=date);
run;


data DENEME.denemeDropCoklu;
set SASHELP.BIRTHWGT(keep = Married AgeGroup Death);
run;

/*sql ile tablo oluşturma*/
/*sql ile tablo oluşturma istiyorsak proc sql komutu ile başlayıp 
quit komutu ile sonlandırmamız gerekiyor.*/

proc sql;
create table DENEME.sqlDeneme as /*tablomuzu oluşturalım*/
select DATE,AIR from SASHELP.air; /*sashelp altında air tablosunda bütün kolonları al ve sqlDeneme adında bir tablo yarat*/
quit;


/*csv tablosunu sas tablosuna dönüştürme*/
FILENAME REFFILE '/home/u59204182/sasuser.v94/Iris.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV /*DBMS :dosyanın hangi formatta olduğu*/
	OUT=DENEME.ornek; /*çıktı olarak nereye yazılacağı*/
	GETNAMES=YES; /*tabloda kolon adları var mı yok mu */
RUN;

/*direk FILENAME olarak yazmadanda yapılabilir*/

PROC IMPORT DATAFILE='/home/u59204182/sasuser.v94/Iris.csv'
	DBMS=CSV /*DBMS :dosyanın hangi formatta olduğu*/
	OUT=DENEME.ornek; /*çıktı olarak nereye yazılacağı*/
	GETNAMES=YES; /*tabloda kolon adları var mı yok mu */
RUN;

data deneme.ornek2;
set deneme.ornek;
rename Id=Number; /*rename komutu Id sutunun adını Number olarak değiştirir.
set deneme.ornek(rename= (Id=Number)); olarakda yazılabilir.*/
run;

data deneme.ornek3;
set deneme.ornek(rename= (Id=Number));
keep Number Species;
run;

