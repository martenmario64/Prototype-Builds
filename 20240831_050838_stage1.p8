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
    player.x=24
    player.y=316
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
if matimer <5 then
 matimer = 5
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
	 elseif matimer > 1 and not lbu then
	  player.acc=0.4 / 2
	  sfx(47)
	 elseif matimer < -10 and not lbu then
	  player.acc=0.5 / 2
	  sfx(47)
	 else
	  sfx(47)
	 end
 if player.y <64 then
  mahuy=0
 elseif player.y >266 then
  mahuy=200
 else
  mahuy=player.y-64
 end
 if state == "game" then
    if btn(🅾️) and not player.grab then
  matimer-=0.2 / 2
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
   
   print("\n        select a pizza guy\n\n         press 🅾️ to swap\n             clothes",7)
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
   if btnp(🅾️) then
    cloth+=1
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

         pal(10,sc)
   pal(9,cc)
   pal(15,skc) 
   pal(10,sc)
   spr(hs,cam_x+13,mahuy,2,2)
   --spr(player.sp,player.x,player.y,1,1,player.flip)
   pal(10,10)
   pal(10,sc)
   pal(9,cc)
   pal(15,skc)
   spr(117,24,80)
   pal(10,10)
   pal(9,9)
   pal(15,15)
   spr(239,cam_x,mahuy)
   --spr(rank,cam_x+30,mahuy+1)
   sspr((75 % 16) * 8,flr(75 / 16) * 8,16,16, cam_x+100,mahuy+1,22,18,player.filp)
   print(" " .. flr(coins),cam_x+99,mahuy+7,1,0,0)
  if combotimer > 0 then
  
   pal(7,11)
   sspr((75 % 16) * 8,flr(75 / 16) * 8,16,16, cam_x+100,mahuy+1,22,18,player.filp)
print(" combo\n x " .. flr(combo),cam_x+97,mahuy+5,1,0,0)

pal()
  end
  combotimer-=0.3
  if player.colorpal == 1 then
   if btn(🅾️) and matimer > -10 and pepstate == 0 and heatmeter < 8 and player.running then
	   hs=186
	  elseif btn(🅾️) and matimer < -10 and pepstate == 0 and heatmeter < 8 and player.running then
	   hs=184
	  elseif pepstate == 1 then
	   hs=78
	  else
	   hs=188
	  end
  else
	  if btn(🅾️) and pepstate == 0 and matimer >-10 then
	   hs=105
	  elseif btn(🅾️) and pepstate == 0 and matimer < -10 then
	   hs=80

	  elseif pepstate == 1 then
	   hs=68
	  else
	   hs=103
	  end

end
  if not lbu and not player.running and btn(⬆️) and tt > 0 and player.landed and not btn(⬅️) and not btn(➡️) then
  ---sfx(44)
  spr(83,player.x+4,player.y-4,1,1,0)
  spr(83,player.x-4,player.y-4)
  spr(83,player.x+4,player.y+4,1,1,1,1)
  spr(83,player.x-4,player.y+4,1,1,false,1)
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
     hs=68
    else
     hs=78
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
  
  if not tr then
   spr(99,56,112,2,1)
   spr(190,56,120,2,2)
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
    ttimer-=0.1 / 5
    coins-=0.1 / 2
   end
   --print(player.wall)
	 elseif waittime>0 then
	  camera(0,0)
	  cls(1)
	  
	  print("loading...",90,120,7)
	 end
  	      if matimer > 10 then
	  spr(47,cam_x,mahuy+13)
	  spr(47,cam_x+8,mahuy+13)
	  spr(47,cam_x+16,mahuy+13)
	  spr(47,cam_x+24,mahuy+13)
	  spr(47,cam_x+32,mahuy+13)
  elseif matimer > 9 then
   pal(8,10)
	  spr(46,cam_x,mahuy+13)
	  pal(8,8)
	  spr(47,cam_x+8,mahuy+13)
	  spr(47,cam_x+16,mahuy+13)
	  spr(47,cam_x+24,mahuy+13)
	  spr(47,cam_x+32,mahuy+13)
	 elseif matimer > 7 then
	  pal(8,10)
	  spr(46,cam_x,mahuy+13)
	  pal(8,8)
	  pal(8,9)
	  spr(46,cam_x+8,mahuy+13)
	  pal(8,8)
	  spr(47,cam_x+16,mahuy+13)
	  spr(47,cam_x+24,mahuy+13)
	  spr(47,cam_x+32,mahuy+13)
	 elseif matimer > 5 then
	  pal(8,10)
	  spr(46,cam_x,mahuy+13)
	  pal(8,8)
	  pal(8,9)
	  spr(46,cam_x+8,mahuy+13)
	  pal(8,8)
	  pal(8,13)
	  spr(46,cam_x+16,mahuy+13)
	  pal(8,8)
	  spr(47,cam_x+24,mahuy+13)
	  spr(47,cam_x+32,mahuy+13)
	 elseif matimer > 3 then
	  pal(8,10)
	  spr(46,cam_x,mahuy+13)
	  pal(8,8)
	  pal(8,9)
	  spr(46,cam_x+8,mahuy+13)
	  pal(8,8)
	  pal(8,13)
	  spr(46,cam_x+16,mahuy+13)
	  pal(8,8)
	  pal(8,12)
	  spr(46,cam_x+24,mahuy+13)
	  pal(8,8)
spr(47,cam_x+32,mahuy+13)
	 elseif matimer > -500 then
   pal(8,10)
	  spr(blink,cam_x,mahuy+13)
	  pal(8,8)
	  pal(8,9)
	  spr(blink,cam_x+8,mahuy+13)
	  pal(8,8)
	  pal(8,13)
	  spr(blink,cam_x+16,mahuy+13)
	  pal(8,8)
	  pal(8,12)
	  spr(blink,cam_x+24,mahuy+13)
	  pal(8,8)
	  spr(blink,cam_x+32,mahuy+13)
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
	  print(flr(ttimer),cam_x+70,mahuy+120,7)
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
  load("stagehub")
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
 
  if not btn(⬆️) and not lbu and not player.wall and not lbu and btn(⬅️) or btn(🅾️) and player.flip == true then
  player.dx-=acc
  player.running=true
  player.flip=true
 end
 if not btn(⬆️) and not lbu and not player.wall and not lbu and btn(➡️) or btn(🅾️) and player.flip == false then
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
                       if player.sp>223 or player.sp < 221 then
          player.sp=221
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
000000000aaaaaaa000000000aaaaaaa0aaaaaaa0aaaaaaa0aaaaaaa000000000aaaaaaa00000000666166660001111100000000000000000000000000000000
0000000011141f100000000011141f1011141f1011141f1011141f100000000011141f1000000000666166660017777700000000000000000000000000000000
00000000014ffff000000000014ffff0014ffff0014fffff014ffff000000000014ffff000000000111111110177777700000000000000000000000000000000
0000000011177f700000000011177f7011177f7011177f7f11177f70000000001f177f7f00000000666666160177777700000000000000000000000000000000
0000000001a111a00000000001f111f001a111a0f1a111a001a111a00000000000a111a000000000666666160177777700000000000000000000000000000000
0000000001faaaf00000000000aaaaa101faaaf0f0aaaaa100ffaaaf0000000000aaaaa100000000111111111777777700000000000000000000000000000000
0000000000aaaaa00000000001aaaaa100aaaaa001aaaaa100aaaaa00000000001aaaaa100000000666166661777777700000000000000000000000000000000
00000000001101100000000001100000001101100100000000111110000000000110000000000000111111111777777700000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000004444440000111112221222200000000dddddddd000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000ff1f1f0001777772221222200000000dddddddd000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000ff1f1f0017777771111111100000000dddddddd000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000081f8887017777772222221200000000dddddddd0000aa00000aa00000000000
00000000000000000000000000000000000000000000000000000000000000007f1111f0017777772222221200000000dddddddd000a1aa000a1aa0000000000
000000000000000000000000000000000000000000000000000000000000000000f88f00177777771111111100000000dddddddd00aaaa000aaaa00000000000
0000000000000000000000000000000000000000000000000000000000000000000ff000177777772221222200000000dddddddd0aaaaaa0aaaaaa0000000000
000000000000000000000000000000000000000000000000000000000000000007700770177777771111111100000000ddddddddaaaaaaaaaaaaaaaa00000000
00000000000000000000000000000000bbbbbbbb7777717700000000444444441777777166666666222122226777777600000000000000000880000007700000
00000000000000000000000000000000bbbbbbbb6666616600000000999999991777777155555555222122226777777600000000000000000888800007777000
00000000000000000000000000000000bbbbbbbb6666616600000000000880001777777100000000111111111177771100000000000000000888888007777770
00000000000000000000000000000000bbbbbbbb1111111100000000000880001777777100000000222222126677771600000000000000000888888807777777
00000000000000000000000000000000bbbbbbbb6166666600000000000000001777777100000000222222126677771600000000000000000888888107777771
00000000000000000000000000000000bbbbbbbb6166666600000000000000001777777100000000111111111117711100000000000000000888811007777110
00000000000000000000000000000000bbbbbbbb6166666600000000000000001777777100000000222122226667766600000000000000000881100007711000
00000000000000000000000000000000bbbbbbbb1111111100000000000000001777777100000000111111111111111100000000000000000110000001100000
000000004444444400000000000000000000000022222222d0d0d0d0000000000000000000888800008888000088880000000900001111000000000000000000
0000000099999999000000000000000000000000222222220d0d0d0d088800000000000002828880028888800288288000009900015555100000000000000000
00000000d0d0d0d000000000000000000000000022222222d0d0d0d0088888000000000002888880028282800288888000099900015555100000000000000000
000000000d0d0d0d000000000000000000000000222222220d0d0d0d0888888800000000028882800288888002882880019dd190015555100000000000000000
00000000d0d0d0d000000000000000000000000022555525d0d0d0d0088888880000000002888880028888800288888001191190015555100000000000000000
000000000d0d0d0d000000000000000000000000256666560d0d0d0d08888811000000000022220000222200002222000999dd90015555100000000000000000
00000000d0d0d0d000000000677777770000000056666666d0d0d0d0088111000000000000000000000000000000000009111190015555100000000000000000
000000000d0d0d0d000000006666666600000000566666660d0d0d0d011000000000000000000000000000000000000009911990015555100000000000000000
77777777111110000111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
77777777777771001414414100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
77777777777777101414414100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
77777777777777101414414100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
7777777777777710141441410000000000000000000000000000000000000000000000004fffffffffffffff0000000000000000000000000000000000000000
7777777777777771141441410000000000000000000000000000000000000000000000004fffffffffffffff0000000000000000000000000000000000000000
7777777777777771141441410000000000000000000000000000000000000000000000004fffffffffffffff0000000000000000000000000000000000000000
77777777777777710111111000000000000000000000000000000000000000000000000004444444444444440000000000000000000000000000000000000000
00000000000000007777777777000007000000000000000066666666000000006661666600000000011111100000000000000000000000000000000000000000
00000000000000001111111177700077000000000000000066666666000000006661666600000000155551510000000000000000000000000000000000000000
00000000000000000000000007770777000000000000000066666666000000001111111100000000155551510000000000000000000000000000000000000000
00000000000000000000000000777777000000000000000066666666000000006666661600000000111111110000000000000000000000000000000000000000
000000000000000000000000007777770000000000000000666666660000000066666616fffffff4151555510000000000000000000000000000000000000000
000000000000000011111111000777770000000000000000666666660000000011111111fffffff4151555510000000000000000000000000000000000000000
000000000000000077777777077777770000000000000000666666660000000066616666fffffff4151555510000000000000000000000000000000000000000
00000000000000007777777777777777000000000000000066666666000000001111111144444440011111100000000000000000000000000000000000000000
0000000000000000166666660000000000000000fffffff922212222000001111111100000000111111110000000000000000000000000000004400000000000
0000000000000000166666760000000000000000ffffffff2221222200001aaaaaaa100000001aaaaaaa10000044440000000000000000000044440000000000
00000000000000001666666600000000000000009fffff9f111111110111aaaa1a1a10000111aa1aaaa100000444444000000000000bb0000014440000000000
0000000000000000166666660000000000000000ffffffff222222121aaaaaa1777100001aaaaaa1771100000444444000000000008888000041410000000000
0000000000000000166666660000000000000000fff999ff222222121aaaaa17777710001aaaaaa7777710000041410000000000088181800044440000000000
0000000000000000166666660000000000000000ff99ffff111111111aaa1477717771001aaa1477717771000044440009aa1a10088888800044440000000000
0000000000000000166666660000000000000000f99fffff2221222201111477177771000111147717777100001441000aa9aaa0008888000044440000000000
00000000000000001111111100000000000000009ffffff91111111111441477777771001144147777777100011001100aaaaaa00bb00bb00440044000000000
00000000000000000000000000000000000440000000000000000000014444474f774100014444474f7741000000000000000000000000000000000000000000
00000000000000000000000000000000000440000000000000033000114ffff14f41f10011444ff14f41f1000000000000000000000000000000000000000000
0000000000000000000000000000000000044000000000000009a0000014ffff4ff4ff100014f7774ff47f100000000000000000000000000000000000000000
000000000000000000000000000000000009900000000000009a9a00001f11114ff41110001f77774ff477100000000000000000000000000000000000000000
00000000000000000000000000000000000990000000000000a1a1000014ffff4ff4ff100014f7774ff47f100000000000000000000000000000000000000000
00aaaa000000000000000000000000000004400000000000009a9a00000144fff44fff1000014ffff44fff100000000000000000000000000000000000000000
1a1aaaa000000000000000000000000000044000000000000019a100000011444444410000001144444441000000000000000000000000000000000000000000
1a11ffff000000000000000000000000000440000000000001100110000000111111100000000011111110000000000000000000000000000000000000000000
a000000000000000000000a0a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a00000000000000000000000000000000000000000a0727272a0a1a1a1a0000000000000
00000000a0a1a1a1a07272720000a000000000000000000000a0a1a1a1a0a0a0a0a0a0a0a00000000000000000000000000000a0a1a1a1a1a1a1a1a1a1a1a1a1
a00000000000000000000000a0a1a1a1a1a1a1a1a1a1a1a1a1a1a1a0000000000000000023000000230000000000000000a0000000a0a1a1a1a0000000000000
00000000a0a1a1a1a00000000000a000000000000000000000a0a1a1a1a1a1a1a1a1a1a1a00000000000000000000000000000a0a1a1a1a1a1a1a1a1a1a1a1a1
a0000000000000000000000000a0a1a1a1a1a1a1a1a1a1a1a1a1a000000000000000a0a0a0a0a0a0a0a0a0000000000000a0727272a0a1a1a1a0000000000000
00000000a0a1a1a1a00000000000a000000000000000000000a0a1a1a1a1a1a1a1a1a1a1a07200000000000000000000000000a0a1a1a1a1a1a1a1a1a1a1a1a1
a000b00414000000000000000000a0a1a1a1a1a1a1a1a1a1a1a00000000000000000a0a1a1a1a1a1a1a1a0000000000000a0000000a0a1a1a1a0000000000000
00000000a0a1a1a1a000000000000000230000000000000000a0a1a1a1a1a1a1a1a1a1a1a0000000000000000000000000000000a0a1a1a1a1a1a1a1a1a1a1a1
a00004040400000000000000000000a0a0a0a0a0a0a0a0a0a0000000000000000000a0a1a1a1a1a1a1a1a0000000000000a0727272a0a1a1a1a0000000000000
00000000a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0000000000000a0a1a1a1a1a1a1a1a1a1a1a000000000000000000000000000000000a0a1a1a1a1a1a1a1a1a1a1
a0000404040000000000000000000047000047000047000047000000000000000000a0a1a1a1a1a1a1a1a00000000000004300b100a0a1a1a1a0000000000000
00000000000000000000000000000000000000000032323232a0a1a1a1a1a1a1a1a1a1a1a072000000000000000000000000000000a0a1a1a1a1a1a1a1a1a1a1
a0000404040000000000000000000047000047000047000047000000000000000000a0a1a1a1a1a1a1a1a000000000000043007200a0a1a1a1a0000000000000
00000000000000000000000000000000000000000000000000a0a1a1a1a1a1a1a1a1a1a1a000000000000000000000000000000000a0a1a1a1a1a1a1a1a1a1a1
a0000404040000d000d000d0002300470000470000470000470000002300d0d0d000a0a1a1a1a1a1a1a1a000000000230043000000a0a1a1a1a0000023002300
23002300000000000000230000000023000000000000230000a0a1a1a1a1a1a1a1a1a1a1a000000000000000000000000000000000a0a1a1a1a1a1a1a1a1a1a1
a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a1a1a1a1a1a1a1a0a0a0a0a0a0a0a0a0a0a0a0a1a1a1a0a0a0a0a0a0a0
a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a1a1a1a1a1a1a1a1a1a1a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a1a1a1a1a1a1a1a1a1a1
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
65656565000000000000006565656565000000000000006565656565000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
65656565656565656565656565656565656565656565656565656565000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
65656565656565656565656565656565656565656565656565656565000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
65656565656565656565656565656565656565656565656565656565000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
65656565656565656565656565656565656565656565656565656565000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
65656565656565656565656565656565656565656565656565656565000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
65656565656565656565656565656565656565656565656565656565000000000000000000000000000000000000000000000000000000000000000000770077
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000700007
65656565656565656565656565656565656565656565656565656565000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
65656565000000000000006565656565000000000000006565656565000000000000000000000000000000000000000000000000000000000000000000700007
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000770077
__label__
66616666444444444444444444444444222222222222222222222222222222222222222266616666222122222221222222ddddddddddddddddddddd122212222
666166669999999999999999999999992222227777222222222222222222222222222222666166662221222222212222dd222227771117777777777d11212222
111111112228822222288222222882222222273337722222222222222222222222222222111111111111111111111111dd222227771117777777777d11111111
666666162228822222288222222882222222773773772222222222222222222222222222666666162222221222222212dd277777777771117777777d11222212
666666162222222222222222222222222222773773772222222222222222222222222222666666162222221222222212dd277777777777744411122d11222212
111111114442222222222222222222222222773773772222222222222222222222222222111111111111111111111111dd277777777777744411122d11111111
666166664242222222222222222222222222773773772222222222222222222222222222666166662221222222212222dd222771777777774411122d11212222
111111114242222222222222222222222222273337722222222222222222222222222222111111111111111111111111dd222117777117774444111d11111111
666166664242222222222222222222222222227777222222222222222222222222222222666166662221222222212222dd222117777117774444111d11212222
64ffffff4442ffffffffffffffffffff4222222222222222222222222222222222222222666166662221222222212222dd222771777117774411144d11212222
14ffffffffffffffffffffffffffffff4222222222222222222222222222222222222222111111111111111111111111dd222771777117774411144d11111111
64ffffffffffffffffffffffffffffff4222222222222222222222222222222222222222666666162222221222222212dd222771777117774411144d11222212
664444444444444444444444444444442222222222222222222222222222222222222222666666162222221222222212dd222777777777774411444d11222212
111111112222222222222222222222222222222222222222222222222222222222222222111111111111111111111111dd222777777777774411444d11111111
666166662222222222222222222222222222222222222222222222222222222222222222666166662221222222212222dd222771777777774444444d11212222
111111112222222222222222222222222222222222222222222222222222222222222222111111111111111111111111dd222771777777774444444d11111111
666166662222222222222222222222222222222222222222222222222222222222222222666166662221222222212222dd222114ff7777744444444d11212222
666166662222222222222222222222222222222222222222222222222222222222222222666166662221222222212222dd222224fff114444444fffd11212222
111111112222222222222222222222222222222222222222222222222222222222222222111111111111111111111111dd222224fff114444444fffd11111111
666666162222222222222222222222222222222222222222222222222222222222222222666666162222221222222212dd222224fff77111fffffffd11222212
66666616222222222222222222222222222222222222222222222222222222222222222266666616222222122222221222ddddddddddddddddddddd122222212
11111111222222222222222222222222222222222222222222222222222222222222222211111111111111111111111111ddddddddddddddddddddd111111111
66616666222222222222222222222222222222222222222222222222222222222222222266616666222122222221222222212222222122222221222222212222
11111111222222222222222222222222222222222222222222222222222222222222222211111111111111111111111111111111111111111111111111111111
66616666666666666666666666666666222222222222222222222222222222222222222266616666222122222221222222212222222122222221222222212222
66616666666666666666666666666666222222222222222222222222222222222222222266616666222122222221222222212222222122222221222222212222
11111111666666666666666666666666222222222222222222222222222222222222222211111111111111111111111111111111111111111111111111111111
66666616666666666666666666666666222222222222222222222222222222222222222266666616222222122222221222222212222222122222221222222212
66666616666666666666666666666666222222222222222222222222222222222222222266666616222222122222221222222212222222122222221222222212
11111111666666666666666666666666222222222222222222222222222222222222222211111111111111111111111111111111111111111111111111111111
66616666666666666666666666666666222222222222222222222222222222222222222266616666222122222221222222212222222122222221222222212222
11111111666666666666666666666666222222222222222222222222222222222222222211111111111111111111111111111111111111111111111111111111
66616666666166666661666666616666666166666661666666616666666166666661666666616666222122222221222222212222222122222221222222212222
66616666666166666661666666616666666166666661666666616666666166666661666666616666222122222221222222212222222122222221222222212222
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
66666616666666166666661666666616666666166666661666666616666666166666661666666616222222122222221222222212222222122222221222222212
66666616666666166666661666666616666666166666661666666616666666166666661666666616222222122222221222222212222222122222221222222212
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
66616666666166666661666666616666666166666661666666616666666166666661666666616666222122222221222222212222222122222221222222212222
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
22212222222122222221222222212222222122222221222222212222222122222221222222212222222122222221222222212222222122222221222222212222
22212222222122222221222222212222222122222221222222212222222122222221222222212222222122222221222222212222222122222221222222212222
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
22222212222222122222221222222212222222122222221222222212222222122222221222222212222222122222221222222212222222122222221222222212
22222212222222122222221222222212222222122222221222222212222222122222221222222212222222122222221222222212222222122222221222222212
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
22212222222122222221222222212222222122222221222222212222222122222221222222212222222122222221222222212222222122222221222222212222
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
66616666666166666661666666616666666166666661666666616666666166666661666666616666666166662221222222212222222122222221222222212222
66616666666166666661666666616666666166666661666666616666666166666661666666616666666166662221222222212222222122222221222222212222
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
66666616666666166666661666666616666666166666661666666616666666166666661666666616666666162222221222222212222222122222221222222212
66666616666666166666661666666616666666166666661666666616666666166666661666666616666666162222221222222212222222122222221222222212
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
66616666666166666661666666616666666166666661666666616666666166666661666666616666666166662221222222212222222122222221222222212222
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
66616666666666666666666666666666666666666666666666666666666666666666666666666666666666666661666622212222222122222221222222212222
66616666666666666666666666666666666666666666666666666666666666666666666666666666666666666661666622212222222122222221222222212222
11111111666666666666666666666666666666666666666666666666666666666666666666666666666666661111111111111111111111111111111111111111
66666616666666666666666666666666666666666666666666666666666666666666666666666666666666666666661622222212222222122222221222222212
66666616666666666666666666666666666666666666666666666666666666666666666666666666666666666666661622222212222222122222221222222212
11111111666666666666666666666666666666666666666666666666666666666666666666666666666666661111111111111111111111111111111111111111
66616666666666666666666666666666666666666666666666666666666666666666666666666666666666666661666622212222222122222221222222212222
11111111666666666666666666666666666666666666666666666666666666666666666666666666666666661111111111111111111111111111111111111111
66616666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666616666222122222221222222212222
66616666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666616666222122222221222222212222
11111111666666666666666666666666666666666666666666666666666666666666666666666666666666666666666611111111111111111111111111111111
66666616666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666616222222122222221222222212
66666616666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666616222222122222221222222212
11111111666666666666666666666666666666666666666666666666666666666666666666666666666666666666666611111111111111111111111111111111
66616666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666616666222122222221222222212222
11111111666666666666666666666666666666666666666666666666666666666666666666666666666666666666666611111111111111111111111111111111
66616666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666166662221222222212222
66616666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666166662221222222212222
11111111666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666111111111111111111111111
66666616666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666162222221222222212
66666616666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666162222221222222212
11111111666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666111111111111111111111111
66616666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666166662221222222212222
11111111666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666111111111111111111111111
66616666666666666661111177777777111116666666666666666666666666666666666666666666666666666666666666666666666666666661666622212222
66616666666666666617777777777777777771666666666666666666666666666666666666666666666666666666666666666666666666666661666622212222
11111111666666666177777777777777777777166666666666666666666666666666666666666666666666666666666666666666666666661111111111111111
66666616666666666177777777777777777777166666666666666666666666666666666666666666666666666666666666666666666666666666661622222212
66666616666666666177777777777777777777166666666666666666666666666666666666666666666666666666666666666666666666666666661622222212
11111111666666661777777777777777777777716666666666666666666666666666666666666666666666666666666666666666666666661111111111111111
66616666666666661777777777777777777777716666666666666666666666666666666666666666666666666666666666666666666666666661666622212222
11111111666666661777777777777777777777716666666666666666666666666666666666666666666666666666666666666666666666661111111111111111
66616666666666667777777777777777777777772222222222222222222222222222222222222222222222226666666666666666666666666666666666616666
66616666666666667777777777777777777777772222222222222222222222222222222222222222222222226666666666666666666666666666666666616666
11111111666666667777777777777777777777772222222222222222222222222222222222222222222222226666666666666666666666666666666611111111
66666616666666667777777777777777777777772222222222222222222222222222222222222222222222226666666666666666666666666666666666666616
66666616666666667777777777777777777777772222222222222222222222222222222222222222222222226666666666666666666666666666666666666616
11111111666666667777777777777777777777772222222222222222222222222222222222222222222222226666666666666666666666666666666611111111
66616666666666667777777777777777777777772222222222222222222222222222222222222222222222226666666666666666666666666666666666616666
11111111666666667777777777777777777777772222222222222222222222222222222222222222222222226666666666666666666666666666666611111111
66616666222222227777777777777777777777772222222222222222222222222222222222222222222222222222222222222222222222222222222222244222
66616666222222227777777777777777777777772222222222222222222222222222222222222222222222222222222222222222222222222222222222244222
11111111222222227777777777777777777777772222222222222222222222222222222222222222222222222222222222222222222222222222222222244222
66666616222222227777777777777777777777772222222222222222222222222222222222222222222222222222222222222222222222222222222222299222
66666616222222227777777777777777777777772222222222222222222222222222222222222222222222222222222222222222222222222222222222299222
11111111222222227777777777777777777777772222222222222222222222222222222222222222222222222222222222222222222222222222222222244222
66616666222222227777777777777777777777772222222222222222222222222222222222222222222222222222222222222222222222222222222222244222
11111111222222227777777777777777777777772222222222222222222222222222222222222222222222222222222222222222222222222222222222244222
66616666222222227777777777777777777777772222222222222222222222222222222222222222222222222222222222222222222222222222222222244222
66616666222222227777777777777777777777772222222222222222222222222222222222222222222222222222222222222222222222222222222222244222
11111111222222227777777777777777777777772222222222222222222222222222222222222222222222222222222222222222222222222222222222244222
66666616222222227777777777777777777777772222222222222222222222222222222222222222222222222222222222222222222222222222222222299222
66666616222222227777777777777777777777772222222222222222222222222222222222222222222222222222222222222222222222222222222222299222
11111111222222227777777777777777777777772222222222222222222222222222222222222222222222222222222222222222222222222222222222244222
66616666222222227777777777777777777777772222222222222222222222222222222222222222222222222222222222222222222222222222222222244222
11111111222222227777777777777777777777772222222222222222222222222222222222222222222222222222222222222222222222222222222222244222
66616666222222227777777777777777777777772222222777777722228888222222222222888822222222222288882222222222222222222222222222244222
666166662222222277777777777777777777777722222211141f1222228288822222222222828882222222222282888222222222222222222222222222244222
1111111122222222777777777777777777777777222222214ffff222228888822222222222888882222222222288888222222222222222222222222222244222
666666162222222277777777777777777777777722222211177f72222288828222222222228882822222222222888282222222222222222222222222aa299222
66666616222222227777777777777777777777772222222171117222228888822222222222888882222222222288888222222222222222222222222a1aa99222
111111112222222277777777777777777777777722222221f777f22222222222222222222222222222222222222222222222222222222222222222aaaa244222
666166662222222277777777777777777777777722222222177712222222222222222222222222222222222222222222222222222222222222222aaaaaa44222
11111111222222227777777777777777777777772222222211211222222222222222222222222222222222222222222222222222222222222222aaaaaaaa4222
66616666666166666661666666616666666166666661666666616666666166666661666666616666666166666661666666616666666166666661666666616666
66616666666166666661666666616666666166666661666666616666666166666661666666616666666166666661666666616666666166666661666666616666
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
66666616666666166666661666666616666666166666661666666616666666166666661666666616666666166666661666666616666666166666661666666616
66666616666666166666661666666616666666166666661666666616666666166666661666666616666666166666661666666616666666166666661666666616
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
66616666666166666661666666616666666166666661666666616666666166666661666666616666666166666661666666616666666166666661666666616666
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111

__gff__
0000000000000000000041080010000000000000000000001008410020000000000000000000004008454100000000000040008000000000210000000020000008084100000000000000000000000000000000000000000010001000000000000000100000411000000000000000000000000000100000000002000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a1a1a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a1a1a1a1a1a1a1a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a1a1a1a1a1a1a1a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a
0a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a1a1a0a00000000000000000000000000000a1a1a1a1a1a1a1a0a00000000000000000000000000000000000000000000000a1a1a1a1a1a1a1a0a00000000000000000a0000000000000a00000000000000000a
0a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a1a1a0a00000000000000000000000000000a1a1a1a1a1a1a1a0a00000000000000000000000000000000000000000000000a1a1a1a1a1a1a1a0a00000000000000000a0000000000000a00000000000000000a
0a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a1a1a0a00000000000000000000000000000a1a1a1a1a1a1a1a0a00000000000000000000000000000000000000000000000a1a1a1a1a1a1a1a0a00000000000000000a0000000000000a00000000000000000a
0a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a1a1a0a00000000000000000000000000000a1a1a1a1a1a1a1a0a00000000000000000000000000000000000000000000000a1a1a1a1a1a1a1a0a00000000000000000a0000000000000a00000000000000000a
0a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a1a1a0a00000000000000000000000000000a1a1a1a1a1a1a1a0a00000000000000000000000000000000000000000000000a1a1a1a1a1a1a1a0a0000000000000000740000000000007400000000000000000a
0a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a1a1a0a00000000000000000000000000000a1a1a1a1a1a1a1a0a00000000000000000000000000000000000000000000000a1a1a1a1a1a1a1a0a0000000000000000740000000000007400000000000000000a
0a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a1a1a0a00000000000000000000000000000a1a1a1a1a1a1a1a0a00000000000000000000000000000000000000000000000a1a1a1a1a1a1a1a0a0000000000000000740000000000007400000000000000000a
0a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a1a1a0a00000000000000000000000000000a0a0a0a0a0a0a0a0a00000000000000000000000000000000000000000000000a1a1a1a1a1a1a1a0a000000000a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0000270a
0a0000000000000032000000323232323200323300001800320000180032000018003232323232000000005a586666580000000a0a0a0a00000d0d0d0d0d5a5a5a5a5a5a5a5a5a000032000000003300003200000d0d0d0d0d0d0d0000000a1a1a1a1a1a1a1a0a000000000a1a1a1a1a0a000000000000000000000a0000000a
0a00000000000a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a272727270a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0000000a0a0a0a0a0a0a0a0a000000000a1a1a1a1a0a000000000000000000000a0000000a
0a00000000000a1a1a0a000000000000000000000000000a00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a0a00000000000000000000000a000000000a1a1a1a1a0a000000000000000000000a0000000a
0a00000000000a1a1a0a000000000000000000000000000a00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a0a00000000000000000000000a000000000a0a0a0a0a0a000000000000000000000a0000000a
0a00000000000a0a0a0a000000000000000000000000000a00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a0a00000000000000000000000a000000005a5a5a5a5a5a00000d0d0000000000000a0000000a
0a00000000000a00000a000000000000000000000000000a0000000000000000000a0a0a0a0a0a0a0a0a00000000000000000000000000000000000000000000000000000a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a0a00000000000000000000000a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a000000000a0000000a
0a00000000000a00000a000000000000000000000000000a0000000000000000000a1a1a1a1a1a1a1a0a00000000000000000000000000000000000000000000000000000a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a00000000000000000000000000000000000000000000000000000000000000000a0000000a
0a000d0d0d00001c001b000000000000000000000000000a0000000000000000000a1a1a1a1a1a1a1a0a00000000000000000000000000000000000000000000000000000a00000000000000000000000000000000000000000a0a00000000000000000000000000000000000000000000000000000000000000000a0000000a
0a0a0a0a0a0a0a0a0a0a002727003200000000000000000a0000000000000000000a1a1a1a1a1a1a1a0a00000000000000000000000000000000000000000000000000000a00000000000000000000000000000000000000000a0a00000000000000000000000000000000000000000000000000000000000000000a0000000a
0a00000000000000000a000000002727003200000000000a0000000000000000000a1a1a1a1a1a1a1a0a00000000000000000000000000000000000000000000000000000a00000000000000000000000000000000000000000a0a00000000000000000000000000000000000000000000000000000000000000000a0000000a
0a00000000000000000a000000000000002727003200000a0000000000000000000a1a1a1a1a1a1a1a0a00000000000000000000000000000000000000000000000000000a00000000000000000000000000000000000000000a0a000000000d0d0d0d0d0d0d0d0d0d0000003232323232323232320000000000000a0000000a
0a00000000000000000a0d0d0d0d0d0000000000272700340000000d0d0d0000000a1a1a1a1a1a1a1a0a000000000000000d0d0d0d0000320000323232320000180000000a00000000000000000000000000000000000000000a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0000000a
0a00000000000033000a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a1a1a1a1a1a1a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0000000000000000000000000000000000000000000000000a0000000000000a1a1a1a1a1a1a1a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0000000a
0a000000000a0a0a0a0a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a0a000000000000000000000000000000000034000000000000000000000a0000000000000000000000000000000000000000000000000a000000000000000a1a1a1a1a1a0a00000000000000000000000000000a0a0000000a
0a00000000000000000a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a0a00000000000000000000000000000000000034000000000000000000000a0000000000000000000000000000000000000000003300000a00000000000000000a0a0a0a0a0000000000000000000000000000000a0a0000000a
0a00000000000000000a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a0a0000000000000000000000000000000000000034000000000000000000000a00000000000000000000000000000000000000000a0a0a0a0a000000000000000000000000000000000000000000000000000000000a0a0000000a
0a27272700000000000a1a1a1a1a1a1a1a1a1a1a1a1a1a1a0a0a0a0a0a0a0a0a0a0a0a0a0a000000000000000000000000000000000000000034000000000000000000000a00000000000000000000000000000000000000000a0a0a0a0a000000000000000000000000000000000000000000000000000000000a0a0000000a
0a000000000000000058666666666666666666666666665800000000000000000000000000000000000000000000000a0a0a0000000000000034000000000000000000000a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a
0a0000000000000000586666666666666666666666666658000000000000000000000000000000000000000000000000000a0000000000000034000000000000000000000a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a
0a0000000000000000586666666666666666666666666658000033000000000000000000000000000000000000000000000a0000000000000034000000000000000000000a00000000000000000000000d0d0d0d0d0d00003232320000000000000000000000000000000000000000000000000000000000000000000000000a
0a0a0a0a0a0a0a0a0a0a1a1a1a1a1a1a1a1a1a1a1a1a1a1a0a0a0a0a0a00000000000000000000000000000000000000000a0d0d0d0d0d0d0d34000000000000000000000a0a0a0a0a27272700000a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0000000000000000000000000000000000000000000000320000320000320000000a
1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a0a00000000000000000000000000000000000000000a2727270a0a0a0a0a000000000000000000000a1a1a1a0a00000000000a000000000000000000000a1a1a1a0a000000000000000000000000000d0d0d00000000000a0a0a0a0a0a0a0a0a0a0a0a0a
0a0a0a0a0a0a0a0a0a0a0a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a0a00000000000000000000000000000000000000000a0000000a1a1a1a0a000000000000000000000a1a1a1a0a00000000000a000000000000000000000a1a1a1a0a000d0d0d0d0d0000000000000a0a0a0a0a000000000a1a1a1a1a1a1a1a1a1a1a1a1a
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

