class Patient < ActiveRecord::Base
  after_save :add_to_classification

  searchable_by :firstname, :lastname1, :lastname2

  validates_presence_of :firstname, :lastname1, :lastname2, :birthday, :street,  :bornstate_id, :square_id, :ocupation_id, :maritalstatus_id
  validates_numericality_of :square_id, :ocupation_id, :maritalstatus_id, :only_integer => true, :greater_than => 0, :message => "Debes Seleccionar una colonia valida"
  validates_inclusion_of :gender, :in => [true, false]
  validates_uniqueness_of :cuip, :message => "Este paciente ya existe en el sistema, busque nuevamente porfavor."

  belongs_to :square
  belongs_to :state
  belongs_to :maritalstatus
  belongs_to :ocupation
  belongs_to :economic_situation
  belongs_to :tipo_vivienda
  belongs_to :schooling

  has_many :psychologies
  has_many :clinical_histories
  has_many :appoiments
  has_many :ultra_sounds
  has_many :ultra2_sounds
  has_many :ultra3_sounds
  has_many :first_times
  has_many :somatomeries

  has_one :violency
  has_one :ries_par
  has_one :neonatal
  has_one :variable_fetal
  has_one :socioeconomic
  has_one :classification


  def keygen(patient, borndate)
    key = rfc(patient, borndate) + unique_chars(patient, borndate)
    key = key.upcase
  end

  def rfc(patient, borndate)
    rfc = patient['lastname1'].slice(0..1) + patient['lastname2'].slice(0..0) + patient['firstname'].slice(0..0) + State.find(patient['bornstate_id']).key + borndate[:year].slice(2..3) + eval_data(borndate[:month]) + eval_data(borndate[:day])
  end

  def unique_chars(patient, borndate)
   extra_chars = Digest::SHA512.hexdigest([rfc(patient, borndate), patient['firstname'], patient['lastname1'], patient['lastname2']].join('').upcase).slice(0..2)
  end

    def eval_name(name)
    name name.split(/ /)
    name[0]
  end

  def eval_data(data)
    (data.to_i > 9) ? data : ("0" +data)
   end


  def fullname
    "#{firstname} #{lastname1} #{lastname2}"
  end

  def address
    "#{street} #{exterior} #{interior}"
  end

  def full_address
    "#{street} #{exterior}, #{interior} CP: #{cp}, Colonia: #{self.square.name}, Delegacion: #{self.square.county.name}, #{self.square.county.state.name}"
  end

  def age
    ((Date.today - birthday) / 365.2475).to_i
  end

  def sex
    gender == true ? "Hombre" : "Mujer"
  end

  private
  def add_to_classification
    Classification.new(:patient_id => self.id, :age => self.age, :maritalstatus_id => self.maritalstatus_id, :schooling_id => self.schooling_id).save
  end
end
