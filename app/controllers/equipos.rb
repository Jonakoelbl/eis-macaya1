Macaya::App.controllers :equipos do

	get :all do
	    @equipos = Equipo.all
	    render 'equipos/equipo_manager'
	end

	get :new do
		@equipo = Equipo.new
	    render 'equipos/new'
	end

	post :create do
		@equipo = Equipo.new(params[:equipo])
		if @equipo.save
		  flash[:success] = 'EL EQUIPO FUE CREADO'
		  redirect '/'
		else
		  flash.now[:error] = 'NO SE PUDO CREAR EL EQUIPO'
		  render 'equipos/new'
        end
	end
end
