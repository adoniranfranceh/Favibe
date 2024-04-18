FactoryBot.define do
  factory :event do
    name { "Lual Festivo" }
    description { "Será um momento de muito aprendizado" }
    event_start { "2024-04-18 22:18:50" }
    event_end { "2024-04-18 22:18:50" }
    location { "Rua das Palmeiras" }
    category { "Conferência" }
    status { 1 }
  end
end
