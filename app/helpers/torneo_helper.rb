Macaya::App.helpers do

	def torneo_actual=(torneo)
		@torneo_actual = torneo 
	end

	def torneo_actual
		@torneo_actual ||= Torneo.get(session[:torneo_actual])
	end

	def asignar_torneo_actual(torneo)
		session[:torneo_actual] = torneo.id
		self.torneo_actual = torneo
	end

	def borrar_asignacion_torneo
		session.delete(:torneo_actual)
	end

	def torneo_asignado?
		!torneo_actual.nil?
	end

    def equipos_a_agregar=(equipos)
		@equipos_a_agregar = equipos
	end

	def equipos_a_agregar
        @equipos_a_agregar ||= session[:equipos_a_agregar]
	end

	def asignar_equipos_a_agregar(equipos)
		session[:equipos_a_agregar] = equipos
		self.equipos_a_agregar = equipos
	end

	def borrar_equipos_a_agregar
		session[:equipos_a_agregar] = []
	end
	
end
