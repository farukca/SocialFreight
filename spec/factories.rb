Factory.define :user do |u|
  u.name "SocialFreight"
  u.surname "Admin"
  u.sequence(:email) { |n| "foos{#n}@socialfreight.com" }
  u.password "secret"
end

Factory.define :patron do |p|
  p.title "Patron1"
  p.sequence(:email) { |n| "patrons{#n}@socialfreight.com" }  
  p.tel "902161234567"
  p.fax "902167654321"
  p.address "Cevizli Kartal"
  p.password "123456"
  p.password_confirmation "123456"
end
