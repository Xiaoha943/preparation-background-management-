/*
 * @Author: 韩静文
 * @Date: 2024-11-26 13:52:16
 * @Description: 
 */
const Router = require('koa-router')
const user = require('../services/user')
let router = new Router()

//获取列表数据
router.get('/getTable', async (ctx) => { 
    ctx.body = { data: 'Hello from the backend!' };
})

//提交数据
router.post('/submit', async (ctx) => {
    let res = await user.submit(ctx, '200')
    if (res == true) {
        console.log('成功')
    }
})

module.exports = router