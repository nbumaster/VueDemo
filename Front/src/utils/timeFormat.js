/*
 * @Author: chenwensheng
 * @Date: 2020-07-03 17:38:46
 * @LastEditTime: 2020-07-03 19:58:27
 * @LastEditors: Please set LastEditors
 * @Description: 时间戳转化为年月日时分秒
 * @FilePath: \sem-console\src\utils\timeFormat.js
 */
export const formatTime = function (timestamp) {
    let time = new Date(timestamp);
    let year = time.getFullYear();
    const month = (time.getMonth() + 1).toString().padStart(2, '0');
    const date = (time.getDate()).toString().padStart(2, '0');
    const hours = (time.getHours()).toString().padStart(2, '0');
    const minute = (time.getMinutes()).toString().padStart(2, '0');
    const second = (time.getSeconds()).toString().padStart(2, '0');
    return year + '-' + month + '-' + date + ' ' + hours + ':' + minute + ':' + second;
};
