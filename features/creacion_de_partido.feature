Feature: Creación de Partidos
    Background:
        Given que tengo ya creado el torneo "torneoA"
        And el equipo "equipo1"
        And el equipo "equipo2"


    Scenario: Creacion Exitosa
        Given que no existan partidos
        When creo un partido para el "torneoA" con fecha "2014-07-20"
        And defino equipo local "equipo1"
        And defino equipo visitante "equipo2"
        Then se visualiza el partido en el fixture

    Scenario: Creacion Fallida por partidos ya definidos

        Given que no existan partidos
        When creo un partido para el "torneoA" con fecha "2014-07-20"
        And defino equipo local "equipo1"
        And defino equipo visitante "equipo2"
        Then se visualiza el partido en el fixture
        When creo un partido para el "torneoA" con fecha "2014-07-20"
        And defino equipo local "equipo1"
        And defino equipo visitante "equipo2"
        Then muestra un error que el partido ya existe