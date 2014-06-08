class Partido
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :torneo, String, :unique_index => :u
  property :equipo_local, String, :unique_index => :u
  property :equipo_visitante, String, :unique_index => :u
  property :fecha, Date, :unique => true

#  belongs_to :torneo, :key => true
#  belongs_to :equipo_local, 'Equipo', :key => true
#  belongs_to :equipo_visitante, 'Equipo', :key => true

  validates_presence_of :fecha

end
