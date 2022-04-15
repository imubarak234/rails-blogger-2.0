FactoryBot.define do
  factroy: user do
    sequence(:email) {|n| "hello+#{c}@cjav.dev"}
    password { SecureRandom.hex }
  end
end