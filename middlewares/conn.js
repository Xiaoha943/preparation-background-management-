/*
 * @Author: 韩静文
 * @Date: 2024-11-25 17:01:33
 * @Description: 连接数据库操作
 */
const { Promise } = require('bluebird')
const mysql = require('mysql') //引入数据库模块
const databaseConfig = require('./data.config') //引入数据库配置模块中的数据

module.exports = {
  query: function (sql, params) {
    //每次使用的时候需要创建连接，数据操作完成后要关闭连接
    return new Promise((resolve, reject) => {
      let connection = mysql.createConnection(databaseConfig)
      connection.connect((err) => {
        if (err) {
          console.log('数据库连接失败')
          alert(err)
        }
      })
      //开始数据操作
      //传入是哪个参数，第一个参数sql语句，第二个参数 sql语句中需要的的数据，第三个参数回调函数
      connection.query(sql, params, (err, results, fields) => {
        if (err) {
          reject(err)
        }
        //将查询出来的数据返回回调函数
        resolve(results, fields)
        //results作为数据操作后的结果，fields作为数据库连接的一些字段
        //停止连接数据库后，必须在查询语句后，哟啊不然已调用这个方法就停止连接，数据库操作就会失败
        connection.end((err) => {
          if (err) {
            console.log('关闭数据库连接失败')
            alert(err)
          }
        })
      })
    })
  },
}
