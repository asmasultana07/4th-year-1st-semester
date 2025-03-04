%%fact
%parent(x,y).
%parent(y,z).
%parent(z,a).
%parent(a,b).
%parent(b,c).

%%rules
%ancestor(X, Y):-
%    parent(X, Y);
%    (
%        parent(Z,Y),
%        ancestor(X,Z)
%    ).

%ancestor(X, Y):-
%    parent(X, Y).

%ancestor(X, Y):-
%    parent(Z,Y),
%    ancestor(X,Z).


%%% graph connection

%fact
edge(a,b).
edge(p,a).
edge(q,b).
edge(b,c).
edge(b,d).
edge(b,e).
edge(d,f).
edge(f,g).
edge(x,y).

%rules
connected(X,Y):-
    edge(X,Y).

connected(X,Y):-
    edge(X,Z),
    connected(Z,Y).
