Given(/^que no existan partidos$/) do
  Partido.all.destroy
  visit '/torneos/new'
  fill_in('torneo[name]', :with => 'torneoA')
  click_button('Crear')
end

When(/^creo un partido para el "(.*?)" con fecha "(.*?)"$/) do |nombre_torneo, fecha|
  visit '/'
  click_link ('agregar-partido') #ID del Button
  fill_in('Torneo', :with => nombre_torneo)
  fill_in('Fecha', :with => fecha)
end

When(/^defino equipo local "(.*?)"$/) do |equipoLocal|
  fill_in('Equipo local', :with => equipoLocal)
end

When(/^defino equipo visitante "(.*?)"$/) do |equipoVisitante|
  fill_in('Equipo visitante', :with => equipoVisitante)
end

Then(/^se visualiza el partido en el fixture$/) do
  click_button('Agregar')
  page.should have_content('PARTIDO AGREGADO EXITOSAMENTE')
end

Then(/^muestra un error que el partido ya existe$/) do
  click_button('Agregar')
  page.should have_content('EL PARTIDO NO PUDO SER AGREGADO')
end
