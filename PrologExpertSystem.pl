/* Conor McCandless, Casey Jones Expert System in Prolog */

begin :- write("Welcome to the Beer Selector, an Expert System made to pick the beer you need!"),
introduction,nl,
guessBeer,
retractItems,
end.

/* start guessing each beer type */
checkFor(pilsner)     :- pilsner, !.
checkFor(amberLager)  :- amberLager, !.
checkFor(paleAle)     :- paleAle, !.
checkFor(porter)      :- porter, !.
checkFor(stout)       :- stout, !.
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


/* list of beer items TODO: need to add more! */

% 1
pilsner :-     checkBeer(lightColor),
               checkBeer(lowHops),
               checkBeer(mediumMalt),
               checkBeer(notSour),
               checkBeer(lowAlcohol),
               nl.
% 2
amberLager :-  checkBeer(amberColor),
               checkBeer(mediumHops),
               checkBeer(mediumMalt),
               checkBeer(notSour),
               checkBeer(mediumAlcohol),
               nl.
% 3
paleAle :-     checkBeer(amberColor),
               checkBeer(highHops),
               checkBeer(mediumMalt),
               checkBeer(notSour),
               checkBeer(highAlcohol),
               nl.
% 4
porter :-      checkBeer(darkColor),
               checkBeer(highHops),
               checkBeer(highMalt),
               checkBeer(notSour),
               checkBeer(mediumAlcohol),
               nl.
% 5
irishStout :-  checkBeer(darkColor),
               checkBeer(mediumHops),
               checkBeer(mediumMalt),
               checkBeer(notSour),
               checkBeer(mediumAlcohol),
               nl.
% 6
milkStout :-   checkBeer(darkColor),
               checkBeer(lowHops),
               checkBeer(highMalt),
               checkBeer(notSour),
               checkBeer(mediumAlcohol),
               nl.
% 7
bock :-        checkBeer(darkColor),
               checkBeer(lowHops),
               checkBeer(highMalt),
               checkBeer(notSour),
               checkBeer(highAlcohol),
               nl.
% 8
wheatBeer :-   checkBeer(amberColor),
               checkBeer(lowHops),
               checkBeer(mediumMalt),
               checkBeer(notSour),
               checkBeer(lowAlcohol),
               nl.
% 9
brownAle :-    checkBeer(darkColor),
               checkBeer(lowHops),
               checkBeer(highMalt),
               checkBeer(notSour),
               checkBeer(mediumAlcohol),
               nl.
% 10
sourBeer :-    checkBeer(lightColor),
               checkBeer(mediumHops),
               checkBeer(mediumMalt),
               checkBeer(sour),
               checkBeer(highAlcohol),
               nl.
% 11
ipa :-         checkBeer(lightColor),
               checkBeer(highHops),
               checkBeer(mediumMalt),
               checkBeer(notSour),
               checkBeer(highAlcohol),
               nl.
% 12
scottishAle :- checkBeer(amberColor),
               checkBeer(lowHops),
               checkBeer(highMalt),
               checkBeer(notSour),
               checkBeer(highAlcohol),
               nl.
% 13
redAle :-      checkBeer(amberColor),
               checkBeer(mediumHops),
               checkBeer(mediumMalt),
               checkBeer(notSour),
               checkBeer(highAlcohol),
               nl.
% 14
dubbel :-      checkBeer(darkColor),
               checkBeer(mediumHops),
               checkBeer(lowMalt),
               checkBeer(notSour),
               checkBeer(mediumAlcohol),
               nl.
% 15
belgianGold :- checkBeer(lightColor),
               checkBeer(highHops),
               checkBeer(lowMalt),
               checkBeer(notSour),
               checkBeer(highAlcohol),
               nl.


guessBeer :-
    (
        checkFor(Beer),
        write("you should order the: "),
        write(Beer),nl,
        checkifRight
    ) ; (
        write("Sorry, I could not find the drink you want"),nl,
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

/* check for each trait */
:- dynamic yes/1,no/1.

checkBeer(S) :-
(
     yes(T) -> true;
     (
         no(T) -> fail;
         askQuestion(S)
     )
 ).

/* introduction for user */
introduction :-
write("I will now ask you questions to find out your favorite beer!
Please answer 'yes' or 'no'.
Are you ready? "),
read(yes) ->
write("") ;
write("Goodbye."), fail.

/* verify if answer is correct */
checkifRight :-
write("Did I guess correctly?"),
read(yes) ->
write("Told you I would!") ;
write("I hope I can get it next time... "), fail.

/* retractItems chosen for more program runs */
retractItems :- retract(yes(_)),fail.
retractItems :- retract(no(_)),fail.
retractItems.

end :- write("Type 'begin.' and press enter to have another go!").
