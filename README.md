# AirCodition

![ezgif com-video-to-gif](https://user-images.githubusercontent.com/30911232/221056278-372002c9-8cca-4da8-845d-c8aee825d6a3.gif)
   
## Opis   
Aplikacja służy do monitorowania pogody i jakości powietrza w wybranych przez użytkownika miejscach na terenie Polski.   
Ponadto wyświetla aktualną lokalizację użytkowanika.   
Użytkownik ma do dyspozycji dwie listy, z których wybiera miejsca jakie chce monitorować pod względem    
stanu jakości powietrza jak i panujących warunków atmosferycznych.   
   
   #### Stan pogody   
   Funkcjonalność opiera się o dane pochodzące z następującego API:   
   https://danepubliczne.imgw.pl/apiinfo
   Aplikacja umożliwia kontrolowanie nastepujących parametrów:   
   💧 - informacja o występowaniu opadu w oparciu o sumę opadów (podawana zero jedynkowo w postaci obrazka z deszczem)   
   🌡 - temperatura powietrza podana w stopniach Celsjusza
      
       
   #### Stan jakości powietrza   
   Funkcjonalość i wyświetlana informacja opiera się o następujące źródło i jego specyfikację:   
   https://powietrze.gios.gov.pl/pjp/content/api   
   💨 - infromcja o stanie powietrza w oparciu o stężenie pyłu zawieszonego PM10   
   
   🕔 Ponadto wyświetlana jest informacja na temat aktualności danego pomiaru (podana w formie godziny)   
   
   #### Wyświetlanie lokalizacji   
   🌍 - podanie lokalizacji ma wyłącznie charakter informacyjny.   
      Głównym założeniem tej funckjonalności jest wsparcie użytkownika w wyborze miejsca do monitorowania (wybrania stacji),   
      gdyby miał wątpliwości co do swojego aktualnego położenia.   
