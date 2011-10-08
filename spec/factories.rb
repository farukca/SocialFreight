Factory.define :user do |u|
  u.sequence(:email) { |n| "foos{#n}@socialfreight.com" }
  u.password "secret"
end

Factory.define :patron do |p|
  p.title "Patron1"
  p.sequence(:email) { |n| "patrons{#n}@socialfreight.com" }  
  p.tel "902161234567"
  p.fax "902167654321"
  p.address "Cevizli Kartal"
end
