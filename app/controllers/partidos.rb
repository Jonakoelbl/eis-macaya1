Macaya::App.controllers :partidos do

	get :new do
	    @partido = Partido.new
	    render 'partidos/new'
	end

	post :create do
		@partido = Partido.new(params[:partido])
		if @partido.save
		  flash[:success] = 'PARTIDO AGREGADO EXITOSAMENTE'
		  redirect '/'
		else
		  flash.now[:error] = 'EL PARTIDO NO PUDO SER AGREGADO'
		  render 'partidos/new'
        end
	end
end
