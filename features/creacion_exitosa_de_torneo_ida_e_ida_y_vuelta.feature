Feature: Creación exitosa de un torneo de ida/ida y vuelta.

	Background:
		Given que tengo ya creado el equipo "equipo1"
		And el equipo "equipo2"
		And el equipo "equipo3"
		And el equipo "equipo4"
 
	Scenario: Creación de torneo ida exitosa
		Given quiero crear un torneo con nombre "prueba"
		And agrego al "equipo1" al torneo "prueba"
		And agrego al "equipo2" al torneo "prueba"
		And agrego al "equipo3" al torneo "prueba"
		And agrego al "equipo4" al torneo "prueba"
		And elijo que sea solo con partidos de ida
		Then el torneo "prueba" se crea exitosamente y tiene "3" fechas.

	Scenario: Creación de torneo ida y vuelta exitosa
		Given quiero crear un torneo con nombre "prueba"
		And agrego al "equipo1" al torneo "prueba"
		And agrego al "equipo2" al torneo "prueba"
		And agrego al "equipo3" al torneo "prueba"
		And agrego al "equipo4" al torneo "prueba"
		And elijo que sea solo con partidos de ida y vuelta
		Then el torneo "prueba" se crea exitosamente y tiene "6" fechas.
