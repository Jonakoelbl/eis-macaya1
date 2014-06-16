Macaya::App.controllers :torneos do

	get :all do
	    @torneos = Torneo.all
	    render 'torneos/torneo_manager'
	end

	get :new do
	    @torneo = Torneo.new
	    render 'torneos/new'
	end

	get :table do
            @equipos = Equipo.all(:order => [:puntaje.desc])
	    render 'torneos/table'
	end

	get :show, :with => :torneo_id do
	    @torneo = Torneo.get(params[:torneo_id])
	    asignar_torneo_actual @torneo
	    @partidos = Partido.all(:torneo_id => torneo_actual.id)
            render 'torneos/show'
	end

	post :create do
		@torneo = Torneo.new(params[:torneo])
		if @torneo.save
		  flash[:success] = 'EL TORNEO FUE CREADO'
		  redirect '/'
		else
		  flash.now[:error] = 'NO SE PUDO CREAR EL TORNEO'
		  render 'torneos/new'
        	end
	end

end
