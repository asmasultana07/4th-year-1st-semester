%%family relationship_work01%%
%fact_

male(abdullah).
male(affan).
male(ali).
male(amir).
male(aman).
male(ahsan).
male(akil).
male(absar).
male(aaa).
male(ahan).
male(asfi).
male(ashik).
male(anaf).
male(ahdar).
male(akash).

female(akhter).
female(adri).
female(afra).
female(ayesha).
female(ahona).
female(aleya).
female(akhi).
female(akira).
female(asma).
female(annie).
female(alo).
female(ava).
female(ardhi).
female(asa).

%% A mother of B
mother(akter,adri).
mother(akter,ali).
mother(adri,amir).
mother(ayesha,aleya).
mother(ayesha,akil).
mother(aleya, asma).
mother(aleya, annie).
mother(aleya, ahan).
mother(annie, ardhi).
mother(annie, asa).
mother(akhi,asfi).
mother(akhi,ashik).
mother(afra,aman).
mother(ahona,absar).
mother(akira,alo).
mother(alo,ahdar).
mother(ava, akash).

%% A IS THE FATHER OF B
father(abdullah,adri).
father(abdullah,ali).
father(affan,amir).
father(amir,aleya).
father(amir, akil).
father(akil,asfi).
father(akil,ashik).
father(ahsan, asma).
father(ahsan, annie).
father(ahsan, ahan).
father(aaa,ardhi).
father(ali, aman).
father(aman,absar).
father(absar,alo).
father(anaf,  ahdar).
father(ahdar, akash).


%%%-rules

parent(X,Y):-
     mother(X,Y);
     father(X,Y).

siblings(X,Y):-
    father(Z,X),
    father(Z,Y),
    X\= Y.

aunt(X,Y):-
     parent(Z,Y),
     siblings(X,Z),
     female(X).

uncle(X,Y):-
     parent(Z,Y),
     siblings(X,Z),
     male(X).

grandparent(X,Y):-
     parent(X,Z),
     parent(Z,Y).

grandmother(X,Y):-
     parent(X,Z),
     parent(Z,Y),
     female(X).
grandfather(X,Y):-
     parent(X,Z),
     parent(Z,Y),
     male(X).

great_grandparent(X,Y):-
     parent(X,Z),
     grandparent(Z,Y).

great_greatgrandparent(X, Y):-
      parent(X,Z),
      great_grandparent(Z,Y).




%%-cousin_rule
first_cousin(X,Y):-
    grandparent(Z,X),
    grandparent(Z,Y),
    not(siblings(X,Y)),
    X\=Y.
second_cousin(X,Y):-
    great_grandparent(Z,X),
    great_grandparent(Z,Y),
    not(siblings(X,Y)),
    not(first_cousin(X,Y)),
    X\=Y.

third_cousin(X,Y):-
    great_greatgrandparent(Z,X),
    great_greatgrandparent(Z,Y),
    not(first_cousin(X,Y)),
    not(second_cousin(X,Y)),
    not(siblings(X,Y)),
    X\=Y.


%%%- cousin_removed
first_cousin_once_removed(X, Y):-
    (
        parent(Z,Y),
        first_cousin(X,Z)
    );
    (
        parent(Z,X),
        first_cousin(Y,Z)
    ).
first_cousin_twice_removed(X,Y):-
    (
        grandparent(Z,Y),
        first_cousin(X,Z)
    );
    (
        grandparent(Z,X),
        first_cousin(Y,Z)
    ).
second_cousin_once_removed(X, Y):-
    (
        parent(Z,Y),
        second_cousin(X,Z)
    );
    (
        parent(Z,X),
        second_cousin(Y,Z)
    ).
second_cousin_twice_removed(X,Y):-
    (
        grandparent(Z,Y),
        second_cousin(X,Z)
    );
    (
        grandparent(Z,X),
        second_cousin(Y,Z)
    ).

third_cousin_once_removed(X,Y):-
   (
       parent(Z,Y),
       third_cousin(X,Z)
   );
   (
       parent(Z,X),
       third_cousin(Z,Y)
   ).
third_cousin_twice_removed(X,Y):-
   (
       grandparent(Z,Y),
       third_cousin(X,Z)
   );
   (
       grandparent(Z,X),
       third_cousin(Z,Y)
   ).




















