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
