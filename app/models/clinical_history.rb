class ClinicalHistory < ActiveRecord::Base
  # after_save :add_to_classification

  has_many :past_pregnants
  accepts_nested_attributes_for :past_pregnants, :reject_if => :all_blank

  validates_uniqueness_of :patient_id

  private
  def add_to_classification
    @partos = !self.partos.nil? ? self.partos.to_i : 0
    @cesareas = !self.cesareas.nil? ? self.cesareas.to_i : 0
    @paridad =  @partos + @cesareas
    @record = Classification.find_by_patient_id(self.patient_id)
    @record.update_attributes(:weight => self.peso, :height => self.talla, :parity => @paridad)
  end
end
