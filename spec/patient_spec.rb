require('spec_helper')

describe(Patient) do

  describe(".all") do
    it("is empty at first") do
      expect(Patient.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a patient to the database") do
      test_patient = Patient.new({:name => "Sally", :birthdate => '1998-08-12', :doctor_id => 2})
      test_patient.save()
      expect(Patient.all()).to(eq([test_patient]))
    end
  end
end
