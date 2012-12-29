json.partial! @loading

json.positions @loading.positions do |json, position|
  json.partial! position
end