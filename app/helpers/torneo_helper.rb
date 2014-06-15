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
	
end
