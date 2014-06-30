And(/^el equipo "(.*?)"$/) do |nombre_equipo|
  visit '/equipos/new'
  fill_in('equipo[name]', :with => nombre_equipo)
  click_button('Crear')
end

Given(/^quiero crear un torneo con nombre "(.*?)"$/) do |nombre_torneo|
  visit '/torneos/new'
  fill_in('torneo[name]', :with => nombre_torneo)
end

Given(/^agrego al "(.*?)" al torneo "(.*?)"$/) do |nombre_equipo, nombre_torneo|
  select(nombre_equipo, :from => 'equipo_select')
  click_button('Agregar Equipo')
end

Given(/^elijo que sea solo con partidos de ida$/) do
  choose('ida')
  click_button('Crear')
end

Then(/^el torneo "(.*?)" se crea exitosamente y tiene "(.*?)" fechas\.$/) do |nombre_torneo, nro|
  visit '/'
  click_link(nombre_torneo)

end

Given(/^elijo que sea solo con partidos de ida y vuelta$/) do
  choose('ida_vuelta')
end
