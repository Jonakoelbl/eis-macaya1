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
        @equipo = Equipo.new
		@nombre_equipo = params[:equipo][:name]
		if !@nombre_equipo.empty?
			@equipo.name = @nombre_equipo
			if @equipo.save
			  flash[:success] = 'EL EQUIPO FUE CREADO'
			  redirect '/'
			else
			  flash.now[:error] = 'EL EQUIPO YA EXISTE'
			  render 'equipos/new'
		    end
		else
			flash.now[:error] = 'EL EQUIPO DEBE TENER UN NOMBRE'
			render 'equipos/new'
		end
	end
end
