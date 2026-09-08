# Claudiri

Skrót na iPhone'a, który zamienia jedno zdanie powiedziane na głos w wykonane działanie na telefonie. Mówisz „nastaw budzik na szóstą trzydzieści, dopisz mleko do zakupów i przypomnij mi zadzwonić do księgowej w czwartek", a telefon zakłada budzik, dopisuje produkt i dodaje przypomnienie. Trzy rzeczy z jednego zdania.

Rozpoznawanie robi Claude, ale wykonanie jest w całości natywne: Przypomnienia, Kalendarz, Zegar, Mapy, Muzyka. Nic nie wychodzi na żaden serwer poza samą aplikacją Claude, nie ma konta do zakładania, nie ma nic do skonfigurowania poza jedną listą zakupów.

## Co umie

| Powiesz | Stanie się |
|---|---|
| „przypomnij mi zapłacić rachunek w piątek" | przypomnienie z terminem |
| „spotkanie z Anią jutro o dwunastej na godzinę" | wydarzenie w kalendarzu |
| „budzik na szóstą trzydzieści", „wyłącz budzik na siódmą" | założenie, włączenie albo wyłączenie budzika |
| „ustaw minutnik na dwadzieścia minut" | odliczanie w Zegarze |
| „dopisz mleko i ogórki do zakupów" | dwie pozycje na liście zakupów |
| „zawieź mnie do Biedronki na Grunwaldzkiej" | nawigacja w Mapach Google |
| „puść coś na trening" | Claude wybiera wykonawcę, gra Apple Music |
| „ile kalorii ma awokado" | otwarta wyszukiwarka z tym pytaniem |

Jedno zdanie może zawierać kilka poleceń różnego typu. Czego nie rozpozna, to pomija, zamiast zgadywać.

Terminy liczy od zegara telefonu, nie od swoich wyobrażeń o dacie. „Za godzinę dziesięć" to 70 minut, nie 10:00. „O ósmej" powiedziane o piętnastej to dziś wieczorem, powiedziane o dwudziestej trzeciej to jutro rano. Termin bez podanej godziny ląduje na 9:00, nie na „teraz".

## Czego potrzebujesz

- iPhone. Zbudowane i sprawdzone na iOS 26, starszych wersji nie testowaliśmy.
- Aplikacja **Claude** zainstalowana i zalogowana. Skrót korzysta z jej rozszerzenia, więc bez aplikacji nie ruszy.
- Lista w Przypomnieniach o nazwie **Zakupy**. Jeśli Twoja nazywa się inaczej, patrz „Dostrajanie" niżej.

## Instalacja

1. Na iPhonie otwórz w Safari [stronę wydania](https://github.com/szwarcphysio-coder/claudiri/releases/latest) i pobierz plik `Claudiri.shortcut`. Alternatywnie [link bezpośredni](https://raw.githubusercontent.com/szwarcphysio-coder/claudiri/main/Claudiri.shortcut).
2. Otwórz pobrany plik (Pliki, folder Pobrane). Skróty zapytają, czy dodać.
3. Wejdź w Skróty, długie przytrzymanie na Claudiri, i wpięcie tam, gdzie ma być pod ręką: ekran główny, przycisk akcji albo Siri.

Skrót jest podpisany tak, żeby dało się go zaimportować bez włączania trybu dla niezaufanych skrótów.

**Jeśli już masz starszą wersję, skasuj ją przed importem.** Skróty przy zbiegu nazw nie nadpisują, tylko dokładają kopię „Claudiri 1", „Claudiri 2", i potem odpalasz starą wersję zastanawiając się, czemu nic się nie zmieniło.

## Dostrajanie

Wszystko siedzi w akcji **Tekst** tuż nad akcją Claude. To zwykły prompt po polsku, cała logika rozpoznawania jest w nim opisana zdanie po zdaniu. Możesz go czytać i zmieniać wprost w aplikacji Skróty.

- **Inna nazwa listy zakupów:** w gałęzi `dodaj_zakupy` jest akcja „Dodaj nowe przypomnienie" z polem listy ustawionym na `Zakupy`. Zmień na swoją.
- **Inna wyszukiwarka albo mapy:** dwie akcje „Otwórz URL" z adresem Google. Podmień adres.
- **Inne domyślne godziny:** reguły 3 i 4 w prompcie („rano 8:00, przed południem 10:00...").
- **Nowe narzędzie:** dopisz je do listy narzędzi w prompcie i dołóż gałąź `Jeśli` porównującą pole `narzedzie`.

Kopia promptu do czytania na spokojnie leży w [`zrodlo/prompt.md`](zrodlo/prompt.md).

## Dla grzebiących

- [`zrodlo/Claudiri.xml`](zrodlo/Claudiri.xml) to źródło skrótu jako czytelny plist XML. Tę wersję się czyta i diffuje, nie podpisany pakiet.
- [`zbuduj.sh`](zbuduj.sh) podpisuje XML do gotowego `Claudiri.shortcut` (macOS, `shortcuts sign`).
- Podpisywanie waliduje plik po **rozszerzeniu**, nie po zawartości. Plik wejściowy z rozszerzeniem `.xml` albo `.plist` leci na „isn't in the correct format", nawet gdy w środku jest poprawny plist. Stąd kopiowanie do `.shortcut` przed podpisem.
- Nazwa skrótu po imporcie bierze się z **nazwy pliku**, nie z pola `WFWorkflowName` w środku.

## Czego nie robi

Nie odpowiada na pytania. Pytanie zamienia na frazę i otwiera wyszukiwarkę, bo do rozmowy masz samą aplikację Claude.

Nie czyta wiadomości, nie wysyła ich i nie dzwoni. To router poleceń, nie asystent ogólnego przeznaczenia.

Rozumie polski. Prompt jest napisany po polsku i osadzony w polskich liczebnikach, więc na innym języku trzeba go przepisać.

## Licencja

MIT, plik [LICENSE](LICENSE). Rób z tym co chcesz.
