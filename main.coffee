Router = require('routes')
Sequelize = require('sequelize')
sequelize = new Sequelize('hive_development', '', '',
  dialect: 'postgres' # sqlite, postgres, mariadb, mysql
  port: 5432) # or 5432 for postgres, 3306 for mysql
Hyvelet = sequelize.import(__dirname + "/models/Hyvelet")
Location = sequelize.import(__dirname + "/models/Location")
sequelize.sync()
sequelize.authenticate().complete (err) ->
  if ! !err
    console.log 'Unable to connect to the database:', err
  else
    # console.log 'Connection has been established successfully.'
    router = Router()
    noop = ->
    Location.findAll().then (projects) ->
      results = JSON.stringify(projects)
    
    # router.addRoute '/articles/:title?', noop
    # router.addRoute '/:controller/:action/:id.:format?', noop
    # console.log router.match('/articles')
    # console.log router.match('/articles/never-gonna-let-you-down')
    # console.log router.match('/posts/show/1.json')
  return
