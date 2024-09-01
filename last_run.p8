pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
function _init()
  hs=103
  mt=false
  ct=false
  tot=false
  st=false
  pt=true
  tc=0
  displaytext=0
  dt=0
  heatmeteractive=true
  music(0)
  lbu=false
  lmt=0
  heatmeter=0
  combo=0
  combotimer=0
  rank=79
  blink2=2
  nescon=true
  let="1: john gutter"
  conview=1  --true
  --false
  skycolor=1
  sl=5
  ws=101
  roboomega=false
  inlsp=19
  marten= false
  dt=7
  mahuy=0
  introcam=0
  coinp=9
  blink=39
  t=0
  matimer=11
  matimer2=11
  mnext=0
  circfillsp=0
  state=""
  chstate("start")
  circitirs=0
  mach=1
  mtimer=11
  player={
    sp=96,
    x=5,
    x2=0,
    y=0,
    walking=true,
    w=8,
    h=8,
    filp=false,
    dx=0,
    dy=0,
    max_dx=1,
    max_dy=0,
    acc=1,
    walk_acc=1,
    boost=0,
    anim=1,
    running=false,
    jumping=false,
    slideing=false,
    landed=false,
    colorpal=0,
    plytime=300,
    wall=false
  }
  
  tt=0
  mb=23
  player2={
    sp=1,
    x=39,
    y=104,
    w=8,
    h=8,
    filp=true,
    dx=0,
    dy=0,
    max_dx=1,
    max_dy=3,
    rolling=false,
    acc=0.3,
    walk_acc=0.5,
    boost=0,
    anim=1,
    running=false,
    jumping=false,
    slideing=false,
    landed=false,
    colorpal=3,
    plytime=5,
    grab=false,
    falling=false
  }
  gt=11
   flash=0
   gx=0
   gy=0
   gw=0
   gh=0
   hudmlx=10
   gsp=29
   cam_x=232
   cam_x_last=0
   cam_d=0
   circtest=35939
   gravity=0.2
   
   friction=0.90
   coins=0
   y=0
   callbacktimer=2
   lasttime=time()
   world=4
   coiblocanim=23
   starspd={}
   starx={}
   stary={}
   cam_stop=cam_x
   lives=5
   strszes={}
    for i=1,155 do
	    add(starx,flr(rnd(1026)))
	    add(stary,flr(rnd(555)))
	    add(starspd,rnd(2))
	  local starsize={
    x=8+rnd(16),
    y=4+rnd(4)
   }
   add(strszes,starsize)
  end
   for i=1,155 do
	    add(starx,flr(rnd(1026)))
	    add(stary,flr(rnd(555)))
	    add(starspd,rnd(2))
	  local smstarsizes={
    x=rnd(2),
    y=rnd(2)
   }
   add(strszes,smstarsizes)
  end
  bsp=52
  ancoinx={}

  ancoiny={}
  goombas={}
  
  gdir="left"
  wa=76
  pepstate=0
  --gdir="left"
 	--mget(gx-8,gy+)
	 --mget(gx-8,gy)
   for gx=0,127 do
 	  for gy=0,63 do
     if mget(gx,gy) == 50 then
     local goomba={
				    pixelx=0,
				    pixely=0,
				    stomped=false,
				    dir="right",
				    flp=false
				  }
      goomba.pixelx=gx*8
      goomba.pixely=gy*8
      add(goombas,goomba)
	    end
	  end
	 end
  ancointch={}
  stop_cam=0
  for bx=0,127 do
 	 for by=0,63 do
 	  if mget(bx,by) == 102 then
 	   add(watertopx,wtx)
 	   add(watertopy,wty)
 	  end
   end
  end
  for cx=0,127 do
 	 for cy=0,63 do
 	  if mget(cx,cy) == 13 then
 	   add(ancoinx,cx)
 	   add(ancoiny,cy)
 	   add(ancointch,0)
 	  end
   end
  end
  aryblock={}
  csp=57
  sc=7
  cloth=7
  skc=15
  cc=9
  cx=0
  cy=0
  tr=false
  ttimer=100
  cam_stop=cam_x
  nohud=false
  debug=false
  gs=5
  c=9
end

function reset_pl()
  if world==1 then
    circtest=1000
    player.sp=1
    player.x=15
    player.y=80
    player.w=8
    player.h=8
    player.dx=0
    player.dy=0
    player.max_dx=4
    player.max_dy=3
    player.acc=0.3
    player.walk_acc=0.1
    player.boost=3.5
    player.anim=0
    player.running=false
    player.jumping=false
    player.slideing=false
    player.landed=false
   end

end



function chstate(new_state)
 state=new_state
end

-->8

-- update and draw --
function _update()
 local acc=player.walk_acc
  	if matimer > 9 then
	  player.acc=0.1
	 elseif matimer > 7 then
	  player.acc=0.2
	 elseif matimer > 5 then
	  player.acc=0.3
	 elseif matimer > 3 then
	  player.acc=0.4
	  sfx(47)
	 elseif matimer > 1 then
	  player.acc=0.4
	  sfx(47)
	 else
	  sfx(47)
	 end
 if player.y <64 then
  mahuy=0
 elseif player.y >448 then
  mahuy=384
 else
  mahuy=player.y-64
 end
 if btn(🅾️) and not player.grab then
  matimer-=0.2
 elseif not btn(🅾️) then
  matimer=11
 end
 if lmt > 4 then
  lmt=matimer
 end
 if btn(🅾️) and player.flip then
  player.dx-=acc
  player.running=true
  player.flip=true
 elseif btn(🅾️) and not player.flip then
  player.dx+=acc
  player.running=true
  player.flip=false
 end
 if matimer<6 and btn(⬆️) and player.landed then
       player.dy-=player.boost+6
  player.sp=2
    sfx(30)
  player.landed=false
  player.acc=0
  matimer=11
  lbu=false
 end
end

function _debug()
 if btn(⬅️) then
  player.x-=2
 end
 if btn(➡️) then
  player.x+=2
 end
 if btn(⬇️) then
  player.y+=2
 end
 if btn(⬆️) then
  player.y-=2
 end
 if btn(⬅️) and btn(❎) then
  player.x-=2
 end
 if btn(➡️) and btn(❎) then
  player.x+=2
 end
 if btn(⬇️) and btn(❎) then
  player.y+=2
 end
 if btn(⬆️) and btn(❎) then
  player.y-=2
 end
 spr(94,player.x,player.y)
end
 --menuitem(2,"debug",setbug)
 --menuitem(1,"select player",setpal)
function _draw()
  cls()
 -- pal(11,15+128,1)
  if state == "levelsct" then
   level_select()
  end
  if multiplayer==true then
   player2_update()
   player2_animate()
  end

  blink+=.5
  if blink>40 then
  blink=39
  end
  introcam+=5
  if introcam > 92 then
   introcam=0
  end
  if state=="ending" then
   chstate("game")
  end
  if state=="start" then
   poke(0x5f2c,3)
   camera(0,0)
   cls(1)
   if btnp(⬇️) then
    cloth+=1
   end
   if btnp(⬆️) then
    cloth+=1
   end
   pal(10,sc)
   spr(1,30,30)
   pal(10,10)
   print("   press ❎ to\n      start\n\n\n\n\n\n ⬆️/⬇️ to select\n    a colour")
   if btnp() then
    world=1
    reset_pl()
    chstate("game")
   end
 if cloth == 0 and player.colorpal == 0 then
  sc=0
 elseif cloth == 1 and player.colorpal == 0 then
  sc=1
 elseif cloth == 2 and player.colorpal == 0 then
  sc=2
 elseif cloth == 3 and player.colorpal == 0 then
  sc=3
 elseif cloth == 4 and player.colorpal == 0 then
  sc=4
 elseif cloth == 5 and player.colorpal == 0 then
  sc=5
 elseif cloth == 6 and player.colorpal == 0 then
  sc=6
 elseif cloth == 7 and player.colorpal == 0 then
  sc=7
  --print("          classic cook",0,65,7)
 elseif cloth == 8 and player.colorpal == 0 then
  sc=8
  --print("           blood red",0,65,7) 32////32332/332/332/332/33/
 elseif cloth == 9 and player.colorpal == 0 then
  sc=9
 elseif cloth == 10 and player.colorpal == 0 then
  sc=10
 elseif cloth == 11 and player.colorpal == 0 then
  sc=11
 elseif cloth == 12 and player.colorpal == 0 then
  sc=12
 elseif cloth == 13 and player.colorpal == 0 then
  sc=13
 elseif cloth == 14 and player.colorpal == 0 then
  sc=14
 elseif cloth == 15 and player.colorpal == 0 then
  sc=15
 elseif cloth == 16 and player.colorpal == 0 then
  sc=16
 else
  cloth=0
 end
  end
   
  if state == "charselect" then
   camera(cam_x,mahuy)
   cam_x=60
   mahuy=64
   map(0,48,cam_x-(cam_x/1)%96,mahuy,128,16)
   map()
   poke(0x5f2c,3)
   if btnp(➡️) and player.colorpal == 0 then
    player.colorpal=1
   elseif btnp(➡️) and player.colorpal == 1 then
    player.colorpal=0
   end
   if btnp(⬅️) and player.colorpal == 0 then
    player.colorpal=1
   elseif btnp(⬅️) and player.colorpal == 1 then
    player.colorpal=0
   end
   if player.colorpal == 0 then
    spr(78,cam_x+17,mahuy+13)
   elseif player.colorpal == 1 then
    spr(78,cam_x+32,mahuy+13)
   end
   if btnp(🅾️) then
    chstate("ending")
    world=1
    reset_pl()
   end
   ancoin()
   ang()
   spr(44,cam_x+14,mahuy+24,4,2)
  end
  if state=="game over" then
   stop()
  end
  if state=="game" then
 
  if debug == false then

  elseif debug == true then
   _debug()
  end
  ang()
  
 if state=="game" then
  poke(0x5f2c,3)
  if closeview == 1 then
   poke(0x5f2c,3)
  else
   poke(0x5f2c,4)
  end
  if player.y>512 then
    chstate("ending")
  end

  t+=1
  collect_toppin(player,7,0)

  collect_pickup(player,4,0)
  --metal(player,3,0)
  -- stop at end or start --
  if stop_cam<1 and cam_x > 64-128 then
   cam_x=64-128
  elseif stop_cam<1 and cam_x > 960 then
   cam_x=896
  end
  if player.x<0 then
   player.x=0
  end
  if player.x>1016 then
   player.x=1016
  end
  
  if btn(3,1) then
   player2.sp=11
   player2.acc=0
   player2.walk_acc=0
   player2.jumping=0
  elseif btn(2,1) then
   player2.sp=12
   player2.acc=0
   player2.walk_acc=0
   player2.jumping=0
  else
   player2.acc=0.3
   player2.walk_acc=0.1
   player2.boost=6
   
  end
  
  if player2.x<0 then
   player2.x=0
  elseif player2.x>1016 then
   player2.x=1016
  end
   color(9,coinp)
 end

  
   --spr(74,cam_x_last+34,mahuy)
   --print("   " .. flr(player.plytime),cam_x_last+35,mahuy,15)
   sl-=.1
   spr(13,39,104)
   --if player.flip then
    --   else
--    spr()
--   end

   circtest-=0
  

  
  -- camera --
  if stop_cam<1 and player.x < 64 and world != 4 then
   cam_x=0
  elseif stop_cam<1 and player.x > 960 then
   cam_x=896
  else
   cam_x=player.x-63
  end

  cam_d=cam_x-cam_x_last
  cam_x_last=cam_x
  if lives < 0 then
   chstate("game over")
   sfx(22)
   sfx(23)
   lives=2
   camera(0,0)
   player.x=39
   player.y=104
  end

 
  
 
  if world == 3 then
   mo=true
  else
   mo=false
  end
  
  if world == 3 then
   if monx > player.x then
    monx-=1.5
   end
   if monx < player.x then
    monx+=1.5
   end
   if mony > player.y then
    mony-=1.5
   end
   if mony < player.y then
    mony+=1.5
   end
  end
 if cloth == 0 and player.colorpal == 0 then
  sc=0
 elseif cloth == 1 and player.colorpal == 0 then
  sc=1
 elseif cloth == 2 and player.colorpal == 0 then
  sc=2
 elseif cloth == 3 and player.colorpal == 0 then
  sc=3
 elseif cloth == 4 and player.colorpal == 0 then
  sc=4
 elseif cloth == 5 and player.colorpal == 0 then
  sc=5
 elseif cloth == 6 and player.colorpal == 0 then
  sc=6
 elseif cloth == 7 and player.colorpal == 0 then
  sc=7
 elseif cloth == 8 and player.colorpal == 0 then
  sc=8
 elseif cloth == 9 and player.colorpal == 0 then
  sc=9
 elseif cloth == 10 and player.colorpal == 0 then
  sc=10
 elseif cloth == 11 and player.colorpal == 0 then
  sc=11
 elseif cloth == 12 and player.colorpal == 0 then
  sc=12
 elseif cloth == 13 and player.colorpal == 0 then
  sc=13
 elseif cloth == 14 and player.colorpal == 0 then
  sc=14
 elseif cloth == 15 and player.colorpal == 0 then
  sc=15
 elseif cloth == 16 and player.colorpal == 0 then
  sc=16
 else
  cloth=0
 end

  if player.colorpal == 1 then
   circitirs=circitirs-3
   pal(13,13)
  else
   player.colorpal=0
   circitirs-=3
  end
 if ttimer < 0 then
  chstate("game over")
 end
 if coins<0 then
  coins=0
 end
 camera(cam_x,mahuy)
 cls()
 
 starfield()
 anstrs()
-- 

 map(0,48,cam_x-(cam_x/2)%96,mahuy,128,16)
 map()
 
 ancoin()
 if player.x == monx then
  coins-=1
 end
 if player.landed and btn(⬆️) and matimer < 5 then
      	pal(15,2)
	   pal(4,2)
	   pal(10,2)
	   pal(7,2)
 --spr(player.sp,player.x,player.y+4)
	   pal(15,15)
	   pal(10,10)
	   pal(7,7)
	   pal(4,4)
 end
  if not player.wall and not player.rolling and blink2 == 0 and matimer<5 then
   pal(7,7)
   spr(77,player.x,player.y,1,1,player.flip)
   pal(7,7)

  end
  --pal(15,15+128,1)
  
 	if not btn(⬆️) and not player.flip and blink2==1 or not player.wall and blink2==1 and player.flip == false then
   	pal(15,2)
	   pal(4,5)
	   pal(6,5)
	   pal(10,2)
	   pal(7,2)
	  -- pal(1,5)
	   spr(player.sp,player.x2-7,player.y,1,1,player.flip)
	   pal(15,15)
	   pal(10,10)
	   
	   pal(7,7)
	   pal(6,6)
	   pal(4,4)
	   spr(14,player.x2-4,player.y,1,1,player.flip)
	  	  	pal(15,3)
	   pal(4,5)
	   pal(10,3)
	   pal(6,5)
	   pal(7,3)
	   spr(player.sp,player.x2-20,player.y,1,1,player.flip)
	   pal(15,15)
	   pal(10,10)
	   pal(7,7)
	   pal(6,6)
	   pal(4,4)
	   pal(1,1)
	  elseif not btn(⬆️) and not lbu and blink2==1 and player.flip or not player.wall and blink2==1 and player.flip then
   	pal(15,2)
	   pal(4,5)
	   pal(6,5)
	   pal(10,2)
	   pal(7,2)
	  -- pal(1,5)
	   spr(player.sp,player.x2+7,player.y,1,1,player.flip)
	   pal(15,15)
	   pal(10,10)
	   
	   pal(7,7)
	   pal(6,6)
	   pal(4,4)
	   spr(14,player.x2+4,player.y,1,1,player.flip)
	  	  	pal(15,3)
	   pal(4,5)
	   pal(10,3)
	   pal(6,5)
	   pal(7,3)
	   spr(player.sp,player.x2+20,player.y,1,1,player.flip)
	   pal(15,15)
	   pal(10,10)
	   pal(7,7)
	   pal(6,6)
	   pal(4,4)
	   pal(1,1)
	   --spr(blink2+13,player.x2-4,player.y,1,1,player.flip)

	  end
	 
	  if player.x > 1000 then
  end
--  if displaytext == 1 and dt > 0 then
--   dt -=1
--   sspr((64 % 16) * 8,flr(64 / 16) * 8,8,8, cam_x+10,mahuy+29,100,10,player.filp)
--
--   print("get more pizza boxes!",cam_x+18,mahuy+30,1)
--  end
   --pal(10,sc)
   --pal(1,0)
   --spr(player.sp,player.x,player.y,1,1,player.flip)
   
   pal(10,10)
   --heat-=0.1 / 2
 
   

   --print(heat,cam_x+55,mahuy+55)
   spr(rank,cam_x+36,mahuy+1)
   if heatmeter > 0 then
   line(cam_x+8+heatmeter,mahuy+13,cam_x+8,mahuy+13,8)
end
   --spr(82,cam_x+105,mahuy+1,2,2)
   --print(" " .. flr(coins),cam_x+103,mahuy+6,1,0,0)
  if btn(🅾️) and heatmeter < 8 and player.running and player.colorpal == 0 then
   hs=105
  elseif heatmeter > 8 then
    hs=75
  elseif player.colorpal == 0 and  heatmeter < 8 and player.wall then
   hs=75
  else
   hs=103
  end
  if heatmeter > 19 then
   heatmeter = 19
  end
  if not lbu and not player.running and btn(⬆️) and tt > 0 and player.landed and not btn(⬅️) and not btn(➡️) then
  ---sfx(44)
  spr(83,player.x-4,player.y-4,2,2)
  end
  if heatmeteractive then
  spr(71,cam_x+5,mahuy+8,2,1)
  spr(87,cam_x+21,mahuy+8)
  end
  spr(73,cam_x+9,mahuy+5,2,1)
     spr(73,cam_x+1,mahuy+5,2,1)
     
   spr(89,cam_x+25,mahuy+5,1,1)
   pal(10,sc)
   if pepstate == 0 then
    spr(player.sp,player.x,player.y,1,1,player.flip)
   elseif pepstate == 1 then
    hs=80
    matimer=10
    player.boost=2
    spr(12,player.x,player.y,1,1,player.flip)
   end
   pal(10,10)
   if tc == 1 and not player.flip then
    spr(107,player.x-9,player.y,1,1,player.flip)
   elseif tc == 1 and player.flip then
    spr(107,player.x+9,player.y,1,1,player.flip)
   elseif tc == 2 and not player.flip then
    spr(107,player.x-9,player.y,1,1,player.flip)
    spr(108,player.x-18,player.y,1,1,player.flip)
   elseif tc == 2 and player.flip then
    spr(107,player.x+9,player.y,1,1,player.flip)
    spr(108,player.x+18,player.y,1,1,player.flip)
   elseif tc == 3 and not player.flip then
    spr(107,player.x-9,player.y,1,1,player.flip)
    spr(109,player.x-26,player.y,1,1,player.flip)
    spr(108,player.x-18,player.y,1,1,player.flip)
   elseif tc == 3 and player.flip then
    spr(107,player.x+9,player.y,1,1,player.flip)
    spr(108,player.x+18,player.y,1,1,player.flip)
    spr(109,player.x+26,player.y,1,1,player.flip)   
   elseif tc == 4 and not player.flip then
    spr(107,player.x-9,player.y,1,1,player.flip)
    spr(110,player.x-34,player.y,1,1,player.flip)
    spr(108,player.x-18,player.y,1,1,player.flip)
    spr(109,player.x-26,player.y,1,1,player.flip)
   elseif tc == 4 and player.flip then
    spr(107,player.x+9,player.y,1,1,player.flip)
    spr(110,player.x+34,player.y,1,1,player.flip)
    spr(108,player.x+18,player.y,1,1,player.flip)
    spr(109,player.x+26,player.y,1,1,player.flip)   
   elseif tc == 5 and not player.flip then
    spr(107,player.x-9,player.y,1,1,player.flip)
    spr(110,player.x-34,player.y,1,1,player.flip)
    spr(108,player.x-18,player.y,1,1,player.flip)
    spr(109,player.x-26,player.y,1,1,player.flip)
    spr(118,player.x-42,player.y,1,1,player.flip)
   elseif tc == 5 and player.flip then
    spr(107,player.x+9,player.y,1,1,player.flip)
    spr(110,player.x+34,player.y,1,1,player.flip)
    spr(108,player.x+18,player.y,1,1,player.flip)
    spr(109,player.x+26,player.y,1,1,player.flip)  
    spr(118,player.x+42,player.y,1,1,player.flip)    
   end

  waittime=-5
  combotimer-=0.2
  if heatmeter < 0 then
   heatmeter=0
  end

  ang()
  if combotimer > 24 then
   combotimer=24
  end
  if combotimer < 0 then
   combotimer=0
   combo=0
  end
  heatmeter-=0.1 / 6
  if heatmeter > 8 then
   coins+=0.1 / 2
  else
   coins+=0
  end

--  if 
    --print(heatmeter,cam_x+55,mahuy+55,7)

  --print(combotimer,cam_x+55,mahuy+55)
  --print(player.y,cam_x+30,mahuy+55)
  if combotimer > 0 then
  sspr((46 % 16) * 8,flr(46 / 16) * 8,16,16, cam_x+90,mahuy+20,40,16,player.filp)
 
     spr(82,cam_x+94,mahuy+24)
  spr(82,cam_x+102,mahuy+24)
  
  spr(82,cam_x+110,mahuy+24)
  spr(82,cam_x+118,mahuy+24)  spr(64,cam_x+94,mahuy+32)
  
  spr(64,cam_x+102,mahuy+32)
  spr(64,cam_x+110,mahuy+32)
  spr(64,cam_x+118,mahuy+32)
  
  print("combo "..combo,cam_x+95,mahuy+34,2)
  
   spr(60,cam_x+94+combotimer,mahuy+21)
  end
  
    print(flr(coins),cam_x+9,mahuy+5,2)
  print(flr(coins),cam_x+8,mahuy+5,4)
  if coins < 300 then
   rank=79
  elseif coins < 600 then
   rank=95
  elseif coins < 900 then
   rank=111
  else
   rank=127
  end
  pal(10,sc)
    sspr((hs % 16) * 8,flr(hs / 16) * 8,16,16, cam_x+96,mahuy-4,26,26,player.filp)
 
  pal(10,10)
  --spr(rank,cam_x+30,mahuy+3)
 
  blink2+=1
  if matimer<5 then
   if blink2 > 1 then
    blink2=0
   end
  end
  
 
   player.x2=player.x
 
	 if waittime<0 then
	  player_update()
	  player_animate()
	  goobstomp()
	  if tr==true then
    ttimer-=0.1 / 2
    coins-=0.1 / 2
   end
   --print(player.wall)
	 elseif waittime>0 then
	  camera(0,0)
	  cls(1)
	  print("loading...",90,120,7)
	 end
 

	

	 --print(music(),cam_x+55,mahuy+55,8)
	 if tr==true then
	  print(flr(ttimer),cam_x+65,mahuy+10,7)
	 end
	 end

end


-->8
--collisions

function collide_map(obj,aim,flag)
  --obj = table needs x,y,w,h
  
  local x=obj.x  local y=obj.y
  local w=obj.w  local h=obj.h
  local x1=0  local y1=0
  local x2=0  local y2=0
  
  if aim=="left" then
    x1=x-1  y1=y
    x2=x    y2=y+h-1
    
  elseif aim=="right" then
   x1=x+w     y1=y
   x2=x+w+1   y2=y+h-1
    
  elseif aim=="up" then
   x1=x  +2   y1=y-1
   x2=x+w-3   y2=y
    
  elseif aim=="down" then
   x1=x +2      y1=y+h
   x2=x+w-3     y2=y+h
  end
   
 --pixels to tiles
  x1/=8    y1/=8
  x2/=8    y2/=8
 
  if fget(mget(x1,y1), flag)
  or fget(mget(x1,y2), flag)
  or fget(mget(x2,y1), flag)
  or fget(mget(x2,y2), flag) then
   return true
  else
   return false
  end
end
  
  
function metal(obj,flag,new_spr)
  local x1=flr(obj.x/8)  local y1=flr(obj.y/8)
  if matimer < 3 and (fget(mget(x1,y1), flag))then
   mset(x1,y1,new_spr)
   for i=1,#ancoinx do
    if ancoinx[i]==x1 and ancoiny[i]==y1 then
     ancointch[i]=1
    end
   end
   coins+=10
   if combotimer > 0 then
    combotimer+=5
   end
   return true
  end
end
  
function collect_pickup(obj,flag,new_spr)
  local x1=flr(obj.x/8)  local y1=flr(obj.y/8)
  if(fget(mget(x1,y1), flag))then
   mset(x1,y1,new_spr)
   for i=1,#ancoinx do
    if ancoinx[i]==x1 and ancoiny[i]==y1 then
     ancointch[i]=1
    end
   end
   ancoin()
   if heatmeteractive then
    heatmeter+=0.4
   end
   coins+=10
   if combotimer > 0 then
    combotimer+=5
   end
   sfx(32)
   return true
  end
end
function collect_toppin(obj,flag,new_spr)
  local x1=flr(obj.x/8)  local y1=flr(obj.y/8)
  if(fget(mget(x1,y1), flag))then
   mset(x1,y1,new_spr)
   for i=1,#ancoinx do
    if ancoinx[i]==x1 and ancoiny[i]==y1 then
     ancointch[i]=1
    end
   end
   tc+=1
   if combo > 0 then
   
   combotimer=60
   end
   return true
  end
end


-->8
--player
function player_update()
 local acc=player.walk_acc
 local deltatime=time()-lasttime
 player.plytime-=deltatime
  if collide_map(player,"down",1) then
  pepstate =0 
 end
  if collide_map(player,"right",1) then
  pepstate =0 
 end
   if collide_map(player,"up",1) then
  pepstate =0 
 end
   if collide_map(player,"left",1) then
  pepstate =0 
 end
 if collide_map(player,"up",5) then
  tr=true
 end
 if collide_map(player,"down",5) then
  tr=true
 end
 if collide_map(player,"right",5) then
  tr=true
 end
 if collide_map(player,"left",5) then
  tr=true
 end
 if collide_map(player,"left",2) then
  pepstate=1
 end
 if collide_map(player,"left",4) then
  
 end
 if collide_map(player,"right",3) and btnp(⬆️) and tr == true then
  stop()
 end
 --physics--
 player.dy+=gravity
 player.dx*=friction
 
 if btn(❎) and nescon == false then
  acc=player2.acc
  player2.walking =false
 elseif btn(🅾️) and nescon == true then
  acc=player.acc
  player2.walking =false
 elseif not btn(🅾️) then
  player.walking =true
 end
 --controls
 if not player.wall and btn(⬅️) or btn(🅾️) and player.flip == true then
  player.dx-=acc
  player.running=true
  player.flip=true
 end
 if not player.wall and btn(➡️) or btn(🅾️) and player.flip == false then
  player.dx+=acc
  player.running=true
  player.flip=false
 end
 if player.running
  and not btn(⬅️)
  and not btn(➡️)
  and not btn(🅾️)
  and not player.falling
  and not player.jumping or
  btn(⬅️) and btn(➡️) then
   player.running=false
   player.falling=false
   player.jumping=false
   player.slideing=true
  end
 if btn(❎) and
  player.landed==true and nescon == true then
  player.dy-=player.boost+0.5
  player.landed=false
  sfx(28)
 end
 
 if btnp(⬇️) and matimer > 5 and gt>10 and not player.flip then
  player.grab=true
  sfx(0)
 elseif btnp(⬇️) and matimer > 5 and gt>10 and player.flip then
  player.grab=true
  sfx(0)
 end
if btn(⬇️) and matimer < 5 then
 player.rolling=true
 sfx(0)
 else
 player.rolling=false
end
 --check collision up and down
 if player.dy>=0 then
  player.falling=true
  player.landed=false
  player.jumping=false 
  player.wall=false
	 if collide_map(player,"down",6) then
	  player.falling=false 
	  player.landed=true
	  player.dy=0
	  player.wall=false
	  player.y-=((player.y+player.h)+1)%8-1
	 end
	 
 elseif player.dy<0 then
  player.jumping=true
  player.wall=false
  if collide_map(player,"up",0) then
   player.dy=0
   matimer=11
  end
 end

 if matimer > 5 then
   if player.dx<0 then
  if collide_map(player,"left",0) then
    player.dx=0
    matimer=11
    player.wall=false
  end
 elseif player.dx>0 then
  if collide_map(player,"right",0) then
    player.dx=0
    matimer=11
    player.wall=false
  end
 end
 
 else
  if player.dx<0 then
  if collide_map(player,"left",0) then
    player.dy-=player.boost-2.7
    player.dx=0
    player.wall=true
   -- matimer+=2
       if btnp(❎) then
     player.dy-=player.boost-5
     player.landed=false
     sfx(28)
     player.x+=4
     player.flip=false
    end
  end
 elseif player.dx>0 then
  if collide_map(player,"right",0) then
    player.dy-=player.boost-2.7
    player.wall=true
    player.dx=0
    if btnp(❎) then
    player.dy-=player.boost-5

     player.landed=false
     sfx(28)
     player.x -=4
     player.flip=true
    end
    --matimer+=2
  end
  
 end
 end
 --player.wall=false
 --stop slideing
 if player.slideing then
  if abs(player.dx)<.2   
   or player.running then
    player.dx=0
    player.slideing=false
  end
 end
 player.x+=player.dx
 player.y+=player.dy
 callbacktimer-=1
end

function player_animate()
player.boost=3
local acc=player.walk_acc
 if player.colorpal == 0 then
  if player.grab == true then
   player.sp=67
   gt-=1
   
     
  player.landed=false
   if not player.flip then
    player.dx+=acc+0.6 / 2
    player.running=true
    player.flip=false
   else
    player.dx+=acc-0.6 / 2
    player.running=true
    player.flip=true
   end
   if gt < 1 then
    gt=11
    player.grab=false
   end
  elseif player.wall ==true then
           player.sp+=.3
           player.boost=3
        if player.sp>46 or player.sp < 44 then
          player.sp=44
        end
        gravity=0.2
      
  elseif player.jumping and not player.wall then
       player.sp+=0.4
player.boost=3
gravity=0.2
       if matimer > 7 then 
        player.sp=8
        gravity=0.2
       elseif matimer < 7 then
           if player.sp>34 or player.sp < 32 then
          player.sp=32
        end
       end
       gravity=0.2
       player.boost=3
  elseif player.rolling then
        player.sp+=1
                       if player.sp>115 or player.sp < 112 then
          player.sp=112
        end
        player.jumping=false
        player.boost=0
        gravity=0.2
        player.boost=3
  elseif player.falling and not player.wall then
       player.sp+=0.4
player.boost=3
gravity=0.2
player.boost=3
       if matimer > 7 then 
        player.sp=9
       elseif matimer < 7 then
           if player.sp>34 or player.sp < 32 then
          player.sp=32
        end
       end
  elseif player.slideing then
    player.sp=1
    gravity=0.2
    player.boost=3
    player.boost=3
  elseif player.running and btn(🅾️) then
    if time()-player.anim>.1 then
      player.anim=time()
      player.sp+=3
      gravity=0.2
      player.boost=3
      player.boost=3
       if matimer > 7 then 
        if player.sp>8 or player.sp < 5 then
         player.sp=3
        end
       elseif matimer < 7 then
        if player.sp>36 or player.sp < 32 then
          player.sp=32
        end
       end
      end
  elseif player.running and not btn(🅾️) and not btn(⬆️) then
    if time()-player.anim>.1 then
      player.anim=time()
      player.sp+=.9
      player.boost=3
        if player.sp>5 or player.sp < 2 then
          player.sp=3
        end
      player.boost=3
      end
      gravity=0.2
  elseif btn(⬆️) and matimer > 3 then
   tt-=2
   player.boost=0
   gravity=0

   if tt > 0 then
    player.sp+=0.1
    if player.sp < 123 or player.sp > 127 then
     player.sp=123
    end
--   elseif btn(🅾️) then
   else
   
   player.boost=3
       player.acc=0
   player.running=false
   matimer=11
   player.boost=3
   --if not btn(🅾️) then
     player.sp+=.5
     if player.sp < 17 or player.sp > 23 then
		    player.sp=17
		   end
   end
		--elseif btn(⬇️) then
   --player.sp=rnd(0,127)
	 else
	 tt=80
	 gravity=0.2
	  player.sp=1
	  player.boost=3
--		 elseif btn(🅾️) then
--		   player.sp+=0
--     player.sp=rnd(123,127)
--   end
  end
  
 
  end
  
end
  

  
-->8
function starfield()
 for i=1,#starx do
 local scol=7
 if starspd[i]<1 then
  scol=5
 elseif starspd[i]<1.5 then
  scol=6
 end
  rectfill(starx[i]-strszes[i].x,stary[i]+strszes[i].y,starx[i]+strszes[i].x,stary[i]-strszes[i].y,5)
 end
end

function anstrs()
 for i=1,#starx do
  local sx=starx[i]
  sx=sx-(cam_d/(120*starspd[i]))
  sx=sx+starspd[i]
  sx=sx-(cam_d/(120*starspd[i]))
  if sx>1096 then
   sx=sx-1200
  end
   starx[i]=sx
 end
end
function starfielda()
 for i=1,#starx do
 local scol=7
 if starspd[i]<1 then
  scol=5
 elseif starspd[i]<1.5 then
  scol=6
 end
  pset(starx[i],stary[i],scol)
 end
end

function anstrsa()
 for i=1,#stary do
  local sy=stary[i]
   sy=sy+starspd[i]
  if sy>129 then
   sy=sy-129
  end
   stary[i]=sy
 end
end

function anbloc()
 bsp+=.1
 if bsp >56 then
  bsp=52
 end
 for i=1,#anblocx do
  if anblochit[i]==1 then
   spr(83,anblocx[i]*8,anblocy[i]*8)
  else
   spr(bsp,anblocx[i]*8,anblocy[i]*8)
	 end 
 end
end
function ancoin()
 csp+=.1
 if csp >60 then
  csp=57
 end
 for i=1,#ancoinx do
  if ancointch[i]==1 then
   spr(13,ancoinx[i]*8,ancoiny[i]*8)
  else
   spr(csp,ancoinx[i]*8,ancoiny[i]*8)
  end
 end
end

function ang()
 gsp+=.1
 if gsp >31 then
  gsp=29
 end
 
 local col_sprs={36,34,10,75,99,126,127,75,62,125,124,96,97,112,113,108,109,34,36}
 for i=1,#goombas do
  local forward=0
  local fdown=0
  if goombas[i].dir=="right" then
   forward=mget((goombas[i].pixelx+8.1)/8,goombas[i].pixely/8)
   fdown=mget((goombas[i].pixelx+8.1)/8,(goombas[i].pixely+8)/8)
  elseif goombas[i].dir=="left" then
   forward=mget((goombas[i].pixelx-.1)/8,goombas[i].pixely/8)
   fdown=mget((goombas[i].pixelx-.1)/8,(goombas[i].pixely+8)/8)
  end
  
  for j=1,#col_sprs do
   if forward == col_sprs[j] or fdown==26 or fdown==56 or fdown==13 or fdown==0 or fdown==62 or fdown==50 or fdown==108 or fdown==109 then
    if goombas[i].dir=="left" then
     goombas[i].dir="right"
     goombas[i].flp=false
    else
     goombas[i].dir="left"
     goombas[i].flp=true
    end
    break
   end
  end
  
  if goombas[i].dir=="right" then
   goombas[i].pixelx+=.1
  elseif goombas[i].dir=="left" then
   goombas[i].pixelx-=.1
  end
  if goombas[i].stomped==false then
   spr(gsp,goombas[i].pixelx,goombas[i].pixely,1,1,goombas[i].flp)
	 end 
 end
end

function icoin()
 csp+=.1
 if csp >61 then
  csp=57
 end
 for i=1,#ancoinx do
  if ancointch[i]==1 then
   spr(13,ancoinx[i]*8,ancoiny[i]*8)
  else
   spr(csp,ancoinx[i]*8,ancoiny[i]*8)
	 end 
 end
end
-->8
function starfield()
 for i=1,#starx do
 local scol=7
 if starspd[i]<1 then
  scol=5
 elseif starspd[i]<1.5 then
  scol=6
 end
  rectfill(starx[i]-strszes[i].x,stary[i]+strszes[i].y,starx[i]+strszes[i].x,stary[i]-strszes[i].y,5)
 end
end

function anstrs()
 for i=1,#starx do
  local sx=starx[i]
  sx=sx-(cam_d/(120*starspd[i]))
  sx=sx+starspd[i]
  sx=sx-(cam_d/(120*starspd[i]))
  if sx>1096 then
   sx=sx-1200
  end
   starx[i]=sx
 end
end
function starfielda()
 for i=1,#starx do
 local scol=7
 if starspd[i]<1 then
  scol=5
 elseif starspd[i]<1.5 then
  scol=6
 end
  pset(starx[i],stary[i],scol)
 end
end

function anstrsa()
 for i=1,#stary do
  local sy=stary[i]
   sy=sy+starspd[i]
  if sy>129 then
   sy=sy-129
  end
   stary[i]=sy
 end
end

function anbloc()
 bsp+=.1
 if bsp >56 then
  bsp=52
 end
 for i=1,#anblocx do
  if anblochit[i]==1 then
   spr(83,anblocx[i]*8,anblocy[i]*8)
  else
   spr(bsp,anblocx[i]*8,anblocy[i]*8)
	 end 
 end
end
function ancoin()
 csp+=.1
 if csp >60 then
  csp=57
 end
 for i=1,#ancoinx do
  if ancointch[i]==1 then
   spr(13,ancoinx[i]*8,ancoiny[i]*8)
  else
   spr(csp,ancoinx[i]*8,ancoiny[i]*8)
  end
 end
end

function ang()
 gsp+=.1
 if gsp >31 then
  gsp=29
 end
 
 local col_sprs={90,7,36,34,10,75,99,126,127,75,62,125,124,96,97,112,113,108,109,34,36}
 for i=1,#goombas do
  local forward=0
  local fdown=0
  if goombas[i].dir=="right" then
   forward=mget((goombas[i].pixelx+8.1)/8,goombas[i].pixely/8)
   fdown=mget((goombas[i].pixelx+8.1)/8,(goombas[i].pixely+8)/8)
  elseif goombas[i].dir=="left" then
   forward=mget((goombas[i].pixelx-.1)/8,goombas[i].pixely/8)
   fdown=mget((goombas[i].pixelx-.1)/8,(goombas[i].pixely+8)/8)
  end
  
  for j=1,#col_sprs do
   if forward == col_sprs[j] or fdown==26 or fdown==56 or fdown==13 or fdown==0 or fdown==62 or fdown==50 or fdown==108 or fdown==109 then
    if goombas[i].dir=="left" then
     goombas[i].dir="right"
     goombas[i].flp=false
    else
     goombas[i].dir="left"
     goombas[i].flp=true
    end
    break
   end
  end
  
  if goombas[i].dir=="right" then
   goombas[i].pixelx+=.1
  elseif goombas[i].dir=="left" then
   goombas[i].pixelx-=.1
  end
  if goombas[i].stomped==false then
   spr(gsp,goombas[i].pixelx,goombas[i].pixely,1,1,goombas[i].flp)
	 end 
 end
end

function icoin()
 csp+=.1
 if csp >61 then
  csp=57
 end
 for i=1,#ancoinx do
  if ancointch[i]==1 then
   spr(13,ancoinx[i]*8,ancoiny[i]*8)
  else
   spr(csp,ancoinx[i]*8,ancoiny[i]*8)
	 end 
 end
end
-->8
function goobstomp()
 for i=1,#goombas do
	 if player.falling ==false
  and goombas[i].pixelx < player.x+8
  and goombas[i].pixelx + 8 > player.x
  and goombas[i].pixely < player.y+8
  and goombas[i].pixely + 8 >= player.y+8 
  and pepstate == 0
  and goombas[i].stomped==false
  and player.acc<0.3 then
	   player.dy-=0.8
	   coins-=5
	   combotimer-=0.2
	   player.x-=0.1
	 elseif player.falling ==false
  and goombas[i].pixelx < player.x+8
  and goombas[i].pixelx + 8 > player.x
  and goombas[i].pixely < player.y+8
  and goombas[i].pixely + 8 >= player.y+8 
  and goombas[i].stomped==false
  and player.acc>0.3
  and pepstate == 0
  and goombas[i].stomped==false then
   goombas[i].stomped=true
   sfx(52)
   combotimer=40
   combo+=1
   if heatmeteractive then
    heatmeter+=1
   end
   --coins+=10
   	 elseif player.falling ==false
  and goombas[i].pixelx < player.x+8
  and goombas[i].pixelx + 8 > player.x
  and goombas[i].pixely < player.y+8
  and goombas[i].pixely + 8 >= player.y+8 
  and goombas[i].stomped==false
  and pepstate == 1 then
   goombas[i].stomped=true
      combotimer=40
   combo+=1
   break
  end
  
 end
 
end
__gfx__
000000000aaaaaaa000000000aaaaaaa0aaaaaaa0aaaaaaa0aaaaaaa000000000aaaaaaa0aaaaaaa666166660001111186666666000000000000000000000000
0000000011141f100000000011141f1011141f1011141f1011141f100000000011141f1011141f10666166660017777711141f10000000000000000000000000
00000000014ffff000000000014ffff0014ffff0014ffff0014ffff000000000014ffff0014ffff01111111101777777014ffff7000000000000000000000000
0000000011177f700000000011177f7011177f7011177f7f11177f70000000001f177f7f1f177f7f6666661601777777111f7f77000000007770000000000000
0000000001a111a00000000001f111f001a111a0f1a111a001a111a00000000000a111a000a111a0666666160177777744666666000000007777000000000000
0000000001faaaf00000000000aaaaa101faaaf000aaaaa100faaaaf0000000000aaaaa100aaaaa1111111111777777744666604000000007777700000000000
00000000001aaa100000000001aaaaa1001aaa1001aaaaa100aaaaa00000000001aaaaa101aaaaa1666166661777777788666660000000007777700000000000
00000000001101100000000001100000001101100100000000111110000000000110000001100000111111111777777786660666000000007777777700000000
00000000000000000000000000000000000000000000000000000000000000000444444000011111ddddd1dd0000600000000000000000000000000000000000
000000000aa1aaaa0aa1aaaa00000000000000000aa1aaaa0aa1aaaa0aa1aaaa0f1f1ff000177777ddddd1dd0006660000000000000000000000000000000000
0000000011141f1011141f100aa1aaaa0aa1aaaa11141f1011141f1011141f100f1f1ff001777777ddddd1dd0000700000000000000000000000000000000000
00000000014ffff0014ffff011141f1011141f1f014ffff0014ffff0014ffff07888f180017777771111111100007000000000000000aa00000aa00000000000
0000000011177f7011177f70014ffff0014ffff011177f7011177f7011177f700f1111f701777777d1dddddd0000700000000000000a1aa000a1aa0000000000
0000000001a111af01a111a0111aa1a0111aaa1001a111f111a111a011a111a000f88f0017777777d1dddddd000666000000000000aaaa000aaaa00000000000
000000001faaaaa001aaa1a1011111110111111001aaaaa111aaaaa0f1aaaaa0000ff00017777777d1dddddd06666666000000000aaaaaa0aaaaaa0000000000
0000000010aaaa000f1111110f111100f01111000f0000000f0000f00000000f0770077017777777111111116666666600000000aaaaaaaaaaaaaaaa00000000
0aaa1aa000aa1aaa5555555500aa1aaabbbbbbbb777771770000000044444444000000006666666622212222000000000aa1aaaaaaa1aaa07700000770000077
011141f1001141f155555555001141f1bbbbbbbb6666616600000000999999990000000055555555222122220000000011141f1011141f107770007777000777
0014ffff0114ffff555555550114ffffbbbbbbbb66666166000000000008800000000000000000001111111100000000014fffff014fffff0777077777707770
f11177f7f11177f777577577f11177f7bbbbbbbb1111111100000000000880000000000000000000222222120000000011111110111111100077777777777700
001a1110001a111077577577001a1110bbbbbbbb6166666600000000000000000000000000000000222222120000000001aa111001aa11010777777777777770
00aaaaa000aaaaa05555555500aaaaa0bbbbbbbb6166666600000000000000000000000000000000111111110000000000aaaa0100aaaa100000000000000000
0111aa1000aa11a05555555500aa11a0bbbbbbbb6166666600000000000000000000000000000000222122220000000000aaaa1000aaaa010000000000000000
01001110001100005555555500110000bbbbbbbb1111111100000000000000000000000000000000111111110000000000000001000000100000000000000000
00000000444444440000000000000000d0d0d0d022222222d0d0d0d0000000000000000000888800008888000088880000000900000000000000000000000000
000000009999999900000000000000000d0d0d0d222222220d0d0d0d000000000000000002828880028888800288828000009900000000000777777777777770
00044000d0d0d0d00000000000000000d0d0d0d022222222d0d0d0d0000000000000000002888880028282800288888000099900000000000007777777777700
000aa0000d0d0d0d00000000000000000d0d0d0d222222220d0d0d0d0000330000000000028882800288888002828880019dd190000000000077777777777000
000aaa00d0d0d0d00000000000000000d0d0d0d022555525d0d0d0d0000313300000000002888880028888800288888001191190000000000077777777777700
00aaaa000d0d0d0d00000000000000000d0d0d0d256666560d0d0d0d00333300000000000022220000222200002222000999dd90000000000777077777077770
0aa99aa0d0d0d0d00000000067777777d0d0d0d056666666d0d0d0d0033333300000000000000000000000000000000009111190000000007770007777000777
aa0990aa0d0d0d0d00000000666666660d0d0d0d566666660d0d0d0d333333330000000000000000000000000000000009911990000000007700000770000077
7777777711111000011111100aa1aaaa4444444400000000000000000000000000000000000000000000000000000000000010100000000a0000000000777700
77777777777771001414414111141f104444444400000000000000000000000000000000000000000000000000000000000001000000000a0000000007333370
777777777777771014144141014ffff0000000000000000000000000000000000000000000000000000000000ddddddddddddd100000000a0000000073777737
77777777777777101414414111177f7000000000000000000000000000000000000000000000000000000000d4111444444114d10000000a0000000073777777
777777777777771014144141011f11af00000000000000000000000056111111111111114fffffffffffffffd4444144441781d10000000a0000000073777777
77777777777777711414414100aaaaa000000000000000000000000056100000010000014fffffffffffffffd4477814118777d10000000a0000000073777737
77777777777777711414414101aaaaa000000000000000000000000056111111111111114fffffffffffffffd4877774477778d10000000a0000000007333370
7777777777777771011111100100100000000000000000000000000005555555555555550444444444444444d4777174471777d10000000a0000000000777700
00000d100000011d777777777700000770000077000000009999999900000000666166660000000005555150d4777774477778d1066666000666660000777700
0000000ddddd1000111111117770007777000777000000009999999900000000666166660000000055555155df48784444877fd1660006606606066007ccc770
0ddddddddddddd10000000000777077777707770000000009999999900000000111111110000000055555155dffff14ff41fffd1660606606660666077c77c77
d77dd666666886d1000000000077777777777700000000009999999900000000666666160000000011111111dfffff4ff4ffffd1660006606606066077ccc777
d77dd66d66667dd100000000007777777777770000000000999999991111116566666616fffffff455155555dfffff4ff4ffffd1066666000666660077c77c77
d77ddd141d66d1d111111111000777777777700000000000999999990000016511111111fffffff455155555dfffff4ff4ffffd1000000000000000077c77c77
d77dd74f2446ddd177777777077777777777777000000000999999991111116566616666fffffff455155555dfffff4ff4ffffd1000000000000000007ccc770
d776d7ff4ff677d17777777777777777777777770000000099999999555555501111111144444440011111100ddddddddddddd10000000000000000000777700
dd76d67f77f477d1166666667777777777777777fffffff97717777700000d100000011d00000000000010100000000000000000000000000004400000777700
d476d77f7744d7d1166666760777777777777770ffffffff661666660000000ddddd100000000000000001000044440000000000000000000044440007788770
d4d6d6ff4ff467d11666666600077777777777009fffff9f661666660ddddddddddddd100ddddddddddddd100444444000000000000bb0000014440077877877
d2d666fffff4ddd1166666660077777777777000ffffffff11111111d222aa11aaaaaad1daa1aaa1aaaaaad10444444000000000008888000041410077877877
d6d1d6ffff4d6dd1166666660077777777777700fff999ff66666616d2aaaa7711aaaad1d2aa1a17aaa122d10041410000000000088181800044440077888877
d6226d6444466dd1166666660777077777077770ff99ffff66666616d2aaa777744112d1d2277177741112d10044440009aa1a10088888800044440077877877
d44446d6dd666dd1166666667770007777000777f99fffff11111111d22a1777774112d1d2271417771111d1001441000aa9aaa0008888000044440007877870
0ddddddddddddd101111111177000007700000779ffffff955555555d2217771774411d1d2271417774411d1011001100aaaaaa00bb00bb00440044000777700
00000000000000000000000000000000004444000000000000000000d2271771774114d1d2277f77774411d10aaaa1aa0aaaaaaa0aa1aaaa0000000000777700
0aaaaaaa0a0000111111110000010100000440000000000000033000d2271771774114d1d2274f417f1111d111114f1011141f1011141f10aaaaaaa007aaaa70
11141f100a1f71a11aaaaa00001111a000044000000000000009a000d2277777774144d1d2274ff477f111d10114fff00f4ffff0014ffff001f141117a7777a7
014ffff00afff1a10111af101af141a00009900000000000009a9a00d2271777774444d1d22774ff477f11d111a11a111f177f7011177f700ffff4107aaaaa77
111f7f700a1f71a107f7f1111aaff4a0000990000000000000a1a100d2214f77744444d1d227774f477f11d111aaaa1101111110f1a11a11222a7111777777a7
01fa11100a4ffaa10ffff4101a17f1a00004400000000000009a9a00d2224ff14444ffd1d2211114111f11d1f0aaaa0ff0aaaaa000aaaaf1222a11107a7777a7
00aaaaa10a141fa101f141111a1fffa000044000000000000019a100d2224ff711ffffd1d2277777777fddd100aaaa0000aaaaa0011aaa001f1faa0007aaaa70
001111110a111100aaaaaaa01a17f1a00044440000000000011001100ddddddddddddd100ddddddddddddd100110011001100011010001101a1aaa0000777700
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a1a2a2a2a100000000000000a1a2a2a2a100000000000000a1a2a2a2a10000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a1a2a2a2a100000000000000a1a2a2a2a100000000000000a1a2a2a2a10000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a1a2a2a2a100000000000000a1a2a2a2a100000000000000a1a2a2a2a10000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a1a2a2a2a100000000000000a1a2a2a2a100000000000000a1a2a2a2a10000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a1a2a2a2a100000000000000a1a2a2a2a100000000000000a1a2a2a2a10000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a1a2a2a2a100000000000000a1a2a2a2a100000000000000a1a2a2a2a10000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a1a2a2a2a100000000000000a1a2a2a2a100000000000000a1a2a2a2a10000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a1a2a2a2a100000000000000a1a2a2a2a100000000000000a1a2a2a2a10000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a1a2a2a2a100000000000000a1a2a2a2a100000000000000a1a2a2a2a10000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a1a2a2a2a100000000000000a1a2a2a2a100000000000000a1a2a2a2a10000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a1a2a2a2a100000000000000a1a2a2a2a100000000000000a1a2a2a2a10000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a1a2a2a2a100000000000000a1a2a2a2a100000000000000a1a2a2a2a10000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a1a2a2a2a100000000000000a1a2a2a2a100000000000000a1a2a2a2a10000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a1a2a2a2a100000000000000a1a2a2a2a100000000000000a1a2a2a2a10000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a1a2a2a2a100000000000000a1a2a2a2a100000000000000a1a2a2a2a10000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a1a2a2a2a100000000000000a1a2a2a2a100000000000000a1a2a2a2a10000000000000000000000000000000000000000000000000000000000000000000000
__label__
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
333333333333333333333555666666666655533333333d5553333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333166dddffffffffffffd63333331dd555d533333333333333333333333333333333333333333333333333333333333333333333333333333
333333333333335dd6dffffffffffffffffffd13335d28888853333333333333333333333333333333333333333333333333333d555d53333333333333333333
33333333333333ddfffffffffffffff8888ff653335888888d533333333333333333311113333333333333335111111333333565dffddd513333333333333333
33333333333333dffffffff838ffffe88888ffd333552222dd33333333333333333dd5dfd53335d555555555666666d333335628fffffffdd333333333333333
33333333333333dff99afff138ffff888888ff633311dddd13333333333333156652289ff5333dff8888888fffffff6333356888fffffff88d33333333333333
33333333333336dfffffffdddffff8888888ffd3333333333333333333333ddd8288888ff533ddff8888888fffffff63333d8888ffaaaff88853333333333333
33333333333336fffffffffffffff8888888f65333355555115333331556d8888888888fd1335fffa888888fffffff6333d8888ffffffff8888d533333333333
3333333333333dff8888fffffffff8888888fd135d5dd6f8288d3555ddfff988888888ffd535dfffffa88affffffff633369aff8558ffff88888d53333333333
3333333333335df88888ffffffafff88888f8d336fffffff882d56fffaffffa888888ff8d3356fffffffffffffee85d33ddfff811118fff88888853333333333
3333333333335f8888888ffaa99afff889f5d336dfffffffff8d1df9affffffffffffff5533dffffffffffff8882355335ffff15d515fff888888d3333333333
333333333333df8888888ffffffffffff853d33ddff888fffffddffff85111ffffffff5d33d5dffffffffff888835d3356fffdd7776dfffa88888d3333333333
333333333333df8888888ffffffffffd511d5315f88888fffffd6d51111115fffffff85d33151158dffffff8882153331dffffdddddfffffa88afd6333333333
333333333336df888888fffffffff81111dd3356888888ffafd3551111155ff99aff5553333dd11111158ff88836333366ffffffffffffffffffffd333333333
33333333333dfff8888afffffd5111111dd3335d888888ffafd33515dd676ffffff5553555331d6dd5118ff883d533336fff88fffaaaafffffffffd333333333
33333333335dffffffffff111111111d5533336f888888ffff633565d35dffffff5d6ddddd333333dd6dfffa25133333d888888fffffffffffffffd333333333
33333333335d8fffffffff11111555d3333335df98888fffff633333356ffffff8288ffffd633333dd6ffffd5666653dd8888888ffffffffffffffd333333333
1113333333628fffaaffff55ddd5513333333d8fffffffff8863333356ffa99ff88888fffdd333356fffffffffffd63d88888888f55ffff99affffd333333333
1133333335588ffffffffe8d3333333333333699affffff8881333356fffffff888888fffdd3335d8fffffffffffd33d888888881115fffffaafffd333333331
333333333d289fffffff888513333333333368999999999888533356ffffffff8888888ffdd355888ffffaaafff51335888888851111ffffffffffd333333311
333333331d8afffffff8888d5333333333336888888888222213336f888fffff8888888ff8d1d8888ffffffffff55335fa8228a51511dffffffff8d333333313
33333333189ffffffff88888533333333333d51111111111115333688888ffff8888888fa8d628888fffffffff555316fffaaff865d58fa9999982d333333333
33333333d899aaaaa99888886333333333331d11111155555d53336288888fff888888fa98dd2888affffffa981133169afffffd633d8999999882d333333333
33333333d9999999999888825333333333333d66666633333333336888888aaaa888899998dd1118899a9999911d33169999affd63355158888222d333333333
3333333d5998888555511111d333333333333333333333333333336888888999998888553d315111118899995116331699999985633551111111155333333333
11333333d1111111111111116333333333333333333333333333336222111511111111111d335d51111115881153333d88551111d335d11111115d3333333331
1113333351111111111115565333333551115333333333333333335d111111111111111153333516511111111d1333351111111513335d65556d513333333333
333333331d1115ddd55ddd3333dddddddddd6333333333333333333d5dddddddddddd15d33333333d55d1111d1333335ddddd15d333333333333333333333333
333333333dddd55555555d66ddddddd5ddddd633333335555333333556611111111113333333333333313dd51333333311111335555533333333333333333333
3333333333335dddddddddd5dddddddddddd5d33336ddddddd6335dddd563333333dddd333333333333333333333333333335dddddddd3333333333333333333
3333333333331d555dddddd5dddddd55555dd533ddd5ddddd55d5dd5555635dd531ddd55ddd3333333d5115d6d3333333d56d55ddddd56d33333333333333333
3333333333331ddddddd5ddddddd5dddddddd65dddd5ddddd5ddd5ddddd636dd531dddddddd6313666dd5dddd633313ddddd555dd555dd633333333333333333
3333333333331ddddddddddddddd5dddddd5dd5dddddd55d5dddd55dddd615ddd365dddddd5d56555ddd5dddd633dddddddd5ddddd5dddd33333333333333333
3333333333331ddddddd5ddddddd5ddddd51155dddddd5ddd55dd51dddd6d5dddd55ddd555556d5ddddd5ddddd3365dddddd115ddd55d5d33333333333333333
33333333333315ddddd55dd55ddddd5111111dddddddddddddd5dd1d5dd5d5ddddddd5ddd3d5dddddddd55555d3365dd55d533315dddddd33333333333333333
3333333333331dddd5ddddddddddddd11111dd55555d5dddddd5dd1ddd55ddd51ddddddd51d5555dd51155513d336dddddd551355ddddd533333333333333333
33333333333355555511115dddddddd1115dd5ddd5ddd55dddd5dd1ddddddddd55ddd5d53d36ddddd5ddddd5dd336ddddddd65555ddddd333333333333333333
3333333333335d111111115d5ddddd5dd63316ddd5dd11dd5ddd551ddddddddd5dddd551553dddddd5ddddd5333365dd55d555ddddd5d6333333333333333333
33333333333335511111111dddd5ddd633331dddd5d511ddddddd5155555555dddd5dd11d53d5dddddddddd5311365ddddddddddddddd3333333333333333333
3333333333333351111156dddddddddd333365ddd5dd6dddddddd511ddd515ddddddd511533dd55553111135d6d565dddddddddddddd33333333333333333333
333333333333333333333dddddd5ddd5133365d5555dddd5dddd5111ddd515ddddddd115135dddddd3333115ddd565ddddddd55d56d333333333333333333333
333333333333333333333ddd5d55ddd5d3336dddddddd555ddd5dd11ddd115ddddd5111d33ddd5ddd55d5dddddd565ddd55dddddd55333333333333333333333
3333333333333333333335dd5ddddd55d3336dddddddd5ddddd5dd535d51115d5dd51153335dd5dddddd5dddd55d5ddddd5dddddd5d533333333333333333333
3333333333333333333336dd5dddddddd1336d5dddddd5ddddd55dd3dd51115d5dd115333355555555ddddd5dddd5dddd51dddddd5dd53333333333333333333
3333333333333333333336dd5dddddddd1331dd55555555dddd15d635d11111d5d111d13316ddddddddddddddddd5dddd5355555dd55d5333333333333333333
333333333333333333333d5dddd5ddddd1331dddddddddddd55363155535d11155115533316dddddddddddd555111555dd1dd5ddddd5dd533333333333333333
333333333333333333333dddddd5ddddd6331dddd5ddddddd515535d1136511111156333316dddddd5d5511111111ddddd1dd5ddddd5ddd53333333333333333
333333333333333333333dddddd5dddddd331d5555dddddd511513151115551111153333335155111111111111111dd5dd55d5ddddd5dddd5333333333333333
33333333333333333333355555dddddd5d333d1ddddd5511111d333d11d53d511155333333d5111111111115ddd5555155111155555155553333333333333333
333333333333333333333ddd55555515563333515ddd511111d13331d1d133d515533333333d1155555556615513511111111111111111116333333333333333
333333333333333333333d1111111111153333dd111111111d533333ddd3333d5d533333333d15ddd33333333333d111111d5111111111153333333333333333
33333333333333333333355111111111d13333355111111551333333313333333333333333331333333333333333355115d5dd511111115d5333333333333333
33333333333333333333336111111115d33333335165156533333333333333333333333333333333333333333333355555d33dd5555555d53333333333333333
333333333333333333333316666666d3333333333333653333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333133333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333331113333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333113333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333313333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333331133333333333333333333333313333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333311113333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333111111333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333311111333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333311113333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333331333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333133333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333133333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333331333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333763333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333d63773333333333333333333333333333333333333333333333333333333333333
333333333333333333333333333333333333333d7d33333333333333333333771d73333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333377763333333333333333333d77375333333333333333333333333333333333333333333333333333333333333
333333333333333333333333333333333333333777733355333333333333333dd777333333333333333333333333333333333333333333333333333333333333
3333333333333333333333333333333333333337777335773333333333333333d677d33333333333333333333333333333333333333333333333333333333333
3333333333333333333333333333333333333336776d6777333333333333333335776333333333333333333355aaaaa333333333333333333333333333333333
33333333333333333333333333333333333333357776777533333333333333333d757333333335aaaaaaa555aaaaaaa333333333333333333333333333333333
33333333333333333111111567333333333333577777777333333333333333333d756a3333335aaaaaaaaaaaaa55553333333333333333333333333333333333
33333333333311111111115777775533333311d777776133333333333333333335733a433333344aaaaa44aaaa44533333333333333333333333333333333333
3333333331111111111115777777776133111115157713333333333333333333333334a4333333335444aaa4a676677676333333333333333333333333333333
33333333311111111111167777777777761111157161775333333333333333333333334a4335ffff44fddd776dd6ddddd7333333333333333333333333333333
333333333111111111115777766667777752111466177775333333333333333333333335a44f5555ffd77777777777777d333333333333333333333333333333
3333333311111114451157644ff41116775441257776777533333333333333333333333334477757717777533d7ddd5333333333333333333333333333333333
3333333311111144ff5114fffff4111117724147777677753333333333333333333333333447757776666666664f5444f5333333333333333333333333333333
333333331111115555f54ffffff41111555144477776777d33333333333333333333333334477777d7d44444fff444331f333333333333333333333333333333
3333333311111fffffff444555411114ffff44d77776771d33333333333333555555559994a457776d4ff7ffff4f533333433333333333333333333333333333
3333333311115544f44ff5777775114f455444d77d17771d333333333333334999999999994a4556777d55555445565d77533333333333333333333333333333
33333333111115ff4444f577777761f456764fd77617777533333333333333349999999999444440544433444533d77776733333333333333333333333333333
3333333111111f451114f57777777df1675764d777477713333333333333333349999999994a954aa00433113333337777d33333333333333333333333333333
33333331111111111115f67776777df576777dd76d416333333333333333333333449999994a44aaa494d1111333377777533333333333333333333333333333
33333331111111111111177777d776f47d77677d14f13333333333333333333333333333333a5aaaaa4ad111133d775777633333333333333333333333333333
333333311111131111111577777d776fd777677774f43333333333333333333333333333333aaaaaaaaaa0113335557757633333333333333333333333333333
33333331111113111111137777777dd1fd7d777d7dff33333333333333333333333333333335aaaaaaaaad333333357d57333333333333113333333333333333
3333333111113311111133376dd133324f4dd7777dff33333333333333333333333333333344aaaaaaaa5ad53333333333333333333311113333333333333333
33333333111133311111133333333333424ff444444f33333333333333333333333333334aaa5aaaaaa333aaa533333333333333333111113333333333333333
3333333333133331111111333333333334ffff4144335433333333333333333333333335aa43331111333331aa53333333333133333111113333333333333333
33333333333333311111111333333333334fffff4534fff1333333333333333333331131aaa133333333333334a5333111133113333311113333333333333333
33333333333333333111111133333333333111111333ffff13333333333333333331aa4000aa133333333333335adaaaaa533344333331113333333333333333
333333333333333331111111133333333333333333331fff411333333333333333334aaaaaaa13333333333333aaaaa444444994333333133333333333333333
3333333333333333331111111333333333333333333331ffff4443333333333333344444444444dddddddddd5544444999999453333333333333333333333333
33333333333333333333111113333333333333333334ff4f4ff4ff3333333333333449999999957777777777d444444444445553333333333333333333333333
333333333333333333333333333333333333333333344433f44f4443333333333333655555555355555333333333333333365663333333333333333333333333
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
77775111111115777777777761111111116777777777711111111157777777777611111111167777777777111111111d7777777777d111111111677777777771
7777511111111d7777777777611111111177777777777111111111d777777777761111111117777777777711111111167777777777d111111111777777777771
7777511111111d7777777777611111111177777777777111111111d777777777761111111117777777777711111111167777777777d111111111777777777771
777711111111157777777777611111111167777777777111111111d7777777777611111111177777777777111111111d7777777777d111111111777777777771
777761111111116777777777751111111157777777777611111111177777777777111111111d7777777777611111111177777777777111111111d7777777777d
777771111111116777777777751111111157777777777711111111177777777777111111111d7777777777611111111177777777777111111111d77777777776
777771111111116777777777751111111157777777777711111111177777777777111111111d7777777777611111111177777777777111111111d77777777776
777761111111116777777777751111111157777777777611111111177777777777111111111d7777777777d11111111177777777776111111111d7777777777d
77775555555567d7777777776555555557767777777775555555577d77777777765555555d7767777777775555555577d77777777765555555d7677777777775
11167777777777d1111111117777777777711111111167777777777d111111111777777777771111111117777777777751111111157777777777611111111177
111ccccccccccc3111111111ccccccccccc111111111ccccccccccc1111111111ccccccccccc111111111ccccccccccc1111111111ccccccccccc111111111cc
111ccccccccccc3111111111ccccccccccc111111111ccccccccccc1111111111ccccccccccc111111111ccccccccccc1111111111ccccccccccc111111111cc
111cccccccccccc111111111ccccccccccc111111111ccccccccccc3111111111ccccccccccc111111111ccccccccccc3111111111ccccccccccc111111111cc

__gff__
0000000000000000000041080010000000000000000000001008410400000000000041000000004000454100000000000440008002000000210000000000000008084100000000000000000000000000000000000000000010001000000000000200100000414100000000000000000000000000100000020000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
000000000000000000000000000a0a0a0a0a0a0a0a0a0a0a0a00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0a0a0a0a0a0a0a0a0a0a0a0a0a0a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0a0000000000000000000000000a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0a0000000000000000000000000a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0a0000000000000000000000000a27272727270a0a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0a00000b4040410000000000000000000000000a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0a0000404040400000000000000000000000000a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0a0000404040400000000000000000000000000a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0a0000404040400000000000000000000000000a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0a0000404040400000000000000000000000000a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0a0a0a0a0a0a0a0a0a0a0a0a0a0a27272727270a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
0001000015650156501565015650146501665014650136501365012650106500f6500f6500f6500f6500f6500f6500f6500f6500f6500f6500000000000000000000000000000000000000000000000000000000
000f00001a2051a205262000020021200002000020020200002001f200002001d2000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4d0f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4d0f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
150f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
840f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
140f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
150f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
150f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4d0f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
350c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5d0c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
350c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5d0c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010e00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010e00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010c001000c0000c0000c0000c0000c0000c0000c0000c0000c0000c0000c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010c00100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00010000256502d650000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
d40c10001c37512355133551b3751e0051d0051c0051b0001a005000001a0001a0001b0001b0001c0001d0001f000210002200022000000000000000000000000000000000000000000000000000000000000000
000600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0001000027650276502765027650276500f6502765027650001000d650286500d6500d6502b6500d6500e6502f6500f6501065032650001003565000100001000010000100001000000000000000000000000000
c50c00000010200102001020010200102001020010200102001020010200102001020010200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
910c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
d50c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
910c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
9001000024650276502c6503365038650396503b6503e6503f6503f6503d6503b6503865010650006502465021650000000000000000000000000000000000000000000000000000000000000000000000000000
010c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
910c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000100001f1002a10028100281003a100261502a1502c1502d1502f150321503315035150351003510033100301002c100271002e1002a100211001b1003f100376003d1003c1003810035100311001f6002d100
011000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
910c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
d4010000166551665016650166501565013650126501265012650286002d60032600316002f6002960024600246001060025600286001a6002b6000d6002e60030600336002e6002960025600266002a6002b600
c50c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
910c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000501100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00010000313502c35029340233401e34018330133300e3300a3300833005330043300233000330003300000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__music__
01 01414344
00 02414344
00 01034344
00 02044344
00 05030607
00 08040609
00 05030607
00 08040609
00 0a070344
00 0a070344
00 02090b0c
02 0d034344
00 00004000
00 00004000
00 00000000
00 00400040
00 00400040
00 00400040
00 00400000
03 54151444
01 26422829
02 2a42282b
00 40004040
00 40404040
00 40404040
00 40404040
04 40400040
00 00404040
00 00404040
00 00404040
00 00404040
00 00404040
00 00404040
00 00404040
00 00404040
00 00404040
00 00404040
00 00404040
00 00404040
00 00404040
04 00404040
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 00000040
00 00000040
00 00000040
00 00000040
00 00000040
00 00000040
00 00000040
00 00000040
00 00000040
00 00000040
00 00000040
00 00000040
00 00000040
00 00000040
00 00000040
00 00000040
00 00004040

