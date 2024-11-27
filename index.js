/*
 * @Author: 韩静文
 * @Date: 2024-11-26 10:20:30
 * @Description: 入口，配置服务器及静态文件地址
 */

const Koa = require('koa')
const logger = require('koa-logger')
const useRouter = require('./routes/user')
const cors = require('koa2-cors')
//创建koa实例
const app = new Koa()

app.use(cors())
app.use(logger())

app.use(useRouter.routes()).use(useRouter.allowedMethods())

app.listen(8002,
    () => {
        console.log('http://127.0.0.1:8002 服务器已启动')
    }
)