class Equipo
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :name, String, :unique => true

  validates_presence_of :name

  has n, :puntajes
  has n, :torneos, :through => :puntajes

  def self.nombre_para(id)
      @equipo = Equipo.first(:id => id)
      @equipo.name
  end

end
