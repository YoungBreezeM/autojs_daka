

//无密码解锁
function unlockNoPsw() {
    device.wakeUpIfNeeded();
    sleep(500);
    swipe(563, 1600, 500, 1300, 100);
}
unlockNoPsw()