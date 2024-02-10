### GoIT moduł 2 web 
# Zadanie domowe #6
## Zadanie podstawowe
Zaimplementuj bazę danych, która ma schemat zawierający:
- Tabelę ze studentami;
- Tabelę z grupami;
- Tabelę z wykładowcami;
- Tabelę z przedmiotami wraz z podaniem wykładowcy, który prowadzi dany przedmiot;
- Tabelę, zawierającą oceny z poszczególnych przedmiotów dla każdego ucznia wraz z datą, kiedy ocena została wystawiona;

Wypełnij bazę danych danymi losowymi (~30-50 uczniów, 3 grupy, 5-8 przedmiotów, 3-5 wykładowców, do 20 ocen dla każdego ucznia ze wszystkich przedmiotów). 
W tym celu użyj pakietu [Faker](https://pypi.org/project/Faker/).

Utwórz zapytania do bazy danych, które zwrócą następujące wyniki:
1. 5 uczniów z najwyższą średnią ocen ze wszystkich przedmiotów.
2. Uczeń z najwyższą średnią ocen z wybranego przedmiotu.
3. Średnia ocen w grupach dla wybranego przedmiotu.
4. Średnia ocen dla wszystkich grup, uwzględniając wszystkie oceny.
5. Przedmioty, które prowadzi wybrany wykładowca.
6. Lista uczniów w wybranej grupie.
7. Oceny uczniów w wybranej grupie z określonego przedmiotu.
8. Średnia ocen wystawionych przez wykładowcę z danego przedmiotu.
9. Lista kursów, na które uczęszcza uczeń.
10. Lista kursów prowadzonych przez wybranego wykładowcę dla określonego ucznia.

Na potrzeby każdego zapytania utwórz osobny plik ```query_number.sql```, w którym zamiast ```number``` podstaw numer zapytania. 
Taki plik będzie zawierał polecenie SQL, które może być uruchomion zarówno w terminalu bazy danych, jak i poprzez ```cursor.execute(sql)```.

## Zadanie dodatkowe
W ramach dodatkowego zadania napisz bardziej skomplikowane zapytania:
1. Średnia ocen wybranego ucznia wystawionych przez określonego wykładowcę.
2. Oceny uczniów w wybranej grupie z określonego przedmiotu na ostatnich zajęciach.
