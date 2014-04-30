var net = require('net');
var fs = require("fs");

var proxyPort = 8893;

/**
 *  检测header是否接收完成
 *
 * @return 
 */
var ifHeaderDone = function() {
    var index = b.toString().indexOf("\r\n\r\n");
    if(index !== -1) {
        return true;
    }
    return false;
};

var getHeader = function(buffer) {
    return buffer.toString().split("\r\n\r\n")[0] || "";
};

var getHeaderFromBuffer = function() {
};

/**
 *  client有数据返回时的回调
 *
 * @param {Buffer} data
 *
 */
var clientOnDataCallback = function(data) {
};

/**
 *  创建一个代理服务器
 *
 * @return 
 */
var createProxyServer = function () {
    var server = net.createServer(function (client) {
        client.on("data", clientOnDataCallback);
    });
    server.listen(proxyPort);
};

var init = function () {
    createProxyServer();
};
