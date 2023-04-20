# Konstantinopolj_Catapult_2
Микроконтролерски системи/Рачунарска електроника, зимски семестар, ак. 2022/2023. година
<br />
<br />
<p align="center">
<img width="714x727" src="https://user-images.githubusercontent.com/116280871/233384471-2c4952ab-5153-4f5d-a70b-6622c1b0d1c5.jpg">


# Упутство за повезивање катапулта

## Напајање плочице
<p align="justify">Како је задано и пројектним задатком, напајање које се доводи на плочицу износи 12 V. Напајање се у овом случају доводи са протоборда (кориштењем мултиметра претходно је  увијек неопходно провјерити да ли напајање доиста одговара 12 V), а на слици су приказана и минимална повезивања. Краткоспојник жуте боје одговара 12 V, док је плавим означено уземљење, као што се да примијетити на слици. 
<br />
<br />
<p align="center">
<img width="714x727" src="https://user-images.githubusercontent.com/116280871/233385325-ef5e0f39-443d-4784-8dda-ba7f39d9a8b1.jpg">


## Повезивање плочице са програматором 
<p align="justify">За програмирање микроконтролера користи се програматор PICkit верзије 3. Наредна слика показује pinout који користи овај програматор, при чему стрелица ка доле означава пин MCLR, односно, како је приказано ознакама на слици слијева:
<br />
<br />
<p align="center">
<img width="1014x1027" src="https://user-images.githubusercontent.com/116280871/233389197-0f441eda-2a46-462e-8d34-22eb8be5ffd7.jpg">

<p align="justify">На слици здесна приказано је повезивање програматора са плочицом. Пет конектора на које треба повезати пинове програматора налази се унутар црвеног блока, те редослијед који је претходно поменут важи уколико вршимо повезивање као на слици.

## Повезивање корачних мотора са плочицом

<p align="justify">За рад са катапултом кориштено је шест корачних мотора. Од тог броја два корачна мотора користе се за кретање ласера, преостала четири су на самом катапулту,означени са О (окретање), N (натезање), К (кашика) те P (пуцање). Мотор са ознаком О омогућава окретање самог катапулта, а претходно поменути мотори са ознакама N, K и  P приказани су  на слици испод. 
<br />
<br />
<img width="1014x1027" src="https://user-images.githubusercontent.com/116280871/233392076-124cfaa7-8b2a-4bf5-876b-637634a62b4f.jpg">

Слиједи и повезивање корачних мотора са плочицом. На слици је приказан распоред повезивања, гдје се неозначени корачни мотори односе на ласере. 
<br />
<br />
<p align="center">
<img width="814x827" src="https://user-images.githubusercontent.com/116280871/233393178-e441268e-757c-4e85-898c-08fb1391faf9.jpg">

## Повезивање са рачунаром

<p align="justify">За везу са рачунаром  користи се USB-UART модул. Са претходно инсталираном верзијом одговарајућег драјвера за FT232RL неопходно је повезати рачунар и модул који се налази на плочици. 

<br />
<br />
<p align="center">
<img width="814x827" src="https://user-images.githubusercontent.com/116280871/233394921-ade56652-0826-4887-a27f-7c855ce733f9.jpg">

## Програмирање и управљање катапултом
<p align="justify">Преостаје  упалити напајање, а затим на плочици омогућити програмирање микроконтролера. Наредна слика приказује које краткоспојнике треба повезати приликом програмирања (смеђи и зелени), а затим и након што се микроконтролер успјешно испрограмира (црни и зелени). 
<br />
<br />
<p align="center">
<img width="1014x1027" src="https://user-images.githubusercontent.com/116280871/233396646-78c63336-caf0-4238-a410-2a0dbdc6c14c.jpg">

 
<p align="justify">Пројекат у MikroC-у (смјештен на грани Software, фолдер PIC24) компајлирати, а затим изгенерисан .hex унијети у MPLAB IDE софтвер за програмирање. Ући у аппликацију (софтвер Processing) и учитати пројекат (смјештен на грани Software, фолдер Processing), да би  се затим управљало катапултом, са контролним командама наведеним у табели испод.
<br />
<br />

|  Команда |         Функционалност          
|----------|---------------------------------
|  А или а | помјерање првог ласера улијево  
|  D или d | помјерање првог ласера удесно
|  J или j | помјерање другог ласера улијево 
|  L или l | помјерање другог ласера удесно
|  C или c | калибрација
|  space   | гађање мете



