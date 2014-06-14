migration 3, :create_partidos do
  up do
    create_table :partidos do
      column :id, Integer, :serial => true
      column :torneo_id, DataMapper::Property::Integer # :length => 255
      column :id_equipo_local, DataMapper::Property::Integer # :length => 255
      column :id_equipo_visitante, DataMapper::Property::Integer # :length => 255
      column :fecha, DataMapper::Property::Date
    end
  end

  down do
    drop_table :partidos
  end
end
