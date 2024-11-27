/*
 * @Author: 韩静文
 * @Date: 2024-11-26 13:52:24
 * @Description: 
 */
const bluebird = require('bluebird');
// const fs = require('fs');
// bluebird.promisifyAll(fs);
const db = require('../middlewares/conn')

// 提交
exports.submit = async (ctx, code) => {
    // if (code === '200') {
    //     ctx.body = {
    //         github: githubInfo,
    //         username: target.username,
    //         userId: target.id,
    //         role: target.role,
    //         token
    //     }
    // } else {
    //     ctx.throw(403, 'github 授权码已失效！')
    // }
    return true
}