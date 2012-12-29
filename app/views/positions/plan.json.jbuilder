json.partial! @position

json.reservations @position.reservations do |json, reservation|
  json.partial! reservation
end