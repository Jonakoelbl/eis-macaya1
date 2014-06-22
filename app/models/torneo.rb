class Torneo
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :name, String, :unique => true

  validates_presence_of :name

  has n, :partidos

  has n, :puntajes
  has n, :equipos, :through => :puntajes

end
