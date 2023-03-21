json.array! @routines do |routine|
  json.extract! routine, :id, :name
end