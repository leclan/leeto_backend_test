FactoryBot.define do
  factory :employee do
    first_name { 'Jean' }
    last_name { 'Dupont' }
    email { 'jean@dupont.fr' }
    organisation { create :organisation }
    password { 'secret' }
    password_confirmation { 'secret' }
    hire_date { Time.current - 1.year }
  end
end
