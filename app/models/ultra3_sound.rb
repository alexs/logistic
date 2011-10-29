class Ultra3Sound < ActiveRecord::Base

validates_uniqueness_of :patient_id, :message => "ya cuenta con este cuestionario registrado. No puede aplicarse dos veces."

belongs_to :patient

end
