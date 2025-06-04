% Render the houses term as a nice table.
:- use_rendering(table,
		 [header(h('name', 'colour', 'drink', 'pet', 'subject'))]).


hamster_owner(Owner) :-
	houses(Rs),
	member(r(Owner,_,_,hamster,_), Rs).


houses(Rs) :-
	/* each house in the list Hs of houses is represented as:
	      h(name, colour, drink, pet, subject) */
	length(Rs, 5),											%  0
	member(r(max, red, _, _, _), Rs),						%  1
	member(r(bert, _, tea, _, _), Rs),						%  2
	member(r(ute, _, _, cat, _), Rs),						%  3
	next(r(_, green, _, _, _), r(_, white, _, _, _), Rs),	%  4
	member(r(_, green, coffee, _, _), Rs),					%  5
	member(r(_, _, _, budgie, eit), Rs),					%  6
	member(r(_, yellow, _, _, me), Rs),						%  7
	Rs = [_,_,r(_, _, milk, _, _),_,_],						%  8
	next(r(_, _, _, dog, _), r(_, _, _, _, ai), Rs),		%  9
	next(r(_, _, _, _, me), r(_, _, _, parrot, _), Rs),		%  10
	Rs = [r(monika, _, _, _, _)|_],							% 11
	member(r(_, _, oj, _, cs), Rs),							% 12
	member(r(rudolf, _, _, _, ba), Rs),						% 13
	next(r(monika,_,_,_,_), r(_,blue,_,_,_), Rs),			% 14
	next(r(_, _, _, _, ai), r(_, _, water, _, _), Rs),		%  15
	member(r(_,_,_,hamster,_), Rs).							% one of them owns a hamster


next(A, B, Ls) :- append(_, [A,B|_], Ls).
next(A, B, Ls) :- append(_, [B,A|_], Ls).
