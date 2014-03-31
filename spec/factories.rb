FactoryGirl.define do
  factory :class_detail do
    class_name "Example"
    score 13
    method_average 6.5
    method_count 2
  end

  factory :repository do
    url 'http://example.com/abc.git'
  end
end