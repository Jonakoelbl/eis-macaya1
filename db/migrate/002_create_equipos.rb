migration 2, :create_equipos do
  up do
    create_table :equipos do
      column :id, Integer, :serial => true
      column :name, DataMapper::Property::String, :length => 255,:unique => true
      column :puntaje, DataMapper::Property::Integer
    end
  end

  down do
    drop_table :equipos
  end
end
