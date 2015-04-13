var Router, Sequelize, sequelize;

  Router = require('routes');

  Sequelize = require('sequelize');

  sequelize = new Sequelize('hive_development', '', '', {
    dialect: 'postgres',
    port: 5432
  });

  sequelize.authenticate().complete(function(err) {
    var Location, noop, router;
    if (!!err) {
      console.log('Unable to connect to the database:', err);
    } else {
      router = Router();
      noop = function() {};
      Location = sequelize.define('hyvelet_missing_locations', {
        id: Sequelize.STRING,
        deviceid: Sequelize.TEXT,
        lat: Sequelize.FLOAT,
        lng: Sequelize.FLOAT
      });
      router.addRoute('/articles/:title?', noop);
      router.addRoute('/:controller/:action/:id.:format?', noop);
      console.log(router.match('/articles'));
      console.log(router.match('/articles/never-gonna-let-you-down'));
      console.log(router.match('/posts/show/1.json'));
    }
  });