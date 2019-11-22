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
