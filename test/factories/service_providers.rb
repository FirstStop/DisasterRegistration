FactoryGirl.define do
  factory :service_provider do
    name "Service Provider"
    workbench ({
      table_attributes: [],
      statuses: [],
    })
  end
end
