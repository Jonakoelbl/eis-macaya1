Then(/^se visualizan los partidos en el fixture$/) do
  visit '/'
  click_link ('torneoA')
  page.should have_content('2014-07-20')
  page.should have_content('equipo1')
  page.should have_content('equipo2')
end

Then(/^la lista de partidos esta vacia$/) do
  visit '/'
  click_link ('torneoA')
  page.should_not have_content('2014-07-20')
end
