"auto"
/**
* @auther yqf 
* @ 说明　用于翻转校园健康打卡
* @version: 0.1.1
*/
var window = floaty.window(
    <frame gravity="center">
        <text id="text" textSize="16sp" textColor="#f44336"/>
    </frame>
);

window.exitOnClose();

window.text.click(()=>{
    window.setAdjustEnabled(!window.isAdjustEnabled());
});

 //在哪个时间段开始打卡[1-24]
let  startTime = 10 ;
 
let run = setInterval(()=>{
    if(new Date().getHours()==startTime){
            toast("开始打卡")
              Main();   
            clearInterval(run)
    }else{
        //对控件的操作需要在UI线程中执行
    ui.run(function(){
        window.text.setText(dynamicText());
        
    });
    }
    
    
}, 1000);

function dynamicText(){
    var date = new Date();
    var str = util.format("离打卡时间还有: %d:%d:%d\n",startTime>date.getHours()?(startTime-1)-date.getHours():23-date.getHours(), 59-date.getMinutes(),60- date.getSeconds());
    return str;
}


 //app 入口
function Main(){
    console.show()
    console.log("app start")
    appStart()
}
     

 //打开翻转校园
function appStart(){
    launchApp("翻转校园")
    console.info("成功启动翻转校园")
    enterHome()
}

 //进入首页
function enterHome(){
        sleep(3000)
　　var home =id("common_footer_rlyt_homepage").untilFind().click()//获取首页
        console.info("进入首页");
        enterCar()
}

 //进入打卡中心
function enterCar(){
    sleep(2000)
    id("common_gridview_item_ll").findOne().click();
      console.info("进入健康报备")
      //判断是否打过卡
      if(isEnd()){
          //点击返回
          isEnd().click(); 
          console.info("已经打卡")
          sleep(2000)
          console.hide()
      }else{
          console.info("开始打卡")
          submit()
      }
}

  //提交报备信息
function submit(){
    sleep(2000)
   className("android.view.View").untilFind().forEach(child=>{
    if(child.text()=="提交"){
           child.click();
           console.info("打卡成功")
           sleep(2000)
           console.hide()
    }
   })
}   
 //判断是否打过卡
function isEnd() {
    sleep(2000)
    let status = false;
    className("android.view.View").untilFind().forEach(child=>{
       if(child.text()=="返回"){
           status = child;
       }
    });
    return status;
}