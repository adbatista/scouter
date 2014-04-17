FactoryGirl.define do
  factory :klass do
    name "Example"
    score 13
    method_average 6.5
    method_count 2
  end

  factory :repository do
    name 'adbatista/scouter'
  end

  factory :build
end
