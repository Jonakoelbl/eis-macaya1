Macaya::App.controllers :partidos do

	get :new do
            @torneo = torneo_actual
	    @equipos = Equipo.all
	    @partido = Partido.new
	    render 'partidos/new'
	end

	post :create do
		@equipo_local = Equipo.first(:name => params[:partido][:equipo_local])
                @equipo_visitante = Equipo.first(:name => params[:partido][:equipo_visitante])
                @fecha = (params[:partido][:fecha])
			unless @equipo_local.eql? @equipo_visitante
				@partido = Partido.new
	 			@partido.fecha = @fecha
                                @partido.id_equipo_local = @equipo_local.id
                                @partido.id_equipo_visitante = @equipo_visitante.id
				torneo_actual.partidos << @partido
				if @partido.save
	  				flash[:success] = 'PARTIDO AGREGADO EXITOSAMENTE'
	  				redirect '/'
				else
	  				flash.now[:error] = 'EL PARTIDO NO PUDO SER AGREGADO'
	  				render 'partidos/new'
       			end
       		else
        		flash[:error] = 'LOS EQUIPOS DEBEN SER DISTINTOS'
        		redirect '/partidos/new'	
        	end
	end
end
