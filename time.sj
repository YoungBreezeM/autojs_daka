
// var password = [5, 9, 6, 2]
var password = [4, 3, 5, 4, 3, 5]
const isRooted = true

var deviceUnlocker = {}
deviceUnlocker.unlockDevice = function () {
if (device.isScreenOn()) {
sleep(3000) // 延时启动 方便调试
}
var batteryLevel = device.getBattery()
log('battery level : ' + batteryLevel)
if (batteryLevel < 10 && !device.isCharging()) {
log('电量低,屏幕解锁未执行')
return false
}
if (!device.isScreenOn()) {
log('unlocking device')
device.wakeUp()
sleep(100)
if (!device.isScreenOn()) {
console.warn('error: screen still off!!!')
sleep(100)
}

if (isRooted) {
  Swipe(540, 1800, 540, 300, 100) // 大写为root函数 小写的swipe无法成功滑动  //米8为上滑
  for (var i = 0; i < password.length; i++) {
    desc(password[i]).findOne(10000).click()
  }
} else {
  // 非root模式 普通swipe下滑失效 采用下滑通知栏点击设置进入密码输入页面进行曲线解锁
  swipe(540, 10, 540, 1500, 600)
  sleep(500) // 要等通知栏下滑加载完成后定位
  if (desc('设置').exists())
    desc('设置').findOne(2000).click()
  else {
    log('warnning: find setting widget failed once')
    swipe(540, 10, 540, 1500, 200)
  }
  desc('设置').findOne(2000).click()
  for (var i = 0; i < password.length; i++) {
    desc(password[i]).findOne(10000).click()
  }
}

// 返回桌面 解锁结束
sleep(1000)
for (var i = 0; i < 10; i++) {
  if (currentActivity() != 'com.miui.home.launcher.Launcher') {
    log('returning home')
    home()
    sleep(200)
  }
}

if (currentActivity() == 'com.miui.home.launcher.Launcher') {
  toastLog('device unlocked')
  return true
} else {
  return false
}
}
}

module.exports = deviceUnlocker

var deviceUnlocker = require('解锁屏幕.js')
deviceUnlocker.unlockDevice()