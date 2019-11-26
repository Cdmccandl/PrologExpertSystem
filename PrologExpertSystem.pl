/* Conor McCandless, Casey Jones Expert System in Prolog */

:- dynamic color/0.
:- dynamic color/1.
:- dynamic color/2.
:- dynamic hops/0.
:- dynamic hops/1.
:- dynamic hops/2.
:- dynamic malt/0.
:- dynamic malt/1.
:- dynamic malt/2.
:- dynamic sour/0.
:- dynamic sour/1.
:- dynamic sour/2.
:- dynamic alcohol/0.
:- dynamic alcohol/1.
:- dynamic alcohol/2.
:- dynamic yes/1,no/1.

begin :- write("Welcome to the Beer Selector..."), nl,
         write("an Expert System to pick the beer you need!"), nl,
         retractItems,
         introduction, nl,
         guessBeer,
         retractItems,
         end.

/* start guessing each beer type */
checkFor(pilsner)     :- pilsner, !.
checkFor(amberLager)  :- amberLager, !.
checkFor(paleAle)     :- paleAle, !.
checkFor(porter)      :- porter, !.
checkFor(irishStout)  :- irishStout, !.
checkFor(milkStout)   :- milkStout, !.
checkFor(bock)        :- bock, !.
checkFor(wheatBeer)   :- wheatBeer, !.
checkFor(brownAle)    :- brownAle, !.
checkFor(sourBeer)    :- sourBeer, !.
checkFor(ipa)         :- ipa, !.
checkFor(scottishAle) :- scottishAle, !.
checkFor(redAle)      :- redAle, !.
checkFor(dubbel)      :- dubbel, !.
checkFor(belgianGold) :- belgianGold, !.


/* list of beer items */

% 1
pilsner :-     beer_color(lightColor),
               beer_hops(lowHops),
               beer_malt(mediumMalt),
               beer_sour(notSour),
               beer_alcohol(lowAlcohol),
               nl.
% 2
amberLager :-  beer_color(amberColor),
               beer_hops(mediumHops),
               beer_malt(mediumMalt),
               beer_sour(notSour),
               beer_alcohol(mediumAlcohol),
               nl.
% 3
paleAle :-     beer_color(amberColor),
               beer_hops(highHops),
               beer_malt(mediumMalt),
               beer_sour(notSour),
               beer_alcohol(highAlcohol),
               nl.
% 4
porter :-      beer_color(darkColor),
               beer_hops(highHops),
               beer_malt(highMalt),
               beer_sour(notSour),
               beer_alcohol(mediumAlcohol),
               nl.
% 5
irishStout :-  beer_color(darkColor),
               beer_hops(mediumHops),
               beer_malt(mediumMalt),
               beer_sour(notSour),
               beer_alcohol(mediumAlcohol),
               nl.
% 6
milkStout :-   beer_color(darkColor),
               beer_hops(lowHops),
               beer_malt(highMalt),
               beer_sour(notSour),
               beer_alcohol(mediumAlcohol),
               nl.
% 7
bock :-        beer_color(darkColor),
               beer_hops(lowHops),
               beer_malt(highMalt),
               beer_sour(notSour),
               beer_alcohol(highAlcohol),
               nl.
% 8
wheatBeer :-   beer_color(amberColor),
               beer_hops(lowHops),
               beer_malt(mediumMalt),
               beer_sour(notSour),
               beer_alcohol(lowAlcohol),
               nl.
% 9
brownAle :-    beer_color(darkColor),
               beer_hops(lowHops),
               beer_malt(highMalt),
               beer_sour(notSour),
               beer_alcohol(mediumAlcohol),
               nl.
% 10
sourBeer :-    beer_color(lightColor),
               beer_hops(mediumHops),
               beer_malt(mediumMalt),
               beer_sour(sour),
               beer_alcohol(highAlcohol),
               nl.
% 11
ipa :-         beer_color(lightColor),
               beer_hops(highHops),
               beer_malt(mediumMalt),
               beer_sour(notSour),
               beer_alcohol(highAlcohol),
               nl.
% 12
scottishAle :- beer_color(amberColor),
               beer_hops(lowHops),
               beer_malt(highMalt),
               beer_sour(notSour),
               beer_alcohol(highAlcohol),
               nl.
% 13
redAle :-      beer_color(amberColor),
               beer_hops(mediumHops),
               beer_malt(mediumMalt),
               beer_sour(notSour),
               beer_alcohol(highAlcohol),
               nl.
% 14
dubbel :-      beer_color(darkColor),
               beer_hops(mediumHops),
               beer_malt(lowMalt),
               beer_sour(notSour),
               beer_alcohol(mediumAlcohol),
               nl.
% 15
belgianGold :- beer_color(lightColor),
               beer_hops(highHops),
               beer_malt(lowMalt),
               beer_sour(notSour),
               beer_alcohol(highAlcohol),
               nl.


guessBeer :-
    (
        checkFor(Beer),
        write("you should order the: "),
        write(Beer), nl,
        checkifRight
    ) ; (
        write("Sorry, I could not find the drink you want"), nl,
        write("My creator should have been a more experienced beer drinker!"), nl
    ).

/* ask questions for each trait */
askQuestion(Question) :-
write("Would you like your beer to have: "),
write(Question),
write("? "),
read(Reply), nl,
((Reply == yes ; Reply == y) ->
assert(yes(Question)) ;
assert(no(Question)), fail).

checkBeer(S) :-
(
    yes(S) -> true;
    (
        no(S) -> fail;
        askQuestion(S)
    )
).

beer_color(Type) :-
  ( color(Type) ->
    true;
    ( color ->
      false;
      format("Would you like your beer to have: ~w?~n", [Type]),
      Answer = read(yes),
      ( Answer ->
          assert(color(Type)),
          assert(color)
      )
    )
).

beer_hops(Type) :-
  ( hops(Type) ->
    true;
    ( hops ->
      false;
      format("Would you like your beer to have: ~w?~n", [Type]),
      Answer = read(yes),
      ( Answer ->
          assert(hops(Type)),
          assert(hops)
      )
    )
).

beer_malt(Type) :-
  ( malt(Type) ->
    true;
    ( malt ->
      false;
      format("Would you like your beer to have: ~w?~n", [Type]),
      Answer = read(yes),
      ( Answer ->
          assert(malt(Type)),
          assert(malt)
      )
    )
).

beer_sour(Type) :-
  ( sour(Type) ->
    true;
    ( sour ->
      false;
      format("Would you like your beer to have: ~w?~n", [Type]),
      Answer = read(yes),
      ( Answer ->
          assert(sour(Type)),
          assert(sour)
      )
    )
).

beer_alcohol(Type) :-
  ( alcohol(Type) ->
    true;
    ( alcohol ->
      false;
      format("Would you like your beer to have: ~w?~n", [Type]),
      Answer = read(yes),
      ( Answer ->
          assert(alcohol(Type)),
          assert(alcohol)
      )
    )
).

/* introduction for user */
introduction :-
write("I will now ask you questions to find out your favorite beer."), nl,
write("Please answer 'yes.' or 'no.'"), nl,
write("Are you ready? "),
read(yes) -> write("") ;
             write("Goodbye."),
             fail.

/* verify if answer is correct */
checkifRight :-
write("Did I guess correctly?"),
read(yes) -> write("Told you I would!") ;
             write("I hope I can get it next time... "),
             fail.

/* retractItems chosen for more program runs */

retractItems :- retractall(color(_)).
retractItems :- retractall(hops(_)).
retractItems :- retractall(malt(_)).
retractItems :- retractall(sour(_)).
retractItems :- retractall(alcohol(_)).
retractItems.

end :- write("Type 'begin.' and press enter to have another go!").
