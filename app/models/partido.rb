class Partido
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :torneo, String
  property :fecha, Date
  property :equipo_local, String
  property :equipo_visitante , String
  
#  belongs_to :torneo, :key => true
#  belongs_to :equipo_local, 'Equipo', :key => true
#  belongs_to :equipo_visitante, 'Equipo', :key => true

  validates_presence_of :fecha
  validates_uniqueness_of :torneo, :scope => [:fecha, :equipo_local, :equipo_visitante]

end
