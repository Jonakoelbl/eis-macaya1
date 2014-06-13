Macaya::App.controllers :partidos do

	get :new do
		@equipos = Equipo.all
		@torneos = Torneo.all
	    @partido = Partido.new
	    render 'partidos/new'
	end

	post :create do
		unless Torneo.get(params[:partido][:torneo]).nil? 
			unless Equipo.get(params[:partido][:equipo_local]).eql? Equipo.get(params[:partido][:equipo_visitante])
				@partido = Partido.new(params[:partido])
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
        else
        	flash[:error] = 'DEBE SELECCIONAR UN TORNEO'
        	redirect '/partidos/new'
        end
	end
end
