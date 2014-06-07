migration 3, :create_partidos do
  up do
    create_table :partidos do
      column :id, Integer, :serial => true
      column :torneo, DataMapper::Property::String, :length => 255, :unique_index => :u
      column :equipo_local, DataMapper::Property::String, :length => 255, :unique_index => :u
      column :equipo_visitante, DataMapper::Property::String, :length => 255, :unique_index => :u
      column :fecha, DataMapper::Property::Date, :unique_index => :u
    end
  end

  down do
    drop_table :partidos
  end
end
