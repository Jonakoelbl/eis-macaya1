Given(/^tengo un partido que no se jugo$/) do
  page.should have_content('2014-07-20')
  page.should have_content('equipo1')
  page.should have_content('equipo2')
end

When(/^completo el resultado del equipo local con "(.*?)"$/) do |resultado_local|
  fill_in('partido[resultado_equipo_local]', :with => resultado_local)
end

When(/^completo el resultado del equipo visitante con "(.*?)"$/) do |resultado_visitante|
  fill_in('partido[resultado_equipo_visitante]', :with => resultado_visitante)
end

When(/^se juega el partido$/) do
  click_button('Jugar')
end

Then(/^se ve el partido con su resultado$/) do
  page.should have_content('5') 
  page.should have_content('1')
end

Then(/^se ve el equipo "(.*?)" en la posicion "(.*?)" de la tabla$/) do |equipo, posicion|
  click_link('Ver Tabla')
  page.should have_content(equipo) 
  page.should have_content(posicion)
end

Then(/^muestra error por cargar un valor negativo$/) do
  page.should have_content('LOS VALORES DEBEN SER POSITIVOS') 
end

Then(/^muestra error por no completar los campos$/) do
  page.should have_content('DEBE COMPLETAR TODOS LOS CAMPOS')
end

Then(/^muestra error por cargar un valor invalido$/) do
  page.should have_content('DEBE INGRESAR VALORES NUMERICOS')
end
