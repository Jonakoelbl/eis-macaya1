class Equipo
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :name, String, :unique => true
  property :puntaje, Integer, :required => true

  validates_presence_of :name

  # has n, :partidos

  def self.nombre_para(id)
      @equipo = Equipo.first(:id => id)
      @equipo.name
  end

end
