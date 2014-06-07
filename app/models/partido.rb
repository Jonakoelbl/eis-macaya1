class Partido
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :torneo, String, :unique_index => :u
  property :equipo_local, String, :unique_index => :u
  property :equipo_visitante, String, :unique_index => :u
  property :fecha, Date, :unique_index => :u

  validates_presence_of :torneo
  validates_presence_of :equipo_local
  validates_presence_of :equipo_visitante
  validates_presence_of :fecha

end
