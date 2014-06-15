Feature: Listado de Partidos
    Background:
        Given que tengo ya creado el torneo "torneoA"
        And el equipo "equipo1"
        And el equipo "equipo2"
        And el equipo "equipo3"
	And el equipo "equipo4"


    Scenario: Listado de Partidos
        Given que no existan partidos
        When creo un partido para el "torneoA" con fecha "2014-07-20"
        And defino equipo local "equipo1"
        And defino equipo visitante "equipo2"
        And creo el partido
        When creo un partido para el "torneoA" con fecha "2014-07-21"
        And defino equipo local "equipo3"
        And defino equipo visitante "equipo4"
        And creo el partido
        Then se visualizan los partidos en el fixture

    Scenario: No existen partidos
        Given que no existan partidos
        Then la lista de partidos esta vacia
