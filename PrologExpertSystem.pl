/* Conor McCandless, Casey Jones Expert System in Prolog */


begin :- write("Welcome to the Beer Selector..."), nl,
         write("an Expert System to pick the beer you need!"), nl,
         retractall(fact(_)),
         ready -> guessBeer,
                  end;
                  fail.


/* gather facts from user input */
:- dynamic fact/1.
is(Attribute) :-
  ( fact(Attribute) ->
    true;
      format("Would you like your beer to be ~w?~n", [Attribute]),
      Answer = read(yes),
      ( Answer ->
          assert(fact(Attribute))
      )
  ).


/* list of beer items */
% 1
beer(pilsner) :-     is("light-colored"),
                     is("mildly hoppy"),
                     is("moderately malty"),
                     is("low in alcohol content"),
                     nl.
% 2
beer(amberLager) :-  is("amber-colored"),
                     is("moderately hoppy"),
                     is("moderately malty"),
                     is("moderate in alcohol content"),
                     nl.
% 3
beer(paleAle) :-     is("amber-colored"),
                     is("very hoppy"),
                     is("moderately malty"),
                     is("high in alcohol content"),
                     nl.
% 4
beer(porter) :-      is("dark-colored"),
                     is("very hoppy"),
                     is("quite malty"),
                     is("moderate in alcohol content"),
                     nl.
% 5
beer(irishStout) :-  is("dark-colored"),
                     is("moderately hoppy"),
                     is("moderately malty"),
                     is("moderate in alcohol content"),
                     nl.
% 6
beer(milkStout) :-   is("dark-colored"),
                     is("mildly hoppy"),
                     is("quite malty"),
                     is("moderate in alcohol content"),
                     nl.
% 7
beer(bock) :-        is("dark-colored"),
                     is("mildly hoppy"),
                     is("quite malty"),
                     is("high in alcohol content"),
                     nl.
% 8
beer(wheatBeer) :-   is("amber-colored"),
                     is("mildly hoppy"),
                     is("moderately malty"),
                     is("low in alcohol content"),
                     nl.
% 9
beer(brownAle) :-    is("dark-colored"),
                     is("mildly hoppy"),
                     is("quite malty"),
                     is("moderate in alcohol content"),
                     nl.
% 10
beer(sourBeer) :-    is("light-colored"),
                     is("moderately hoppy"),
                     is("moderately malty"),
                     is("sour"),
                     is("high in alcohol content"),
                     nl.
% 11
beer(ipa) :-         is("light-colored"),
                     is("very hoppy"),
                     is("moderately malty"),
                     is("high in alcohol content"),
                     nl.
% 12
beer(scottishAle) :- is("amber-colored"),
                     is("mildly hoppy"),
                     is("quite malty"),
                     is("high in alcohol content"),
                     nl.
% 13
beer(redAle) :-      is("amber-colored"),
                     is("moderately hoppy"),
                     is("moderately malty"),
                     is("high in alcohol content"),
                     nl.
% 14
beer(dubbel) :-      is("dark-colored"),
                     is("moderately hoppy"),
                     is("not too sweet"),
                     is("moderate in alcohol content"),
                     nl.
% 15
beer(belgianGold) :- is("light-colored"),
                     is("very hoppy"),
                     is("not too sweet"),
                     is("high in alcohol content"),
                     nl.


guessBeer :-
  write("I will now ask you questions to find out your favorite beer."), nl,
  ( beer(X),
    write("You should order the "),
    write(X), nl,
    checkifRight
  ) ;
  ( write("Sorry, I could not find a beer matching those criteria."), nl,
    write("My creator should have been a more experienced beer drinker!"), nl
  ).


ready :-
  write("Are you ready? "),
  read(X),
  (X = yes ->
    true, !;
  X = no ->
    write("Goodbye."), nl, fail, !;
  write("Please answer 'yes.' or 'no.'"), nl, ready).


/* verify if answer is correct */
checkifRight :-
write("Did I guess correctly?"),
read(yes) -> write("Told you I would!"), nl ;
             write("I hope I can get it next time... "), nl,
             fail.


end :- write("Type 'begin.' and press enter to have another go!").
