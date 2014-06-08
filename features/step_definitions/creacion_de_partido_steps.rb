Given(/^que tengo ya creado el torneo "(.*?)"$/) do |nombre_torneo|
  Torneo.all.destroy
  Equipo.all.destroy
  visit '/torneos/new'
  fill_in('torneo[name]', :with => nombre_torneo)
  click_button('Crear')
end

Given(/^el equipo "(.*?)"$/) do |nombre_equipo|
  visit '/equipos/new'
  fill_in('equipo[name]', :with => nombre_equipo)
  click_button('Crear')
end

Given(/^que no existan partidos$/) do
  Partido.all.destroy
end

When(/^creo un partido para el "(.*?)" con fecha "(.*?)"$/) do |nombre_torneo, fecha|
  visit '/partidos/new'
  #click_link ('agregar-partido') #ID del Button
  fill_in('partido[torneo]', :with => nombre_torneo)
  fill_in('partido[fecha]', :with => fecha)
end

When(/^defino equipo local "(.*?)"$/) do |equipoLocal|
  fill_in('partido[equipo_local]', :with => equipoLocal)
end

When(/^defino equipo visitante "(.*?)"$/) do |equipoVisitante|
  fill_in('partido[equipo_visitante]', :with => equipoVisitante)  
end

Then(/^se visualiza el partido en el fixture$/) do
  click_button('Agregar')
  expect(page).to have_content 'PARTIDO AGREGADO EXITOSAMENTE'
end

Then(/^muestra un error que el partido ya existe$/) do
  click_button('Agregar')
  expect(page).to have_content 'EL PARTIDO NO PUDO SER AGREGADO'
end
