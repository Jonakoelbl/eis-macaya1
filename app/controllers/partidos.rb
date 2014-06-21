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

		@existe_puntaje_local = Puntaje.first(:torneo_id => torneo_actual.id, :equipo_id => @equipo_local.id).nil?
        @existe_puntaje_visitante = Puntaje.first(:torneo_id => torneo_actual.id, :equipo_id => @equipo_visitante.id).nil?

		if not @existe_puntaje_local
			@puntaje_local = Puntaje.first(:torneo_id => torneo_actual.id, :equipo_id => @equipo_local.id)
        else
            @puntaje_local = Puntaje.new
            @puntaje_local.torneo = torneo_actual
            @puntaje_local.equipo = @equipo_local
            @puntaje_local.puntaje = 0
            @puntaje_local.save
		end

        if not @existe_puntaje_visitante
			@puntaje_visitante = Puntaje.first(:torneo_id => torneo_actual.id, :equipo_id => @equipo_visitante.id)
        else
            @puntaje_visitante = Puntaje.new
            @puntaje_visitante.torneo = torneo_actual
            @puntaje_visitante.equipo = @equipo_visitante
            @puntaje_visitante.puntaje = 0
            @puntaje_visitante.save
        end

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

        @puntaje_actual_local = Puntaje.first(:equipo_id => @equipo_local.id, :torneo_id => torneo_actual.id)
        @puntaje_actual_visitante = Puntaje.first(:equipo_id => @equipo_visitante.id, :torneo_id => torneo_actual.id)

		@resultado_local = params[:partido][:resultado_equipo_local]
        @resultado_visitante = params[:partido][:resultado_equipo_visitante]

        if @resultado_visitante.to_i >= 0 and @resultado_local.to_i >= 0
            @partido.update(:resultado_local => @resultado_local, :resultado_visitante => @resultado_visitante)
			if @resultado_local > @resultado_visitante
               	@puntaje_actual_local.update(:puntaje => (@puntaje_actual_local.puntaje + 3))
            elsif @resultado_local < @resultado_visitante
                @puntaje_actual_visitante.update(:puntaje => (@puntaje_actual_visitante.puntaje + 3))
       	    else
                @puntaje_actual_local.update(:puntaje => (@puntaje_actual_local.puntaje + 1))
                @puntaje_actual_visitante.update(:puntaje => (@puntaje_actual_visitante.puntaje + 1))
			end
		else
			flash[:error] = 'LOS VALORES DEBEN SER POSITIVO'
        	redirect url(:torneos, :show, :torneo_id => @partido.torneo.id)
		end

		# flash[:error] = 'DEBE INGRESAR VALORES NUMERICOS'
		redirect url(:torneos, :show, :torneo_id => @partido.torneo.id)
	end
end
