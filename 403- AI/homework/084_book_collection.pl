%%% book collection %%%%%
%%20101084

go:-
    write('What is Store name? '),
    readln(Store),
    hypothesis(Store, Book),
    write_list([Store,' has ',Book,' book.']),nl.

go:-
    write('Sorry, do not find the book. '),nl.


%%fact
has(Store, series_of_3am):-
    write_list(['Does ',Store,' have a series_of_3am- (y/n) ?']),
    response(Reply),
    Reply='y'.

has(Store, devi ):-
    write_list(['Does ',Store,' have a devi- (y/n) ?']),
    response(Reply),
    Reply='y'.

has(Store, aynaghor ):-
    write_list(['Does ',Store,' have a aynaghor- (y/n) ?']),
    response(Reply),
    Reply='y'.

has(Store, jin):-
    write_list(['Does ',Store,' have a jin- (y/n) ?']),
    response(Reply),
    Reply='y'.

has(Store, dracula ):-
    write_list(['Does ',Store,' have a dracula- (y/n) ?']),
    response(Reply),
    Reply='y'.

has(Store, a_time_to_die ):-
    write_list(['Does ',Store,' have a a_time_to_die- (y/n) ?']),
    response(Reply),
    Reply='y'.

has(Store,tin_goyenda ):-
    write_list(['Does ',Store,' have a tin_goyenda - (y/n) ?']),
    response(Reply),
    Reply='y'.

has(Store,  quiet_girl_in_a_noisy_world):-
    write_list(['Does ',Store,' have a quiet_girl_in_a_noisy_world - (y/n) ?']),
    response(Reply),
    Reply='y'.
has(Store, picutan ):-
    write_list(['Does ',Store,' have a picutan - (y/n) ?']),
    response(Reply),
    Reply='y'.

has(Store, ma ):-
    write_list(['Does ',Store,' have a ma- (y/n) ?']),
    response(Reply),
    Reply='y'.

has(Store, ekaras ):-
    write_list(['Does ',Store,' have a ekaras- (y/n) ?']),
    response(Reply),
    Reply='y'.

has(Store, the_alchemist  ):-
    write_list(['Does ',Store,' have a the_alchemist - (y/n) ?']),
    response(Reply),
    Reply='y'.

has(Store, surjotamshi  ):-
    write_list(['Does ',Store,' have a surjotamshi - (y/n) ?']),
    response(Reply),
    Reply='y'.

has(Store, belapurabarage  ):-
    write_list(['Does ',Store,' have a belapurabarage - (y/n) ?']),
    response(Reply),
    Reply='y'.

has(Store, paradoxial_sajid  ):-
    write_list(['Does ',Store,' have a paradoxial_sajid - (y/n) ?']),
    response(Reply),
    Reply='y'.

has(Store, fera ):-
    write_list(['Does ',Store,' have a fera- (y/n) ?']),
    response(Reply),
    Reply='y'.

has(Store, tusar_konna_O_sath_bamon ):-
    write_list(['Does ',Store,' have a tusar_konna_O_sath_bamon- (y/n) ?']),
    response(Reply),
    Reply='y'.

has(Store, basic_ali ):-
    write_list(['Does ',Store,' have a basic_ali- (y/n) ?']),
    response(Reply),
    Reply='y'.

has(Store, cindrella):-
    write_list(['Does ',Store,' have a cindrella- (y/n) ?']),
    response(Reply),
    Reply='y'.

has(Store, osomapto_aattojiboni):-
    write_list(['Does ',Store,' have a osomapto_aattojiboni- (y/n) ?']),
    response(Reply),
    Reply='y'.

has(Store, deyal):-
    write_list(['Does ',Store,' have a deyal- (y/n) ?']),
    response(Reply),
    Reply='y'.

has(Store, pather_panchali):-
    write_list(['Does ',Store,' have a pather_panchali- (y/n) ?']),
    response(Reply),
    Reply='y'.


%%Rule
type(Store, horor) :-
    has(Store, devi),
    has(Store, aynaghor),
    has(store, dracula).

type(Store, thriller) :-
    has(Store, a_time_to_die),
    has(Store,  tin_goyenda),
    has(store,  series_of_3am).

type(Store, novels) :-
    has(Store, quiet_girl_in_a_noisy_world ),
    has(Store, picutan ),
    has(store, ma ).

type(Store,  fiction) :-
    has(Store, ekaras  ),
    has(Store, the_alchemist ),
    has(store, surjotamshi ).

type(Store,  islamic) :-
    has(Store, belapurabarage ),
    has(Store, paradoxial_sajid ),
    has(store, fera ).

type(Store, comics) :-
    has(Store, tusar_konna_O_sath_bamon ),
    has(Store,  basic_ali),
    has(store,  cindrella).

type(Store, historical) :-
    has(Store, osomapto_aattojiboni),
    has(Store, deyal),
    has(store, pather_panchali ).



write_list([]).
write_list([Term| Terms]) :-
    write(Term),
    write_list(Terms).

response(Reply) :-
    get_single_char(Code),
    put_code(Code), nl,
    char_code(Reply, Code).













