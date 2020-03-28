"auto";
/*
脚本名称 :翻转校园打卡
脚本版号 :1
脚本版名 :0.0.1
脚本作者 :yqf
完成日期 :2020-3-26
权限环境 :Root环境 OR Android7.+无障碍环境
测试环境 :AutoJs 3.1.0 Beta | Android 7.0系统 | 翻转校园
*/
//环境检查
auto.waitFor();
//设置屏幕分辨率环境,以适应不同分辨率设备
setScreenMetrics(1440, 2392);
//正文代码
var rootAutomator;
var isFirstRun = true;
var isPlaying = false;
var isDebug = false; //开发者模式
var btnSubmit = text("提交");
var btnContinue = id("check_right");
//问题选项列表
var answerListView = className("android.widget.ListView");

if (isDebug) {
console.clear(); //清除控制台
console.show();
}
if (hasRoot()) {
rootAutomator = new RootAutomator();
}
//检查当前界面是否是脚本初始运行界面
if (!id("tab_title").text("章节").exists()) {
alert("提示", "学习通->我的课程->选择某个课程进入，脚本便会自动运行了");
}
//脚本退出监听
events.on('exit', function() {
if (rootAutomator != null) rootAutomator.exit();
console.hide(); //隐藏控制台
});

