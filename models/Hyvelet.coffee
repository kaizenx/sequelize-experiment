module.exports = (sequelize, DataTypes) ->
  Hyvelet = sequelize.define('hyvelets',                                 
                            {
                              id: 
                                type: DataTypes.INTEGER
                                primaryKey: true
                              name: DataTypes.STRING
                              pin: DataTypes.STRING
                              lat: DataTypes.FLOAT
                              lng: DataTypes.FLOAT
                              created_at:
                                type: DataTypes.DATE
                                defaultValue: DataTypes.NOW
                              updated_at:
                                type: DataTypes.DATE
                                defaultValue: DataTypes.NOW
                              user_id: DataTypes.INTEGER
                              status: DataTypes.STRING  
                            },
                            {
                              timestamps: false
                              freezeTableName: true
                              tablename: 'hyvelets'
                            }
                          )