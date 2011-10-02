Factory.define :user do |u|
  u.sequence(:email) { |n| "foo{#n}@socialfreight.com" }
  u.password "secret"
end
