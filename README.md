# Claudiri

Skrót na iPhone'a, który zamienia jedno zdanie powiedziane na głos w wykonane działanie na telefonie. Mówisz „nastaw budzik na szóstą trzydzieści, dopisz mleko do zakupów i przypomnij mi zadzwonić do księgowej w czwartek", a telefon zakłada budzik, dopisuje produkt i dodaje przypomnienie. Trzy rzeczy z jednego zdania.

Rozpoznawanie robi Claude: podyktowane zdanie idzie do aplikacji Claude i wraca jako lista poleceń. Wykonanie jest już w całości natywne, przez Przypomnienia, Kalendarz, Zegar, Mapy i Muzykę. Poza tą jedną wymianą nic nigdzie nie wychodzi, nie wklejasz żadnego klucza ani adresu serwera.

## Co umie

| Powiesz | Stanie się |
|---|---|
| „przypomnij mi zapłacić rachunek w piątek" | przypomnienie z terminem, posortowane po ważności |
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

1. Na iPhonie otwórz w Safari [stronę wydania](https://github.com/szwarcphysio-coder/claudiri/releases/latest) i pobierz plik `Claudiri.shortcut`. Alternatywnie [link bezpośredni](https://raw.githubusercontent.com/szwarcphysio-coder/claudiri/main/Claudiri.shortcut).
2. Otwórz pobrany plik (Pliki, folder Pobrane). Skróty zapytają, czy dodać.
3. Podepnij go tam, gdzie ma być pod ręką. Sens tego skrótu jest w tym, żeby dało się go odpalić jednym ruchem, bez szukania ikony:
   - **Przycisk czynności**, jeśli masz nowszego iPhone'a (od 15 Pro wzwyż). Ustawienia > Przycisk czynności, przewiń do „Skrót" i wybierz Claudiri. Przytrzymujesz przycisk i mówisz.
   - **Ekran blokady** na starszych modelach. Przytrzymaj palec na ekranie blokady, dotknij „Dostosuj", potem „Ekran blokady", dodaj widżet Skrótów i wskaż Claudiri. Odpala się bez odblokowywania telefonu.
   - Do tego Siri („Hej Siri, Claudiri") albo zwykła ikona na ekranie głównym, jeśli tak wolisz.
4. Jeśli chcesz mieć zakupy na osobnej liście: otwórz skrót do edycji, znajdź w gałęzi `dodaj_zakupy` akcję „Dodaj nowe przypomnienie" i wybierz w niej swoją listę. Bez tego produkty trafiają na listę domyślną, co też działa, tylko mniej porządnie.

Ten czwarty krok trzeba zrobić ręcznie na swoim telefonie, bo Przypomnienia identyfikują listę po wewnętrznym identyfikatorze, innym na każdym urządzeniu. Nazwa listy wpisana w pliku nic nie da: skrót pokaże w interfejsie właściwą nazwę, a wpisy i tak pójdą do listy domyślnej. Dlatego w tej wersji pole listy jest celowo puste, zamiast obiecywać coś, czego nie dowiezie.

Skrót jest podpisany tak, żeby dało się go zaimportować bez włączania trybu dla niezaufanych skrótów.

**Jeśli już masz starszą wersję, skasuj ją przed importem.** Skróty przy zbiegu nazw nie nadpisują, tylko dokładają kopię „Claudiri 1", „Claudiri 2", i potem odpalasz starą wersję zastanawiając się, czemu nic się nie zmieniło.

## Jak sortuje zadania

Przypomnienia nie lecą na jedną kupę. Claude przy każdym zadaniu wybiera jedną z pięciu wartości: cztery ćwiartki macierzy Eisenhowera (`ważne-pilne`, `ważne-niepilne`, `nieważne-pilne`, `nieważne-niepilne`) oraz `inbox` na rzeczy punktowe, które mają zadzwonić o danej porze i po niej tracą sens („wyjmij pranie za godzinę", „zadzwoń do przychodni, jak otworzą").

Kryteria siedzą w prompcie, reguła 8a. Pilne jest to, czego termin biegnie sam: podatek, składka, polisa, pismo z urzędu, nawet kiedy nie padła żadna data. Ważne jest to, czego zaniechanie kogoś kosztuje. **Czego nie umie przypisać, wrzuca do inboxa**, żeby nic nie wylądowało w ćwiartce na siłę.

Zaraz po imporcie wszystkie pięć wartości pisze do Twojej listy domyślnej, czyli cały ruch idzie do jednego inboxa i skrót działa od pierwszego uruchomienia. Segregację włączasz wtedy, kiedy zechcesz: załóż w Przypomnieniach cztery listy ćwiartek i przypisz je w ośmiu akcjach „Dodaj nowe przypomnienie" wewnątrz gałęzi `dodaj_przypomnienie`. Każda ćwiartka ma tam dwie akcje, jedną dla zadania z godziną i drugą dla zadania bez. Ręcznie, z tego samego powodu co przy zakupach: identyfikatora listy nie da się przenieść między telefonami.

Jeśli macierz Ci nie leży, nie rób nic. Nieprzypisane listy znaczą jeden inbox, a to zwykłe przypomnienia.

## Dostrajanie

Wszystko siedzi w akcji **Tekst** tuż nad akcją Claude. To zwykły prompt po polsku, cała logika rozpoznawania jest w nim opisana zdanie po zdaniu. Możesz go czytać i zmieniać wprost w aplikacji Skróty.

- **Inna wyszukiwarka albo mapy:** dwie akcje „Otwórz URL" z adresem Google. Podmień adres.
- **Inne domyślne godziny:** reguły 3 i 4 w prompcie („rano 8:00, przed południem 10:00...").
- **Nowe narzędzie:** dopisz je do listy narzędzi w prompcie i dołóż gałąź `Jeśli` porównującą pole `narzedzie`.

Kopia promptu do czytania na spokojnie leży w [`zrodlo/prompt.md`](zrodlo/prompt.md).

## Dla grzebiących

- [`zrodlo/Claudiri.xml`](zrodlo/Claudiri.xml) to źródło skrótu jako czytelny plist XML. Podpisany pakiet jest zaszyfrowany, więc do czytania i do diffów nadaje się tylko XML.
- [`zbuduj.sh`](zbuduj.sh) podpisuje XML do gotowego `Claudiri.shortcut` (macOS, `shortcuts sign`).
- Podpisywanie waliduje plik po **rozszerzeniu**, nie po zawartości. Plik wejściowy z rozszerzeniem `.xml` albo `.plist` leci na „isn't in the correct format", nawet gdy w środku jest poprawny plist. Stąd kopiowanie do `.shortcut` przed podpisem.
- Nazwa skrótu po imporcie bierze się z **nazwy pliku**, nie z pola `WFWorkflowName` w środku.

## Czego nie robi

Nie odpowiada na pytania. Pytanie zamienia na frazę i otwiera wyszukiwarkę, bo do rozmowy masz samą aplikację Claude.

Nie czyta wiadomości, nie wysyła ich i nie dzwoni. To router poleceń, nie asystent ogólnego przeznaczenia.

Rozumie tylko polski: prompt jest napisany po polsku i osadzony w polskich liczebnikach, więc pod inny język trzeba go przepisać.

## Licencja

MIT, plik [LICENSE](LICENSE). Rób z tym co chcesz.
