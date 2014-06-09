Macaya::App.controllers :partidos do

	get :new do
	    @partido = Partido.new
	    render 'partidos/new'
	end

	post :create do
		torneo = Torneo.get(params[:partido][:torneo])
		equipo_local = Equipo.get(params[:partido][:equipo_local])
		equipo_visitante = Equipo.get(params[:partido][:equipo_visitante])
		
		unless torneo.nil? 
			unless equipo_local.eql? equipo_visitante
				@partido = Partido.new(params[:partido])
				if @partido.save
		  			flash[:success] = 'PARTIDO AGREGADO EXITOSAMENTE'
		  			redirect '/'
				else
		  			flash.now[:error] = 'EL PARTIDO NO PUDO SER AGREGADO'
		  			render 'partidos/new'
        		end
        	else
        		flash.now[:error] = 'LOS EQUIPOS DEBEN SER DISTINTOS'
        		#render 'partidos/new'
        	end
        else
        	flash.now[:error] = 'NO EXISTE TORNEO'
        	#render 'partidos/new'
        end
	end
end
