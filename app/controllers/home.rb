Macaya::App.controllers :home do
  
  get :index, :map => '/' do
    @torneos = Torneo.all
    @equipos = Equipo.all
    @partidos = Partido.all
    render 'home/index'
  end
  
end
