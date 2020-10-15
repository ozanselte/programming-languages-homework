% knowledge base

flight(istanbul, rize).
flight(istanbul, van).
flight(istanbul, ankara).
flight(istanbul, gaziantep).
flight(istanbul, antalya).
flight(istanbul, izmir).
flight(rize, van).
flight(van, ankara).
flight(ankara, konya).
flight(konya, antalya).
flight(antalya, gaziantep).
flight(izmir, isparta).
flight(isparta, burdur).
flight(edirne, edremit).
flight(edremit, erzincan).  

% rules

path(From, To) :-
    flight(From, To) ;
    flight(To, From) .

route(From, To, Visiteds) :- 
	path(From, X) ,
	not(member(X, Visiteds)) ,
	(
        To = X ;
        route(X, To, [From | Visiteds])
    ) .

proute(From, To) :-
    (
        setof(From, route(From, To, []), L) ,
        is_list(L) ,
        length(L, 1)
    ) ;
    (
        setof(To, route(To, From, []), L) ,
        is_list(L) ,
        length(L, 1)
    ) .

route(From, To) :-
    route(From, To, []) .