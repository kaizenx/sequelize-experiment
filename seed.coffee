Sequelize = require('sequelize')
Chance = require('chance')
sequelize = new Sequelize('hive_development', '', '',
  dialect: 'postgres' # sqlite, postgres, mariadb, mysql
  port: 5432) # or 5432 for postgres, 3306 for mysql
Hyvelet = sequelize.import(__dirname + "/models/Hyvelet")
Location = sequelize.import(__dirname + "/models/Location")

Hyvelet.hasMany Location 
Location.belongsTo Hyvelet, foreignKey: 'hyvelet_id'

sequelize.sync()

sequelize.authenticate().complete (err) ->
  if ! !err
    console.log 'Unable to connect to the database:', err
  else
    # console.log 'Connection has been established successfully.'
    chance = Chance()
    now = Date()
    noop = ->
  
    i = 0
    while i < 10
      Hyvelet.create({
                      name: chance.name()
                      pin: chance.guid()
                      lat: chance.latitude({fix:7})
                      lng: chance.longitude({fix:7})
                      }).on 'success', (hyvelet) ->
        console.log(hyvelet)
        Location.create({
                         deviceid: chance.guid()
                         lat: chance.latitude({fix:7})
                         lng: chance.longitude({fix:7})
                         created_at: now
                         updated_at: now
                         }).on 'success', (location) ->
          location.setHyvelet(hyvelet)  
      i++
  return
