require('doctor')
require('rspec')
require('pg')
require('patient')
require('pry')

DB = PG.connect({:dbname => "doctors_office_test"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM doctors *;")
    DB.exec("DELETE FROM patients *;")
  end
end
