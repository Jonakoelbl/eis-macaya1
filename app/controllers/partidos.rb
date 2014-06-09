Macaya::App.controllers :partidos do

	get :new do
	    @partido = Partido.new
	    render 'partidos/new'
	end

	post :create do
		
		unless Torneo.get(params[:partido][:torneo]).nil? 
			unless Equipo.get(params[:partido][:equipo_local]).nil? or Equipo.get(params[:partido][:equipo_visitante]).nil?
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
        		flash[:error] = 'ALGUNOS DE LOS EQUIPOS NO EXISTE'
        		redirect '/partidos/new'
        	end
        else
        	flash[:error] = 'NO EXISTE TORNEO'
        	redirect '/partidos/new'
        end
	end
end
