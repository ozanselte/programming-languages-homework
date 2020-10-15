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
distance(istanbul, rize, 967.79).
distance(istanbul, van, 1262.37).
distance(istanbul, ankara, 351.5).
distance(istanbul, gaziantep, 847.42).
distance(istanbul, antalya, 482.75).
distance(istanbul, izmir, 328.8).
distance(rize, van, 373.01).
distance(van, ankara, 920.31).
distance(ankara, konya, 227.34).
distance(konya, antalya, 192.28).
distance(antalya, gaziantep, 592.33).
distance(izmir, isparta, 308.55).
distance(isparta, burdur, 24.6).
distance(edirne, edremit, 914.67).
distance(edremit, erzincan, 736.34).

% rules

path(From, To, Distance) :-
    distance(From, To, Distance) ;
    distance(To, From, Distance) .

froute(From, To, Distance, Visiteds) :- 
	path(From, X, D) ,
	not(member(X, Visiteds)) ,
	(
        (To = X, Distance is D) ;
        (froute(X, To, Y, [From | Visiteds]), Distance is Y + D)
    ) .

mroute(From, To, Distances) :-
    findall(
        D, froute(From, To, D, []), Distances
    ) .

route(From, To, Visiteds) :- 
	path(From, X, _) ,
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

sroute(From, To, Distance) :-
    route(From, To, []) ,
    mroute(From, To, Distances) ,
    min_list(Distances, Distance) .

sproute(From, To, Distance) :-
    proute(From, To) ,
    mroute(From, To, Distances) ,
    min_list(Distances, Distance) .