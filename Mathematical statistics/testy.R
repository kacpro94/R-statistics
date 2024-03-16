#library(normtest)
library(dplyr)

shapiro.test(test.pamieci$predkosc_zapisu)
shapiro.test(test.pamieci$predkosc_odczytu)

?ks.test

ks.test(test.pamieci$predkosc_zapisu,"pnorm",mean=mean(test.pamieci$predkosc_zapisu),sd=sd(test.pamieci$predkosc_zapisu))
ks.test(test.pamieci$predkosc_odczytu,"pnorm")

ks.test(test.pamieci$predkosc_odczytu,"pnorm",mean=mean(test.pamieci$predkosc_odczytu),sd=sd(test.pamieci$predkosc_odczytu))
plot(test.pamieci$predkosc_odczytu)

#czy rozklady predkosci odczytu pamieci 8 i 16 sa takie same

gb8=test.pamieci%>%
  filter(pojenmosc==8)

gb16=test.pamieci%>%
  filter(pojenmosc==16)

ks.test(gb8$predkosc_odczytu,gb16$predkosc_odczytu)  


chisq.test(c(500,1000),p=c(0.5,0.5))

#czy wartosc oczekiwana predkosci odczytu pamieci 8gb jest istotnie mniejsza niz 40
library(BSDA)

shapiro.test(gb8$predkosc_odczytu)
#jako ze jest to 3 wersja tego testu do muismy dac sigma.x=mean. jesli bylby to 1 wersja to bysmy wpisali np. simga.x=15
z.test(gb8$predkosc_odczytu,mu=40,alternative = "less",sigma.x = sd(gb8$predkosc_odczytu))

t.test(gb8$predkosc_odczytu,mu=40,alternative = "less")

#czy wartosci oczekiwane predkosci odczytu pamieci 8gb i 16gb sa takie same

z.test(gb8$predkosc_odczytu,gb16$predkosc_odczytu,mu=0,alternative = "two.sided",sigma.x = sd(gb8$predkosc_odczytu),sigma.y=sd(gb16$predkosc_odczytu))

t.test(gb8$predkosc_odczytu,gb16$predkosc_odczytu,mu=0,alternative = "two.sided",var.equal = T)

#czy wartosci oczekiwane predkosci odczytu pamiecii predkosci zapisu sa takie same

#tutaj jest haczyk bo cechy sa od siebie zalezne
shapiro.test(test.pamieci$predkosc_zapisu)

z.test(test.pamieci$predkosc_zapisu-test.pamieci$predkosc_odczytu,mu=0,alternative = "two.sided",sigma.x = sd(test.pamieci$predkosc_zapisu-test.pamieci$predkosc_odczytu))
#ALBO LATWIEJ: BO JEST PARAMERT PAIRED
t.test(test.pamieci$predkosc_zapisu,test.pamieci$predkosc_odczytu,mu=0,alternative = "two.sided",paired = T)


#  h0: m1-m2=-2
#  h1: m1=m2-2
t.test(test.pamieci$predkosc_zapisu,test.pamieci$predkosc_odczytu,mu=-2,alternative = "two.sided",paired = T)

#test rownosci dwoch wariancji
#czy wariancje predkosci odczytu 8gb i 16 gb sa takie same

?var.test()
var.test(gb8$predkosc_odczytu,gb16$predkosc_odczytu,alternative = "two.sided")

#czy odchylenie standardowe predkosci odczytu pamieci 8gb jest istotnie wieksze niz 12
library(DescTools)
library(EnvStats)
varTest(gb8$predkosc_zapisu,alternative = "two.sided",sigma.squared = 144)


#test do frakcji 
#czy odsetek pamieci 8gb o predkosci odczytu mniejszej niz 27 jest wiekszy niz 30%?

?prop.test()

prop.test(x=sum(gb8$predkosc_odczytu<27),n=length(gb8$predkosc_odczytu),p=0.3,alternative = "greater")


#czy odsetek pamieci 16gb o prednkosci zapisu mniejszej niz 22 jest wiekszy niz 1/3?

prop.test(x=sum(gb16$predkosc_zapisu<22),n=length(gb16$predkosc_zapisu),p=1/3,alternative = "greater")
#x- liczba sukcesow, n=dlugosc danych, p=zadany odsetek

#czy odsetki 8gb i 16gb o predkosci zapisu mniejszej niz 22 sa takie same?

m1<-sum(gb8$predkosc_zapisu<22)
m2<-sum(gb16$predkosc_zapisu<22)
n1<-length(gb8$predkosc_zapisu)
n2<-length(gb16$predkosc_zapisu)
prop.test(c(m1,m2),c(n1,n2))

#czy predkosci zapisu pamieci 8gb ma rozklad normalny

ks.test(gb8$predkosc_zapisu,"pnorm",mean=mean(gb8$predkosc_zapisu),sd=sd(gb8$predkosc_zapisu))

#Czy predkosc zapisu ma rozklad normalny? h0: predkosc ma r.norm h1:predkosc nei ma rozkladu normalnego

dane<-test.pamieci[,3]

#10 klas

srednia=mean(dane)
odch_st=sd(dane)
#parametry mozliwego r.norm ktory sprawdzamy

qnorm(0.1,mean = srednia,sd=odch_st) #14 elementow

qnorm(0.2,mean = srednia,sd=odch_st) #35 elementow
qnorm(0.3,mean = srednia,sd=odch_st) #23 elementow
qnorm(0.4,mean = srednia,sd=odch_st) #
qnorm(0.5,mean = srednia,sd=odch_st)
qnorm(0.6,mean = srednia,sd=odch_st)
qnorm(0.7,mean = srednia,sd=odch_st)
qnorm(0.8,mean = srednia,sd=odch_st)
qnorm(0.9,mean = srednia,sd=odch_st)

#chisq.test(liczebnosci,p=rep(0.1,10)) liczebnosci to wektor utworzony z liczebnosci klas wyzej!!!


#czy predkosc zapisu ma rozklad t-studenta
set.seed(123)
dane=rt(300,df=7)

ks.test(dane,"pt",df=ni)
#trzeba skorzystac z metody momentow aby oszacowac parametry
sd(dane)^2
#df=5,92



#METODA MOMENTOW
vv=var(dane)
ni=2*vv/(vv-1)
ni

#METODA NAJWIEKSZEJ WIARYGODNOSCI

#trzeba zrobic funkcje ktora oblicza sume

f_lmax=function(st_sw,x){
  #return(sum(log(dt(x,df=st_sw))))
  f_lmax=-sum(log(dt(x,df=st_sw)))
  
}
#funkja optim
optim(10,f_lmax,x=dane,method = "L-BFGS-B",lower = 2.00001)

#funkcja do r.norm

f_lmax2=function(parametry,x){
  f_lmax2=-sum(log(dnorm(x,mean=parametry[1],sd=parametry[2])))
}
optim(c(0,1),f_lmax2,x=dane,method = "L-BFGS-B",lower = c(-Inf,0.00001))

#QRM pakiet
