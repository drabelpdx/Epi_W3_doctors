require('spec_helper')

describe(Doctor) do

  describe("#name") do
    it("returns a doctor's name") do
      doctor = Doctor.new({:name => "Dr. Bob", :specialty => "Cardiology", :id => nil})
      expect(doctor.name()).to(eq("Dr. Bob"))
    end
  end

  describe("#specialty") do
    it("returns a doctor's specialty") do
      doctor = Doctor.new({:name => "Dr. Bob", :specialty => "Cardiology", :id => nil})
      expect(doctor.specialty()).to(eq("Cardiology"))
    end
  end

  describe(".all") do
    it("starts off empty at first") do
      expect(Doctor.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("lets you save doctor info to the database") do
      doctor = Doctor.new({:name => "Dr. Bob", :specialty => "Cardiology", :id => nil})
      doctor.save()
      expect(Doctor.all()).to(eq([doctor]))
    end
  end

  describe("#id") do
    it("sets an ID when you save it") do
      doctor = Doctor.new({:name => "Dr. Bob", :specialty => "Cardiology", :id => nil})
      doctor.save()
      expect(doctor.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe(".find") do
    it("returns a doctor by his/her ID") do
      test_doctor = Doctor.new({:name => "Dr. Bob", :specialty => "Cardiology", :id => nil})
      test_doctor.save()
      test_doctor2 = Doctor.new({:name => "Dr. Jack", :specialty => "Surgery", :id => nil})
      test_doctor2.save()
      expect(Doctor.find(test_doctor2.id())).to(eq(test_doctor2))
    end
  end

  describe("#patient_list") do
    it("returns an array of patients for that doctor") do
      test_doctor = Doctor.new({:name => "Dr. Bob", :specialty => "Cardiology", :id => nil})
      test_doctor.save()
      test_patient = Patient.new({:name => "Dylan", :birthdate => "1955-01-01", :doctor_id => test_doctor.id()})
      test_patient.save()
      test_patient2 = Patient.new({:name => "Johnny", :birthdate => "1965-01-01", :doctor_id => test_doctor.id()})
      test_patient2.save()
      expect(test_doctor.patient_list()).to(eq([test_patient, test_patient2]))
    end
  end
end
