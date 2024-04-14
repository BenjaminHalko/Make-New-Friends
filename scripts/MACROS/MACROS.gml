#macro EnableLive if live_call() return live_result

#macro RESW 480
#macro RESH 270

#macro OutlineSize 0.8
#macro CircleSides 8

globalvar MinSpawnX;
globalvar MaxSpawnX;
MinSpawnX = 150;
MaxSpawnX = room_width;

#macro SAVEFILE "save.ini"

#macro BROWSER false