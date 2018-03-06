Sequel.migration do
  change do
    create_table :patients_addresses do
      primary_key :id
      foreign_key :patient_id, :patients
      foreign_key :address_id, :addresses
    end
  end
end
