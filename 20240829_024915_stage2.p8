pico-8 cartridge // http://www.pico-8.com
version 42
__lua__

function l()
 load("stagehub")
end

function sch()
 if player.colorpal == 0 then
  player.colorpal=1
  sc=10
  ninec=9
 else
  player.colorpal=0
  cloth=7
 end
end

menuitem(2,"exit level",l)

function _init()
  nun=false
  hs=103
  pox=230
  poy=184
  ry=0
  rx=0
  title=100
 -- poke(0x5f30,1)
  mt=false
  ct=false
  --callbacktimer=2
  tot=false
  st=false
  pt=true
  tc=0
  displaytext=0
  dt=0
  heatmeteractive=false
  music(11)
  lbu=false
  lmt=0
  heatmeter=0
  oldhud=false
  ohs=55
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
  state="game"
  
  chstate("start")
  circitirs=0
  mach=1
  mtimer=11
  lbd=false
  player={
    dive=true,
    sp=96,
    x=55,
    x2=316,
    y=316,
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
  pogo=false
  ninec=6
  room=0
  roomenter=false
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
   gravity=0.1
   
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
  ttimer=52
  pf={}
  pf.x=0
  pf.y=0
  cam_stop=cam_x
  nohud=false
  debug=false
  gs=5
  c=9
      circtest=1000
   -- player.sp=1
    player.x=146
    player.y=226
    player.w=8
    player.h=8
    player.dx=0
    player.dy=0
    player.max_dx=4
    player.max_dy=3
    player.acc=0.3
    player.walk_acc=0.1
    --player.boost=3
    player.anim=0
    player.running=false
    player.jumping=false
    player.slideing=false
    player.landed=false
end




function chstate(new_state)
 state=new_state
end

-->8

-- update and draw --

function _update60()
heatmeter-=0.1 / 30
 if combotimer < 1 and combo > 0 then
  coins+=combo+9
 end
 tt=80

 local acc=player.walk_acc
 	if matimer > 9 and not lbu then
	  player.acc=0.0
	 elseif matimer > 7 and not lbu then
	  player.acc=0.1 / 2
	 elseif matimer > 5 and not lbu then
	  player.acc=0.2 / 2
	 elseif matimer > 3 and not lbu then
	  player.acc=0.3 / 2
	  sfx(47)
	 elseif matimer > -10 and not lbu then
	  player.acc=0.4 / 2
	  sfx(47)
	 elseif matimer < -10 and not lbu then
	  player.acc=0.5 / 2
	  sfx(47)
	 else
	  sfx(47)
	  --player.acc+=0.1 / 10
	 end
	 if player.rolling then
	 
	 -- if player.rolling then
  player.acc-=0.2 / 10
  if player.acc < 0.1 then
  player.sp=117
  end
  if player.acc < 0 then
   player.rolling = false
   player.acc=0
   player.running=false
  end 
 
	 end
 if player.y <64 then
  mahuy=0
 elseif player.y >266 then
  mahuy=200
 else
  mahuy=player.y-64
 end
 if state == "game" then
    if btn(🅾️) and matimer > 0 and not player.grab then
  matimer-=0.2 / 2
 elseif btn(🅾️) and matimer < 0 and not player.grab then
  matimer-=0.1 / 2
 elseif not btn(🅾️) then
  matimer=11
 end
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
 	 if btn(⬆️) and matimer<-10 then
	  lbu=true
	  if player.colorpal == 0 then
	   player.sp=2
	  elseif player.colorpal == 1 then
	   player.sp=216
	  end
	  player.acc=0.0
	  matimer=-10
	  matimer-=0.2
	  --player.boost=0
	 end
 if player.landed and not btn(⬆️) and lbu then
       player.dy-=player.boost+6
  --player.sp=2
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
 --menuitem(1,"heat meter: ",anstrs)
--menuitem(2,"no hud(only m/l)",aaaaa)

function _draw()
  --cls()

 -- pal(11,15+128,1)
  if state == "levelsct" then
   level_select()
  end
  if multiplayer==true then
   player2_update()
   player2_animate()
  end

  blink+=.5
  if blink>47 or blink < 46 then
  blink=46
  end
  introcam+=5
  if introcam > 92 then
   introcam=0
  end
  if state=="start" then
   poke(0x5f2c,4)
   camera(0,0)
   cls()
   if player.colorpal == 0 then
	  for i=10,29 do
	   line(60+i/10,0,i,111,9)
	  end
	 elseif player.colorpal == 1 then
	  for i=99,125 do
	   line(60+i/60,0,i,111,9)
	  end
	  end
   line(0,112,128,112,2)
   --map()
   matimer=11
   
   print("\n        select a pizza guy",7)
   if player.colorpal == 0 then
    pal(10,sc)
    spr(1,18,104)
    pal(10,10)
    print("peppino",45,120,7)
   else
    pal(10,sc)
    pal(9,ninec)
    spr(215,104,104,1,1,1)
    pal(10,10)
    pal(9,9)
    print("the noise (experimental)",15,120,7)
   end
   if btnp(⬅️) then
    player.colorpal-=1
   elseif btnp(➡️) then
    player.colorpal+=1
   end

   if player.colorpal > 1 then
    player.colorpal=0
   elseif player.colorpal < 0 then
    player.colorpal=1
   end
   if cloth < 0 then
    cloth = 15
   elseif cloth > 15 then
    cloth = 0
   end
   print("   press ❎ to start\n\n    ⬆️/⬇️ to select\n       a colour\n\n      press ⬅️/➡️\n      to select a\n       character",576,396,7)
   if btnp(❎) then
    chstate("game")
   end
 if cloth == 0 then
  sc=0
  ninec=0
 elseif cloth == 1 then
  sc=1
  ninec=0
 elseif cloth == 2 then
  sc=2
  ninec=5
 elseif cloth == 3 then
  sc=3
  ninec=5
 elseif cloth == 4 then
  sc=4
  ninec=2
 elseif cloth == 5 then
  sc=5
  ninec=1
 elseif cloth == 6 then
  sc=6
  ninec=5
 elseif cloth == 7 and player.colorpal == 0 then
  sc=7
  ninec=6
 elseif cloth == 7 and player.colorpal == 1 then
  sc=10
  ninec=9
  --print("          classic cook",0,65,7)
 elseif cloth == 8 then
  sc=8
  ninec=2
  --print("           blood red",0,65,7) 32////32332/332/332/332/33/
 elseif cloth == 9 then
  sc=9
  ninec=5
 elseif cloth == 10 and player.colorpal == 0 then
  sc=10
  ninec=9
 elseif cloth == 10 and player.colorpal == 1 then
  sc=7
  ninec=6
 elseif cloth == 11 then
  sc=11
  ninec=3
 elseif cloth == 12 then
  sc=12
  ninec=1
 elseif cloth == 13 then
  sc=13
  ninec=5
 elseif cloth == 14 then
  sc=14
  ninec=2
 elseif cloth == 15 then
  sc=15
  ninec=9
 else
  cloth=0
 end
  end
 
  if state=="game over" then
   load("stagehub")
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
  jp(player,5,0)
  -- stop at end or start --
  if stop_cam<1 and cam_x > 64-128 then
   cam_x=0
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
  if player.x < 64 then
   cam_x=0
  elseif player.x > 960 then
   cam_x=896
  else
   cam_x=player.x-63
  end
camera(cam_x+rx,mahuy+ry)
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
 
 cls(2)
 
-- starfield()
-- anstrs()
-- 
 map(0,48,cam_x-(cam_x/2)%96,mahuy,128,16)
 
 map()
 
 ancoin()
 if player.x == monx then
  coins-=1
 end
  if not lbu and not player.wall and not player.rolling and blink2 == 0 and matimer<5 then
   pal(7,7)
   spr(77,player.x,player.y,1,1,player.flip)
   pal(7,7)

  end
  --pal(15,15+128,1)
  
 	if not lbu and not btn(⬆️) and not player.flip and blink2==1 or not player.wall and blink2==1 and player.flip == false then
   	pal(15,2)
	   pal(4,5)
	   pal(6,5)
	   pal(10,2)
	   pal(7,2)
	   pal(9,2)
	   pal(8,2)
	   pal(14,2)
	  -- pal(1,5)
	   spr(player.sp,player.x2-7,player.y,1,1,player.flip)
	   pal(15,15)
	   pal(10,10)
	   	   pal(9,9)
	   pal(8,8)
	   pal(14,14)
	   pal(7,7)
	   pal(6,6)
	   pal(4,4)
	   spr(14,player.x2-4,player.y,1,1,player.flip)
	  	  	pal(15,3)
	   pal(4,5)
	   pal(10,3)
	   pal(6,5)
	   	   pal(9,3)
	   pal(8,3)
	   pal(14,3)
	   pal(7,3)
	   spr(player.sp,player.x2-20,player.y,1,1,player.flip)
	   pal(15,15)
	   pal(10,10)
	   pal(7,7)
	   pal(6,6)
	   pal(4,4)
	   	   pal(9,9)
	   pal(8,8)
	   pal(14,14)
	   pal(1,1)
	  elseif not lbu and not btn(⬆️) and blink2==1 and player.flip or not player.wall and blink2==1 and player.flip then
   	pal(15,2)
	   pal(4,5)
	   pal(6,5)
	   pal(10,2)
	   	   pal(9,2)
	   pal(8,2)
	   pal(14,2)
	   pal(7,2)
	  -- pal(1,5)
	   spr(player.sp,player.x2+7,player.y,1,1,player.flip)
	   pal(15,15)
	   pal(10,10)
	   
	   pal(7,7)
	   pal(6,6)
	   	   pal(9,9)
	   pal(8,8)
	   pal(14,14)
	   pal(4,4)
	   spr(14,player.x2+4,player.y,1,1,player.flip)
	  	  	pal(15,3)
	   pal(4,5)
	   pal(10,3)
	   	   pal(9,3)
	   pal(8,3)
	   pal(14,3)
	   pal(6,5)
	   pal(7,3)
	   spr(player.sp,player.x2+20,player.y,1,1,player.flip)
	   pal(15,15)
	   pal(10,10)
	   	   pal(9,9)
	   pal(8,8)
	   pal(14,14)
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
 
   

if not oldhud then
   --print(heat,cam_x+55,mahuy+55)
      if heatmeter > 0 then
   line(cam_x+8+heatmeter,mahuy+14,cam_x+4,mahuy+14,8)
end
   --spr(82,cam_x+105,mahuy+1,2,2)
   --print(" " .. flr(coins),cam_x+103,mahuy+6,1,0,0)

  if player.colorpal == 1 then
	  if btn(🅾️) and pepstate == 0 and matimer < 7 and matimer > -10 and heatmeter < 8 and player.running then
	   hs=105
	  elseif btn(🅾️) and pepstate == 0 and matimer < -10 and heatmeter < 8 and player.running then
	   hs=80
	  elseif heatmeter > 8 and pepstate == 0 then
	   hs=75
	  elseif pepstate == 1 then
	   hs=68
	  else
	   hs=46
	  end
  else
	  if btn(🅾️) and pepstate == 0 and matimer < 7 and matimer > -10 and heatmeter < 8 and player.running then
	   hs=105
	  elseif btn(🅾️) and pepstate == 0 and matimer < -10 and heatmeter < 8 and player.running then
	   hs=80
	  elseif heatmeter > 8 and pepstate == 0 then
	   hs=75
	  elseif pepstate == 1 then
	   hs=68
	  else
	   hs=103
	  end
  end
  --print(heatmeteractive)
  if heatmeter > 24 then
   heatmeter = 24
  end
  spr(93,cam_x+36,mahuy+1)

  if not lbu and not player.running and btn(⬆️) and tt > 0 and player.landed and not btn(⬅️) and not btn(➡️) then
  ---sfx(44)
  spr(83,player.x+4,player.y-4,1,1,0)
  spr(83,player.x-4,player.y-4)
  spr(83,player.x+4,player.y+4,1,1,1,1)
  spr(83,player.x-4,player.y+4,1,1,false,1)
  end
   spr(71,cam_x+1,mahuy+9,2,1)
  spr(72,cam_x+17,mahuy+9,1,1)
  spr(87,cam_x+25,mahuy+9)

  sspr((hs % 16) * 8,flr(hs / 16) * 8,16,16, cam_x+96,mahuy-4,26,26,player.filp)

   spr(221,cam_x+15,mahuy+13)
spr(222,cam_x+1,mahuy+17)
  spr(73,cam_x+9,mahuy+5,2,1)
     spr(73,cam_x+1,mahuy+5,2,1)
     
   spr(89,cam_x+25,mahuy+5,1,1)
   
    if combotimer > 0 then
  --sspr((46 % 16) * 8,flr(46 / 16) * 8,16,16, cam_x+90,mahuy+20,40,16,player.filp)
 
     spr(82,cam_x+94,mahuy+24)
  spr(82,cam_x+102,mahuy+24)
  
  spr(82,cam_x+110,mahuy+24)
  spr(82,cam_x+118,mahuy+24)  spr(64,cam_x+94,mahuy+32)
  
  spr(64,cam_x+102,mahuy+32)
  spr(64,cam_x+110,mahuy+32)
  spr(64,cam_x+118,mahuy+32)
  
  print("  com-bo",cam_x+96,mahuy+34,1)
  print(combo,cam_x+95,mahuy+34,1)
  
   spr(60,cam_x+120-combotimer,mahuy+21)
  spr(55,cam_x+118,mahuy+21)
  
  end
  
    score=tostring(flr(coins))
    digit_color={8,11,14,7,8,2,9}
    digit_v_offset={0,0,0,0,0,0,0}
    char2={2,3,2,6,2,2,5}
    if heatmeter < 10 then
    for c=1, #score do
      local char = sub(score,c,c)
      print(char,cam_x+6+c*4,mahuy+5,5)
      print(char,cam_x+5+c*4,mahuy+5,1)
    end 
    else
        for c=1, #score do
      local char = sub(score,c,c)
      print(char,cam_x+6+c*4,flr(mahuy+4+digit_v_offset[c]+flr(sin(c*0.4+time())*2)),char2[c])
      print(char,cam_x+5+c*4,flr(mahuy+4+digit_v_offset[c]+flr(sin(c*0.4+time())*2)),digit_color[c])
    end 
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
end
   if pepstate == 0 then
    pal(10,sc)
    pal(9,ninec)
    spr(player.sp,player.x,player.y,1,1,player.flip)
    pal(9,9)
    pal(10,10)
   elseif pepstate == 1 then
    if player.colorpal == 0 then
     hs=80
    else
     hs=164
    end
    matimer=10
    player.boost=2
    if player.colorpal == 0 then
     spr(12,player.x,player.y,1,1,player.flip)
    else
    pal(9,ninec)
 spr(235,player.x,player.y,1,1,player.flip)
  pal(9,9)
  end
   end
  waittime=-2
  combotimer-=0.1 / 2
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

--  if 
    --print(heatmeter,cam_x+55,mahuy+55,7)

  --print(combotimer,cam_x+55,mahuy+55)
  --print(player.y,cam_x+30,mahuy+55)
   if coins < 1000 then
   rank=78
  elseif coins < 1500 then
   rank=79
  elseif coins < 4000 then
   rank=95
     elseif coins < 6000 then
   rank=111
  elseif coins < 7600 then
   rank=127
  else
   rank=70
  end
  pal(10,sc)
   -- sspr((hs % 16) * 8,flr(hs / 16) * 8,16,16, cam_x+96,mahuy-4,26,26,player.filp)
 
  pal(10,10)
  --spr(rank,cam_x+30,mahuy+3)
 
  blink2+=1
  if matimer<5 then
   if blink2 > 1 then
    blink2=0
   end
  end
  if pox == player.x and poy == player.y then
   player.x=832
   player.y=256
   coins+=1000
  end
  if not tr then
   spr(99,832,240,2,1)
   spr(117,pox,poy)
   spr(190,832,248,2,2)
  else
  spr(55,pox,poy)
  end
   player.x2=player.x
 
	 if waittime<0 then
	  player_update()
	  if not nun then
	   player_animate()
	  else
	   noupno()
	   player.boost=2
	  end 
	  goobstomp()
	  
	  if tr==true then
    ttimer-=0.1 / 15
    coins-=0.1 / 2
   end
   --print(player.wall)
	 elseif waittime>0 then
	  camera(0,0)
	  cls(1)
	  
	  print("loading...",90,120,7)
	 end
  
  if player.x > pf.x then
   pf.x+=1
  end
  if player.x < pf.x then
   pf.x-=1
  end  
  if player.y > pf.y then
   pf.y+=1
  end  
  if player.y < pf.y then
   pf.y-=1
  end
	 if ttimer < 0 then
load("stagehub")
	 end


	 --print(music(),cam_x+55,mahuy+55,8)
	 if tr==true and ttimer >0 then
	  line(cam_x+100,mahuy+125,ttimer+cam_x+48,mahuy+125,5)
	  line(cam_x+100,mahuy+124,cam_x+48,mahuy+124,9)
	  line(cam_x+100,mahuy+126,cam_x+48,mahuy+126,9)
	  --print(flr(ttimer),cam_x+70,mahuy+120,7)
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
  
  
function jp(obj,flag,new_spr)
  local x1=flr(obj.x/8)  local y1=flr(obj.y/8)
  if(fget(mget(x1,y1), flag))then
   mset(x1,y1,new_spr)
   for i=1,#ancoinx do
    if ancoinx[i]==x1 and ancoiny[i]==y1 then
     ancointch[i]=1
    end
   end
   ancoin()
   tr=true
   if heatmeteractive then
    heatmeter+=0.4
   end
   coins+=10
   music(0)
   if combotimer > 0 then
    combotimer+=5
   end
   sfx(32)
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
   coins+=1000
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

  if collide_map(player,"left",1) then
  pepstate =0 
 end
  if collide_map(player,"right",1) then
  pepstate =0 
 end
  if collide_map(player,"up",1) then
  pepstate =0 
 end



 if collide_map(player,"left",2) then
  pepstate=1
 end
 if collide_map(player,"left",4) then
  
 end
 if tr and collide_map(player,"right",3) and btnp(⬆️) then-- and tr == true then
  
  if player.colorpal == 0 then
  load("rank")
  else
   load("rankn")
  end
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
 if not btn(⬅️) and not btn(➡️) then

 end
 
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
 if btn(❎) and not lbu and
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
  player.dive=false
  player.landed=false
  player.jumping=false 
  lbd=false
  player.wall=false
	 if collide_map(player,"down",6) then
	  player.falling=false 
	  player.landed=true
	  player.dy=0
	  lbd=false
	  player.dive=false
	  player.wall=false
	  player.y-=((player.y+player.h)+1)%8-1
	 end
	 
 elseif player.dy<0 then
  player.jumping=true
  player.wall=false
  lbd=false
  player.dive=false
  if collide_map(player,"up",0) then
   player.dy=0
   matimer=11
  end
 end

 if matimer > 5 or lbu then
   if player.dx<0 then
  if collide_map(player,"left",0) then
    player.dx=0
    player.dive=false
    matimer=11
    lbd=false
    player.wall=false
  end
 elseif player.dx>0 then
  if collide_map(player,"right",0) then
    player.dx=0
    matimer=11
    lbd=false
    player.dive=false
    player.wall=false
  end
 end
 
 elseif matimer < 5 and not lbu then
  if player.dx<0 then
  if collide_map(player,"left",0) then
    player.dy-=player.boost / 15
    player.dx=0
    player.dive=false
    player.wall=true
    lbd=false
   -- matimer+=2
   if btnp(❎) then
    player.dy-=player.boost-3
    player.landed=false
    sfx(28)
    player.x+=4
    player.flip=false
    lbd=false
   end
  end
 elseif player.dx>0 then
  if collide_map(player,"right",0) then
    player.dy-=player.boost / 15
    player.wall=true
    player.dx=0
    player.dive=false
    lbd=false
    if btnp(❎) then
    player.dy-=player.boost-3
lbd=false
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
 --stop slideing111111111111111111`111xxxxxxxxxxx
  if player.landed and not btn(⬆️) and lbu then
       player.dy-=player.boost+6
  --player.sp=2
  player.boost=0
    sfx(30)
  player.landed=false
  player.acc=0
  matimer=11
  lbu=false
 end
 if player.slideing then
  if abs(player.dx)<.2   
   or player.running then
    player.dx=0
    player.slideing=false
  end
 end
 if matimer < 3 and player.falling and btn(⬇️) or lbd then
  player.dive=true
  lbd=true
 end 
 player.x+=player.dx
 player.y+=player.dy
 callbacktimer-=0.1
  if player.landed and not btn(⬆️) and lbu then
       player.dy-=player.boost+6
 -- player.sp=2
    sfx(30)
  player.landed=false
  player.acc=0
  matimer=11
  lbu=false
 end
end

function player_animate()
if player.colorpal == 1 and player.dive then
 player.sp=15
elseif player.colorpal == 0 and player.dive then
 player.sp=31
end 
 if player.dive then
  player.dy+=0.1
 end 
player.boost=2
local acc=player.walk_acc
 if player.colorpal == 0 then
  if player.dive and not lbu then
   player.sp=31
  elseif player.grab == true then
   player.sp=67
   gt-=1
   
     
  player.landed=false
   if not player.flip then
    player.dx+=acc+0.6 / 2
    player.running=true
    player.flip=false
   end
   if player.flip then
    player.dx-=acc+0.6 / 2
    player.running=true
    player.flip=true
   end
   if gt < 1 then
    gt=11
    player.grab=false
   end

  elseif player.wall ==true and not lbu and not lbu then
           player.sp+=.3
           player.boost=2
        if player.sp>46 or player.sp < 44 then
          player.sp=44
        end
        
      
  elseif player.jumping and not lbu and not player.wall then
       
player.boost=2
--gravity=0.2
       if matimer > 7 and not lbu then 
        player.sp=8
        --gravity=0.2
       elseif matimer > -10 then
           player.sp+=0.5
           if player.sp>34 or player.sp < 32 then
          player.sp=32
        end
        elseif matimer < -10 then
           player.sp+=0.4
           if player.sp>255 or player.sp < 252 then
          player.sp=252
        end
       end
      -- gravity=0.2
       player.boost=2
          elseif not lbu and btn(⬆️) and matimer < 2 and not player.wall then
	  lbu=true
	  player.acc=0
	  matimer=0

	  player.boost=0
	  if player.colorpal == 0 then
	   player.sp=2
	  elseif player.colorpal == 1 then
	   player.sp=216
	  end
  elseif not player.dive and player.rolling and not lbu then
        player.sp+=.7
                       if player.sp>116 or player.sp < 112 then
          player.sp=112
        end
        player.jumping=false
        player.boost=0
        --gravity=0.2
        player.boost=2
  elseif player.falling and not lbu and not player.wall then
       
player.boost=2
--gravity=0.2
       if matimer > 7 and not lbu then 
       player.sp=8
        --gravity=0.2
       elseif matimer > -10 then
           player.sp+=0.5
           if player.sp>34 or player.sp < 32 then
          player.sp=32
        end
        elseif matimer < -10 then
           player.sp+=0.4
           if player.sp>255 or player.sp < 252 then
          player.sp=252
        end
       end
      -- gravity=0.2
       player.boost=2
  elseif player.running and btn(🅾️) and not lbu then
       
player.boost=2
--gravity=0.2
       if matimer > 7 and not lbu then 
        player.sp+=0.2
        if player.sp > 7 or player.sp < 5 then
         player.sp=5
        end
        --gravity=0.2
       elseif matimer > -10 then
           player.sp+=0.5
           if player.sp>34 or player.sp < 32 then
          player.sp=32
        end
        elseif matimer < -10 then
           player.sp+=0.4
           if player.sp>255 or player.sp < 252 then
          player.sp=252
        end
       end
      -- gravity=0.2
       player.boost=2
  elseif player.running and not lbu and not btn(🅾️) and not btn(⬆️) then
    if time()-player.anim>.1 then
      player.anim=time()
      player.sp+=.9
      player.boost=2
        if player.sp>5 or player.sp < 2 then
          player.sp=3
        end
      player.boost=2
      end
    --  gravity=0.2
  elseif btn(⬆️) and not lbu and matimer > 3 then
   tt-=1
   player.boost=2
   --gravity=0
   player.acc=0
   if tt > 0 then
    player.sp+=0.1 / 2
    player.boost=2
    player.acc=0
    if player.sp < 123 or player.sp > 127 then
     player.sp=123
     player.boost=2
     player.acc=0
    end
    player.boost=2
    player.acc=0

   else
   
   player.boost=2
       player.acc=0
   player.running=false
   matimer=11
   player.boost=2
   --if not btn(🅾️) then
     player.sp+=.4
     if player.sp < 17 or player.sp > 23 then
		    player.sp=17
		   end
   end
		--elseif btn(⬇️) then
   --player.sp=rnd(0,127)
	 elseif not lbu and not btn(⬆️) then
	 tt=80
	 --gravity=0.2
	  player.sp=1
	  player.boost=2
--		 elseif btn(🅾️) then
--		   player.sp+=0
--     player.sp=rnd(123,127)
--   end
  end
  else
    if player.dive and not lbu then
   player.sp=15
    elseif player.grab == true then
   player.sp=38
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

  elseif player.wall ==true and not lbu and not lbu then
   player.sp=223
      
  elseif player.jumping and not lbu and not player.wall then
       player.sp+=0.5
player.boost=2
--gravity=0.2
       if matimer > 7 and not lbu then 
        player.sp=234
        --gravity=0.2
       elseif matimer > -10 then
           if player.sp>233 or player.sp < 231 then
          player.sp=231
        end
       elseif matimer < -10 then
        if player.sp>238 or player.sp < 236 then
          player.sp=236
        end
       end
       --gravity=0.2
       player.boost=2
          elseif not lbu and btn(⬆️) and matimer < 2 and not player.wall then
	  lbu=true
	  player.acc=0
	  matimer=0

	  player.boost=0
	  player.sp=216
  elseif not player.dive and player.rolling and not lbu then
         player.sp+=.7
                       if player.sp>116 or player.sp < 112 then
          player.sp=112
        end
        player.jumping=false
        player.boost=0
        --gravity=0.2
        player.boost=2  elseif player.falling and not lbu and not player.wall then
       player.sp+=0.4
player.boost=2
--gravity=0.2
player.boost=2
       if matimer > 7 and not lbu then 
        player.sp=234
       elseif matimer > -10 then
           if player.sp>234 or player.sp < 231 then
          player.sp=231
        end
       elseif matimer < -10 then
        if player.sp>239 or player.sp < 236 then
          player.sp=236
        end
       end
  elseif player.running and btn(🅾️) and not lbu then
       
player.boost=2
--gravity=0.2
       if matimer > 8 and not lbu then 
        player.sp+=0.2
        if player.sp > 221 or player.sp < 219 then
         player.sp=219
        end
  
        --gravity=0.2
       elseif matimer > -10 then
          player.sp+=0.3
           if player.sp>234 or player.sp < 231 then
          player.sp=231
        end
       elseif matimer < -10 then
       player.sp+=0.3
        if player.sp>239 or player.sp < 236 then
          player.sp=236
        end
       end
       --gravity=0.2
       player.boost=2
  elseif player.running and not lbu and not btn(🅾️) and not btn(⬆️) then
    if time()-player.anim>.1 then
      player.anim=time()
      player.sp+=.9
      player.boost=2
        if player.sp>219 or player.sp < 217 then
          player.sp=217
        end
      player.boost=2
      end
      --gravity=0.2
  elseif btn(⬆️) and not lbu and matimer > 3 then
   tt-=1
   player.boost=0
   --gravity=0
   player.acc=0
   if tt > 0 then
    player.sp+=0.1 / 2
    player.boost=0
    player.acc=0
    if player.sp < 249 or player.sp > 252 then
     player.sp=249
     player.boost=0
     player.acc=0
    end
    player.boost=0
    player.acc=0

   else
   
   player.boost=2
       player.acc=0
   player.running=false
   matimer=11
   player.boost=2
   --if not btn(🅾️) then
     player.sp+=.4
     if player.sp < 17 or player.sp > 23 then
		    player.sp=17
		   end
   end
		--elseif btn(⬇️) then
   --player.sp=rnd(0,127)
	 elseif not lbu and not btn(⬆️) then
	 tt=80
	 --gravity=0.2
	  player.sp=215
	  player.boost=2
--		 elseif btn(🅾️) then
--		   player.sp+=0
--     player.sp=rnd(123,127)
--   end
  end
  
 
  end
  
end
  

  
-->8

-->8
function starfield()
 for i=1,#starx do
 local scol=7
 if starspd[i]<1 then
  scol=5
 elseif starspd[i]<1.5 then
  scol=6
 end
  rectfill(starx[i]-strszes[i].x,stary[i]+strszes[i].y,starx[i]+strszes[i].x,stary[i]-strszes[i].y,6)
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
  and not player.grab
  and goombas[i].stomped==false
  and player.acc<0.1 then
	   player.dy-=0.8
	   coins-=5
	   combotimer-=0.2
	 elseif player.falling ==false
  and goombas[i].pixelx < player.x+8
  and goombas[i].pixelx + 8 > player.x
  and goombas[i].pixely < player.y+8
  and goombas[i].pixely + 8 >= player.y+8 
  and goombas[i].stomped==false
  and player.acc>0.1
  and not player.grab
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
	 elseif player.falling ==false
  and goombas[i].pixelx < player.x+8
  and goombas[i].pixelx + 8 > player.x
  and goombas[i].pixely < player.y+8
  and goombas[i].pixely + 8 >= player.y+8 
  and goombas[i].stomped==false
  and player.grab
  and pepstate == 0
  and goombas[i].stomped==false then
   goombas[i].stomped=true
   sfx(52)
   combotimer=40
   combo+=1
   if heatmeteractive then
    heatmeter+=1
   end
   break
  end
  
 end
 
end
__gfx__
000000000aaaaaaa000000000aaaaaaa0aaaaaaa0aaaaaaa0aaaaaaa000000000aaaaaaa0b44444b666166660001111186666666000000000000000000aaaa00
0000000011141f100000000011141f1011141f1011141f1011141f100000000011141f1004bbabb4666166660017777711141f10000000000000000000f1f100
00000000014ffff000000000014ffff0014ffff0014ffff0014ffff000000000014ffff0048ebe841111111101777777014ffff700000000000000000f1771f0
0000000011177f700000000011177f7011177f7011177f7f11177f70000000001f177f7f0be8a8eb666666160177777711177f7700000000777000007f1881f7
0000000001a111a000aaaaa001f111f001a111a0f1a111a001f111a00000000000a111a004bb4bb466666616017777774466666600000000777700000af9f9a0
0000000001faaaf00f17f71f00aaaaa101faaaf000aaaaa100aaaaa00000000000aaaaa104aabaa4111111111777777744666604000000007777700099aaaa0a
00000000001aaa1001a111a101aaaaa1001aaa1001aaaaa100aaaaa00000000001aaaaa1004bab40666166661777777788666660000000007777700099aaaaaa
0000000000110110001101100110000000110110010000000011111000000000011000000004b400111111111777777786660666000000007777777799aa9000
000000000000000000000000000000000000000000000000000000000000000004444440000111112221222200006000dddddddd000000000000000010100000
00000000000000000000000000000000000000000000000000000000000000000ff1f1f0001777772221222200066600dddddddd00000000000000000aaa0000
00000000000000000000000000000000000000000000000000000000000000000ff1f1f0017777771111111100007000dddddddd00000000000000000aaaaa00
0000000000000000000000000000000000000000000000000000000000000000081f8887017777772222221200007000dddddddd00000000008887000a1aaaa0
00000000000000000000000000000000000000000000000000000000000000007f1111f0017777772222221200007000dddddddd008887000088177000141f10
000000000000000000000000000000000000000000000000000000000000000000f88f00177777771111111100066600dddddddd008817700088871000177f70
0000000000000000000000000000000000000000000000000000000000000000000ff000177777772221222206666666dddddddd00888700010000100001ffff
000000000000000000000000000000000000000000000000000000000000000007700770177777771111111166666666dddddddd00111100010000000000ffff
0aaa1aa00aaa1aa00aaa1aa000000000bbbbbbbb7777717700aaaa00444444441777777166666666222122226777777607717777777177700000000000000000
011141f1001141f1001141f100000000bbbbbbbb6666616600f8f800999999991777777155555555222122226777777611141f1011141f100000000000000000
0014ffff0114ffff0014ffff00000000bbbbbbbb666661660f1717f00008800017777771000000001111111111777711014fffff014ffff00111111111111110
f11177f7f11177f7f11177f700000000bbbbbbbb111111110f1111f0000880001777777100000000222222126677771611111110111111ff1111117771111111
001a1110001a1110001a111000000000bbbbbbbb616666660aaa79a7000000001777777100000000222222126677771601771111017711101111117771111111
00aaaaa000aaaaa000aaaaa000000000bbbbbbbb6166666699aaaa00000000001777777100000000111111111117711100777771007777101411188188111411
011aaa1000a111a0011aa11000000000bbbbbbbb616666669aaaa000000000001777777100000000222122226667766600777710007777711f4188888884f511
01001110001110000110011000000000bbbbbbbb111111119a9a900000000000177777710000000011111111111111110000001100000000155ff44444ff5511
000000004444444400000000009990000000000022222222d0d0d0d000080800000000000077770000777700007777000000000000111100155ffffffff55511
0000000099999999000000000909090000000000222222220d0d0d0d0808080000000000071771700717717007177170000000000155551015aa9fffff9a5511
00044000d0d0d0d000000000090909000000000022222222d0d0d0d008888808000000000777777007777770077777700aaaaaa0015555101aaa99fff99aaa11
000aa0000d0d0d0d000000009009009000000000222222220d0d0d0d8eeeee880000000001777710017777100177771000a1a100015555101aaaaaaaaaaaaa11
000aaa00d0d0d0d000000000900900900000000022555525d0d0d0d08eeeeee8000000000711117007111170071111700fffff00015555101a55aaaaaaa55a11
00aaaa000d0d0d0d000000009019109000000000256666560d0d0d0d8eeeeee800000000076666700766667007666670f1117100015555101a55aaaaaaa55511
0aa99aa0d0d0d0d000000000901910900000000056666666d0d0d0d08eeeeee800000000066666600666666006666660f1188800015555101555aaaaaaa55511
aa0990aa0d0d0d0d000000009999999000000000566666660d0d0d0d8eeeeee80000000000666600006666000066660000aaaa00015555100111111111111110
7777777711111000011111100aa1aaaa0000000000000000007777000000000000000000000000000000000000000000000000000000000a0077770000777700
77777777777771001414414111141f100000000000000000072222700000000000000000000000000000000000000000000000000000000a0733377007bbbb70
777777777777771014144141014ffff00111111111111110772777277777777777777777000000777777777701111111111111100000000a773773777b7777b7
77777777777777101414414111177f701111117771111111772222770777777777777777000777777777777711111177711111110000000a773773777b777777
777777777777771014144141011f11af1111117771111111772777770777777777777777007777777777777711111177711111110000000a773773777b777777
77777777777777711414414100aaaaa01411188188111411772777770077777777777777077777777777777714111881881114110000000a773773777b7777b7
07777777777777711414414101aaaaa01f4188888884f51107277770000777777777777707777777777777771f4188888884f5110000000a0733377007bbbb70
00777770777777710111111001001000155ff44444ff55110077770000000077777777777777777777777777155ff44444ff55110000000a0077770000777700
00000000000000000000000077000007155ffffffff555116666666600000000666166660000000001111110155ffffffff55511000000000666660000777700
0000000000000000000777007770007715aa9fffff9a5511666666660000000066616666000000001155551115aa9fffff9a5511000000006606066007ccc770
011111111111111000777770077707771aaa99fff99aaa1166666666777777771111111177000000151551511aaa99fff99aaa11000000006660666077c77c77
111111777111111107777777007777771aaaaaaaaaaaaa116666666677777770666666167777700015c55c511aaaaaaaaaaaaa11000000006606066077ccc777
111111777111111177777777007777771a55aaaaaaa55a1166666666777777706666661677777700155555511a55aaaaaaa55a11000000000666660077c77c77
141118818811141177777777000777771a55aaaaaaa5551166666666777777001111111177777770151111511a55aaaaaaa55511000000000000000077c77c77
1f4188888884f51177777777077777771555aaaaaaa5551166666666777770006661666677777770115555111555aaaaaaa55511000000000000000007ccc770
155ff44444ff55117777777777777777011111111111111066666666770000001111111177777777011111100111111111111110000000000000000000777700
155ffffffff55511166666660001111111111111fffffff955515555000000000000000000000000000000000000000000000000000000000004400000777700
15aa9fffff9a55111666667600011dddddddddd1ffffffff55515555000000000000000000000000000000000000000000000000000440000044440007788770
1aaa99fff99aaa111666666600011dddd1111dd19fffff9f111111110111111111111110011111111111111000bbbbbb00000000004444000014440077877877
1aaaaaaaaaaaaa111666666600011dddddddddd1ffffffff5555551511111177711111111111117771111111000b3b3000070700004141000041410077877877
1a55aaaaaaa55a111666666600011ddd111111d1fff999ff5555551511111177711111111111117771111111000bbbb0000707000e1444100044440077888877
1a55aaaaaaa555111666666600011dddddddddd1ff99ffff111111111411188188111411141118818811141100b33b3000017100044111400044440077877877
1555aaaaaaa555111666666600011dddd1111dd1f99fffff555155551f4188888884f5111f4188888884f51100b3bbb0ddd77770044444400044440007877870
01111111111111101111111100011dddddddddd19ffffff911111111155ff44444ff5511155ff44444ff5511bbbbbbb0ddd7d700004444000440044000777700
00000000000000000000000000000000000440000000000000000000155ffffffff55511155ffffffff555110aaaa1aa0aaaaaaa0aa1aaaa0000000000aaaa00
00aaaa0000aaaa0000aaaa0000aaaa0000044000000000000003300015aa9fffff9a551115aa9fffff9a551111114f1011141f1011141f10aaaaaaa00a9999a0
00f1f10000f1f10000f1f10000f1f10000044000000000000009a0001aaa99fff99aaa111aaa99fff99aaa110114fff00f4ffff0014ffff001f14111a9aaaa9a
0f1771f00f1771f00f1771f00f1771f00009900000000000009a9a001aaaaaaaaaaaaa111aaaaaaaaaaaaa1111a11a111f177f7011177f700ffff410a99999aa
9f1111f09f1111f09f1111f09f1111f0000990000000000000a1a1001a55aaaaaaa55a111a55aaaaaaa55a1111aaaa1101111110f1a11a11222a7111aaaaaa9a
9af9f9009af9f9009af9f9009af9f9000004400000000000009a9a001a55aaaaaaa555111a55aaaaaaa55511f0aaaa0ff0aaaaa000aaaaf1222a1110a9aaaa9a
79aaaa0a79aaaa0a79aaaa0a79aaaa0a00044000000000000019a1001555aaaaaaa555111555aaaaaaa5551100aaaa0000aaaaa0011aaa001f1faa000a9999a0
99aaaaaa99aaaaaa99aaaaaa99aaaaaa000440000000000001100110011111111111111001111111111111100110011001100011010001101a1aaa0000aaaa00
a0000000a07272720000a000000000000000000000a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a0a5a5000000000000000000000000000000a5a500000000000000a0a1a1a1a1a1a1a1a1a1a1a1a0008300000000d0d0d0d0d0d0d0d0d0d0d0003300000000a0
a0000000a00000000000a00000000000000000000000000000000000000000000000000000000000000000000000000000000000000023230000000000000000
00a5a500000000d000d000d0000023000000a5a500000000000000a0a1a1a1a1a1a1a1a1a1a1a1a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0
a0000000a00000000000a00000000000000000000000000000000000000000000072727272a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0
a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1
a0000000a00000000000000023330000000000000000000000000000000000000000000000a0a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1
a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1
a0000000a0a0a0a0a0a0a0a0a0a0a000000000000000000000000000000000000000000000a0a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1
a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1
a00000000000000000000000000000000072727272a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1
a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1
a00000000000000000000000000000000000000000a0a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1
a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1
a00000000000230000000023000000000000230000a0a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1
a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1
a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1
a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011dda111111a1
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011dd11d11d111
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011ddddd1d1dd1
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011ddddd1d11d1
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011dddd1dddd11
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011dddd1dddd11
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011dddd11111d1
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011ddd1ddddd11
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011dd1ddddddd1
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011d1d11111111
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011d1dddddddd1
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011dddddddddd1
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011ddddd111111
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011dddddddddd1
656565650000000000000065656565650000000000000065656565650000000000000000000000000000000000000000000000000000000000011dddddddddd1
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001111111111111
6565656565656565656565656565656565656565656565656565656500aaaa00000000000aaaa0000aaaa0000aaaaa000aaaaa000000000000000000000aaaa0
0000000000000000000000000000000000000000000000000000000000f1f1000000000000f1f00000f1f00000f1f10000f1f1000000000007700770000f1f10
656565656565656565656565656565656565656565656565656565650f1771f0000000000f1170000f1170000ffffff00ffffff0000000000700007000f17777
000000000000000000000000000000000000000000000000000000000f1881f0000000000f1880000f1880000ffffff00ffffff000000000000000009aaaaa77
656565656565656565656565656565656565656565656565656565650af9f9a000aaaa000af9f9000af9f9000af9f9a00af9f9a000000000000000009aaaaaaa
0000000000000000000000000000000000000000000000000000000079aaaa0777f1f17779aaa0a079aaa000997aaa00997aaaa0000000000700007099aaaaaa
6565656565656565656565656565656565656565656565656565656599a99a00af1771fa9aa99aa099a99a0099a99a009aa99aa0000000000770077099aaaaaa
000000000000000000000000000000000000000000000000000000009aa99aa09aa99aa99a99900099aaaa009aa99aa09a9990000000000000000000000000aa
6565656565656565656565656565656565656565656565656565656500aaa00000aaa00000aaa00000aaaa0096666660007aaaa7007aaaa7007aaaa700000000
0000000000000000000000000000000000000000000000000000000000f1f00000f1f00000f1f00000f1f10000616100007f1f17007f1f17007f1f1700000000
656565656565656565656565656565656565656565656565656565650f7777009f7777000f7777000f1771f000fffff700f7777f99f7777f00f7777f00000000
000000000000000000000000000000000000000000000000000000009f7777009f7777009f7777007f1881f70f11711799f7777f99f7777f99f7777f00000000
656565656565656565656565656565656565656565656565656565659a79f9709a79f9709a79f9700af9f9a00f1888169a79f9709a79f9709a79f97000000000
000000000000000000000000000000000000000000000000000000009aaaaa009aaaaa009aaaaa0099aaaa00076969079aaaaa000aaaaa009aaaaa0000000000
65656565000000000000006565656565000000000000006565656565aaa00a00999aa000aa00aa0099a99a00996666600aaaa0000aaaa0000aaaa00000000000
00000000000000000000000000000000000000000000000000000000a000aa000aaa0000aa00aa009aa99aa0966606660a0a00000a0a00000a0a000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000dd00000aaaa0000aaaa00aaaaaa00aaaaaa00aaaaaa0000000000
00000000000000000000000000000000000000000000000000000000000000000000000000dddd0000f1f10000f1f10011141f1001141f1001141f1000000000
00000000000000000000000000000000000000000000000000000000000000000000000000dddd000f1771f00f1771f0014ffff0114ffff0014fffff00000000
0000000000000000000000000000000000000000000000000000000000000000000000000dddddd00f1887f77f1881f711177f7f01177f7001f77f7000000000
0000000000000000000000000000000000000000000000000000000000000000000000000dddddd00af9f9770af9f9a0f1a111a001f111af01a111a000000000
0000000000000000000000000000000000000000000000000000000000000000000000000dddddd079aaaa0099aaaa0000aaaaa000aaaaa011aaaaa100000000
0000000000000000000000000000000000000000000000000000000000000000000000000dddddd099a99a0099a99a0000aa1110001aa0001111000100000000
0000000000000000000000000000000000000000000000000000000000000000000000000dddddd09aa99aa09aa99aa001110000000000001000111100000000
__label__
12222222122222221222222212222222122222221222222212222222122222221222222212222222122222221222222212ddddddddddddddddddddd112222222
122222221222222212222222122222221222227777222222122222221222222212222222122222221222222212222222dd222226661117777777777d11222222
111111111111111111111111111111111111177773311111111111111111111111111111111111111111111111111111dd222226661117777777777d11111111
222122222221222222212222222122222221777772272222222122222221222222212222222122222221222222212222dd266666666661116666666d11212222
222122222221222222212222222122222221777722272222222122222221222222212222222122222221222222212222dd266666777777744411122d11212222
111111111888211111111111111111111111722222771111111111111111111111111111111111111111111111111111dd266666777777744411122d11111111
122222221828222212222222122222221222722227772222122222221222222212222222122222221222222212222222dd222661777777774411122d11222222
111111111828211111111111111111111111172277711111111111111111111111111111111111111111111111111111dd222117777117774444111d11111111
166666661828266616666666166666661666667777666666166666661666666616666666166666661666666616666222dd222117777117774444111d11222222
14fffffff8882fffffffffffffffffff4666666616666666166666661666666616666666166666661666666616666222dd222771777117774411144d11222222
14ffffffffffffffffffffffffffffff4111111111111111111111111111111111111111111111111111111111111111dd222771777117774411144d11111111
64ffffffffffffffffffffffffffffff4661666666616666666166666661666666616666666166666661666666616222dd222771777117774411144d11212222
664444444444444444444444444444446661666666616666666166666661666666616666666166666661666666616222dd222777777777774411444d11212222
156111111111111176111111111111165111111111111111111111111111111111111111111111111111111111111111dd222777777777774411444d11111111
156166661166666666666666116666165666666616666666166666661666666616666666166666661666666616666222dd222771777777774444444d11222222
156111111111111666611111111111165111111111111111111111111111111111111111111111111111111111111111dd222771777777774444444d11111111
225555555555555566555555555555552222222222222222222222222222222222222222222222222222266616666222dd122114ff7777744444444d11222222
222222222222222222222222222222222222222222222222222222222222222222222222222222222222266616666222dd111114fff114444444fffd11222222
227722772222222222222222222222222222222222222222222222222222222222222222222222222222211111111111dd111114fff114444444fffd11111111
227222272222222222222222222222222222222222222222222222222222222222222222222222222222266666616222dd111114fff77111fffffffd11212222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222226666661622222ddddddddddddddddddddd122212222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222221111111111111ddddddddddddddddddddd111111111
22722227222222222222222222222222222222222222222222222222222222222222222222222222222226661666622212222222122222221222222212222222
22772277222222222222222222222222222222222222222222222222222222222222222222222222222221111111111111111111111111111111111111111111
22222222222222222222222222222222222222222222226666666666666666666666666666666666666666661666622212222222122222221222222212222222
22222222222222222222222222222222222222222222226666666666666666666666666666666666666666661666622212222222122222221222222212222222
22222222222222222222222222222222222222222222226666666666666666666666666666666666666661111111111111111111111111111111111111111111
22222222222222222222222222222222222222222222226666666666666666666666666666666666666666666661622222212222222122222221222222212222
22222222222222222222222222222222222222222222226666666666666666666666666666666666666666666661622222212222222122222221222222212222
22222222222222222222222222222222222222222222226666666666666666666666666666666666666661111111111111111111111111111111111111111111
22222222222222222222222222222222222222222222226666666666666666666666666666666666666666661666622212222222122222221222222212222222
22222222222222222222222222222222222222222222226666666666666666666666666666666666666661111111111111111111111111111111111111111111
66666666666666666666666666666666666666666666666666666666111117777777711111666666666666661666622212222222122222221222222212222222
66666666666666666666666666666666666666666666666666666661777777777777777777166666666666661666622212222222122222221222222212222222
66666666666666666666666666666666666666666666666666666617777777777777777777716666666661111111111111111111111111111111111111111111
66666666666666666666666666666666666666666666666666666617777777777777777777716666666666666661622222212222222122222221222222212222
66666666666666666666666666666666666666666666666666666617777777777777777777716666666666666661622222212222222122222221222222212222
66666666666666666666666666666666666666666666666666666177777777777777777777771666666661111111111111111111111111111111111111111111
66666666666666666666666666666666666666666666666666666177777777777777777777771666666666661666622212222222122222221222222212222222
66666666666666666666666666666666666666666666666666666177777777777777777777771666666661111111111111111111111111111111111111111111
66666666666666666666666666666666666666666666666666666777777777777777777777777666666666661666666616666666166666661666666616666666
66666666666666666666666666666666666666666666666666666777777777777777777777777666666666661666666616666666166666661666666616666666
66666666666666666666666666666666666666666666666666666777777777777777777777777666666661111111111111111111111111111111111111111111
66666666666666666666666666666666666666666666666666666777777777777777777777777666666666666661666666616666666166666661666666616666
66666666666666666666666666666666666666666666666666666777777777777777777777777666666666666661666666616666666166666661666666616666
66666666666666666666666666666666666666666666666666666777777777777777777777777666666661111111111111111111111111111111111111111111
66666666666666666666666666666666666666666666666666666777777777777777777777777666666666661666666616666666166666661666666616666666
66666666666666666666666666666666666666666666666666666777777777777777777777777666666661111111111111111111111111111111111111111111
66666666666666666666666666666666666666666666666666666777777777777777777777777666666666661666666666666666666666666666666666666666
66666666666666666666666666666666666666666666666666666777777777777777777777777666666666661666666666666666666666666666666666666666
66666666666666666666666666666666666666666666666666666777777777777777777777777666666661111111166666666666666666666666666666666666
66666666666666666666666666666666666666666666666666666777777777777777777777777666666666666661666666666666666666666666666666666666
66666666666666666666666666666666666666666666666666666777777777777777777777777666666666666661666666666666666666666666666666666666
66666666666666666666666666666666666666666666666666666777777777777777777777777666666661111111166666666666666666666666666666666666
66666666666666666666666666666666666666666666666666666777777777777777777777777666666666661666666666666666666666666666666666666666
66666666666666666666666666666666666666666666666666666777777777777777777777777666666661111111166666666666666666666666666666666666
66666666666666666666666666666666666666666666666666666777777777777777777777777666666666661666666666666666666666666666666666666666
66666666666666666666666666666666666666666666666666666777777777777777777777777666666666661666666666666666666666666666666666666666
66666666666666666666666666666666666666666666666666666777777777777777777777777666666661111111166666666666666666666666666666666666
66666666666666666666666666666666666666666666666666666777777777777777777777777666666666666661666666666666666666666666666666666666
66666666666666666666666666666666666666666666666666666777777777777777777777777666666666666661666666666666666666666666666666666666
66666666666666666666666666666666666666666666666666666777777777777777777777777666666661111111166666666666666666666666666666666666
66666666666666666666666666666666666666666666666666666777777777777777777777777666666666661666666666666666666666666666666666666666
66666666666666666666666666666666666666666666666666666777777777777777777777777666666661111111166666666666666666666666666666666666
66666666666666666666666666666666666666666666666666666777777777777777777777777666666666661666666666666666666666666666666666666666
66666666666666666666666666666666666666666666666666666777777777711141f17777777666666666661666666666666666666666666666666666666666
666666666666666666666666666666666666666666666666666667777777777714ffff7777777666666661111111166666666666666666666666666666666666
66666666666666666666666666666666666666666666666666666777777777711177f77777777666666666666661666666666666666666666666666666666666
66666666666666666666666666666666666666666666666666666777777777771711177777777666666666666661666666666666666666666666666666666666
66666666666666666666666666666666666666666666666666666777777777771f777f7777777666666661111111166666666666666666666666666666666666
66666666666666666666666666666666666666666666666666666777777777777177717777777666666666661666666666666666666666666666666666666666
66666666666666666666666666666666666666666666666666666777777777777117117777777666666661111111166666666666666666666666666666666666
16666666166666661666666616666666166666661666666616666666166666661666666616666666166666661666666666666666666666666666666666666666
16666666166666661666666616666666166666661666666616666666166666661666666616666666166666661666666666666666666666666666666666666666
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111166666666666666666666666666666666666
66616666666166666661666666616666666166666661666666616666666166666661666666616666666166666661666666666666666666666666666666666666
66616666666166666661666666616666666166666661666666616666666166666661666666616666666166666661666666666666666666666666666666666666
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111166666666666666666666666666666666666
16666666166666661666666616666666166666661666666616666666166666661666666616666666166666661666666666666666666666666666666666666666
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111166666666666666666666666666666666666
16666666666666666666666666666666666666666666666666666666666666666666666666666666666666661666666666666666666666666666666666666666
16666666666666666666666666666666666666666666666666666666666666666666666666666666666666661666666666666666666666666666666666666666
11111666666666666666666666666666666666666666666666666666666666666666666666666666666661111111166666666666666666666666666666666666
66616666666666666666666666666666666666666666666666666666666666666666666666666666666666666661666666666666666666666666666666666666
66616666666666666666666666666666666666666666666666666666666666666666666666666666666666666661666666666666666666666666666666666666
11111666666666666666666666666666666666666666666666666666666666666666666666666666666661111111166666666666666666666666666666666666
16666666666666666666666666666666666666666666666666666666666666666666666666666666666666661666666666666666666666666666666666666666
11111666666666666666666666666666666666666666666666666666666666666666666666666666666661111111166666666666666666666666666666666666
16666222222222222222222222222222222222222222226666666666666666666666666666666666666666661666622222222222222222222222222222222222
16666222222222222222222222222222222222222222226666666666666666666666666666666666666666661666622222222222222222222222222222222222
11111222222222222222222222222222222222222222226666666666666666666666666666666666666661111111122222222222222222222222222222222222
66616222222222222222222222222222222222222222226666666666666666666666666666666666666666666661622222222222222222222222222222222222
66616222222222222222222222222222222222222222226666666666666666666666666666666666666666666661622222222222222222222222222222222222
11111222222222222222222222222222222222222222226666666666666666666666666666666666666661111111122222222222222222222222222222222222
16666222222222222222222222222222222222222222226666666666666666666666666666666666666666661666622222222222222222222222222222222222
11111222222222222222222222222222222222222222226666666666666666666666666666666666666661111111122222222222222222222222222222222222
16666222222222222222222222222222222222222222222222222222222222222222222222222222222226661666622222222222222222222222222222222222
16666222222222222222222222222222222222222222222222222222222222222222222222222222222226661666622222222222222222222222222222222222
11111222222222222222222222222222222222222222222222222222222222222222222222222222222221111111122222222222222222222222222222222222
66616222222222222222222222222222222222222222222222222222222222222222222222222222222226666661622222222222222222222222222222222222
66616222222222222222222222222222222222222222222222222222222222222222222222222222222226666661622222222222222222222222222222222222
11111222222222222222222222222222222222222222222222222222222222222222222222222222222221111111122222222222222222222222222222222222
16666222222222222222222222222222222222222222222222222222222222222222222222222222222226661666622222222222222222222222222222222222
11111222222222222222222222222222222222222222222222222222222222222222222222222222222221111111122222222222222222222222222222222222
16666222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
16666222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
11111222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
66616222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
66616222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
11111222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
16666222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
11111222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
16666222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
16666222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
11111222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
66616222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
66616222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
11111222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
16666222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
11111222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
222222222222222222222222222222aa222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222a1aa22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
2222222222222222222222222222aaaa222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
222222222222222222222677777aaaaaa22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222266666aaaaaaaa2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222

__gff__
0000000000000000000041080010000000000000000000001008410420000000000000000000004008454100000000000040008002000000200000000020000000084100000000000000000000000000000000000000000010001000000000000000100000411000000000000000000000000000100000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a
0a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a
0a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a
0a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a
0a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d0d0d0d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a
0a000000000000000000003200000000003200000000003200000000003200000000000000000000000000000000000000000000000000000000000d0d0d0d00000d0d0d0d00000d0d0d0d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a
0a000000000000000000000a0a000000000a0a000000000a0a000000000a0a000000000000000000000000000000000000000000000000000000000d0d0d0d00000000000000000d0d0d0d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a
0a000000000000000000005a5a000000005a5a000000005a5a000000005a5a0000000000000032000000320000000000000000320000320000003200000000000a0a0a0a0a0a000000000000003300000000000000000d0d320d0d00000000000d320d000000000000000d0d320d0d000000000000000033000000000000000a
0a0a0a2727272700000a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a00000a0a0a0a0a0a27272727270a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a1a1a1a1a0a0a0a0a0a0a0a0a0a0a0a0a270000000a0a0a0a0a0a0a0000000a0a0a0a0a000000000a0a0a0a0a0a0a0a0000000a0a0a0a0a0a0a00000000000a
0a00000000000000000000000000000000000000000a1a1a1a1a1a1a1a1a1a1a0a00000a1a1a1a1a0a00000000000a00000000000000000000000a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a0a000000000a1a1a1a1a1a0a0000000a1a1a1a0a000000000a1a1a1a1a1a1a0a0000000000000a1a1a0a00000000000a
0a00000000000000000000000000000000000000000a1a1a1a1a1a1a1a1a1a1a0a00000a0a0a0a0a0a00000000000a00000000000000000000000a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a0a000000000a1a1a1a1a1a0a0000000a1a1a1a0a000000000a1a1a1a1a1a1a0a0000000000000a1a1a0a00000000000a
0a00000000000000000000000000000000000000000a1a1a1a1a1a1a1a1a1a1a0a00005a5a5a5a5a5a00003300000a00000000000000000000000a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a0a000000000a0a0a0a0a0a0a0000000a0a0a0a0a000000000a0a0a0a0a0a0a0a0000000000000a1a1a0a00000000000a
0a00000000000000000000000000000000000000000a1a1a1a1a1a1a1a1a1a1a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a00000000000000000000000a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a0a270000000000000000000000000000000000000000000000000000000000000000000000000a1a1a0a00000000000a
0a000000000000005a5a5a5a5a5a5a5a00000000000a0a0a0a0a0a0a0a0a0a0a0a0a1a0a00000000000a003400000000000000000000000000000a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a0a000000000000000000000000000000000000000000000000000000000000000000000000000a1a1a0a00000000000a
0a000000000000005a5a5a5a5a5a5a5a00000000000a00000000000000000000000a1a0a00000000000a003400000000000000000000000000000a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a0a000000000000000000000000000000000000000000000000000000000000000000000000000a1a1a0a00000000000a
0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a272700000a00000000000000000000000a1a0a00000000000a003400000000000000000000000000000a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a0a000000000000000000000000000000000000000000000000000000000000000000000000000a1a1a0a00000000000a
1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a0a343434340a00000000000000000000000a1a0a00000000001b003400000000000000320000000000000a1a1a1a0a0a0a0a0a0a0a0a0a0a0a0a0a1a1a1a1a1a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a1a1a0a00000000000a
1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a0a000000000a00000000000000000000000a0a0a00000a0a0a0a0a0a0a0a0a0a272727270000000000000a1a1a1a0a00000000000000000000000a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a0a00000000000a
1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a0a32323232323232320a0a0a0a0a32323232323232320a1a1a1a1a1a1a1a0a00000000000000000032000a1a1a1a0a00000000000000000000000a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a0a00000000000a
1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a0a0a0a0a0a0a0a0a0a0a1a1a1a0a0a0a0a0a0a0a0a0a0a1a1a1a1a1a1a1a0a00000000000000272727270a0a0a0a0a00000000000000000000000a0a0a0a1a1a0a0a0a0a0a0a0a0a0a0a0a0a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a0a00000000000a
1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a0a00000000000000000000005a5a5a5a0000000000000000000000000000000a1a1a0a000000000000000000000a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a0a00000000000a
0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a0a00000032000000000000005a5a5a5a0000000000000000000000000000000a1a1a0a000000000000000000000a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a0a00000000000a
0a00000000000000000000000000000000000000000a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a2727000000000000000000000a1a1a0a000000000000000000000a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a0a00000000000a
0a00000000000000000000000000000000000000000a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a0a00000000000000000000000000000000000000000000000a00005a5a5a5a0000000000000a0a0a0a000000000000000000000a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a0a00000000000a
0a000000000000000000000000000000000b4041000a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a0a00000000000000000000000000000000000000000000000a00005a5a5a5a003200320000005a5a5a000000000000000000000a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a0a00000000000a
0a00000000000000000000000000000000404040000a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a00000000000000000000000000000000000000000000000a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a272727272727272700000a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a0a00000000000a
0a00000000000000000000000000000000404040000a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000a1a1a0a00000000000000000000000000000000000000000000000a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a0a00000000000a
0a00000000000000000000000000000000404040000a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000a0a0a0a00000000000000000000000000000000000000000000000a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a0a00000000000a
0a00000000000000000000000000000000404040000a00000000000000000000000000000000000000000000000000000000000000000000000d000d000d000d5a5a5a5a00000000000000000000000000000000000000000000000a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a0a00000000000a
0a0000000a2727270a0a0a0a0a0a0a0a0a0a0a0a0a0a0000000000000000000000000000000000000000000000000000000000000000000027272727272727270a0a0a0a0a0a0000000000000000000000000000000000000000000a1a1a1a1a1a1a1a1a1a1a1a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a00000000000a
0a0000000a00000000000a000000000000000000000a00000000000000000000000000000000000000000000000000000d000d000d00000000000000000000000a1a1a1a1a0a0000000000000000000000000000000000000000000a1a1a1a1a1a1a1a1a1a1a1a0a00000a00000000000000000000000000000000000000000a
0a0000000a00000000000a000000000000000000000a0000000000000000000000000000000000000000000000000027272727272727000000000000000000000a0a0a0a0a0a0000000000000000000000000000000000000000000a1a1a1a1a1a1a1a1a1a1a1a0a00000a00000000000000000000000000000000000000000a
__sfx__
0001000015650156501565015650146501665014650136501365012650106500f6500f6500f6500f6500f6500f6500f6500f6500f6500f6500000000000000000000000000000000000000000000000000000000
000f00000f04016040170400f04016040190400f04016040170400f04016040190400f0401604017040160400f04016040170400f04016040190400f04016040170400f04016040190400f040160401704016040
000f0000000000f03016030170300f03016030190300f03016030170300f03016030190300f0301603017030160300f03016030170300f03016030190300f03016030170300f03016030190300f0301603016030
000f0000160300f03016030170300f03016030190300f03016030170300f03016030190300f0301603017030160300f03016030170300f03016030190300f03016030170300f03016030190300f0301603017030
000f000000000000001b0401b0401e0401e0401e040000001b0401b040000001e0401e0401f040200400000000000000001b0401b0401e0401e0401e040000001b0401b040000000000000000200401e0401d040
000f0000160300000016040160401904019040190400000016040160400000019040190401a0401b04000000000000000016040160401904019040190400000016040160400000000000000001b0401904018040
000f000000000000001b0401b0401e0401e0401e040000001b0401b040000001e0401e0401f040200400000000000000001b0401b0401e0401e040000001b0402104021040000002204022040000000000000000
000f0000160300000016040160401904019040190400000016040160400000019040190401a0401b0400000000000000001604016040190401904000000160401c0401c040000001d0401d040000000000000000
000f00001e04019040160401e0401e0401e040160401e0401d04014040190401d0401c04014040170401c0401b04014040160401b0401b04014040160401b0401b04014040160401b0401e0401d0401b0401d040
000f00001e04019040160401e0401e04019040160401e0401d04014040190401d0401c04014040170401c0401b04014040160401b0401b0402004022040270402704027040000000000000000000000000000000
000f00001904019040000001b0401b0401b0401b0401b0401904019040000001b0401b0401b0401b0401b0401e0401e040000001d0401d040000001b0401b0401b0401b0401b0401b04000000000001b0401d040
000f00001e0401e0401e0401e0401e0401e04000000000001d0401d0401d0401d0401d0401d04000000000001e04020040200401e04020040200401e040200401e04020040210402204022040220402204022040
000f000000000000000000000000000000000000000000000000000000000000000000000000000000000000190401b0401b040190401b0401b040190401b040190401b0401c0401d0401d0401d0401d0401d040
000f0000000000f03016030170300f03016030190300f03016030170300f03016030190300f0301603017030160300f03016030170300f03016030190300f03016030170300f03016030190300f0301603017030
000f1a001e04019040160401e0401e04019040160401e0401d04014040190401d0401c04014040170401c0401b04014040160401b0401b0402004022040270402704027040014000140001400014000140001400
0012000007060070600000000000000000000006060060600706007060000000000008060080600806008060070600706000000000000000000000060600606007060070600f0600f06008060080600806008060
001200000906009060070600706000000000000000000000060600606007060070600000000000080600806000000000000706007060070600706000000000000a0600b0600c0600c06023060230602306023060
00120000000000000000000000001f06000000000000000022060220602206000000000000000024060000002506025060260600000022060220601f060000001a0601a0601a060000001d0601d0601c0601b060
00120000000000000007060070600000000000000000000006060060600706007060000000000008060080600806008060070600706000000000000000000000060600606007060070600f0600f0600806008060
001200001a060000001f060000000000000000000000000026060000002b060000000000000000000000000032060000003706000000000000000000000000000000000000000000000000000000003506036060
001200000f0600f0600706007060000000000000000000000606006060070600706000000000000a0600a06000000000000706007060000000000000000000000606006060070600706007060070600000000000
001200003706037060370600000000000000000000000000000000000034060000003506000000310600000030060000002b06000000000000000000000000000000000000280600000029060000002506000000
001200000a0600b0600c0600c060000000000000000000000b0600b0600c0600c06000000000000d0600d0600d0600d06016060140600c0600c060000000000000000000000b0600b0600c0600c0600000000000
0012000024060000001f060000000000000000000000000000000000001f06000000200602006022060200601f0600000024060000002b0600000000000000002b06000000300600000037060000003806000000
001200000d0600d0600d0600d06016060140600c0600c060000000000000000000000b0600b0600c0600c06000000000000d0600d0600d0600d06016060140600c0600c060000000000000000000000b0600b060
00120000390600000036060000003206000000000000000000000000002d0602d0602a0602a06026060260602706027060270602706027060270602706027060270602706022060240602206021060000001f060
001200000c0600c0600c0600c06000000000000d0600d0600e0600e0600e0600e060020600206002060020600e0600e0600e0600e060020600206002060020600f0600f0600f0600f06002060020600206002060
001200000000021060210602606026060000000000000000000002d0602d060320603206000000000002d0602d060300603006030060300603006030060300603006000000000002e060300602e0602d06000000
00010000195500b5500955008550085500855009550095500a5500a5500b5500c5500d5500f550115501355000000000000000000000000000000000000000000000000000000000000000000000000000000000
001200000f0600f0600f0600f06002060020600206002060110601106011060110600206002060020600206011060110601106011060020600206002060020600f0600f0600f0600f06002060020600206002060
d401100023375203551f3551d3751d3551e3551f3552235025355293502d350333501b0001b0001c0001d0001f000210002200022000000000000000000000000000000000000000000000000000000000000000
001200002b060000002d0600000032060000000000000000000000000000000000000000000000000002d06032060360603706037060370603706037060370603706037060000000000037060000003906000000
000200002965021630136301e63012620126301322017630176300b6301361012110116100d1100a6100a61008610106000d60004600116000e6001160012600116000a600066000960003600026000260002600
001200000f0600f0600f0600f060020600206002060020600e0600e0600e0600e060020600206002060020600e0600e0600e0600e060020600206002060020600f0600f0600f0600f06002060020600206002060
001200003a060000003c0603c0603c0603c0603c0603c0603c0603c06000000000003a0600000039060000003706000000390600000036060000003306000000320600000030060000002e060000002d06000000
001200003006000000190601906019060190600000000000180601806019060000001906000000000000000025060250602406024060240602406000000000002306023060240600000024060000000000000000
001200002406024060250602506025060250600000000000240602406025060000002506000000000000000031060310603006000000300600000000000000002506025060240600000024060000000000000000
9001000024650276502c6503365038650396503b6503e6503f6503f6503d6503b6503865010650006502465021650000000000000000000000000000000000000000000000000000000000000000000000000000
0012000019060190601806000000180600000000000000000d0600d0600c060000000c06000000000000000000060000000000000000000000000000000000000000000000000000000000000000000000000000
00120000000000000000000000001a060000001f06000000260600000024060000002206000000210600000022060000001f0601f0601f0601f0601f0601f0601f0601f0601f0600000000000000000000000000
0012000000000000000000000000250600000031060000000000000000000000000031060000003d060000000000000000000000000000000000001f060000000000000000220602206022060000000000000000
001200000000000000260600000032060000000000000000000000000032060000003e06000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0012000024060000002506025060260600000022060220601f060000001a0601a0601a060000001d0601d0601c0601b0601a060000001f060000000000000000000000000026060000002b060000000000000000
001200000000000000320600000037060000000000000000000000000000000000000000000000000000000035060360603706037060370600000000000000000000000000000000000034060000003506000000
000100001f1002a10028100281003a100261502a1502c1502d1502f150321503315035150351003510033100301002c100271002e1002a100211001b1003f100376003d1003c1003810035100311001f6002d100
00120000310600000030060000002b0600000000000000000000000000000000000028060000002906000000250600000024060000001f060000000000000000000000000000000000001f060000002006020060
0012000022060200601f0600000024060000002b0600000000000000002b06000000300600000037060000003806000000390600000036060000003206000000000000000000000000002d0602d0602a0602a060
d4010000166351663016640166401564013630126301263012630286002d60032600316002f6002960024600246001060025600286001a6002b6000d6002e60030600336002e6002960025600266002a6002b600
0012000026060260602706027060270602706027060270602706027060270602706022060240602206021060000001f0600000021060210602606026060000000000000000000002d0602d060320603206000000
00120000000002d0602d060300603006030060300603006030060300603006000000000002e060300602e0602d060000002b060000002d0600000032060000000000000000000000000000000000000000000000
00120000000002d060320603606037060370603706037060370603706037060370600000000000370600000039060000003a060000003c0603c0603c0603c0603c0603c0603c0603c06000000000003a06000000
0012000039060000003706000000390600000036060000003306000000320600000030060000002e060000002d060000003006000000190601906019060190600000000000180601806019060000001906000000
00010000313502c35029340233401e34018330133300e3300a3300833005330043300233000330003300000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001200000000000000250602506024060240602406024060000000000023060230602406000000240600000000000000002406024060250602506025060250600000000000240602406025060000002506000000
0012000000000000003106031060300600000030060000000000000000250602506024060000002406000000000000000019060190601806000000180600000000000000000d0600d0600c060000000c06000000
00120000000000000000060000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001a060000001f06000000260600000024060000002206000000
00120000210600000022060000001f0601f0601f0601f0601f0601f0601f0601f0601f06000000000000000000000000000000000000000000000025060000003106000000000000000000000000003106000000
00120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000260600000032060000000000000000000000000032060000003e060000000000000000
001200003d060000000000000000000000000000000000001f06000000000000000022060220602206000000000000000024060000002506025060260600000022060220601f060000001a0601a0601a06000000
001200001d0601d0601c0601b0601a060000001f060000000000000000000000000026060000002b0600000000000000000000000000320600000037060000000000000000000000000000000000000000000000
00120000000000000035060360603706037060370600000000000000000000000000000000000034060000003506000000310600000030060000002b060000000000000000000000000000000000002806000000
001200002906000000250600000024060000001f060000000000000000000000000000000000001f06000000200602006022060200601f0600000024060000002b0600000000000000002b060000003006000000
0012000037060000003806000000390600000036060000003206000000000000000000000000002d0602d0602a0602a0602606026060270602706027060270602706027060270602706027060270602206024060
001200002206021060000001f0600000021060210602606026060000000000000000000002d0602d060320603206000000000002d0602d060300603006030060300603006030060300603006000000000002e060
__music__
00 01024040
00 01034040
00 01034040
00 04400405
00 06400607
00 08084040
00 09094040
00 0a400a40
00 0b400b0c
00 010d4040
02 01034040
01 0f400f40
00 10401040
00 11401240
00 13401440
00 15401640
00 17401840
00 19401a40
00 1b401d40
00 1f402140
00 22404040
00 23404040
00 24404040
00 26404040
00 27404040
00 28294040
00 2a404040
00 2b404040
00 2d404040
00 2e404040
00 30404040
00 31404040
00 32404040
00 33404040
00 35404040
00 36404040
00 37404040
00 38394040
00 3a404040
00 3b404040
00 3c404040
00 3d404040
02 3e404040
00 3f404040
00 00404040
00 00404040
00 00404040
00 00404040
00 00404040
00 00404040
00 00294040
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
00 00004040
04 00404040

