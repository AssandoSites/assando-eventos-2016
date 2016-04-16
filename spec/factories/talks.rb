FactoryGirl.define do
  factory :talk do
    title 'Título da palestra'
    description 'Descrição da palestra'
    start '09:00:00'
    finish '10:00:00'
    speaker
  end
end
