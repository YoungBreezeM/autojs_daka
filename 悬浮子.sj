"auto"

var window = floaty.window(
    <frame gravity="center">
        <text id="text" textSize="16sp" textColor="#f44336"/>
    </frame>
);

window.exitOnClose();

window.text.click(()=>{
    window.setAdjustEnabled(!window.isAdjustEnabled());
});

//在哪个时间段开始打卡
let  startTime = 24;
 
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
    var str = util.format("离打卡时间还有: %d:%d:%d\n",(startTime-1)-date.getHours(), 59-date.getMinutes(),60- date.getSeconds());
    return str;
}


//app 入口
function Main(){
    console.show()
    console.log("app start")
    appStart()
    enterHome()
    enterCar()
    isEnd()
　
}
     

 //打开翻转校园
function appStart(){
    launchApp("翻转校园")
    console.info("成功启动翻转校园")
}

//进入首页
function enterHome(){
　　var home = id("common_footer_txt_homepage").findOne();//获取首页
         console.log(home.text())
　　if(home){
            home.click()
            console.info("进入首页");
        }　
}

//进入打卡中心
function enterCar(){
    sleep(3000)
   var p =  id("common_gridview_item_ll").findOne();
   p.click()
}

   

function isEnd() {
    sleep(2000)
    var msg = id("common_first_header_tv_title").findOne();
    console.log(msg.text())
        if(msg.text()=="健康报备"){
            console.info("打卡成功")
        } else{
        console.("打卡失败")
        }  
         sleep(1000)
         console.hide()
}