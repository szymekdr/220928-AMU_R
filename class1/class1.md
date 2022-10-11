-   [Zanim zaczniemy](#zanim-zaczniemy)
    -   [0. Przydatne zasoby pomocowe w pracy z R - część
        pierwsza](#0-przydatne-zasoby-pomocowe-w-pracy-z-r---część-pierwsza)
    -   [0. Katalog roboczy](#0-katalog-roboczy)
-   [A. Podstawy składni `R`](#a-podstawy-składni-r)
    -   [1. R działa w oparciu o funkcje](#1-r-działa-w-oparciu-o-funkcje)
    -   [2. Skąd wiedzieć jakie argumenty ma
        funkcja?](#2-skąd-wiedzieć-jakie-argumenty-ma-funkcja)
    -   [3. Istotne cechy składni języka
        `R`](#3-istotne-cechy-składni-języka-r)
    -   [4. `R` to kalkulator na
        sterydach](#4-r-to-kalkulator-na-sterydach)
-   [B. Zapisywanie pracy](#b-zapisywanie-pracy)
-   [C. Zmienne i struktury danych](#c-zmienne-i-struktury-danych)
    -   [1. Tworzenie zmiennych](#1-tworzenie-zmiennych)
    -   [2. Wektory i ich tworzenie](#2-wektory-i-ich-tworzenie)
    -   [3. Indeksowanie wektorów](#3-indeksowanie-wektorów)
    -   [4. Ładowanie danych do `R`. Typy
        danych](#4-ładowanie-danych-do-r-typy-danych)
    -   [5. Dane jako macierz -
        indeksowanie](#5-dane-jako-macierz---indeksowanie)
    -   [6. Filtrowanie danych](#6-filtrowanie-danych)
    -   [7. Brakujące dane](#7-brakujące-dane)

# Zanim zaczniemy

## 0. Przydatne zasoby pomocowe w pracy z R - część pierwsza

-   [RStudio
    cheat-sheet](https://raw.githubusercontent.com/rstudio/cheatsheets/main/rstudio-ide.pdf)
-   [RMarkdown
    cheat-sheet](https://raw.githubusercontent.com/rstudio/cheatsheets/main/rmarkdown.pdf)
-   [Książka o
    RMarkdown](https://bookdown.org/yihui/rmarkdown-cookbook/)
-   [Ściąga z podstawowych funkcji
    R](http://github.com/rstudio/cheatsheets/blob/main/base-r.pdf)
-   [Szybki GitHub dla
    RStudio](https://raw.githubusercontent.com/rstudio/cheatsheets/main/git-github.pdf)
-   [Porównanie stylów
    kodowania](https://raw.githubusercontent.com/rstudio/cheatsheets/main/syntax.pdf)
-   [Książka online “Intro to R”](https://intro2r.com)
-   [Zbiory użytecznych funkcji wg tematu - CRAN Task
    Views](https://cran.r-project.org/web/views/)

------------------------------------------------------------------------

## 0. Katalog roboczy

By móc pracować w `R` - potrzebujemy tzw. katalogu roboczego. Po
uruchomieniu `R` katalog roboczy ustawiany jest automatycznie - możemy
podejrzeć go w belce terminala, obok numeru wersji `R`.

![](wd.png)

Znacznie lepiej jest samodzielnie zdecydować, gdzie taki folder powinien
się znajdować. Stosowanie folderów roboczych osobnych dla każdego
projektu/analizy jest dobrą praktyką pozwalającą utrzymać porządek w
plikach.

Aby ustawić katalog roboczy (*working directory*) możemy dokonać tego w
menu w panelu **Files** (menu **More**) - po przejściu do wybranego
folderu w przeglądarce plików panelu **Files**. Druga możliwość to
użycie funkcji `setwd()`:

1.Upewnij się, że folder który chcesz wykorzystać fizycznie istnieje na
Twoim dysku - jeśli nie: utwórz go;

2.W terminalu wykonaj instrukcję

    setwd("~/Dropbox/#SCIENCE/R/_dydaktyka/220928-AMU_R")

wpisując wewnątrz funkcji ścieżkę do wybranego przez siebie folderu.

Wybrany folder powinien pojawić się w belce terminala `R` - możemy też
sprawdzić wybór folderu za pomocą funkcji `getwd()`:

``` r
getwd()
```

    ## [1] "/Users/szymek/Dropbox/#SCIENCE/R/_dydaktyka/220928-AMU_R/class1"

------------------------------------------------------------------------

# A. Podstawy składni `R`

## 1. R działa w oparciu o funkcje

“Funkcja” to rodzaj makra, które wykonuje określone instrukcje. Mogą one
być bardzo proste, ale mogą też mieć wiele złożonych właściwości. W `R`
funkcja zawsze ma podobną strukturę:

``` r
pewna_funkcja(argument1 = 50, argument2 = "opcja1", argument3 = T)
```

Funkcja zawsze ma nazwę (`pewna_funckja`), po której następuje `()`.
Nawias ujmuje argumenty funkcji, w parach zawierających nazwę argumentu
oraz jego wartość. Wartości mogą być liczbowe, mogą być to instrukcje
tekstowe, mogą to być też wartości logiczne (prawda/fałsz, oznaczane w
`R` jako `T` oraz `F`, ewentualnie `TRUE` oraz `FALSE` - obydwie
konwencje są poprawne).

Warto pamiętać o kilku istotnych rzeczach:

-   `opcja1` to nie to samo co `"opcja1"`. Pierwsza wersja oznacza
    obiekt w `R` o nazwie `opcja1` (co to dokładnie oznacza - za
    chwilę). Druga oznacza tekst zawierający ciąg znaków “opcja1”;
-   `T` wpisujemy bez `""` ponieważ nie jest to tekst, ale wartość
    logiczna “prawda”; wpisanie `"T"` oznacza po prostu podanie wielkiej
    litery “T”;
-   wartości logiczne są równoznaczne z zerem i jedynką (to znaczy
    `T == 1` oraz `F == 0`).

Choć argumenty zawsze mają swoje nazwy, możemy je często pominąć, jeśli
ich wartości podajemy w odpowiedniej kolejności (takiej, jak
zdefiniowana przez autora funkcji), lub też kiedy funkcja ma tylko 1
argument. Na przykład funkcja `sqrt` oblicza pierwiastek kwadratowy i
przyjmuje tylko jeden argument `x` oznaczający zmienną, którą chcemy
pierwiastkować.

**Zadanie** Spróbuj wywołać tę funkcję korzystając z nazwy jej argumentu
oraz go pomijając. Spierwiastkuj w tych dwóch wywołaniach liczbę 2 oraz
6.

**Spodziewany wynik**

``` r
sqrt(x = 2)
```

    ## [1] 1.414214

``` r
sqrt(6)
```

    ## [1] 2.44949

**Zadanie** Funkcja `round()` przyjmuje argumenty `x` (wartość do
zaokrąglenia) oraz `digits` (liczba miejsc dziesiętnych, do których
chcemy zaokrąglić). Stosując tą funkcję do liczby 4.246813579 wykonaj ją
w kilku wersjach, zaokrąglając wynik do 3 miejsc po przecinku: podając
nazwy argumentów; nie podając ich ale zakładając, że ich kolejność to
`x` `digits`; wreszcie - nie podając nazw i zakładając, że kolejność
jest osobna. Co się stanie, gdy pominiesz drugi argument (`digits`)?

**Spodziewany wynik**

*Podając nazwy argumentów*

``` r
round(x = 4.246813579, digits = 3)
```

    ## [1] 4.247

*Bez nazw, w kolejności `x digits`*

``` r
round(4.246813579, 3)
```

    ## [1] 4.247

*Bez nazw, w kolejności `digits x`*

``` r
round(3, 4.246813579)
```

    ## [1] 3

*Bez podania drugiego argumentu*

``` r
round(4.246813579)
```

    ## [1] 4

◼

## 2. Skąd wiedzieć jakie argumenty ma funkcja?

Aby dowiedzieć się czegoś o funkcji, której nazwę znamy wystarczy
wywołać jej plik pomocy. Robimy to poprzez komendę `?nazwa_funkcji`.

**Zadanie** Podejrzyj pomoc dla funkcji `round` oraz `sqrt` - czy
zgadzają się z tym, co obserwowaliśmy wcześniej?

**Zadanie** Co wyświetli polecenie `??"square root"`? Czym różni się ten
wynik od poprzedniego rezultatu?

◼

## 3. Istotne cechy składni języka `R`

-   Tzw. *white spaces* nie maja w kodzie znaczenia - zapis
    `round(3, digits = 4)` jest równoznaczny zapisowi
    `round(3,digits=4)`, czy też `round(3,digits     = 4` - warto jednak
    stosować białe znaki dla zwiększenia czytelności kodu. Dotyczy to
    nie tylko spacji ale też tabulatorów, którymi dobrze jest zaznaczać
    wcięcia oznaczające integralne części kodu (zobaczymy to nieco
    później). *RStudio* samodzielnie wprowadza wcięcia pomagając nam
    wyizolować fragmenty ujęte np. w jeden nawias:

<!-- -->

    round(4.7654, digits = 2)
    round(4.7654,
          digits = 2)

-   W `R` możemy stosować 2 rodzaje cudzysłowu: podwójny `""` oraz
    pojedynczy `''`. Stosowane osobno są równorzędne, możemy więc
    napisać `pewna_funkcja(argument2 = "opcja1")`, jak również
    `pewna_funkcja(argument2 = 'opcja1')`. Jeśli jednak cudzysłów ma być
    częścią wprowadzanego ciągu znaków, zewnętrznym cudzysłowem musi być
    `''`: `pewna_funkcja(argument2 = '"opcja1"')`.

-   Wprowadzenie znaków “zakazanych” w ciągu tekstowym (np. `'`) wymaga
    zastosowania tzw. *escape* (np. `"\"`). *Escape* wykorzystuje się
    również by wprowadzić np. znak nowej linii `"\n"`:

``` r
cat("Pierwsza linia\nDruga linia")
```

    ## Pierwsza linia
    ## Druga linia

Zastosowana powyżej funkcja `cat()` służy do wyświetlania ciągów znaków
w konsoli.

-   Jeśli zapomnimy zamknąć jakiś nawias lub cudzysłów i zatwierdzimy
    linijkę kodu - znak zachęty `>` zmieni się w `+` - co oznacza
    oczekiwanie konsoli na dokończenie/zamknięcie wprowadzania
    instrukcji:

<!-- -->

    >
    > round(4.7654, digits = 2
    +
    )
    >

-   Kolejność działań w `R` jest zgodna z zasadami matematyki (działania
    w nawiasie, potem `^`, potem \*`i`/`, potem`+`i`-\`) ale dla
    zachowania czytelności zawsze lepiej używać (nawet nadmiarowych)
    nawiasów).
-   `R` rozróżnia małe litery tak więc `ZmiennA` ≠ `zmienna`.
-   Linie kodu rozpoczynające się od `#` stają się komentarzami i nie są
    uruchamiane:

``` r
# tutaj zaokrąglam liczbę do 4 miejsc po przecinku
round(pi, 4)
```

    ## [1] 3.1416

``` r
# przy okazji poznajemy jedną ze zmiennych wewnętrznych w R
# przechowującą wartość liczby 'pi'
```

-   Na dawne obiektom `R` nazwy nie mogą zaczynać się od cyfr, nie mogą
    zawierać znaków specjalnych (`;:'",<>?/!+-*&|[]{}()^%$#@`), unikajmy
    również używania w nich kropki `.` (w niektórych kontekstach oznacza
    ona konkretny rodzaj obiektu w `R`); najlepiej stosować konwencję
    rozdzielania słów w nazwach za pomocą “\_” (`zmienna_pierwsza`) lub
    wielkich liter (`zmiennaPierwsza`).

## 4. `R` to kalkulator na sterydach

`R` to język programowania wykonywany w linii poleceń, w *czasie
rzeczywistym*. Oznacza to, że to co wpiszemy w konsoli terminala `R`
zostanie wykonane od razu, i od razu zobaczymy wyniki naszych obliczeń.

Z `R` można również pracować inaczej - za pomocą skryptów. Są to pliki
tekstowe (najcześciej z rozszerzeniem `.R`), które `R` może uruchomić i
wykonać w całości.

**Zadanie** Za pomocą funkcji `source()` spróbuj uruchomić przykładowy
skrypt `class1_script.R`. **Spodziewany wynik**

``` r
source('class1_script.R')
```

    ## [1] "Hello World!"

Pracując w konsoli poeksploruj funkcje obliczeniowe `R`.

**Zadanie** Zsumuj liczby całkowite od -4 do 7.

**Spodziewany wynik**

``` r
-4+-3+-2+-1+1+2+3+4+5+6+7
```

    ## [1] 18

**Zadanie** Sprawdź do czego służą operatory arytmetyczne `%%` oraz
`%/%`. Jaki wynik daje operacja `82%%9` oraz `82%/%9`? Korzystając z
jednej z tych funkcji - jak sprawdzisz czy liczba 87654 podzielna jest
przez 7?

``` r
87654 %% 7 # podzielna przez 7 bo wynik == 0
87654 %/% 7 # 7 mieści się w liczbie 12522 razy, ? czy jest podzielna
```

Wiele operacji ma swoje własne funkcje - np.:

-   `abs()` - wartość bezwzględna
-   `sin()`, `cos()`, `tan()` - operacje trygonometryczne (uwaga - kąty
    podajemy w radianach)
-   `log10()`, `log2()`, `log()` - logarytmy, o podstawie 10, 2 oraz *e*
    (naturalny)
-   `exp()` - eksponent (odwrotność logarytmy naturalnego, czyli
    *e*<sup>*x*</sup>)
-   `sqrt()` - pierwiastek kwadratowy
-   `factorial()` - silnia (*x*!).

**Zadanie** Czy logarytm dziesiętny z liczby 100 oraz logarytm naturalny
z liczby *e*<sup>1</sup> dają spodziewany wynik?

``` r
log10(100) # powinno być 2
log(exp(1)) # powinno być 1
```

W trakcie pracy w `R` możemy napotkać na wartości na pierwszy rzut oka
dziwne. **Zadanie** Zobacz co się stanie, gdy spróbujesz podzielić
liczbę dodatnią i ujemną przez zero.

**Spodziewany wynik**

``` r
10/0
```

    ## [1] Inf

``` r
-3/0
```

    ## [1] -Inf

`Inf` oznacza “nieskończoność”. Choć formalnie nie możemy podzielić
liczby przez zero, `R` próbuje wybrnąć z sytuacji i traktuje wyrażenie
tak, jak w analizie matematycznej (skoro nie potrafi obliczyć wartości,
próbuje znaleźć wartość graniczną wyrażenia i tutaj jest to
±nieskończoność). Jakie jeszcze operacje matematyczne mogą wywołać
nieoczekiwane rezultaty?

``` r
log(-10)
factorial(-9)
sqrt(-9)

# ale:

sqrt(-9+0i)
```

`R` zawiera trzy typy “nieliczbowych” wartości, które bedą pojawiać się
w naszej pracy:

-   `NA` - wartość brakująca, “wypełniacz” w danych wskazujący, że
    formalnie w danym miejscu brakuje wartości
-   `NaN` - *not-a-number* - wartość nienumeryczna, `R` nie wie co z
    taką liczbą zrobić
-   `±Inf` - nieskończoność (ostrożnie, bo może ona zniszczyć inne
    operacje - zob. np. `10+Inf` lub `50*(-Inf)`)

------------------------------------------------------------------------

# B. Zapisywanie pracy

`R` oferuje kilka różnych sposobów zapisywania pracy oraz jej postępów.

-   **R project** - jest to rodzaj “folderu” - lub archiwum -
    przechowującego wszystkie elementy projektu, nad którym pracujemy.
    Najlepiej sprawdzają się one, gdy korzystamy z danego folderu jako
    zarezerwowanego dla konkretnego projektu (tzn. jest on dla tego
    projektu zawsze folderem roboczym). Tworzenie projektu polega na
    wybraniu **File** \> **New project…** i selekcji odpowiedniej opcji.
    W folderze roboczym pojawi się plik z rozszerzeniem `.Rproj` który
    będzie od tej pory przechowywać istotne informacje o naszym
    projekcie.

-   **Skrypt R** - jest to plik tekstowy z rozszerzeniem `.R`
    przechowujący tekstową wersję instrukcji, które chcemy wykonać w
    `R`. Powinien zawierać tylko to, co może zostać wprowadzone i
    uruchomione w konsoli.

-   **Dokument RMarkdown** - dokumenty tego typu są skryptami `R` “na
    sterydach”. Tworzymy je poprzez **File** \> **New File** \> **R
    Markdown…** - powstaje wtedy szkielet dokumentu. Tego typu pliki
    zawierają tekst oraz specjalne *tagi* pozwalające formatować i
    definiować tekst o określonych parametrach. Zawierają one również
    kawałki kodu `R`, które mogą być na bieżąco, w takim dokumencie,
    uruchamiane, a ich wyniki wstawiane w określonym miejscu. Do
    działania RMarkdown konieczny jest pakiet `rmarkdown`. Dobry
    przewodnik po RMarkdown znajduje się wśród plików na górze tej
    instrukcji.

-   **Przestrzeń robocza** - to to, co wyświetla się w panelu
    **Environment**. Zawiera ona wszystkie obiekty i funkcje stworzone w
    naszej aktualnej sesji `R`. Możemy zapisać ją do pliku dzięki
    funkcji `save.image(file = "nazwa_pliku.Rdata")`, oraz odtworzyć ją
    za pomocą `load(file = "nazwa_pliku.Rdata")`. Pominięcie nazwy pliku
    spowoduje, że zapisana zostanie “ukryta” wersja przestrzeni, nazwana
    `.Rdata` - do takiego pliku RStudio próbuje również zapisać
    przestrzeń roboczą gdy zamykamy program.

> Zamiast korzystać z komend terminala - możemy skorzystać z ikony
> folderu (`load`) i dyskietki (`save`) w panelu **Environment**.

![](icons.png)

> Uwaga: jeśli w `R` podajemy nazwy plików bez pełnej ścieżki - `R`
> zapisuje je (oraz przy próbie odczytu poszukuje ich) w aktualnym
> katalogu roboczym.

Stwórzmy w naszej (ciągle pustej przestrzeni roboczej) 2 obiekty (więcej
o tworzeniu obiektów dowiemy się za chwilę):

``` r
zmienna1 <- 1000
zmienna_2 <- "my_text"
```

**Zadanie** Zapisz aktualną przestrzeń roboczą do pliku `wdir.Rdata`.
Wyczyść przestrzeń za pomocą `rm(list = ls())`. Załaduj zachowaną
przestrzeń z powrotem.

``` r
save.image(file = "wdir.Rdata")
rm(list = ls())
load(file = "wdir.Rdata")
```

**Zadanie** Co robi sama funkcja `ls()`?

------------------------------------------------------------------------

# C. Zmienne i struktury danych

## 1. Tworzenie zmiennych

Zmienne tworzymy za pomocą operatora przypisania (*assignment*) `<-`.
Podobny skutek ma użycie znanego z innych języków operatora `=` (oraz
użycie operatora przypisania “w drugą stronę, zamieniając jego
argumenty: `->`) - ale sposoby te nie są rekomendowane, ponieważ
zmniejszają one czytelność kodu. Przypisanie działa tak:

    nazwa_zmiennej <- wartość_zmiennej
    # np. x <- 6

**Zadanie** Przypisz do zmiennej `x` wartość 10, a do zmiennej `y`
wartość 66. Wywołaj je po ich nazwie.

**Spodziewany wynik**

``` r
x <- 10
y <- 66
x
```

    ## [1] 10

``` r
y
```

    ## [1] 66

**Zadanie** Przypisz do zmiennej `z` wartość sumy `x` i `y`,
powiększonej o 45%. Wywołaj `z`.

**Spodziewany wynik**

``` r
z <- (x + y)*1.45
# lub np. z <- (x + y) + 0.45*(x + y)
z
```

    ## [1] 110.2

  
  

> Wyświetlając nawet pojedynczą liczbę, `R` na początku linijki wyrzuca
> `[1]`. Jest to sygnał wskazujący, że obiekt wyświetlany na ekranie nie
> jest prostą jednostkową wartością liczbową (jak powiedziałby
> matematyk - nie jest *skalarem*), ale jest jednoelementowym wektorem.
> Wektor to w zasadzie lista liczb, obiekt mający jeden wymiar
> (długość):

    [ x y z ...]

> Skalar jest szczególnym rodzajem wektora o długości 1:

    [ x ]

> Jeśli takiemu obiektowi nadamy drugi wymiar (szerokość) dostaniemy
> coś, co będzie miało zarówno wiersze, jak i kolumny: tablicę liczb,
> czyli macierz.

    | x y z ... |
    | a b c ... |
    | i j k ... |
    | . . . ... |

◼

## 2. Wektory i ich tworzenie

Do tworzenia wektorów służy funkcja `c()`.

**Zadanie** Stwórz i wyświetl wektor o nazwie “vec” zawierający liczby
parzyste od 2 do 10.

**Spodziewany wynik**

``` r
vec <- c(2, 4, 6, 8, 10)
vec
```

    ## [1]  2  4  6  8 10

**Zadanie** Jakiego rodzaju wynik dostaniemy, jeśli zastosujemy w
stosunku do tego wektora funkcje: `length()`, `sqrt()`, `sum()`,
`mean()`, `sd()`? Co stanie się, gdy do wektora “dodamy” liczbę 100?

**Spodziewany wynik**

``` r
length(vec)
```

    ## [1] 5

``` r
sqrt(vec)
```

    ## [1] 1.414214 2.000000 2.449490 2.828427 3.162278

``` r
sum(vec)
```

    ## [1] 30

``` r
mean(vec)
```

    ## [1] 6

``` r
sd(vec)
```

    ## [1] 3.162278

``` r
vec + 100
```

    ## [1] 102 104 106 108 110

Aby ułatwić sobie życie możemy tworzyć wektory zawierające wiele
wartości w prosty sposób. Sekwencję liczb “od-do” możemy wygenerować za
pomocą operatora `:`. Podobnie (ale mając więcej kontroli nad sekwencją)
działa funkcja `seq()`. Podejrzyj pomoc do funkcji `seq()` oraz `rep()`.

**Zadanie** Stwórz trzy wektory: `vec1` za pomocą operatora `:`
zawierający liczby od 30 do 75, `vec2` zawierający liczby od -5 do 80
dodawane co 4 (`seq`) oraz `vec3` zawierający 156 powtórzeń liczby 6
(`rep`). Wyświetl te wektory. Co stanie się, gdy dodasz `vec1` i `vec3`?

**Spodziewany wynik**

``` r
vec1 <- 30:75
vec2 <- seq(-5, 80, by = 4)
vec3 <- rep(6, 156)

vec1
```

    ##  [1] 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67
    ## [39] 68 69 70 71 72 73 74 75

``` r
vec2
```

    ##  [1] -5 -1  3  7 11 15 19 23 27 31 35 39 43 47 51 55 59 63 67 71 75 79

``` r
vec3
```

    ##   [1] 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
    ##  [57] 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
    ## [113] 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6

``` r
vec1 + vec3
```

    ## Warning in vec1 + vec3: długość dłuszego obiektu nie jest wielokrotnością długości krótszego obiektu

    ##   [1] 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72
    ##  [38] 73 74 75 76 77 78 79 80 81 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63
    ##  [75] 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54
    ## [112] 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 36 37 38 39 40 41 42 43 44 45
    ## [149] 46 47 48 49 50 51 52 53

Przydatne funkcje mające zastosowanie do wektorów:

| Nazwa                    | Działanie                                                          |
|--------------------------|--------------------------------------------------------------------|
| `median()`               | mediana wartości                                                   |
| `mean()`                 | średnia                                                            |
| `sd()`                   | odchylenie standardowe                                             |
| `min()` i `max()`        | minimum i maximum                                                  |
| `length()`               | liczba elementów wektora                                           |
| `prod()` i `sum()`       | iloczyn i suma elementów                                           |
| `cumsum()` i `cumprod()` | jw., ale skumulowane                                               |
| `sort()`                 | sortowanie wektora (`rev(sort())` - w porządku malejącym)          |
| `unique()`               | zwraca tylko unikatowe elementy z danego wektora (usuwa duplikaty) |

◼

## 3. Indeksowanie wektorów

Aby dostać się do konkretnego elementu wektora, stosujemy notację
“indeksową”: `[indeks]`.

**Zadanie** Wyświetl następujące elementy wektora `vec1`: dwunasty; od
trzeciego do jedenastego; siódmy, drugi i trzydziesty.

**Spodziewany wynik**

``` r
vec1[12]
```

    ## [1] 41

``` r
vec1[3:11]
```

    ## [1] 32 33 34 35 36 37 38 39 40

``` r
vec1[c(7, 2, 30)]
```

    ## [1] 36 31 59

**Zadanie** Czy wektor może zawierać wartości różnego typu? Stwórz 2
wektory, jeden zawierający liczbę 2, wartość logiczną TRUE oraz liczbę
siedem, i drugi zawierający liczbę 11, słowo “dwa” i liczbę *π* z
dokładnością do 3 miejsc po przecinku. Co oznacza wynik tych działań?

**Spodziewany wynik**

``` r
v1 <- c(2, T, 7)
v1
```

    ## [1] 2 1 7

``` r
v2 <- c(11, "dwa", round(pi, digits = 3))
v2
```

    ## [1] "11"    "dwa"   "3.142"

◼

## 4. Ładowanie danych do `R`. Typy danych

Aby załadować do `R` realne dane może skorzystać z funkcji
`read.table()`, podając w niej pochodzenie danych (`file`), separator
oddzielający w danych kolumny od siebie (`sep`) oraz sposób
potraktowania zmiennych tekstowych (`stringsAsFactors`). Musimy również
dodać (opcja `header`) czy pierwszy wiersz pliku zawiera nazwy kolumn.

**Zadanie** Załaduj dane z pliku `BTdata.csv` do `R`, do obiektu o
nazwie `dane` - skorzystaj z operatora przypisania `<-`. Opcji
`stringsAsFactors` nadaj wartość `T`. Ładowany plik to CSV - kolumny są
w nim porozdzielane za pomocą przecinków. Następnie wyświetl za pomocą
funkcji `head()` kilka pierwszych wierszy obiektu `dane`.

**Spodziewany rezultat**

``` r
dane <- read.table(file = "BTdata.csv",
                   sep = ",", header = T,
                   stringsAsFactors = T)
head(dane)
```

    ##   tarsus     back     dam fosternest hatchdate  sex weight habitat bill_length bill_depth
    ## 1  13.55 551.3757 R187557      F2102        47  Fem    8.9    park      10.885      0.597
    ## 2  15.07 549.0884 R187559      F1902        47 Male   10.5  forest      12.056      0.682
    ## 3  14.99 550.1739 R187568       A602        47 Male    9.9  forest      12.000      0.673
    ## 4  14.69 550.3067 R187518      A1302        45 Male    9.7  forest      11.733      0.639
    ## 5  14.46 549.6392 R187528      A2602        45  Fem    9.7  forest      11.565      0.631
    ## 6  13.93 551.8693 R187945      C2302        49  Fem    9.3  forest      11.165      0.626

**Zadanie** Strukturę złożonych obiektów w `R` możemy poznać dzięki
funkcji `str()`. Podejrzyj strukturę obiektu `dane`. Co stanie się, gdy
wyświetlisz go za pomocą `View(dane)`?

**Spodziewany rezultat**

``` r
str(dane)
```

    ## 'data.frame':    828 obs. of  10 variables:
    ##  $ tarsus     : num  13.6 15.1 15 14.7 14.5 ...
    ##  $ back       : num  551 549 550 550 550 ...
    ##  $ dam        : Factor w/ 106 levels "Fem2","Fem20",..: 56 57 61 38 43 94 3 23 37 40 ...
    ##  $ fosternest : Factor w/ 104 levels "A1002","A102",..: 74 72 16 4 12 38 35 34 42 28 ...
    ##  $ hatchdate  : int  47 47 47 45 45 49 47 46 44 46 ...
    ##  $ sex        : Factor w/ 3 levels "Fem","Male","UNK": 1 2 2 2 1 1 2 1 1 1 ...
    ##  $ weight     : num  8.9 10.5 9.9 9.7 9.7 9.3 9.3 10.2 9.5 9.6 ...
    ##  $ habitat    : Factor w/ 2 levels "forest","park": 2 1 1 1 1 1 2 1 2 1 ...
    ##  $ bill_length: num  10.9 12.1 12 11.7 11.6 ...
    ##  $ bill_depth : num  0.597 0.682 0.673 0.639 0.631 0.626 0.591 0.675 0.629 0.609 ...

**Zadanie** Wyświetl podsumowanie obiektu `dane` za pomocą funkcji
`summary()`. Dlaczego zmienne `sex`, `habitat` i kilka innych mają inny
typ podsumowania niż np. `tarsus`?

**Spodziewany wynik**

``` r
summary(dane)
```

    ##      tarsus           back            dam        fosternest    hatchdate      sex          weight         habitat   
    ##  Min.   :12.57   Min.   :546.7   R187926: 15   G402   : 15   Min.   :44.0   Fem :373   Min.   : 8.600   forest:418  
    ##  1st Qu.:14.16   1st Qu.:549.2   R187517: 13   A2602  : 12   1st Qu.:47.0   Male:408   1st Qu.: 9.500   park  :410  
    ##  Median :14.54   Median :549.9   R187518: 12   A602   : 12   Median :48.0   UNK : 47   Median : 9.800               
    ##  Mean   :14.50   Mean   :550.0   R187559: 12   F2102  : 12   Mean   :48.4              Mean   : 9.789               
    ##  3rd Qu.:14.77   3rd Qu.:550.8   Fem20  : 11   A1602  : 11   3rd Qu.:50.0              3rd Qu.:10.000               
    ##  Max.   :16.81   Max.   :554.2   R187030: 11   B202   : 11   Max.   :55.0              Max.   :11.400               
    ##                                  (Other):754   (Other):755                                                          
    ##   bill_length      bill_depth    
    ##  Min.   :10.07   Min.   :0.5130  
    ##  1st Qu.:11.32   1st Qu.:0.6130  
    ##  Median :11.64   Median :0.6380  
    ##  Mean   :11.60   Mean   :0.6375  
    ##  3rd Qu.:11.84   3rd Qu.:0.6650  
    ##  Max.   :13.40   Max.   :0.7970  
    ## 

Nasz zestaw danych zawiera nowy rodzaj zmiennej: kategoryczną
(`factor`). Znamy już więc wszystkie potrzebne nam typy danych w `R`:

-   zmienne liczbowe (`numeric`) - mogą one mieć charakter całkowity,
    lub zmiennoprzecinkowy (z częścią dziesiętną)
-   zmienne tekstowe (`character`) - podczas wprowadzania zawsze
    ujmujemy je w cudzysłów (np. `x <- "nowy_tekst"`)
-   zmienne logiczne (`logical`) - możliwe są tylko 2 wartości: `TRUE`
    oraz `FALSE`
-   zmienne kategoryczne (`factor`) - kodują one przynależność do
    określonych kategorii, potrzebne są np. w analizie wariancji, gdzie
    zmienna niezależna ma charakter jakościowy (grupująca zmienna
    kategoryczna).

> Może zawsze testować typ zmiennej za pomocą funkcji z rodziny
> `is....`, a także przekształcać zmienne w inne typy za pomocą funkcji
> z rodziny `as....`. Np. `is.numeric(x)` sprawdza, czy `x` jest typu
> liczbowego (w odpowiedzi dostaniemy `TRUE` lub `FALSE`). Z kolei
> `y <- as.character(x)` tworzy zmienną `y`, w krtórej zapisujemy
> zmienną `x` po jej zamianie na typ tekstowy. Pamiętajmy, że nie
> wszystkie typy możemy zamieniać w dowolny inny typ (np. zamiana
> zmiannej tekstowej w liczbową nie ma większego sensu, chyba że tekst
> zawiera liczbę):

``` r
as.numeric("text")
```

    ## Warning: pojawiły się wartości NA na skutek przekształcenia

    ## [1] NA

``` r
#ale

as.numeric("2")
```

    ## [1] 2

**Zadanie** Za pomocą funkcji `ncol()` oraz `nrow()` ustal wymiary
tabeli `dane`. Czy wynik działania `ncol()` zgadza się z rezultatem
funkcji `names(dane)` - zwracającej nazwy kolumn w tabeli danych?

**Spodziewany wynik**

``` r
ncol(dane)
```

    ## [1] 10

``` r
nrow(dane)
```

    ## [1] 828

``` r
names(dane)
```

    ##  [1] "tarsus"      "back"        "dam"         "fosternest"  "hatchdate"   "sex"         "weight"      "habitat"    
    ##  [9] "bill_length" "bill_depth"

◼

## 5. Dane jako macierz - indeksowanie

W przypadku wektora indeksowanie odbywało się z użyciem `[indeks]`.
Załadowane dane to tzw. `dataframe` i jest to w zasadzie macierz
(tablica) wartości o określonej liczbie wierszy i kolumn. Potrzebujemy
więc 2 indeksów, by się do nich dostać:
`[indeks_wiersza, indeks_kolumny]`. Oto przykłady możliwości:

-   `[3, 4]` - zwróć wartość z 3. wiersza i 4. kolumny
-   `[, 5]` - zwróć całą piątą kolumnę
-   `[2:10, 1]` - zwróć wiersze od 2 do 10 z 1. kolumny
-   `[c(10, 20:25), ]` - zwróć wiersze 10 oraz od 20 do 25 dla
    wszystkich kolumn
-   `[,]` - zwróć wszystkie wiersze i wszystkie kolumny

**Zadanie** Zwróć i wyświetl dla obiektu `dane`: wiersze 1:10; wiersze
2, 20 i 200 dla kolumn od 1 do 5; wszystkie wiersze dla kolumny drugiej.
(W tym ostatnim przypadku użyj funkcji head, by ograniczyć wynik do
kilku pierwszych obserwacji).

**Spodziewany wynik**

``` r
dane[1:10,]
```

    ##    tarsus     back     dam fosternest hatchdate  sex weight habitat bill_length bill_depth
    ## 1   13.55 551.3757 R187557      F2102        47  Fem    8.9    park      10.885      0.597
    ## 2   15.07 549.0884 R187559      F1902        47 Male   10.5  forest      12.056      0.682
    ## 3   14.99 550.1739 R187568       A602        47 Male    9.9  forest      12.000      0.673
    ## 4   14.69 550.3067 R187518      A1302        45 Male    9.7  forest      11.733      0.639
    ## 5   14.46 549.6392 R187528      A2602        45  Fem    9.7  forest      11.565      0.631
    ## 6   13.93 551.8693 R187945      C2302        49  Fem    9.3  forest      11.165      0.626
    ## 7   13.93 549.4878    Fem3      C1902        47 Male    9.3    park      11.154      0.591
    ## 8   15.45 548.3911 R187030      C1302        46  Fem   10.2  forest      12.348      0.675
    ## 9   14.31 550.0810 R187517       C602        44  Fem    9.5    park      11.434      0.629
    ## 10  14.46 549.8523 R187523      B2202        46  Fem    9.6  forest      11.564      0.609

``` r
dane[c(2, 20, 200), 1:5]
```

    ##     tarsus     back     dam fosternest hatchdate
    ## 2    15.07 549.0884 R187559      F1902        47
    ## 20   13.40 549.0100 R187588      F2402        47
    ## 200  14.16 548.3299 R186907       C102        53

``` r
head(dane[, 2])
```

    ## [1] 551.3757 549.0884 550.1739 550.3067 549.6392 551.8693

Kolumn w macierzy możemy również indeksować po ich nazwie, korzystając
zarówno z konwencji `[]`, jak i ze specjalnego operatora `$` (np.
`tabela$zmienna1`).

**Zadanie** Korzystając z indeksowania za pomocą `[]` wyświetl wiersze
33 do 66 zmiennej `sex`. Korzystając z `$` wyświetl wartości 55 do 77
zmiennej `tarsus`.

**Spodziewany wynik**

``` r
dane[33:66, "sex"]
```

    ##  [1] Fem  Fem  Male Male Fem  Male Fem  Male Fem  Fem  Fem  Male Male Male Male Fem  UNK  Fem  Fem  Male Fem  Male
    ## [23] Fem  Male Fem  UNK  Fem  Male Male Fem  Male Fem  Male Male
    ## Levels: Fem Male UNK

``` r
dane$tarsus[55:77]
```

    ##  [1] 14.61 14.46 14.08 15.37 14.69 14.54 15.22 14.77 14.08 14.46 14.69 14.88 15.30 14.08 14.46 14.69 14.61 14.46 13.71
    ## [20] 14.61 14.24 14.77 15.11

Kolumny danych możemy zapisywać do nowych zmiennych. Możemy również
tworzyć nowe kolumny danych - “odwołując się” za pomocą `$` do kolumny o
nieistniejącej w danych nazwie.

**Zadanie** Zapisz kolumnę `back` do nowej zmiennej `kolor_plaszcza`.
Następnie utwórz w `dane` nową kolumnę `nowa` zawierającą same jedynki.
Wyświetl pierwszych 50 wartości nowej zmiennej `kolor_plaszcza` oraz
kilka pierwszych wierszy `dane` po modyfikacji (za pomocą `head()`).

**Spodziewany rezultat**

``` r
kolor_plaszcza <- dane$back
kolor_plaszcza[1:50]
```

    ##  [1] 551.3757 549.0884 550.1739 550.3067 549.6392 551.8693 549.4878 548.3911 550.0810 549.8523 547.7403 548.9847
    ## [13] 551.1920 549.2743 548.3708 551.1921 551.5066 549.7494 552.3874 549.0100 548.5515 550.9192 548.7900 549.6686
    ## [25] 548.8435 548.3054 549.3162 549.0850 550.3779 549.4345 550.0111 549.7445 551.4557 551.5648 549.0410 549.3314
    ## [37] 549.5218 550.5366 550.2580 549.5741 549.7790 554.1662 549.6629 549.6901 549.6963 548.2706 550.3595 547.2247
    ## [49] 551.5836 548.6962

``` r
dane$nowa <- 1
head(dane)
```

    ##   tarsus     back     dam fosternest hatchdate  sex weight habitat bill_length bill_depth nowa
    ## 1  13.55 551.3757 R187557      F2102        47  Fem    8.9    park      10.885      0.597    1
    ## 2  15.07 549.0884 R187559      F1902        47 Male   10.5  forest      12.056      0.682    1
    ## 3  14.99 550.1739 R187568       A602        47 Male    9.9  forest      12.000      0.673    1
    ## 4  14.69 550.3067 R187518      A1302        45 Male    9.7  forest      11.733      0.639    1
    ## 5  14.46 549.6392 R187528      A2602        45  Fem    9.7  forest      11.565      0.631    1
    ## 6  13.93 551.8693 R187945      C2302        49  Fem    9.3  forest      11.165      0.626    1

**Zadanie** Korzystając z `as.character` utwórz kolumnę `dam_text`,
zawierającą wersję tekstową zmiennej `dam` (oryginalnie typu `factor`).
Wyświetl podsumowanie `dane`.

**Spodziewany wynik**

``` r
dane$dam_text <- as.character(dane$dam)
summary(dane)
```

    ##      tarsus           back            dam        fosternest    hatchdate      sex          weight         habitat   
    ##  Min.   :12.57   Min.   :546.7   R187926: 15   G402   : 15   Min.   :44.0   Fem :373   Min.   : 8.600   forest:418  
    ##  1st Qu.:14.16   1st Qu.:549.2   R187517: 13   A2602  : 12   1st Qu.:47.0   Male:408   1st Qu.: 9.500   park  :410  
    ##  Median :14.54   Median :549.9   R187518: 12   A602   : 12   Median :48.0   UNK : 47   Median : 9.800               
    ##  Mean   :14.50   Mean   :550.0   R187559: 12   F2102  : 12   Mean   :48.4              Mean   : 9.789               
    ##  3rd Qu.:14.77   3rd Qu.:550.8   Fem20  : 11   A1602  : 11   3rd Qu.:50.0              3rd Qu.:10.000               
    ##  Max.   :16.81   Max.   :554.2   R187030: 11   B202   : 11   Max.   :55.0              Max.   :11.400               
    ##                                  (Other):754   (Other):755                                                          
    ##   bill_length      bill_depth          nowa     dam_text        
    ##  Min.   :10.07   Min.   :0.5130   Min.   :1   Length:828        
    ##  1st Qu.:11.32   1st Qu.:0.6130   1st Qu.:1   Class :character  
    ##  Median :11.64   Median :0.6380   Median :1   Mode  :character  
    ##  Mean   :11.60   Mean   :0.6375   Mean   :1                     
    ##  3rd Qu.:11.84   3rd Qu.:0.6650   3rd Qu.:1                     
    ##  Max.   :13.40   Max.   :0.7970   Max.   :1                     
    ## 

◼

## 6. Filtrowanie danych

Korzystając z notacji “indeksowej” `[]` możemy również dane filtrować,
wyświetlając ich różne podzbiory. Korzystamy wtedy bardzo często z
szeregu operatorów logicznych:

-   `<` oraz `>` - mniejszy niż, większy niż
-   `<=` oraz `>=` - mniejszy lub równy, większy lub równy
-   `==` - równy (zwróć uwagę, że `==` to nie to samo to `=`!)
-   `!=` - nierówny, inny niż
-   `&` - ORAZ
-   `|` - LUB
-   `!` - “NIE” (zaprzeczenie - np. `!(A==B)` oznacza, że A *nie* jest
    równe B (a zatem to składnia równoważna dla `A!=B`))

Działanie operatorów logicznych skutkuje zawsze powstaniem wartości
`TRUE`/`FALSE` - zależnie, czy warunek jest spełniony, czy nie.

``` r
2 == 3
```

    ## [1] FALSE

``` r
4 < 1
```

    ## [1] FALSE

``` r
8 != 8.0001
```

    ## [1] TRUE

``` r
!(9 > 5.5)
```

    ## [1] FALSE

Wymagany warunek umieszczamy w miejscu indeksu wierszy (bo filtrując
chcemy wybrać lub odfiltrować konkretne *wiersze* danych).

**Zadanie** Wyświetl wiersze danych, gdzie `weight` ma wartość powyżej
3.

**Spodziewany wynik**

``` r
dane[dane$weight > 3, ]
```

    ##    tarsus     back     dam fosternest hatchdate  sex weight habitat bill_length bill_depth nowa dam_text
    ## 1   13.55 551.3757 R187557      F2102        47  Fem    8.9    park      10.885      0.597    1  R187557
    ## 2   15.07 549.0884 R187559      F1902        47 Male   10.5  forest      12.056      0.682    1  R187559
    ## 3   14.99 550.1739 R187568       A602        47 Male    9.9  forest      12.000      0.673    1  R187568
    ## 4   14.69 550.3067 R187518      A1302        45 Male    9.7  forest      11.733      0.639    1  R187518
    ## 5   14.46 549.6392 R187528      A2602        45  Fem    9.7  forest      11.565      0.631    1  R187528
    ## 6   13.93 551.8693 R187945      C2302        49  Fem    9.3  forest      11.165      0.626    1  R187945
    ## 7   13.93 549.4878    Fem3      C1902        47 Male    9.3    park      11.154      0.591    1     Fem3
    ## 8   15.45 548.3911 R187030      C1302        46  Fem   10.2  forest      12.348      0.675    1  R187030
    ## 9   14.31 550.0810 R187517       C602        44  Fem    9.5    park      11.434      0.629    1  R187517
    ## 10  14.46 549.8523 R187523      B2202        46  Fem    9.6  forest      11.564      0.609    1  R187523
    ## 11  14.99 547.7403 R186902      B1402        52 Male   10.0  forest      11.977      0.636    1  R186902
    ## 12  14.08 548.9847 R187400      B1002        47  Fem    9.7    park      11.251      0.685    1  R187400
    ## 13  14.77 551.1920 R187932       B502        49 Male    9.9    park      11.828      0.638    1  R187932
    ## 14  13.63 549.2743 R187582      D1202        48 Male    9.2  forest      10.904      0.612    1  R187582
    ## 15  16.81 548.3708 R187545      D1002        47 Male   11.4    park      13.399      0.797    1  R187545
    ## 16  14.24 551.1921 R187546       D902        47  Fem    9.8    park      11.409      0.679    1  R187546
    ## 17  14.92 551.5066 R187590       D202        49  Fem   10.1  forest      11.929      0.700    1  R187590
    ## 18  14.46 549.7494 R187548       E902        48  Fem    9.6    park      11.512      0.669    1  R187548
    ## 19  15.37 552.3874 R187594       E302        49 Male   10.4  forest      12.259      0.641    1  R187594
    ## 20  13.40 549.0100 R187588      F2402        47  Fem    8.9    park      10.674      0.577    1  R187588
    ## 21  14.08 548.5515 R187557      F2102        47  Fem    9.2  forest      11.258      0.621    1  R187557
    ## 22  13.93 550.9192 R187559      F1902        47  Fem    9.6  forest      11.113      0.638    1  R187559
    ## 23  13.86 548.7900 R187531      F1702        46  Fem    9.0  forest      11.106      0.599    1  R187531
    ## 24  14.92 549.6686 R187592      F1102        47 Male   10.1    park      11.899      0.650    1  R187592
    ## 25  15.22 548.8435 R187575       F902        47 Male   10.4    park      12.163      0.657    1  R187575
    ## 26  13.63 548.3054 R186912       F102        54 Male    9.5  forest      10.866      0.619    1  R186912
    ## 27  14.61 549.3162 R187914      G1202        49  Fem    9.8  forest      11.700      0.631    1  R187914
    ## 28  14.84 549.0850 R187955       G602        49  Fem    9.9  forest      11.842      0.631    1  R187955
    ## 29  14.31 550.3779 R187535       G102        47 Male    9.7  forest      11.450      0.686    1  R187535
    ## 30  14.92 549.4345 K983388      H1302        48 Male    9.8  forest      11.929      0.682    1  K983388
    ## 31  13.93 550.0111   Fem20      H1102        48  Fem    9.4  forest      11.111      0.567    1    Fem20
    ## 32  14.61 549.7445 R187086       H502        47 Male    9.8    park      11.639      0.606    1  R187086
    ## 33  14.16 551.4557 R187539       A102        47  Fem    9.8  forest      11.273      0.648    1  R187539
    ## 34  14.69 551.5648 R187566       A302        47  Fem    9.9  forest      11.774      0.656    1  R187566
    ## 35  14.69 549.0410 R187569       A502        48 Male   10.0  forest      11.729      0.681    1  R187569
    ## 36  14.92 549.3314 R187568       A602        47 Male    9.7  forest      11.925      0.640    1  R187568
    ## 37  14.69 549.5218 R187537      A1002        47  Fem   10.0  forest      11.756      0.656    1  R187537
    ## 38  14.77 550.5366 R187518      A1302        45 Male   10.1  forest      11.772      0.595    1  R187518
    ## 39  14.24 550.2580 R187916      A1602        49  Fem    9.5  forest      11.418      0.612    1  R187916
    ## 40  14.69 549.5741 R186903     A18B02        53 Male   10.2  forest      11.782      0.607    1  R186903
    ## 41  14.39 549.7790 R187512      A2202        45  Fem   10.0  forest      11.506      0.622    1  R187512
    ## 42  13.02 554.1662 R187562      A2302        47  Fem    9.0  forest      10.441      0.632    1  R187562
    ## 43  14.61 549.6629 R187528      A2602        45  Fem   10.0  forest      11.737      0.668    1  R187528
    ## 44  14.54 549.6901 R187563      A2702        47 Male   10.0    park      11.597      0.703    1  R187563
    ## 45  14.77 549.6963 R187571      C2602        47 Male   10.2    park      11.823      0.662    1  R187571
    ## 46  14.77 548.2706 R187945      C2302        49 Male   10.1    park      11.766      0.669    1  R187945
    ## 47  14.54 550.3595    Fem3      C1902        47 Male    9.5  forest      11.676      0.623    1     Fem3
    ## 48  14.99 547.2247 R187030      C1302        46  Fem   10.0  forest      12.010      0.639    1  R187030
    ## 49  14.61 551.5836 R187517       C602        44  UNK    9.7    park      11.696      0.637    1  R187517
    ## 50  14.54 548.6962 R187523      B2202        46  Fem    9.8  forest      11.585      0.601    1  R187523
    ## 51  13.93 549.9861 R186902      B1402        52  Fem    9.3  forest      11.190      0.589    1  R186902
    ## 52  14.61 549.3029 R187958      B1302        51 Male    9.7    park      11.675      0.615    1  R187958
    ## 53  14.69 549.4065 R187953       B902        51  Fem   10.2  forest      11.812      0.673    1  R187953
    ## 54  13.93 551.5280 R187932       B502        49 Male    9.4  forest      11.180      0.590    1  R187932
    ## 55  14.61 548.9334 R187547       B202        48  Fem    9.7  forest      11.687      0.674    1  R187547
    ## 56  14.46 549.2769 R187947      D1302        51 Male   10.1    park      11.595      0.657    1  R187947
    ## 57  14.08 550.0670 R187582      D1202        48  Fem    9.2  forest      11.215      0.660    1  R187582
    ## 58  15.37 548.3958 R187545      D1002        47  UNK   10.4  forest      12.316      0.686    1  R187545
    ## 59  14.69 548.9010 R187546       D902        47  Fem    9.9  forest      11.796      0.640    1  R187546
    ## 60  14.54 549.1467 R187239       D802        48 Male    9.9    park      11.654      0.585    1  R187239
    ## 61  15.22 551.8520 R187590       D202        49 Male    9.7    park      12.150      0.607    1  R187590
    ## 62  14.77 550.0391 R187521      E2002        46  Fem    9.7    park      11.798      0.673    1  R187521
    ## 63  14.08 552.0280 R187931      E1902        49 Male    9.8    park      11.315      0.636    1  R187931
    ## 64  14.46 549.2442 R187577      E1802        47  Fem    9.7    park      11.582      0.650    1  R187577
    ## 65  14.69 548.1016 R187292      E1602        47 Male    9.9  forest      11.790      0.629    1  R187292
    ## 66  14.88 549.1921 R187516      E1402        45 Male   10.2  forest      11.908      0.656    1  R187516
    ## 67  15.30 550.0180 R187166      E1202        47 Male   10.6    park      12.216      0.671    1  R187166
    ## 68  14.08 548.1312 R187579      E1102        47 Male    9.6  forest      11.225      0.618    1  R187579
    ## 69  14.46 550.1487 R187548       E902        48 Male    9.9    park      11.524      0.619    1  R187548
    ## 70  14.69 547.3415 R187155       E702        47  Fem   10.2  forest      11.758      0.627    1  R187155
    ## 71  14.61 551.7654 R187594       E302        49  Fem    9.8    park      11.684      0.595    1  R187594
    ## 72  14.46 549.4461 R187588      F2402        47  Fem    9.7    park      11.593      0.598    1  R187588
    ## 73  13.71 550.9298 R187557      F2102        47  Fem    9.3    park      10.976      0.557    1  R187557
    ## 74  14.61 548.6685 R187559      F1902        47  Fem    9.8  forest      11.647      0.620    1  R187559
    ## 75  14.24 551.3127 R187531      F1702        46  Fem    9.8  forest      11.396      0.609    1  R187531
    ## 76  14.77 549.1432 R187963      F1502        53  Fem    9.9    park      11.801      0.650    1  R187963
    ## 77  15.11 550.3385 R187592      F1102        47 Male   10.2    park      12.115      0.666    1  R187592
    ## 78  13.93 547.4217 R187575       F902        47 Male    9.4    park      11.178      0.620    1  R187575
    ## 79  14.39 551.1328    Fem5       F202        50  Fem    9.6    park      11.513      0.644    1     Fem5
    ## 80  13.86 550.0156 R187930      G2202        50 Male    9.7    park      11.043      0.597    1  R187930
    ## 81  14.77 551.0885 R187598      G1602        49 Male    9.9    park      11.798      0.631    1  R187598
    ## 82  15.30 549.3562 R187914      G1202        49 Male   10.4    park      12.243      0.620    1  R187914
    ## 83  14.39 549.5822 R187957       G702        51  Fem   10.0  forest      11.543      0.627    1  R187957
    ##  [ reached 'max' / getOption("max.print") -- omitted 745 rows ]

**Zadanie** Wyświetl wiersze danych, gdzie `weight` ma wartość powyżej
2.5, i jednocześnie ptak pochodzi z lasu (`habitat == "forest"`).

**Spodziewany wynik**

``` r
dane[dane$weight > 2.5 & dane$habitat == "forest", ]
```

    ##     tarsus     back     dam fosternest hatchdate  sex weight habitat bill_length bill_depth nowa dam_text
    ## 2    15.07 549.0884 R187559      F1902        47 Male   10.5  forest      12.056      0.682    1  R187559
    ## 3    14.99 550.1739 R187568       A602        47 Male    9.9  forest      12.000      0.673    1  R187568
    ## 4    14.69 550.3067 R187518      A1302        45 Male    9.7  forest      11.733      0.639    1  R187518
    ## 5    14.46 549.6392 R187528      A2602        45  Fem    9.7  forest      11.565      0.631    1  R187528
    ## 6    13.93 551.8693 R187945      C2302        49  Fem    9.3  forest      11.165      0.626    1  R187945
    ## 8    15.45 548.3911 R187030      C1302        46  Fem   10.2  forest      12.348      0.675    1  R187030
    ## 10   14.46 549.8523 R187523      B2202        46  Fem    9.6  forest      11.564      0.609    1  R187523
    ## 11   14.99 547.7403 R186902      B1402        52 Male   10.0  forest      11.977      0.636    1  R186902
    ## 14   13.63 549.2743 R187582      D1202        48 Male    9.2  forest      10.904      0.612    1  R187582
    ## 17   14.92 551.5066 R187590       D202        49  Fem   10.1  forest      11.929      0.700    1  R187590
    ## 19   15.37 552.3874 R187594       E302        49 Male   10.4  forest      12.259      0.641    1  R187594
    ## 21   14.08 548.5515 R187557      F2102        47  Fem    9.2  forest      11.258      0.621    1  R187557
    ## 22   13.93 550.9192 R187559      F1902        47  Fem    9.6  forest      11.113      0.638    1  R187559
    ## 23   13.86 548.7900 R187531      F1702        46  Fem    9.0  forest      11.106      0.599    1  R187531
    ## 26   13.63 548.3054 R186912       F102        54 Male    9.5  forest      10.866      0.619    1  R186912
    ## 27   14.61 549.3162 R187914      G1202        49  Fem    9.8  forest      11.700      0.631    1  R187914
    ## 28   14.84 549.0850 R187955       G602        49  Fem    9.9  forest      11.842      0.631    1  R187955
    ## 29   14.31 550.3779 R187535       G102        47 Male    9.7  forest      11.450      0.686    1  R187535
    ## 30   14.92 549.4345 K983388      H1302        48 Male    9.8  forest      11.929      0.682    1  K983388
    ## 31   13.93 550.0111   Fem20      H1102        48  Fem    9.4  forest      11.111      0.567    1    Fem20
    ## 33   14.16 551.4557 R187539       A102        47  Fem    9.8  forest      11.273      0.648    1  R187539
    ## 34   14.69 551.5648 R187566       A302        47  Fem    9.9  forest      11.774      0.656    1  R187566
    ## 35   14.69 549.0410 R187569       A502        48 Male   10.0  forest      11.729      0.681    1  R187569
    ## 36   14.92 549.3314 R187568       A602        47 Male    9.7  forest      11.925      0.640    1  R187568
    ## 37   14.69 549.5218 R187537      A1002        47  Fem   10.0  forest      11.756      0.656    1  R187537
    ## 38   14.77 550.5366 R187518      A1302        45 Male   10.1  forest      11.772      0.595    1  R187518
    ## 39   14.24 550.2580 R187916      A1602        49  Fem    9.5  forest      11.418      0.612    1  R187916
    ## 40   14.69 549.5741 R186903     A18B02        53 Male   10.2  forest      11.782      0.607    1  R186903
    ## 41   14.39 549.7790 R187512      A2202        45  Fem   10.0  forest      11.506      0.622    1  R187512
    ## 42   13.02 554.1662 R187562      A2302        47  Fem    9.0  forest      10.441      0.632    1  R187562
    ## 43   14.61 549.6629 R187528      A2602        45  Fem   10.0  forest      11.737      0.668    1  R187528
    ## 47   14.54 550.3595    Fem3      C1902        47 Male    9.5  forest      11.676      0.623    1     Fem3
    ## 48   14.99 547.2247 R187030      C1302        46  Fem   10.0  forest      12.010      0.639    1  R187030
    ## 50   14.54 548.6962 R187523      B2202        46  Fem    9.8  forest      11.585      0.601    1  R187523
    ## 51   13.93 549.9861 R186902      B1402        52  Fem    9.3  forest      11.190      0.589    1  R186902
    ## 53   14.69 549.4065 R187953       B902        51  Fem   10.2  forest      11.812      0.673    1  R187953
    ## 54   13.93 551.5280 R187932       B502        49 Male    9.4  forest      11.180      0.590    1  R187932
    ## 55   14.61 548.9334 R187547       B202        48  Fem    9.7  forest      11.687      0.674    1  R187547
    ## 57   14.08 550.0670 R187582      D1202        48  Fem    9.2  forest      11.215      0.660    1  R187582
    ## 58   15.37 548.3958 R187545      D1002        47  UNK   10.4  forest      12.316      0.686    1  R187545
    ## 59   14.69 548.9010 R187546       D902        47  Fem    9.9  forest      11.796      0.640    1  R187546
    ## 65   14.69 548.1016 R187292      E1602        47 Male    9.9  forest      11.790      0.629    1  R187292
    ## 66   14.88 549.1921 R187516      E1402        45 Male   10.2  forest      11.908      0.656    1  R187516
    ## 68   14.08 548.1312 R187579      E1102        47 Male    9.6  forest      11.225      0.618    1  R187579
    ## 70   14.69 547.3415 R187155       E702        47  Fem   10.2  forest      11.758      0.627    1  R187155
    ## 74   14.61 548.6685 R187559      F1902        47  Fem    9.8  forest      11.647      0.620    1  R187559
    ## 75   14.24 551.3127 R187531      F1702        46  Fem    9.8  forest      11.396      0.609    1  R187531
    ## 83   14.39 549.5822 R187957       G702        51  Fem   10.0  forest      11.543      0.627    1  R187957
    ## 85   14.01 548.6694 R187552       G502        47  Fem    9.5  forest      11.174      0.611    1  R187552
    ## 87   13.86 549.2066 R187527      H3602        45  Fem    9.4  forest      11.053      0.582    1  R187527
    ## 88   13.86 548.9382 R187595      H3202        48  Fem    9.3  forest      11.126      0.579    1  R187595
    ## 90   14.54 549.3613 K983388      H1302        48 Male    9.5  forest      11.668      0.622    1  K983388
    ## 91   14.54 549.2358   Fem20      H1102        48 Male    9.9  forest      11.622      0.665    1    Fem20
    ## 92   14.54 548.4885 R187086       H502        47 Male    9.8  forest      11.628      0.604    1  R187086
    ## 93   14.08 549.1360 R187539       A102        47 Male    9.5  forest      11.260      0.611    1  R187539
    ## 95   15.30 550.7461 R187569       A502        48 Male   10.3  forest      12.214      0.591    1  R187569
    ## 96   14.24 549.9236 R187568       A602        47  Fem    9.7  forest      11.367      0.573    1  R187568
    ## 97   14.77 548.7549 R187537      A1002        47  Fem    9.8  forest      11.878      0.681    1  R187537
    ## 98   14.12 548.9031 R187518      A1302        45 Male    9.4  forest      11.308      0.601    1  R187518
    ## 101  14.46 547.4245 R186903     A18B02        53 Male    9.6  forest      11.557      0.598    1  R186903
    ## 102  13.71 551.4740 R187512      A2202        45  Fem    9.1  forest      10.975      0.610    1  R187512
    ## 103  13.93 550.9829 R187562      A2302        47 Male    9.8  forest      11.122      0.581    1  R187562
    ## 105  14.46 549.7711 R187563      A2702        47 Male    9.5  forest      11.538      0.630    1  R187563
    ## 108  14.84 550.3242 R187945      C2302        49 Male    9.8  forest      11.875      0.654    1  R187945
    ## 109  14.69 550.3553    Fem3      C1902        47 Male    9.6  forest      11.738      0.641    1     Fem3
    ## 110  15.07 550.4161 R187030      C1302        46  Fem   10.3  forest      12.052      0.664    1  R187030
    ## 113  14.61 549.8967 R187920       C202        50  Fem    9.9  forest      11.720      0.680    1  R187920
    ## 117  14.84 550.6912 R187927      B2102        50 Male   10.2  forest      11.854      0.672    1  R187927
    ## 118  14.77 551.8031 R187942      B1902        50 Male   10.0  forest      11.828      0.675    1  R187942
    ## 122  14.69 550.0155 R186902      B1402        52 Male    9.9  forest      11.760      0.621    1  R186902
    ## 125  15.22 550.7279 R187400      B1002        47 Male   10.3  forest      12.131      0.663    1  R187400
    ## 127  14.46 551.1592 R187932       B502        49  Fem    9.5  forest      11.614      0.625    1  R187932
    ## 128  14.46 548.5005 R187547       B202        48  Fem    9.9  forest      11.622      0.648    1  R187547
    ## 129  14.08 549.7397 R187947      D1302        51  Fem    9.5  forest      11.239      0.601    1  R187947
    ## 131  14.16 548.3601 R187964      D1102        53  Fem    9.7  forest      11.327      0.592    1  R187964
    ## 133  14.77 550.4228 R187546       D902        47  Fem   10.2  forest      11.834      0.668    1  R187546
    ## 134  14.61 548.7633 R187239       D802        48 Male   10.0  forest      11.689      0.685    1  R187239
    ## 135  14.54 553.7773 R187940       D402        50  Fem   10.0  forest      11.626      0.639    1  R187940
    ## 136  15.52 551.7863 R187590       D202        49 Male   10.5  forest      12.394      0.725    1  R187590
    ## 138  15.37 549.9879 R187521      E2002        46 Male   10.1  forest      12.295      0.747    1  R187521
    ## 139  13.78 550.2000 R187931      E1902        49  Fem    9.4  forest      11.039      0.605    1  R187931
    ## 141  14.46 550.6194 R188000      E1702        51  Fem    9.8  forest      11.538      0.642    1  R188000
    ## 142  14.77 547.1794 R187292      E1602        47  Fem   10.0  forest      11.850      0.694    1  R187292
    ##  [ reached 'max' / getOption("max.print") -- omitted 335 rows ]

**Zadanie** Wyświetl wiersze danych, dany osobnik pochodzi z gniazda
(`fosternest`) nr H102 lub D402.

**Spodziewany wynik**

``` r
dane[dane$fosternest == "H102" | dane$fosternest == "D402", ]
```

    ##     tarsus     back     dam fosternest hatchdate  sex weight habitat bill_length bill_depth nowa dam_text
    ## 135  14.54 553.7773 R187940       D402        50  Fem   10.0  forest      11.626      0.639    1  R187940
    ## 221  15.14 553.3317 R187940       D402        50 Male   10.3  forest      12.104      0.645    1  R187940
    ## 313  14.69 550.5040 R187940       D402        50 Male   10.1    park      11.755      0.669    1  R187940
    ## 358  14.92 549.6806 R187009       H102        46 Male   10.0  forest      11.937      0.648    1  R187009
    ## 371  14.61 552.3244 R187927       D402        50  UNK    9.6  forest      11.686      0.676    1  R187927
    ## 381  14.77 550.9502 R187927       D402        50  Fem   10.3    park      11.825      0.684    1  R187927
    ## 385  14.46 551.0132 R187001       H102        46 Male   10.0  forest      11.591      0.601    1  R187001
    ## 396  14.39 551.7571 R187927       D402        50  Fem    9.4  forest      11.469      0.678    1  R187927
    ## 416  14.39 550.8274 R187001       H102        46  Fem    9.6    park      11.493      0.672    1  R187001
    ## 473  13.93 550.6763 R187001       H102        46 Male    9.8    park      11.123      0.661    1  R187001
    ## 509  14.92 552.4517 R187927       D402        50 Male    9.9    park      11.922      0.668    1  R187927
    ## 548  14.46 552.0074 R187001       H102        46  Fem    9.6  forest      11.567      0.607    1  R187001
    ## 591  14.39 550.8278 R187927       D402        50  Fem   10.1    park      11.477      0.655    1  R187927
    ## 634  14.24 549.2437 R187001       H102        46  Fem    9.8    park      11.437      0.659    1  R187001
    ## 679  15.45 550.7465 R187927       D402        50 Male    9.8    park      12.298      0.671    1  R187927
    ## 729  14.01 551.0765 R187001       H102        46  Fem    9.3    park      11.228      0.589    1  R187001
    ## 774  14.84 551.6591 R187927       D402        50 Male   10.2  forest      11.910      0.617    1  R187927
    ## 828  14.92 548.2735 R187001       H102        46 Male   10.2    park      11.926      0.652    1  R187001

**Zadanie** Wyświetl wiersze danych, gdzie dany osobnik pochodzi z
gniazda (`fosternest`) nr H102 lub D402, i jednocześnie usuń wszystkie
ptaki o płci męskiej (`Male` w `sex`).

**Spodziewany wynik**

``` r
dane[(dane$fosternest == "H102" | dane$fosternest == "D402") & dane$sex != "Male", ]
```

    ##     tarsus     back     dam fosternest hatchdate sex weight habitat bill_length bill_depth nowa dam_text
    ## 135  14.54 553.7773 R187940       D402        50 Fem   10.0  forest      11.626      0.639    1  R187940
    ## 371  14.61 552.3244 R187927       D402        50 UNK    9.6  forest      11.686      0.676    1  R187927
    ## 381  14.77 550.9502 R187927       D402        50 Fem   10.3    park      11.825      0.684    1  R187927
    ## 396  14.39 551.7571 R187927       D402        50 Fem    9.4  forest      11.469      0.678    1  R187927
    ## 416  14.39 550.8274 R187001       H102        46 Fem    9.6    park      11.493      0.672    1  R187001
    ## 548  14.46 552.0074 R187001       H102        46 Fem    9.6  forest      11.567      0.607    1  R187001
    ## 591  14.39 550.8278 R187927       D402        50 Fem   10.1    park      11.477      0.655    1  R187927
    ## 634  14.24 549.2437 R187001       H102        46 Fem    9.8    park      11.437      0.659    1  R187001
    ## 729  14.01 551.0765 R187001       H102        46 Fem    9.3    park      11.228      0.589    1  R187001

**Zadanie** Jak wyżej, ale interesują Cię tylko kolumny `hatchdate` oraz
`dam`.

**Spodziewany wynik**

``` r
dane[(dane$fosternest == "H102" | dane$fosternest == "D402") & dane$sex != "Male",
     c("hatchdate", "dam")]
```

    ##     hatchdate     dam
    ## 135        50 R187940
    ## 371        50 R187927
    ## 381        50 R187927
    ## 396        50 R187927
    ## 416        46 R187001
    ## 548        46 R187001
    ## 591        50 R187927
    ## 634        46 R187001
    ## 729        46 R187001

Zamiast używać konwencji indeksowania (`[]`) możemy wykorzystać funkcję
`subset()`. Poza nazwą filtrowanego obiektu, podajemy w niej potrzebne
warunki logiczne, tyle że możemy pominąć wskazywanie zestawu danych i
`$`.

**Zadanie** Za pomocą `subset()`, wybierz wiersze danych, gdzie dany
osobnik pochodzi z gniazda (`fosternest`) nr H102 lub D402, i
jednocześnie usuń wszystkie ptaki o płci męskiej (`Male` w `sex`), a
następnie zapisz je w nowej zmiennej `dane2`. Wyświetl tą nową tabelę
danych.

**Spodziewany wynik**

``` r
dane2 <- subset(dane,
       (fosternest == "H102" | fosternest == "D402") & sex != "Male")
dane2
```

    ##     tarsus     back     dam fosternest hatchdate sex weight habitat bill_length bill_depth nowa dam_text
    ## 135  14.54 553.7773 R187940       D402        50 Fem   10.0  forest      11.626      0.639    1  R187940
    ## 371  14.61 552.3244 R187927       D402        50 UNK    9.6  forest      11.686      0.676    1  R187927
    ## 381  14.77 550.9502 R187927       D402        50 Fem   10.3    park      11.825      0.684    1  R187927
    ## 396  14.39 551.7571 R187927       D402        50 Fem    9.4  forest      11.469      0.678    1  R187927
    ## 416  14.39 550.8274 R187001       H102        46 Fem    9.6    park      11.493      0.672    1  R187001
    ## 548  14.46 552.0074 R187001       H102        46 Fem    9.6  forest      11.567      0.607    1  R187001
    ## 591  14.39 550.8278 R187927       D402        50 Fem   10.1    park      11.477      0.655    1  R187927
    ## 634  14.24 549.2437 R187001       H102        46 Fem    9.8    park      11.437      0.659    1  R187001
    ## 729  14.01 551.0765 R187001       H102        46 Fem    9.3    park      11.228      0.589    1  R187001

**Zadanie** Za pomocą `subset()`, wybierz wiersze danych z `dane` z
samicami, które mają najdłuższy i najkrótszy skok (`tarsus`).

**Spodziewany wynik**

``` r
subset(dane,
       tarsus == max(dane$tarsus) | tarsus == min(dane$tarsus))
```

    ##     tarsus     back     dam fosternest hatchdate  sex weight habitat bill_length bill_depth nowa dam_text
    ## 15   16.81 548.3708 R187545      D1002        47 Male   11.4    park      13.399      0.797    1  R187545
    ## 121  12.57 551.1584 R186908      B1602        53  Fem    8.6    park      10.071      0.574    1  R186908

◼

## 7. Brakujące dane

Wartości `NA` oznaczają “brakujące” (puste) obserwacje. Zobaczmy jak
możemy się ich pozbyć z naszego zestawu danych. Najpierw wprowadźmy do
naszych nowych danych `dane2` kilka brakujących obserwacji w wierszach
3, 5 i 7 kolumny nr 2, oraz w wierszu 1 kolumny 3:

``` r
dane2[c(3, 5, 7), 2] <- NA
dane2[1, 3] <- NA
dane2
```

    ##     tarsus     back     dam fosternest hatchdate sex weight habitat bill_length bill_depth nowa dam_text
    ## 135  14.54 553.7773    <NA>       D402        50 Fem   10.0  forest      11.626      0.639    1  R187940
    ## 371  14.61 552.3244 R187927       D402        50 UNK    9.6  forest      11.686      0.676    1  R187927
    ## 381  14.77       NA R187927       D402        50 Fem   10.3    park      11.825      0.684    1  R187927
    ## 396  14.39 551.7571 R187927       D402        50 Fem    9.4  forest      11.469      0.678    1  R187927
    ## 416  14.39       NA R187001       H102        46 Fem    9.6    park      11.493      0.672    1  R187001
    ## 548  14.46 552.0074 R187001       H102        46 Fem    9.6  forest      11.567      0.607    1  R187001
    ## 591  14.39       NA R187927       D402        50 Fem   10.1    park      11.477      0.655    1  R187927
    ## 634  14.24 549.2437 R187001       H102        46 Fem    9.8    park      11.437      0.659    1  R187001
    ## 729  14.01 551.0765 R187001       H102        46 Fem    9.3    park      11.228      0.589    1  R187001

``` r
summary(dane2)
```

    ##      tarsus           back            dam      fosternest   hatchdate       sex        weight         habitat 
    ##  Min.   :14.01   Min.   :549.2   R187001:4   D402   :5    Min.   :46.00   Fem :8   Min.   : 9.300   forest:4  
    ##  1st Qu.:14.39   1st Qu.:551.2   R187927:4   H102   :4    1st Qu.:46.00   Male:0   1st Qu.: 9.600   park  :5  
    ##  Median :14.39   Median :551.9   Fem2   :0   A1002  :0    Median :50.00   UNK :1   Median : 9.600             
    ##  Mean   :14.42   Mean   :551.7   Fem20  :0   A102   :0    Mean   :48.22            Mean   : 9.744             
    ##  3rd Qu.:14.54   3rd Qu.:552.2   Fem3   :0   A1202  :0    3rd Qu.:50.00            3rd Qu.:10.000             
    ##  Max.   :14.77   Max.   :553.8   (Other):0   A1302  :0    Max.   :50.00            Max.   :10.300             
    ##                  NA's   :3       NA's   :1   (Other):0                                                        
    ##   bill_length      bill_depth         nowa     dam_text        
    ##  Min.   :11.23   Min.   :0.589   Min.   :1   Length:9          
    ##  1st Qu.:11.47   1st Qu.:0.639   1st Qu.:1   Class :character  
    ##  Median :11.49   Median :0.659   Median :1   Mode  :character  
    ##  Mean   :11.53   Mean   :0.651   Mean   :1                     
    ##  3rd Qu.:11.63   3rd Qu.:0.676   3rd Qu.:1                     
    ##  Max.   :11.82   Max.   :0.684   Max.   :1                     
    ## 

**Zadanie** Użyj funkcji `is.na()` na danych z kolumny 2.

**Spodziewany wynik**

``` r
is.na(dane2[, 2])
```

    ## [1] FALSE FALSE  TRUE FALSE  TRUE FALSE  TRUE FALSE FALSE

Funkcja ta testuje czy dana wartość (lub elementy wektora) są
wartościami brakującymi. Możemy wykorzystać filtrowanie zestawów danych,
by wyświetlić tylko te wiersze, gdzie dana zmienna nie ma wartości
brakujących:

``` r
subset(dane2, !is.na(back))
```

    ##     tarsus     back     dam fosternest hatchdate sex weight habitat bill_length bill_depth nowa dam_text
    ## 135  14.54 553.7773    <NA>       D402        50 Fem   10.0  forest      11.626      0.639    1  R187940
    ## 371  14.61 552.3244 R187927       D402        50 UNK    9.6  forest      11.686      0.676    1  R187927
    ## 396  14.39 551.7571 R187927       D402        50 Fem    9.4  forest      11.469      0.678    1  R187927
    ## 548  14.46 552.0074 R187001       H102        46 Fem    9.6  forest      11.567      0.607    1  R187001
    ## 634  14.24 549.2437 R187001       H102        46 Fem    9.8    park      11.437      0.659    1  R187001
    ## 729  14.01 551.0765 R187001       H102        46 Fem    9.3    park      11.228      0.589    1  R187001

**Zadanie** Szybszym sposobem jest użycie funkcji `na.omit()` dla całej
tabeli danych. Spróbuj tego sposobu z naszymi danymi `dane2`.

**Spodziewany wynik**

``` r
na.omit(dane2)
```

    ##     tarsus     back     dam fosternest hatchdate sex weight habitat bill_length bill_depth nowa dam_text
    ## 371  14.61 552.3244 R187927       D402        50 UNK    9.6  forest      11.686      0.676    1  R187927
    ## 396  14.39 551.7571 R187927       D402        50 Fem    9.4  forest      11.469      0.678    1  R187927
    ## 548  14.46 552.0074 R187001       H102        46 Fem    9.6  forest      11.567      0.607    1  R187001
    ## 634  14.24 549.2437 R187001       H102        46 Fem    9.8    park      11.437      0.659    1  R187001
    ## 729  14.01 551.0765 R187001       H102        46 Fem    9.3    park      11.228      0.589    1  R187001

Zauważ, że pozbyliśmy się \*\*wszystkich\* wierszy zawierających choć
jedną wartość `NA`. Często dokładnie o to nam chodzi, ale pamiętajmy, że
czasem usunięcie `NA` z jakiejś zmiennej może nas nie interesować -
jednocześnie jednak może prowadzić do pozbycia się wartościowych danych.

**Zadanie** Spróbuj policzyć średnią (`mean()`) kolumny `back` z tabeli
`dane2`. Co oznacza wynik? Czy jesteś w stanie, czytając `?mean`,
znaleźć rozwiązanie pozwalające na obliczenie prawidłowej wartości
średniej?

**Spodziewany wynik**

``` r
mean(dane2$back)
```

    ## [1] NA

``` r
mean(dane2$back, na.rm = T)
```

    ## [1] 551.6977

Dokładnie ten sam problem (i to samo rozwiązanie) dotyczy takich
funkcji, jak `min()`, `max()`, `sd()`, `median()` czy `var()`.

◼
