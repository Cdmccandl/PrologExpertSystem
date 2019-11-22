/* Conor McCandless, Casey Jones Expert System in Prolog */

begin :- write("Welcome to the Beer Selector, an Expert System made to pick the beer you need!"),
retractItems,
introduction,nl,
checkFor(Beer),
write("you should order the: "),
write(Beer),nl,
checkifRight,nl,
retractItems,
end.

checkFor(pilsner) :- pilsner, !.
checkFor(darkLager) :- darkLager, !.
checkFor(paleAle) :- paleAle, !.
checkFor(porter) :- porter, !.
checkFor(stout) :- stout, !.
checkFor(nothing) :- unknown.

/*List of beer items need to add more!*/
%1
pilsner :- checkBeer(lightColor),checkBeer(lightHops), checkBeer(lowAlcohol),
nl.
%2
darkLager :- checkBeer(amberColor),checkBeer(mediumHops),checkBeer(mediumAlcohol),
nl.
%3
paleAle :- checkbeer(amberColor),checkBeer(highHops),checkBeer(highAlcohol),
nl.
%4
porter :- checkbeer(darkColor),checkBeer(lightHops),checkbeer(highSweet),
nl.
%5
stout :- checkBeer(darkColor),checkBeer(mediumHops),checkBeer(mediumBitter),
nl.

unknown :-
write("").

askQuestion(Question) :-
write("would you like your beer to have: "),
write(Question),
write("?"),
read(Reply), nl,
((Reply == yes ; Reply == y) ->
assert(yes(Question)) ;
assert(no(Question)), fail).

checkBeer(S) :-
(yes(S) -> true ;
(no(S) -> fail ;
askQuestion(S))).

introduction :-
write("I will now ask you questions to find out your favorite beer!
please answer 'yes' or 'no'
are you ready?"),
read(yes) ->
write("") ;
write("GoodBye"), fail.

checkifRight :-
write("Did I guess correctly?"),
read(yes) ->
write("Told you I would!") ;
write("I hope I can get it next time... "), fail.

retractItems :- retract(yes(_)),fail.
retractItems :- retract(no(_)),fail.
retractItems.
