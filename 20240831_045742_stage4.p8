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
  heatmeteractive=true
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
    player.x=40
    player.y=64
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
  
  print("  combo!",cam_x+96,mahuy+34,2)
  print(combo,cam_x+95,mahuy+34,2)
  
   spr(60,cam_x+94+combotimer,mahuy+21)
  end
  
    score=tostring(flr(coins))
    digit_color={8,11,14,7,8,2,9}
    digit_v_offset={0,0,0,0,0,0,0}
    char2={2,3,2,6,2,2,5}
    if heatmeter < 10 then
    for c=1, #score do
      local char = sub(score,c,c)
      print(char,cam_x+6+c*4,mahuy+5,char2[c])
      print(char,cam_x+5+c*4,mahuy+5,digit_color[c])
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
  pset(starx[i]-strszes[i].x,stary[i]+strszes[i].y,15)
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
000000000aaaaaaa000000000aaaaaaa0aaaaaaa0aaaaaaa0aaaaaaa000000000aaaaaaa0b44444bddd2dddd000111118666666600000000000000000aaaaa00
0000000011141f100000000011141f1011141f1011141f1011141f100000000011141f1004bbabb4ddd2dddd0017777711141f10000000000000000080a1a100
00000000014ffff000000000014ffff0014ffff0014ffff0014ffff000000000014ffff0048ebe842222222201777777014ffff7000000000000000008117f00
0000000011177f700000000011177f7011177f7011177f7f11177f70000000001f177f7f0be8a8ebdddddd2d0177777711177f7700000000777000000f1111f0
0000000001a111a000aaaaa001f111f001a111a0f1a111a001f111a00000000000a111a004bb4bb4dddddd2d017777774466666600000000777700009affff00
0000000001faaaf00f17f71f00aaaaa101faaaf000aaaaa100aaaaa00000000000aaaaa104aabaa42222222217777777446666040000000077777000079a9a90
00000000001aaa1001a111a101aaaaa1001aaa1001aaaaa100aaaaa00000000001aaaaa1004bab40ddd2dddd17777777886666600000000077777000000aaaaa
0000000000110110001101100110000000110110010000000011111000000000011000000004b40022222222177777778666066600000000777777770000aaaa
000000000000000000000000000000000000000000000000000000000000000004444440000111115552555500006000dddddddd000000000000000010100000
00000000077177770771777700000000000000000771777707717777077177770ff1f1f0001777775552555500066600dddddddd00000000000000000aaa0000
0000000011141f1011141f10077177770771777711141f1011141f1011141f100ff1f1f0017777772222222200007000dddddddd00000000000000000aaaaa00
00000000014ffff0014ffff011141f1011141f1f014ffff0014ffff0014ffff0081f8887017777775555552500007000dddddddd0000aa00000aa0000a1aaaa0
0000000011177f7011177f70014ffff0014ffff011177f7011177f7011177f707f1111f0017777775555552500007000dddddddd000a1aa000a1aa0000141f10
000000000171117f017111701117717011177710017111f1117111701171117000f88f00177777772222222200066600dddddddd00aaaa000aaaa00000177f70
000000001f7777700177717101111111011111100177777111777770f1777770000ff000177777775552555506666666dddddddd0aaaaaa0aaaaaa000001ffff
00000000107777000f1111110f111100f01111000f0000000f0000f00000000f07700770177777772222222266666666ddddddddaaaaaaaaaaaaaaaa0000ffff
0aaa1aa00aaa1aa00aaa1aa000000000bbbbbbbb777771770aaaaaa0aaaaaaaa1777777166666666555255556777777607717777777177700000000000000000
011141f1001141f1001141f100000000bbbbbbbb66666166000a1a100aaaa0001777777155555555555255556777777611141f1011141f100000000000000000
0014ffff0114ffff0014ffff00000000bbbbbbbb66666166000ffff000a0000017777771000000002222222211777711014fffff014ffff00ddddddddddddd10
f11177f7f11177f7f11177f700000000bbbbbbbb1111111100f11170000000001777777100000000555555256677771611111110111111ffd1114ff7711111d1
001a1110001a1110001a111000000000bbbbbbbb6166666600f1100000000000177777710000000055555525667777160177111101771110d1111155511111d1
00aaaaa000aaaaa000aaaaa000000000bbbbbbbb6166666697a9a90000000000177777710000000022222222111771110077777100777710d1111111111111d1
011aaa1000a111a0011aa11000000000bbbbbbbb6166666699aaaa0000000000177777710000000055525555666776660077771000777771d1111111111111d1
01001110001110000110011000000000bbbbbbbb111111119a9a900000000000177777710000000022222222111111110000001100000000d4111881881114d1
000000004444444400000000000000000000000022222222d0d0d0d000000000000000000088880000888800008888000000090000111100df4188888884f9d1
0000000099999999000000000000000000000000222222220d0d0d0d00000000000000000282888002888880028828800000990001555510d9aff44444ffa9d1
00044000d0d0d0d000000000000000000000000022222222d0d0d0d000000000000000000288888002828280028888800009990001555510daaa9fffff9aaad1
000aa0000d0d0d0d000000000000000000000000222222220d0d0d0d0000000000000000028882800288888002882880019dd19001555510daaa99aaa99aaad1
000aaa00d0d0d0d000000000000000000000000022555525d0d0d0d000000000000000000288888002888880028888800119119001555510daaaaaaaaaaaaad1
00aaaa000d0d0d0d000000000000000000000000256666560d0d0d0d00000000000000000022220000222200002222000999dd9001555510d9aaaaaaaaaaa9d1
0aa99aa0d0d0d0d000000000677777770000000056666666d0d0d0d000000000000000000000000000000000000000000911119001555510d9aaaaaaaaaaa9d1
aa0990aa0d0d0d0d000000006666666600000000566666660d0d0d0d000000000000000000000000000000000000000009911990015555100ddddddddddddd10
7777777711111000011111100aa1aaaa00000d100000011d007777000000000000000000000000000000000000000000000000000000000a0077770000777700
77777777777771001414414111141f100000000ddddd1000072222700000000000000000000000000000000000000000000000000000000a0733377007bbbb70
777777777777771014144141014ffff00ddddddddddddd1077277727000000000000000000000000000000000ddddddddddddd100000000a773773777b7777b7
77777777777777101414414111177f70d77dd666666886d17722227700000000000000000000000000000000d4111444444114d10000000a773773777b777777
777777777777771014144141011f11afd77dd66d66667dd17727777756111111111111114fffffffffffffffd4444144441781d10000000a773773777b777777
77777777777777711414414100aaaaa0d77ddd141d66d1d17727777756100000100000004fffffffffffffffd4477814118777d10000000a773773777b7777b7
77777777777777711414414101aaaaa0d77dd74f2446ddd10727777056111111111111114fffffffffffffffd4877774477778d10000000a0733377007bbbb70
77777777777777710111111001001000d776d7ff4ff677d10077770005555555555555550444444444444444d4777174471777d10000000a0077770000777700
00000000000000007777777777000007dd76d67f77f477d15555555500000000666166660000000001111110d4777774477778d1007777000666660000777700
00000000000000001111111177700077d476d77f7744d7d15555555500000000666166660000000015555151df48784444877fd1077773306606066007ccc770
0ddddddddddddd100000000007770777d4d6d6ff4ff467d15555555500000000111111110000000015555151dffff14ff41fffd1777772276660666077c77c77
d2221717177777d10000000000777777d2d666fffff4ddd15555555500000000666666160000000011111111dfffff4ff4ffffd1777722276606066077ccc777
d2221171717712d10000000000777777d6d1d6ffff4d6dd1555555551111116566666616fffffff415155551dfffff4ff4ffffd1722222770666660077c77c77
d2221717111111d11111111100077777d6226d6444466dd1555555551000016511111111fffffff415155551dfffff4ff4ffffd1722227770000000077c77c77
d222ff14444112d17777777707777777d44446d6dd666dd1555555551111116566616666fffffff415155551dfffff4ff4ffffd1072277700000000007ccc770
d22ff471777ff2d177777777777777770ddddddddddddd1055555555555555501111111144444440011111100ddddddddddddd10007777000000000000777700
d24f422f111ff2d1166666660000000000000000fffffff955515555000000000000000000000000000000000000000000000000000000000004400000777700
d244222f1111ffd1166666760000000000000000ffffffff55515555000000000000000000000000000000000044440000000000000000000044440007788770
d2222222f111ffd11666666600000000000000009fffff9f111111110ddddddddddddd100ddddddddddddd100444444000000000000bb0000014440077877877
d2222222f111ffd1166666660000000000000000ffffffff55555515d2226611777777d1d7717771777777d10444444000000000008888000041410077877877
d222222888111fd1166666660000000000000000fff999ff55555515d2666666116666d1d2771717777112d10041410000000000088181800044440077888877
d222222888881fd1166666660000000000000000ff99ffff11111111d2666777744112d1d2277177771111d10044440009aa1a10088888800044440077877877
d222222288888fd1166666660000000000000000f99fffff55515555d2261777774112d1d2271417771112d1001441000aa9aaa0008888000044440007877870
0ddddddddddddd101111111100000000000000009ffffff911111111d2217771774411d1d2271417774411d1011001100aaaaaa00bb00bb00440044000777700
00000000000000000000000000000000000440000000000000000000d2271771774114d1d2277f77774412d10aaaa1aa0aaaaaaa0aa1aaaa0000000000aaaa00
00000000000011100000000000010100000440000000000000033000d2271771774114d1d2274f417f1111d111114f1011141f1011141f10aaaaaaa00a9999a0
0aa1aaaaa01f7a1011111100001111a000044000000000000009a000d2277777774144d1d2274ff477f121d10114fff00f4ffff0014ffff001f14111a9aaaa9a
11141f10a0fffa101aaf1110011141a00009900000000000009a9a00d2271777774444d1d22774ff477f11d111a11a111f177f7011177f700ffff410a99999aa
014ffff0a01f7f1017f771110117f410000990000000000000a1a100d1214f77744444d1d227774f477f11d111aaaa1101111110f1a11a11222a7111aaaaaa9a
11177f71a14f71100ffff41001f7f10a0004400000000000009a9a00d1114ff14444ffd1d2211114111f11d1f0aaaa0ff0aaaaa000aaaaf1222a1110a9aaaa9a
0111faa10a14111001f1411101afff0a00044000000000000019a100d1114ff711ffffd1d2277777777f11d100aaaa0000aaaaa0011aaa001f1faa000a9999a0
001111110a111100aaaa1aa001a7f10a0004400000000000011001100ddddddddddddd100ddddddddddddd100110011001100011010001101a1aaa0000aaaa00
a0000000000000000000000032a0a0a0a0a032000000a0a0a0a00000000000000000000000000000000000a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0
a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a000a0
a0000000000000000000000000a0a0a0a0a00000d000a0a0a0a0000000000000000000d0d0d0d0d0000000a0a0a0a0a0a0a0a0a0a0a000000000000000000000
000000000000000000a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a000a0
a0000000000000000000000000a0a0a0a0a000000000a0a0a0a0000000000000000000d0d0d0d0d0000000a0a0a0a0a0a0a0a0a0a0a000000000000000000000
000000000000000000a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a032a0
a0000000000000000000000032a0a0a0a0a03200000000000000000000a00000000032a0a0a0a0a0000000a0a0a0a0a0a0a0a0a0a0a000000000000000000000
000000000000000000a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a000a0
a0000000000000000000000000a0a0a0a0a00000000000000000000000a00000000000a0a0a0a0a0000000a0a0a0a0a0a0a0a0a0a0a000000000000000000000
d0d0d0000000000000a0a0a0a0a0a0a0a0a0a0a0a0a0a00000000000a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a000a0
a00000a0a0a0a0a0a000000000a0a0a0a0a00000000000000000000000a000000000000000000000000000a0a0a0a0a0a0a0a0a0a0a000000000000000000000
000000000000000000a0a0a0a0a0a0a0a0a0a0d0d0d0d0d0d000000000a0a0a0000000000000000000000000000000000000000000000000a0a0a0a0a0a000a0
a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a000000000000000000000000000a0a0a0a0a0a0a0a0a0a0a0000000000000000032a0
a0a0a0a03200000000a0a0a0a0a0a0a0a0a0a0d0d0d0d0d0d000000000a0a0a0000000000000000000000000000000000000000000000000a0a0a0a0a0a032a0
a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a032000000000000000000000000a0a0a0a0a0a0a0a0a0a0a0000000000000000000a0
a0a0a0a00000000000a0a0a0a0a0a0a0a0a0a0d0d0d0d0d0d000000000a0a0a0000000000000000000000000000000000000000000000000a0a0a0a0a0a000a0
a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a000000000000000230000000000a0a0000000000000000000000000000000000000a0
a0a0a0a00000000000a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a000000000a0a0a00000000000000000000000000000000000000000000000000000a0a0a0a000a0
a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a00000000000a0a0a0a0a0000000a0a0000000000000000000000000000000000032a0
a0a0a0a03200000000a0a0a0a000000000000000000000000000000000a0a0a00000000000000000000000000000000000000000000000d0000000a0a0a000a0
a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a00000000000a0a0a0a0a0000000000000002300000000d0d0d00000000000000000a0
a0a0a0a00000000000a0a0a0a00000000000000000000000000000a0a0a0a0a000000000000000000000000000000000000000000000d000000000a0a0a032a0
a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a00000000000000000a0
a0a0a0a00000000000a0a0a0a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a0a0a000a0
a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a000000000000032a0
a0a0a0a03200000000a0a0a0a000000000000000000000000000000000000000000000000000002300000000000000000000000000000000a00000a0a0a000a0
a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0000000000000a0
a0a0a0a000000000000000000000000000d0a0a0a0a0a0a0d00000000000000000000000a0a0a0a0a0a0000000000000000000a0a0a00000a00000a0a0a000a0
a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a00000000000a0
a0a0a0a0000000000000000000230000d000a0a0a0a0a0a000d000002300000000000000a0a0a0a0a0a0000000002300a0a0a0a0a0a00000a00000a0a0a032a0
a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0
a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a00000a0a0a000a0
a1a2a2a2a100000000000000a1a2a2a2a100000000000000a1a2a2a2a1a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0
a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a00000a0a0a000a0
a1a2a2a2a100000000000000a1a2a2a2a100000000000000a1a2a2a2a1a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0
a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a00000a0a0a000a0
a1a2a2a2a100000000000000a1a2a2a2a100000000000000a1a2a2a2a1a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0
a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a00000a0a0a032a0
a1a2a2a2a100000000000000a1a2a2a2a100000000000000a1a2a2a2a1a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0
a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0000000000000a0000000000000000000000000000000000000000000a0000000a00000a0a0a000a0
a1a2a2a2a100000000000000a1a2a2a2a100000000000000a1a2a2a2a1a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0
a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0000000000000a000000000000000000000000000000000000000000000000000a00000a0a0a000a0
a1a2a2a2a100000000000000a1a2a2a2a100000000000000a1a2a2a2a1a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0
a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0000000000000a000000000000000000000000000000000d0000023000000d000a00000a0a0a000a0
a1a2a2a2a100000000000000a1a2a2a2a100000000000000a1a2a2a2a1a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0
a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0000000000000a0000000000000000000000000000032323232323232a0a0a0a0a00000a0a0a032a0
a1a2a2a2a100000000000000a1a2a2a2a100000000000000a1a2a2a2a1a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0
a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0000000000000a00000000000000000000000000000000000000000000000000000000000000000a0
a1a2a2a2a100000000000000a1a2a2a2a100000000000000a1a2a2a2a1a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0
a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0000033000000000000000023000023000023000000000000000000000000000000000000000000a0
a1a2a2a2a100000000000000a1a2a2a2a100000000000000a1a2a2a2a1a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0
a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a032323232a0a0a0a0
a1a2a2a2a100000000000000a1a2a2a2a100000000000000a1a2a2a2a1a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0
a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a070707070a0a0a0a0
a1a2a2a2a100000000000000a1a2a2a2a100000000000000a1a2a2a2a1a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0
a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0
a1a2a2a2a100000000000000a1a2a2a2a100000000000000a1a2a2a2a1a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0
a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0
a1a2a2a2a100000000000000a1a2a2a2a100000000000000a1a2a2a2a1a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0
a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0
a1a2a2a2a100000000000000a1a2a2a2a100000000000000a1a2a2a2a1a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0
a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0
a1a2a2a2a100000000000000a1a2a2a2a100000000000000a1a2a2a2a1a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0
a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0
__label__
ddd2ddddddd2ddddddd2ddddddd2ddddddd2ddddddd2ddddddd2ddddddd2ddddddd2ddddddd2ddddddd2ddddddd2ddddddddddddddddddddddddddd1ddd2dddd
ddd2ddddddd2ddddddd2ddddddd2ddddddd2dd7777d2ddddddd2ddddddd2ddddddd2ddddddd2ddddddd2ddddddd2dddddd222226661117777777777d11d2dddd
222222222222222222222222222222222222277773322222222222222222222222222222222222222222222222222222dd222226661117777777777d11222222
dddddd2ddddddd2ddddddd2ddddddd2ddddd77777227dd2ddddddd2ddddddd2ddddddd2ddddddd2ddddddd2ddddddd2ddd266666666661116666666d11dddd2d
dddddd2ddddddd2ddddddd2ddddddd2ddddd77772227dd2ddddddd2ddddddd2ddddddd2ddddddd2ddddddd2ddddddd2ddd266666777777744411122d11dddd2d
222222222888222222222222222222222222722222772222222222222222222222222222222222222222222222222222dd266666777777744411122d11222222
ddd2ddddd8282dddddd2ddddddd2ddddddd272222777ddddddd2ddddddd2ddddddd2ddddddd2ddddddd2ddddddd2dddddd222661777777774411122d11d2dddd
222222222828222222222222222222222222272277722222222222222222222222222222222222222222222222222222dd222117777117774444111d11222222
ddd2dddd5828255555555555555555555555557777222222222222222222222222222222222222225555555555555555dd222117777117774444111d11555555
d4fffffff8882fffffffffffffffffff4555555522222222222222222222222222222222222222225555555555555555dd222771777117774411144d11555555
24ffffffffffffffffffffffffffffff4555555522222222222222222222222222222222222222225555555555555555dd222771777117774411144d11555555
d4ffffffffffffffffffffffffffffff4555555522222222222222222222222222222222222222225555555555555555dd222771777117774411144d11555555
dd4444444444444444444444444444445555555522222222222222222222222222222222222222225555555555555555dd222777777777774411444d11555555
256111111111111176111111111111165555555522222222222222222222222222222222222222225555555555555555dd222777777777774411444d11555555
d561dddd5155555666655555515555165555555522222222222222222222222222222222222222225555555555555555dd222771777777774444444d11555555
256111111111111666611111111111165555555522222222222222222222222222222222222222225555555555555555dd222771777777774444444d11555555
dd5555555555555566555555555555555555555522222222222222222222222222222222222222225555555555555555dd122114ff7777744444444d11555555
ddd2dddd5555555555555555555555555555555522222222222222222222222222222222222222225555555555555555dd111114fff114444444fffd11555555
227722775555555555555555555555555555555522222222222222222222222222222222222222225555555555555555dd111114fff114444444fffd11555555
dd7ddd275555555555555555555555555555555522222222222222222222222222222222222222225555555555555555dd111114fff77111fffffffd11555555
dddddd2d555555555555555555555555555555552222222222222222222222222222222222222222555555555555555555ddddddddddddddddddddd155555555
22222222555555555555555555555555555555552222222222222222222222222222222222222222555555555555555555ddddddddddddddddddddd155555555
dd72ddd7555555555555555555555555555555552222222222222222222222222222222222222222555555555555555555555555555555555555555555555555
22772277555555555555555555555555555555552222222222222222222222222222222222222222555555555555555555555555555555555555555555555555
ddd2dddd555555555555555555555555555555552222222222222222222222222222222222222222555555555555555555555555555555555555555555555555
ddd2dddd555555555555555555555555555555552222222222222222222222222222222222222222555555555555555555555555555555555555555555555555
22222222555555555555555555555555555555552222222222222222222222222222222222222222555555555555555555555555555555555555555555555555
dddddd2d555555555555555555555555555555552222222222222222222222222222222222222222555555555555555555555555555555555555555555555555
dddddd2d555555555555555555555555555555552222222222222222222222222222222222222222555555555555555555555555555555555555555555555555
22222222555555555555555555555555555555552222222222222222222222222222222222222222555555555555555555555555555555555555555555555555
ddd2dddd555555555555555555555555555555552222222222222222222222222222222222222222555555555555555555555555555555555555555555555555
22222222555555555555555555555555555555552222222222222222222222222222222222222222555555555555555555555555555555555555555555555555
ddd2dddd555555555555555555555555222111117777777711111222222222222222222222222222222222225555555555555555555555555555555555555555
ddd2dddd555555555555555555555555221777777777777777777122222222222222222222222222222222225555555555555555555555555555555555555555
22222222555555555555555555555555217777777777777777777712222222222222222222222222222222225555555555555555555555555555555555555555
dddddd2d555555555555555555555555217777777777777777777712222222222222222222222222222222225555555555555555555555555555555555555555
dddddd2d555555555555555555555555217777777777777777777712222222222222222222222222222222225555555555555555555555555555555555555555
22222222555555555555555555555555177777777777777777777771222222222222222222222222222222225555555555555555555555555555555555555555
ddd2dddd555555555555555555555555177777777777777777777771222222222222222222222222222222225555555555555555555555555555555555555555
22222222555555555555555555555555177777777777777777777771222222222222222222222222222222225555555555555555555555555555555555555555
ddd2dddd555555555555555555555555777777777777777777777777222222222222222222222222222222225555555555555555555555555555555555555555
ddd2dddd555555555555555555555555777777777777777777777777222222222222222222222222222222225555555555555555555555555555555555555555
22222222555555555555555555555555777777777777777777777777222222222222222222222222222222225555555555555555555555555555555555555555
dddddd2d555555555555555555555555777777777777777777777777222222222222222222222222222222225555555555555555555555555555555555555555
dddddd2d555555555555555555555555777777777777777777777777222222222222222222222222222222225555555555555555555555555555555555555555
22222222555555555555555555555555777777777777777777777777222222222222222222222222222222225555555555555555555555555555555555555555
ddd2dddd555555555555555555555555777777777777777777777777222222222222222222222222222222225555555555555555555555555555555555555555
22222222555555555555555555555555777777777777777777777777222222222222222222222222222222225555555555555555555555555555555555555555
ddd2dddd555555555555555555555555777777777777777777777777222222222222222222222222222222225555555555555555555555555555555555555555
ddd2dddd555555555555555555555555777777777777777777777777222222222222222222222222222222225555555555555555555555555555555555555555
22222222555555555555555555555555777777777777777777777777222222222222222222222222222222225555555555555555555555555555555555555555
dddddd2d555555555555555555555555777777777777777777777777222222222222222222222222222222225555555555555555555555555555555555555555
dddddd2d555555555555555555555555777777777777777777777777222222222222222222222222222222225555555555555555555555555555555555555555
22222222555555555555555555555555777777777777777777777777222222222222222222222222222222225555555555555555555555555555555555555555
ddd2dddd555555555555555555555555777777777777777777777777222222222222222222222222222222225555555555555555555555555555555555555555
22222222555555555555555555555555777777777777777777777777222222222222222222222222222222225555555555555555555555555555555555555555
ddd2dddd555555555555555555555555777777777777777777777777222222222222222222222222222222225555555555555555555555555555555555555555
ddd2dddd555555555555555555555555777777777777777777777777222222222222222222222222222222225555555555555555555555555555555555555555
22222222555555555555555555555555777777777777777777777777222222222222222222222222222222225555555555555555555555555555555555555555
dddddd2d555555555555555555555555777777777777777777777777222222222222222222222222222222225555555555555555555555555555555555555555
dddddd2d555555555555555555555555777777777777777777777777222222222222222222222222222222225555555555555555555555555555555555555555
22222222555555555555555555555555777777777777777777777777222222222222222222222222222222225555555555555555555555555555555555555555
ddd2dddd555555555555555555555555777777777777777777777777222222222222222222222222222222225555555555555555555555555555555555555555
22222222555555555555555555555555777777777777777777777777222222222222222222222222222222225555555555555555555555555555555555555555
ddd2dddd555555555555555555555555777777777777777777777777222222222222222222222222222222225555555555555555555555555555555555555555
ddd2dddd5555555555555555555555557777777711141f1777777777222222222222222222222222222222225555555555555555555555555555555555555555
2222222255555555555555555555555577777777714ffff777777777222222222222222222222222222222225555555555555555555555555555555555555555
dddddd2d5555555555555555555555557777777711177f7777777777222222222222222222222222222222225555555555555555555555555555555555555555
dddddd2d555555555555555555555555777777777171117777777777222222222222222222222222222222225555555555555555555555555555555555555555
222222225555555555555555555555557777777771f777f777777777222222222222222222222222222222225555555555555555555555555555555555555555
ddd2dddd555555555555555555555555777777777717771777777777222222222222222222222222222222225555555555555555555555555555555555555555
22222222555555555555555555555555777777777711711777777777222222222222222222222222222222225555555555555555555555555555555555555555
ddd2dddd5555555555555555ddd2ddddddd2ddddddd2ddddddd2ddddddd2dddd2222222222222222222222225555555555555555ddd2ddddddd2ddddddd2dddd
ddd2dddd5555555555555555ddd2ddddddd2ddddddd2ddddddd2ddddddd2dddd2222222222222222222222225555555555555555ddd2ddddddd2ddddddd2dddd
22222222555555555555555522222222222222222222222222222222222222222222222222222222222222225555555555555555222222222222222222222222
dddddd2d5555555555555555dddddd2ddddddd2ddddddd2ddddddd2ddddddd2d2222222222222222222222225555555555555555dddddd2ddddddd2ddddddd2d
dddddd2d5555555555555555dddddd2ddddddd2ddddddd2ddddddd2ddddddd2d2222222222222222222222225555555555555555dddddd2ddddddd2ddddddd2d
22222222555555555555555522222222222222222222222222222222222222222222222222222222222222225555555555555555222222222222222222222222
ddd2dddd5555555555555555ddd2ddddddd2ddddddd2ddddddd2ddddddd2dddd2222222222222222222222225555555555555555ddd2ddddddd2ddddddd2dddd
22222222555555555555555522222222222222222222222222222222222222222222222222222222222222225555555555555555222222222222222222222222
ddd2ddddddd2ddddddd2ddddddd2dddd555255555552555555525555ddd2ddddddd2ddddddd2ddddddd2ddddddd2ddddddd2ddddddd2dddd5552555555525555
ddd2ddddddd2ddddddd2ddddddd2dddd555255555552555555525555ddd2ddddddd2ddddddd2ddddddd2ddddddd2ddddddd2ddddddd2dddd5552555555525555
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
dddddd2ddddddd2ddddddd2ddddddd2d555555255555552555555525dddddd2ddddddd2ddddddd2ddddddd2ddddddd2ddddddd2ddddddd2d5555552555555525
dddddd2ddddddd2ddddddd2ddddddd2d555555255555552555555525dddddd2ddddddd2ddddddd2ddddddd2ddddddd2ddddddd2ddddddd2d5555552555555525
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
ddd2ddddddd2ddddddd2ddddddd2dddd555255555552555555525555ddd2ddddddd2ddddddd2ddddddd2ddddddd2ddddddd2ddddddd2dddd5552555555525555
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
55525555555255555552555555525555555255555552555555525555555255555552555555525555555255555552555555525555555255555552555555525555
55525555555255555552555555525555555255555552555555525555555255555552555555525555555255555552555555525555555255555552555555525555
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
55555525555555255555552555555525555555255555552555555525555555255555552555555525555555255555552555555525555555255555552555555525
55555525555555255555552555555525555555255555552555555525555555255555552555555525555555255555552555555525555555255555552555555525
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
55525555555255555552555555525555555255555552555555525555555255555552555555525555555255555552555555525555555255555552555555525555
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
55525555555255555552555555525555555255555552555555525555555255555552555555525555555255555552555555525555555255555552555555525555
55525555555255555552555555525555555255555552555555525555555255555552555555525555555255555552555555525555555255555552555555525555
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
55555525555555255555552555555525555555255555552555555525555555255555552555555525555555255555552555555525555555255555552555555525
55555525555555255555552555555525555555255555552555555525555555255555552555555525555555255555552555555525555555255555552555555525
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
55525555555255555552555555525555555255555552555555525555555255555552555555525555555255555552555555525555555255555552555555525555
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
55525555555255555552555555525555555255555552555555525555555255555552555555525555555255555552555555525555555255555552555555525555
55525555555255555552555555525555555255555552555555525555555255555552555555525555555255555552555555525555555255555552555555525555
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
55555525555555255555552555555525555555255555552555555525555555255555552555555525555555255555552555555525555555255555552555555525
55555525555555255555552555555525555555255555552555555525555555255555552555555525555555255555552555555525555555255555552555555525
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
55525555555255555552555555525555555255555552555555525555555255555552555555525555555255555552555555525555555255555552555555525555
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
55525555555255555552555555525555555255555552555555525555555255555552555555525555555255555552555555525555555255555552555555525555
55525555555255555552555555525555555255555552555555525555555255555552555555525555555255555552555555525555555255555552555555525555
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
55555525555555255555552555555525555555255555552555555525555555255555552555555525555555255555552555555525555555255555552555555525
55555525555555255555552555555525555555255555552555555525555555255555552555555525555555255555552555555525555555255555552555555525
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
55525555555255555552555555525555555255555552555555525555555255555552555555525555555255555552555555525555555255555552555555525555
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
55525555555255555552555555525555555255555552555555525555555255555552555555525555555255555552555555525555555255555552555555525555
55525555555255555552555555525555555255555552555555525555555255555552555555525555555255555552555555525555555255555552555555525555
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
55555525555555255555552555555525555555255555552555555525555555255555552555555525555555255555552555555525555555255555552555555525
55555525555555255555552555555525555555255555552555555525555555255555552555555525555555255555552555555525555555255555552555555525
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
55525555555255555552555555525555555255555552555555525555555255555552555555525555555255555552555555525555555255555552555555525555
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222

__gff__
0000000000000000000041080010000000000000000000001008410420000000000000000000004008454100000000000040008002000002200000000020000008084100000000000000000000000000000000000200000000001000000000000000100000411000000000000000000000000000101000020000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a
0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a
0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a
0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a
0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a
0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a
0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a
0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a00000000000000000000000000000000000000000000000000000000000000000000000000000a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a
0a0a0a0a0a0a0000000a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0000000000000000000d0d0d0d0d0d0d0d0d0d0d0000000032323232323232323232000000000a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0000000000000000000000000000000a
0a0a0a0a0a00000000000a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a000000000000000a0a0a0a0a0a0a0a0a0a0a000000000000000a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a230a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0000000000000000000000000000000a
000000000000000000000a0000000a0000000a0000000000000a00000000000000000000000a0a0a0a0a0a0a0a0a0a000000000000000a00000a0a0a0a0a00000000000000000000000000000000000000000000000000000a000a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a00000a0a0a23000a0a0a0a0a0a0a0a0a
000000000000000000000000000000000000000000000000000000000000000d0d000000000a0a0a0a0a0a0a0a0a0a000000000000000a00000a0a0a0a0a00000000000000000000000000000000000000000000000000000a2300000000000000000000000000000000000000000000000000000a000000000000000000000a
000000000041000000000000000000000000000000000000000000000000000a0a000000000a0a0a0a0a0a0a0a0a0a000000000000000a00000a0a0a0a0a00000000000000000000000000000000000000000000000000000a0000000000000000000000000000000000000000000000000000000a230000000000000000000a
00001000005100000d0b0b0b0b0b000000003232000000000000000d0d00000a0a0a00000000000000000000000000000000000000000000000a0a0a0a0a230a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a00000a0000000000000000000000000000000000000000000000000000000a000000000000000000000a
0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a00000a0a0a0a0a000000000000000000000000000000000000000000000a0a0d0d0a00000000000d0d000000000000000d0d0d0d0d0d000000000000000a000d0d0d0d0d0d0000000a
0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a00000a0a0a0a0a230000000000000000000000000000000000000000000a0a0d0d0a232323232323232300002323230a0a0a0a0a0a0a0a0a0a0a0000000a0a0a0a0a0a0a0a0a00230a
0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0d0d0a0a0a0a0a000000000000000000000000000000000000000000000a0a0d0d0a000000000000000000000000000000000a0a0a0a0a0a0a0a0d0d0d0a000000000000000a00000a
0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0d0d0a0a0a0a0a00000032000000000000000000000032000000000d0d0a0a0d0d0a000000000000000000000000000000000a0a0a0a0a0a0a0a0d0d0d0a000000000000000a00000a
0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0d0d0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a232323232323230a0a0d0d0a000000230000000000000000000000000a0a0a0a0a0a0a0a0d0d0d0a000000000000000a00230a
0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0d0d0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a000000000000000a0a0d0d0a000000000000000000000000000000000a0a0a0a0a0a0a0a0d0d0d0a0000000d0d0d000a00000a
0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0d0d0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a000000000000000a0a0d0d0a000000000000000d0d0d0d0d0d0d00000d0d0d0d000a0a0a0d0d0d0a2300000a2323000a00000a
0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0d0d0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a230000000000000a0a0d0d0a0a0a000a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0d0d0d0a0000000a0000000a00230a
0a00003636363636363636363636363636363636363636363636363636360a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0000000000000a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a000000000000000a0a0d0d0a00002300000000000000000000000000000000000000000a0d0d0d0a0000000a0000000000000a
0a00000a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a230a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a000000000000000000000a0000000000000000000000232323232323230a0a0d0d0a00000000000000000000000000000000000000000000000a0d0d0d0a0000000a000d0d0d0d000a
0a0000000000000000000000000000000000000000000a0a0a0a0a0a0a000a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a00000000000000000000000000000000000000000000000000000a0a0d0d0a00000000000000003232000000000000000000000000000a0d0d0d0a2300000a0a0a0a0a0a0a0a
0a0000000000000000000000000000000000000000000a0a0a0a0a0a0a000a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0000000000000000000000000000000000230a0a0a0a0a0a0a0a0a0a0d0d0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a000a0d0d0d0a000000000000000000000a
0a0000000000000000000000000000000000000000000a0a0a0a0a0a0a230a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0000000000000000000000000000000000000a0a0a0a0a0a0a0a0a0a0d0d0a00000000000000000000000000000000000000000000230a0d0d0d0a000000000000000000000a
0a0000000000000000000000000000000000000000000a0a0a0a0a0a0a003636363636363636363636363636363636363636363636363636360a000000000d0d0d0d000000000000000032000a0a0a0a0a0a0a0a0a0a0d0d0a00000000000000000000000000000000000000000000000a0d0d0d0a000d0d0d0000000000000a
0a0000000000000000000000000000000000000000000a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a230a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0d0d0a0000000000000000000000000000320000000d000d00000a0d0d0d0a0a0a0a0a0a0a230000000a
0a0000000000000000000000000000000000000000000a0a0a0a0a0a0a0a000000000000000000000000000a0a0a0a0a0a0a0a0a0a0a0a0a000a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a000000000000000000000000000a0a0a0a0a0a000000000000420a0d0d0d0a0a0a0a0a0a0a000000000a
0a0000000000000000000000000000000000000000000a0a0a0a0a0a0a0a000000000000000000000000000a0a0a0a0a0a0a0a0a0a0a0a0a230a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0d0d0d0a0a0a0a0a0a0a000000000a
0a0000000000000000000000000000003200000000000a0a0a0a0a000000000000000000000000000000000a0a0a0a0a0a0a0a0a0a0a0a0a0036363636363636363636363636363636363636363636363636363636363636363636363636363636363636363636363636363636363636363636360a0a0a0a0a0a0a000000000a
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
000f00001e0401e0401e0401e0401e0401e04000000000001d0401d0401d0401d0401d0401d04000000000001e04020040200401e04020040200401e040200401e04020040210402204022040220402204000000
000f000000000000000000000000000000000000000000000000000000000000000000000000000000000000190401b0401b040190401b0401b040190401b040190401b0401c0401d0401d0401d0401d0401d040
000f0000000000f03016030170300f03016030190300f03016030170300f03016030190300f0301603017030160300f03016030170300f03016030190300f03016030170300f03016030190300f0301603017030
000f1a001e04019040160401e0401e04019040160401e0401d04014040190401d0401c04014040170401c0401b04014040160401b0401b0402004022040270402704027040014000140001400014000140001400
000f00000017000170000000017000170001700017000170001700000000170001700017000170001700017000000001700017000170001700017000170000000017000170001700017001170011700000001170
000f0000270602706027060270602706027060260602706024060240602406024060240602406024060240600000027060270602706027060270602706026060270602406024060240602406024060270602b060
000f00000117001170011700117001170000000117001170011700117001170011700000001170011700117001170011700117000000011700117001170011700317003170000000317003170031700317003170
000f00002c0602c0602c0602c0602c0602c0602b0602c0602906029060290602906029060290602906029060000002c0602c0602c0602c0602c0602c0602c0602c06000000300602e0602c060290602906029060
000f00000317000000031700317003170031700317003170000000317003170031700317003170031700000003170031700317003170011700117000000011700117001170011700117001170000000117001170
000f0000290602b0602b0602b0602b0602b0602b060290602b060270602706027060270602206027060290602b0602b0602b0602b0602b0602b0602b0602b060000002c0602c0602c0602c0602e0602e0602e060
000f00000117001170011700117001170000000117001170000000117001170011700117000000011700117000000011700017000170000000017000170001700017000170001700000000170001700017000170
000f00002e0602c0602c0602c0602c060290602b0602c0602e0602e0602e0602e0602b0602c0602e060310603106031060310603106031060310603106031060310603106031060310603106031060000001b060
000f00000017000170000000017000170001700017000170001700000000170001700017000170011700117000000011700117001170011700117001170000000117001170011700117001170011700000001170
000f00001b0601b0601b0601b0601b0601a0601b0601806018060180601806018060180601806018060000001b0601b0601b0601b0601b0601b0601a0601b06018060180601806018060180601b0601f06020060
000f00000117001170011700117001170000000117001170011700117003170031700000003170031700317003170031700317000000031700317003170031700317003170000000317003170031700317003170
000f000020060200602006020060200601f060200601d0601d0601d0601d0601d0601d0601d0601d060000002006020060200602006020060200602006020060000002406022060200601d0601d0601d0601d060
000f00000317000000031700317003170031700117001170000000117001170011700117001170011700000001170011700117001170011700117000000011700117001170000000117001170011700117001170
00010000195500b5500955008550085500855009550095500a5500a5500b5500c5500d5500f550115501355000000000000000000000000000000000000000000000000000000000000000000000000000000000
000f00001f0601f0601f0601f0601f0601f0601d0601f0601b0601b0601b0601b060160601b0601d0601f0601f0601f0601f0601f0601f0601f0601f060000002006020060200602006022060220602206022060
d401100023375203551f3551d3751d3551e3551f3552235025355293502d350333501b0001b0001c0001d0001f000210002200022000000000000000000000000000000000000000000000000000000000000000
000f00000117001170000003407000170340703b07039070001703507001170350703c0703a070011703407000170340703b0703907000170330703f070330703a070350703f0703407000170340703b07039070
000200002965021630136301e63012620126301322017630176300b6301361012110116100d1100a6100a61008610106000d60004600116000e6001160012600116000a600066000960003600026000260002600
000f0000200602006020060200601d0601f06020060220602206022060220601f0602006022060200602006020060200602006020060200602006020060200602006020060200602006020060000000000000000
000f0000001703507001170350703c0703a070011703407000170340703b07039070001703907000170051703c07001170061703507001170350703c0703a070011703607002170360703d0703b0700217035070
000f000001170350703c0703a070011703407000170340703b07039070001703507001170350703c0703a070011703607002170360703d0703b0700217037070001703e07038070001703f070390700517003170
000f00003a0700617001170001700017000000001700017000170001700017000170000000017000170001700017001170011700000001170011700117001170011700117000000011700117001170011703e070
9001000024650276502c6503365038650396503b6503e6503f6503f6503d6503b6503865010650006502465021650000000000000000000000000000000000000000000000000000000000000000000000000000
000f00003e070000003e0703e0703e0703e0703e0703e070000003e0703e0703e0703e07000170340703b0703c0703e0703b07000170340703b0703c0703e0703b07035070350700000035070350703507035070
000f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002406024060
000f00003507035070000003507035070350703507037070370700000037070370703707037070370703707000000370703707037070370703807038070000003807038070380703807038070380700000038070
000f0000240602406024060240602406024060240602406024060000002b06029060280602c0602c0602c0602c0602c0602c0602c0602c0602c0602c0602c06000000290602b0602c06029060290602906029060
000f00003807038070380703a0703a070000003a0703a0703a0703a0703a0703a070000003a0703a0703a0703a0703c0703c0703c070000003c0703c070000003c0703c0703c0703c070000003c0703c07000000
000f00002906029060290602906029060290602906029060290602906029060000002b0602b0602b0602b0602b0602b0602b0602b0602b0602b0602b0602b0602b0602b0602b060000002c0602c0602c0602c060
000100001f1002a10028100281003a100261502a1502c1502d1502f150321503315035150351003510033100301002c100271002e1002a100211001b1003f100376003d1003c1003810035100311001f6002d100
000f00003c0703c0703c0703c070000003c0703c070000003c0703c0703c0703c0703c0703c0703c0700017000170000000017000170001700017000170001700000000170001700017000170001700017000000
000f00002c0602c0602c0602c0602c0602c0602c060000002c0602b060290602e0602e0602e0602e0602e0602e0602e0602e0602e0602e0602e0602e0602e0602e0602e060000002f0602f0602f0602f0602f060
d4010000166351663016640166401564013630126301263012630286002d60032600316002f6002960024600246001060025600286001a6002b6000d6002e60030600336002e6002960025600266002a6002b600
000f00000017000170001700017000170001700000000170001700017000170011700117000000011700117001170011700117001170000000117001170011700117001170011700000001170011700117001170
000f00002f0602f0602f0602f0602f0602f060000002f0602e0602c06031060310603106031060310603106031060310603106031060310603106031060310603106000000330603306033060330603306033060
000f00000117001170000000117001170011700117003170031700000003170031700317003170031700317000000031700317003170031700317003170000000317003170031700317003170031700000003170
000f00003306033060330603306033060330603306033060330600000038060380603806038060380603806038060380603806038060380603806038060380602706027060270602706027060270602606027060
00010000313502c35029340233401e34018330133300e3300a3300833005330043300233000330003300000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000f00000317003170031700117001170000000117001170011700117001170011700000001170011700117001170011700117001170000000117001170000000117001170011700117000000011700117000000
000f000024060240602406024060240602406024060240600000027060270602706027060270602706026060270602406024060240602406024060270602b0602c0602c0602c0602c0602c0602c0602b0602c060
000f00000117000170001700000000170001700017000170001700017000000001700017000170001700017000170000000017000170001700017000170001700000000170001700017000170011700117000000
000f00002906029060290602906029060290602906029060000002c0602c0602c0602c0602c0602c0602c0602c06000000300602e0602c060290602906029060290602b0602b0602b0602b0602b0602b06029060
000f00000117001170011700117001170011700000001170011700117001170011700117000000011700117001170011700117001170000000117001170011700117003170031700000003170031700317003170
000f00002b060270602706027060270602206027060290602b0602b0602b0602b0602b0602b0602b0602b060000002c0602c0602c0602c0602e0602e0602e0602e0602c0602c0602c0602c060290602b0602c060
000f00000317003170000000317003170031700317003170031700000003170031700317003170031700317000000031700317003170031700117001170000000117001170011700117001170011700000001170
000f00002e0602e0602e0602e0602b0602c0602e060310603106031060310603106031060310603106031060310603106031060310603106031060000001b0601b0601b0601b0601b0601b0601a0601b06018060
000f00000117001170011700117001170000000117001170011700000001170011700117001170011700117001170000003407000170340703b07039070001703507001170350703c0703a070011703407000170
000f000018060180601806018060180601806018060000001b0601b0601b0601b0601b0601b0601a0601b06018060180601806018060180601b0601f0602006020060200602006020060200601f060200601d060
000f0000340703b0703907000170330703f070330703a070350703f0703407000170340703b07039070001703507001170350703c0703a070011703407000170340703b07039070001703907000170051703c070
__music__
00 01024040
00 01034040
00 01034040
00 04400405
00 06400607
00 08084040
00 09094040
00 0a400a40
00 0b400b4c
00 010d4040
02 01034040
01 0f104040
00 11124040
00 13144040
00 15164040
00 17184040
00 191a4040
02 1b1d4040
00 1f214040
00 22404040
00 23404040
00 24404040
00 26274040
00 28294040
00 2a2b4040
00 2d2e4040
00 30314040
00 32334040
00 35364040
00 37384040
00 393a4040
00 3b3c4040
00 3d3e4040
02 3f004040
00 00004040
00 00004040
00 00404040
00 00404040
00 00404040
00 00004040
00 00004040
00 00004040
00 00004040
00 00004040
00 00004040
00 40004040
00 40004040
04 40404040
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

