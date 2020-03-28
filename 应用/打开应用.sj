"auto"
console.show()


//app 入口
function Main(){
    console.log("app start")
    appStart()
    enterHome()
    enterCar()
    isEnd()
　
}
     
  Main();   

 //打开翻转校园
function appStart(){
    launchApp("翻转校园")
    console.log("成功启动翻转校园")
}

//进入首页
function enterHome(){
　　var home = id("common_footer_txt_homepage").findOne();//获取首页
         console.log(home.text())
　　if(home){
            home.click()
            console.log("进入首页");
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
            console.log("打卡成功")
        } else{
        console.log("打卡失败")
        }  
}