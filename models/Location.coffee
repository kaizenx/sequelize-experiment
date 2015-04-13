module.exports = (sequelize, DataTypes) ->
  Location = sequelize.define('hyvelet_missing_locations', 
                              {
                                id: 
                                  type: DataTypes.INTEGER
                                  primaryKey: true
                                deviceid: DataTypes.STRING
                                lat: DataTypes.FLOAT
                                lng: DataTypes.FLOAT
                                created_at:
                                  type: DataTypes.DATE
                                  defaultValue: DataTypes.NOW
                                updated_at:
                                  type: DataTypes.DATE
                                  defaultValue: DataTypes.NOW
                                hyvelet_id: DataTypes.INTEGER
                              },
                              {
                                timestamps: false
                                freezeTableName: true
                                tablename: 'hyvelet_missing_locations'
                              }
                            )