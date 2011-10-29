class Psychology < ActiveRecord::Base
  validates_presence_of :weeks_of_gestation, :weeks_of_gestation, :good_health_q1, :exhausted_q2, :sick_q3, :headache_q4, :chill_q5, :full_of_energy_q6, :insomnia_q7, :insomnia_all_night_q8, :restless_nights_q9, :satisfied_to_do_things_q10, :enjoy_daily_activities_q11, :bad_mood_q12, :afraid_q13, :sad_q14, :nervous_q15, :user_id, :dependency_id, :patient_id

  validates_uniqueness_of :patient_id, :message => "ya cuenta con este cuestionario registrado. No puede aplicarse dos veces."
  validates_inclusion_of :pregnant, :in => [true, false]

  belongs_to :patient
end
