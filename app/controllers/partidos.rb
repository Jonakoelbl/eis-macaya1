Macaya::App.controllers :partidos do

	get :new do
            @torneo = torneo_actual
	    @equipos = Equipo.all
	    @partido = Partido.new
	    render 'partidos/new'
	end

	post :create do
		@equipos = Equipo.all
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
	  				redirect url(:torneos, :show, :torneo_id => torneo_actual.id)
				else
	  				flash.now[:error] = 'EL PARTIDO NO PUDO SER AGREGADO'
	  				render 'partidos/new'
       			end
       		else
        		flash[:error] = 'LOS EQUIPOS DEBEN SER DISTINTOS'
        		redirect '/partidos/new'	
        	end
	end

	post :update, :with => :partido_id do
		@partido = Partido.first(:id => params[:partido_id])

                @equipo_local = Equipo.first(:id => @partido.id_equipo_local)
		@equipo_visitante = Equipo.first(:id => @partido.id_equipo_visitante)
                @puntaje_actual_local = @equipo_local.puntaje
                @puntaje_actual_visitante = @equipo_visitante.puntaje

		@resultado_local = params[:partido][:resultado_equipo_local]
                @resultado_visitante = params[:partido][:resultado_equipo_visitante]
        if @resultado_visitante.to_i >= 0 and @resultado_local.to_i >= 0
            @partido.update(:resultado_local => @resultado_local, :resultado_visitante => @resultado_visitante)
			if @resultado_local > @resultado_visitante
               	@equipo_local.update(:puntaje => (@puntaje_actual_local + 3))
            elsif @resultado_local < @resultado_visitante
                @equipo_visitante.update(:puntaje => (@puntaje_actual_visitante + 3))
       	    else
                @equipo_local.update(:puntaje => (@puntaje_actual_local + 1))
                @equipo_visitante.update(:puntaje => (@puntaje_actual_visitante + 1))
			end
		else
			flash[:error] = 'LOS VALORES DEBEN SER POSITIVO'
        	redirect url(:torneos, :show, :torneo_id => @partido.torneo.id)
		end
		redirect '/'	
	end
end
