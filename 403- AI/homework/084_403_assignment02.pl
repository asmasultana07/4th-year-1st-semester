%%% Medical Diagnostic MODIFY %%%%%
%%20101084

go:-
    write('What is the patients name?'),
    readln(Patient),
    hypothesis(Patient,Disease),
    write_list([Patient,' probably has ',Disease,'.']),nl.

go:-
    write('Sorry, I don''t seem to be able to'),nl,
    write('diagnose the disease.'),nl.



symptom(Patient,fever):-
    write_list(['Does ',Patient,' have a fever (y/n) ?']),
    response(Reply),
    Reply='y'.

symptom(Patient,rash):-
    write_list(['Does ',Patient,' have a rash (y/n) ?']),
    response(Reply),
    Reply='y'.

symptom(Patient,headache):-
    write_list(['Does ',Patient,' have a headache (y/n) ?']),
    response(Reply),
    Reply='y'.

symptom(Patient,runny_nose):-
    write_list(['Does ',Patient,' have a runny_nose (y/n) ?']),
    response(Reply),
    Reply='y'.

symptom(Patient,conjunctivitis) :-
    write_list(['Does ',Patient,' have a conjunctivitis (y/n) ?']),
    response(Reply),
    Reply='y'.

symptoms(Patient,cough) :-
    write_list(['Does ',Patient,' have a cough (y/n) ?']),
    response(Reply),
    Reply='y'.

symptoms(Patient,body_ache) :-
    write_list(['Does ',Patient,' have a body_ache (y/n) ?']),
    response(Reply),
    Reply='y'.

symptoms(Patient,chills) :-
    write_list(['Does ',Patient,' have a chills (y/n) ?']),
    response(Reply),
    Reply='y'.

symptom(Patient,sore_throat) :-
    write_list(['Does ',Patient,' have a sore_throat (y/n) ?']),
    response(Reply),
    Reply='y'.

symptom(Patient,sneezing) :-
    write_list(['Does ',Patient,' have a sneezing (y/n) ?']),
    response(Reply),
    Reply='y'.

symptom(Patient,swollen_glands) :-
    write_list(['Does ',Patient,' have a swollen_glands (y/n) ?']),
    response(Reply),
    Reply='y'.



symptom(Patient, tideness) :-
    write_list(['Does ',Patient,' have a tideness (y/n) ?']),
    response(Reply),
    Reply='y'.

symptom(Patient, loss_of_taste_or_smell) :-
    write_list(['Does ',Patient,' have a loss_of_taste_or_smell (y/n) ?']),
    response(Reply),
    Reply='y'.

symptom(Patient, weakness) :-
    write_list(['Does ',Patient,' have a weakness (y/n) ?']),
    response(Reply),
    Reply='y'.

symptom(Patient, pale) :-
    write_list(['Does ',Patient,' have a pale_or_yellowish_skin (y/n) ?']),
    response(Reply),
    Reply='y'.

symptom(Patient, loss_of_appetite) :-
    write_list(['Does ',Patient,' have a loss_of_appetite (y/n) ?']),
    response(Reply),
    Reply='y'.

symptom(Patient, persistent_weakness_and_fatigue) :-
    write_list(['Does ',Patient,' have a persistent_weakness_and_fatigue (y/n) ?']),
    response(Reply),
    Reply='y'.

symptom(Patient, night_sweats) :-
    write_list(['Does ',Patient,' have a night_sweats (y/n) ?']),
    response(Reply),
    Reply='y'.

symptom(Patient, joint_pain) :-
    write_list(['Does ',Patient,' have a joint_pain (y/n) ?']),
    response(Reply),
    Reply='y'.

symptom(Patient, belly_pain) :-
    write_list(['Does ',Patient,' have a belly_pain_pain (y/n) ?']),
    response(Reply),
    Reply='y'.
symptom(Patient, bomiting) :-
    write_list(['Does ',Patient,' have a bomiting (y/n) ?']),
    response(Reply),
    Reply='y'.

%rule
hypothesis(Patient,measles) :-
    symptom(Patient,fever),
    symptom(Patient,cough),
    symptom(Patient,conjunctivitis),
    symptom(Patient,runny_nose),
    symptom(Patient,rash).

hypothesis(Patient,german_measles) :-
    symptom(Patient,fever),
    symptom(Patient,headache),
    symptom(Patient,runny_nose),
    symptom(Patient,rash).

hypothesis(Patient,flu) :-
    symptom(Patient,fever),
    symptom(Patient,headache),
    symptom(Patient,body_ache),
    symptom(Patient,conjunctivitis),
    symptom(Patient,chills),
    symptom(Patient,sore_throat),
    symptom(Patient,runny_nose),
    symptom(Patient,cough).

hypothesis(Patient,common_cold) :-
    symptom(Patient,headache),
    symptom(Patient,sneezing),
    symptom(Patient,sore_throat),
    symptom(Patient,runny_nose),
    symptom(Patient,chills).

hypothesis(Patient,mumps) :-
    symptom(Patient,fever),
    symptom(Patient,swollen_glands).

hypothesis(Patient,chicken_pox) :-
    symptom(Patient,fever),
    symptom(Patient,chills),
    symptom(Patient,body_ache),
    symptom(Patient,rash).

hypothesis(Patient,measles) :-
    symptom(Patient,cough),
    symptom(Patient,sneezing),
    symptom(Patient,runny_nose).


hypothesis(Patient, thalassemia) :-
    symptom(Patient, fatigue),
    symptom(Patient, weakness),
    symptom(Patient, pale).

hypothesis(Patient, covid_19) :-
    symptom(Patient, fever),
    symptom(Patient, cough),
    symptom(Patient, tideness),
    symptom(Patient, loss_of_taste_or_smell).

hypothesis(Patient, blood_cancer) :-
    symptom(Patient, fever),
    symptom(Patient, cough),
    symptom(Patient, rash),
    symptom(Patient, loss_of_appetite),
    symptom(Patient, persistent_weakness_and_fatigue),
    symptom(Patient, night_sweats).

hypothesis(Patient, diareaa) :-
    symptom(Patient, bomiting),
    symptom(Patient, belly_pain),
    symptom(Patient, tideness).




write_list([]).
write_list([Term| Terms]) :-
    write(Term),
    write_list(Terms).

response(Reply) :-
    get_single_char(Code),
    put_code(Code), nl,
    char_code(Reply, Code).













