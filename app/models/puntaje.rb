class Puntaje
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial  
  belongs_to :torneo
  belongs_to :equipo
  property :puntaje, Integer, :required => true

  validates_presence_of :torneo
  validates_presence_of :equipo

end
