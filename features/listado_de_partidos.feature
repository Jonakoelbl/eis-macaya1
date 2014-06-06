Feature: Listado de Partidos

    Scenario: Listado de Partidos
        Given que no existan partidos
        When creo un partido para el "torneoA" con fecha "2014-07-20"
        And defino equipo local "equipo1"
        And defino equipo visitante "equipo2"
        When creo un partido para el "torneoA" con fecha "2014-07-21"
        And defino equipo local "equipo3"
        And defino equipo visitante "equipo4"
        Then se visualizan los partidos en el fixture

    Scenario: No existen partidos
        Given que no existan partidos
        Then la lista de partidos esta vacia