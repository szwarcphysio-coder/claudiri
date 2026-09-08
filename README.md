# Claudiri

Skrót na iPhone'a, który zamienia jedno zdanie powiedziane na głos w wykonane działanie na telefonie. Mówisz „nastaw budzik na szóstą trzydzieści, dopisz mleko do zakupów i przypomnij mi zadzwonić do księgowej w czwartek", a telefon zakłada budzik, dopisuje produkt i dodaje przypomnienie. Trzy rzeczy z jednego zdania.

Rozpoznawanie robi Claude: podyktowane zdanie idzie do aplikacji Claude i wraca jako lista poleceń. Wykonanie jest już w całości natywne, przez Przypomnienia, Kalendarz, Zegar, Mapy i Muzykę. Poza tą jedną wymianą nic nigdzie nie wychodzi, nie wklejasz żadnego klucza ani adresu serwera.

## Co umie

| Powiesz | Stanie się |
|---|---|
| „przypomnij mi zapłacić rachunek w piątek" | przypomnienie z terminem |
| „spotkanie z Anią jutro o dwunastej na godzinę" | wydarzenie w kalendarzu |
| „budzik na szóstą trzydzieści", „wyłącz budzik na siódmą" | założenie, włączenie albo wyłączenie budzika |
| „ustaw minutnik na dwadzieścia minut" | odliczanie w Zegarze |
| „dopisz mleko i ogórki do zakupów" | dwie pozycje w Przypomnieniach, po dziale sklepowym |
| „zawieź mnie do Biedronki na Grunwaldzkiej" | nawigacja w Mapach Google |
| „puść coś na trening" | Claude wybiera wykonawcę, gra Apple Music |
| „ile kalorii ma awokado" | otwarta wyszukiwarka z tym pytaniem |

Jedno zdanie może zawierać kilka poleceń różnego typu. Czego nie rozpozna, to pomija, zamiast zgadywać.

Terminy liczy od zegara telefonu. „Za godzinę dziesięć" to 70 minut, nie 10:00. „O ósmej" powiedziane o piętnastej to dziś wieczorem, powiedziane o dwudziestej trzeciej to jutro rano. Termin bez podanej godziny ląduje na 9:00.

## Czego potrzebujesz

- iPhone. Zbudowane i sprawdzone na iOS 26, starszych wersji nie sprawdzałem.
- Aplikacja **Claude** zainstalowana i zalogowana. Skrót korzysta z jej rozszerzenia, więc bez aplikacji nie ruszy.
- **Darmowe konto Claude wystarczy.** Subskrypcja nie jest do niczego potrzebna.

Nic poza tym: żadnego klucza do wklejania, żadnej usługi do podpięcia.

## Instalacja

1. Na iPhonie otwórz w Safari [stronę wydania](https://github.com/szwarcphysio-coder/claudiri/releases/latest) i pobierz `Claudiri.shortcut`. Jeśli chcesz wersję sortującą zadania, weź zamiast tego `Claudiri-macierz.shortcut` i przeczytaj sekcję niżej.
2. Otwórz pobrany plik (Pliki, folder Pobrane). Skróty zapytają, czy dodać.
3. Wejdź w Skróty, długie przytrzymanie na Claudiri, i wpięcie tam, gdzie ma być pod ręką: ekran główny, przycisk akcji albo Siri.
4. Jeśli chcesz mieć zakupy na osobnej liście: otwórz skrót do edycji, znajdź w gałęzi `dodaj_zakupy` akcję „Dodaj nowe przypomnienie" i wybierz w niej swoją listę. Bez tego produkty trafiają na listę domyślną, co też działa, tylko mniej porządnie.

Ten czwarty krok trzeba zrobić ręcznie na swoim telefonie, bo Przypomnienia identyfikują listę po wewnętrznym identyfikatorze, innym na każdym urządzeniu. Nazwa listy wpisana w pliku nic nie da: skrót pokaże w interfejsie właściwą nazwę, a wpisy i tak pójdą do listy domyślnej. Dlatego w tej wersji pole listy jest celowo puste, zamiast obiecywać coś, czego nie dowiezie.

Skrót jest podpisany tak, żeby dało się go zaimportować bez włączania trybu dla niezaufanych skrótów.

**Jeśli już masz starszą wersję, skasuj ją przed importem.** Skróty przy zbiegu nazw nie nadpisują, tylko dokładają kopię „Claudiri 1", „Claudiri 2", i potem odpalasz starą wersję zastanawiając się, czemu nic się nie zmieniło.

## Wariant z macierzą Eisenhowera

Drugi plik w wydaniu, `Claudiri-macierz.shortcut`, umie to samo, tylko przypomnienia dodatkowo sortuje. Claude przy każdym zadaniu wybiera jedną z pięciu wartości: cztery ćwiartki macierzy (`ważne-pilne`, `ważne-niepilne`, `nieważne-pilne`, `nieważne-niepilne`) oraz `inbox` na rzeczy punktowe, które mają zadzwonić o danej porze i po niej tracą sens („wyjmij pranie za godzinę", „zadzwoń do przychodni, jak otworzą").

Kryteria siedzą w prompcie, reguła 8a. Pilne jest to, czego termin biegnie sam: podatek, składka, polisa, pismo z urzędu, nawet kiedy nie padła żadna data. Ważne jest to, czego zaniechanie kogoś kosztuje. Przy wahaniu wpisuje `ważne-pilne`, bo przeoczona rzecz ważna kosztuje więcej niż zerknięcie na coś, co do tej ćwiartki nie pasowało.

**Zaraz po imporcie wszystkie pięć wartości ląduje w Twojej liście domyślnej**, czyli w jednym inboxie. Tak ma być: skrót działa od pierwszego uruchomienia, a segregacja jest do włączenia wtedy, kiedy zechcesz. Żeby ją włączyć, załóż w Przypomnieniach pięć list i przypisz je w dziesięciu akcjach „Dodaj nowe przypomnienie" wewnątrz gałęzi `dodaj_przypomnienie`. Każda wartość ma tam dwie akcje: jedną dla zadania z godziną, drugą dla zadania bez. Ręcznie, z tego samego powodu co przy zakupach: identyfikatora listy nie da się przenieść między telefonami.

Jeśli nie prowadzisz zadań w macierzy, zostań przy zwykłym Claudiri. Sortowanie do pięciu list, których nie oglądasz, to praca bez odbioru.

## Dostrajanie

Wszystko siedzi w akcji **Tekst** tuż nad akcją Claude. To zwykły prompt po polsku, cała logika rozpoznawania jest w nim opisana zdanie po zdaniu. Możesz go czytać i zmieniać wprost w aplikacji Skróty.

- **Inna wyszukiwarka albo mapy:** dwie akcje „Otwórz URL" z adresem Google. Podmień adres.
- **Inne domyślne godziny:** reguły 3 i 4 w prompcie („rano 8:00, przed południem 10:00...").
- **Nowe narzędzie:** dopisz je do listy narzędzi w prompcie i dołóż gałąź `Jeśli` porównującą pole `narzedzie`.

Kopie promptów do czytania na spokojnie leżą w [`zrodlo/prompt.md`](zrodlo/prompt.md) i [`zrodlo/prompt-macierz.md`](zrodlo/prompt-macierz.md).

## Dla grzebiących

- [`zrodlo/Claudiri.xml`](zrodlo/Claudiri.xml) i [`zrodlo/Claudiri-macierz.xml`](zrodlo/Claudiri-macierz.xml) to źródła obu wariantów jako czytelne plisty XML. Podpisany pakiet jest zaszyfrowany, więc do czytania i do diffów nadaje się tylko XML.
- [`zbuduj.sh`](zbuduj.sh) podpisuje każdy XML z `zrodlo/` do gotowego pliku `.shortcut` (macOS, `shortcuts sign`).
- Podpisywanie waliduje plik po **rozszerzeniu**, nie po zawartości. Plik wejściowy z rozszerzeniem `.xml` albo `.plist` leci na „isn't in the correct format", nawet gdy w środku jest poprawny plist. Stąd kopiowanie do `.shortcut` przed podpisem.
- Nazwa skrótu po imporcie bierze się z **nazwy pliku**, nie z pola `WFWorkflowName` w środku.

## Czego nie robi

Nie odpowiada na pytania. Pytanie zamienia na frazę i otwiera wyszukiwarkę, bo do rozmowy masz samą aplikację Claude.

Nie czyta wiadomości, nie wysyła ich i nie dzwoni. To router poleceń, nie asystent ogólnego przeznaczenia.

Rozumie tylko polski: prompt jest napisany po polsku i osadzony w polskich liczebnikach, więc pod inny język trzeba go przepisać.

## Licencja

MIT, plik [LICENSE](LICENSE). Rób z tym co chcesz.
