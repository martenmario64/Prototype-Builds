pico-8 cartridge // http://www.pico-8.com
version 42
__lua__

function _init() 
  hs=103
  taunttimer=0
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
  music(1)
  circitirs=0
  mach=1
  mtimer=11
  player={
    sp=96,
    x=0,
    x2=0,
    y=0,
    walking=true,
    w=8,
    h=8,
    filp=false,
    dx=0,
    dy=0,
    max_dx=1,
    max_dy=3,
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
  mb=23
  player2={
    sp=1,
    x=39,
    y=104,
    w=8,
    h=8,
    filp=false,
    dx=0,
    dy=0,
    max_dx=1,
    max_dy=3,
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
    falling=false
  }
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
  sc=10
  cloth=0
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
    player.x=39
    player.y=104
    player.w=8
    player.h=8
    player.filp=false
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

 if btn(🅾️) and waittime < 0 and player.running then
  matimer-=0.2 / 1.4
 else
  matimer=11
 end
 if btnp(⬆️) and matimer < 3 and player.landed then
  player.dy-=player.boost+3
  sfx(30)
  player.landed=false
  player.acc=0
  matimer=11
 end
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
	  player.acc=0.5
	  sfx(47)
	 else
	  sfx(47)
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
  pal(11,15+128,1)
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
   camera(0,0)
   cls()
   if btnp() then
    world=1
    reset_pl()
    chstate("game")
   end
   print("\n      this game is based on\n            sage 2019\n    note that the characters\n         belong to mcpig\n\n\n\n\n\n\n      ❎ to play as peppino\n       🅾️ to play as snick",7)
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
  collect_pickup(player,4,0)
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
  sc=7
  skc=15
  cc=9
 elseif cloth == 0 and player.colorpal == 1 then
  sc=10
  skc=15
  cc=9
 elseif cloth == 1 then
  sc=12
  skc=4
  cc=14
 elseif cloth == 2 then
  sc=13
  skc=15
  cc=13
 elseif cloth == 3 then
  sc=8
  skc=15
  cc=2
 elseif cloth == 4 then
  sc=11
  skc=15
  cc=3
 elseif cloth == 5 and player.colorpal == 0 then
  sc=10
  skc=15
  cc=9
 elseif cloth == 5 and player.colorpal == 1 then
  sc=7
  skc=15
  cc=6
 elseif cloth == 6 then
  sc=5
  skc=15
  cc=1
 elseif cloth == 7 then
  sc=14
  skc=15
  cc=2
 elseif cloth == 8 then
  sc=1
  skc=15
  cc=1
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
 
 map(0,48,cam_x-(cam_x/2)%96,mahuy,128,16)
 map()
 
 ancoin()
 if player.x == monx then
  coins-=1
 end
  if blink2 == 0 and matimer<5 then
   pal(7,7)
   spr(77,player.x,player.y,1,1,player.flip)
   pal(7,7)

  end
  
 	if blink2==1 and player.flip == false then
   	pal(15,2)
	   pal(4,2)
	   pal(10,2)
	   pal(7,2)
	   spr(player.sp,player.x2-4,player.y,1,1,player.flip)
	   pal(15,15)
	   pal(10,10)
	   pal(7,7)
	   pal(4,4)
	  	pal(15,3)
	   pal(4,3)
	   pal(10,3)
	   pal(7,3)
	   spr(player.sp,player.x2-10,player.y,1,1,player.flip)
	   pal(15,15)
	   pal(10,10)
	   pal(7,7)
	   pal(4,4)
	   spr(blink2+13,player.x2-4,player.y,1,1,player.flip)
	  elseif blink2==1 and player.flip then
   	pal(15,2)
	   pal(4,2)
	   pal(10,2)
	   pal(7,2)
	   spr(player.sp,player.x2+4,player.y,1,1,player.flip)
	   pal(15,15)
	   pal(10,10)
	   pal(7,7)
	   pal(4,4)
	   spr(blink2+13,player.x2+4,player.y,1,1,player.flip)
	  	  	pal(15,3)
	   pal(4,3)
	   pal(10,3)
	   pal(7,3)
	   spr(player.sp,player.x2+10,player.y,1,1,player.flip)
	   pal(15,15)
	   pal(10,10)
	   pal(7,7)
	   pal(4,4)
	   spr(blink2+13,player.x2-4,player.y,1,1,player.flip)

	  end
	 
	  if player.x > 1000 then
  end
   if player.colorpal == 0 then
   pal(10,sc)
   spr(hs,cam_x+13,mahuy,2,2)
   spr(player.sp,player.x,player.y,1,1,player.flip)
   pal(10,10)
   pal(10,sc)
   pal(9,cc)
   pal(15,skc)
   else
       pal(10,sc)
   pal(9,cc)
   pal(15,skc) 
   pal(10,sc)
   spr(hs,cam_x+13,mahuy,2,2)
   spr(player.sp,player.x,player.y,1,1,player.flip)
   pal(10,10)
   pal(10,sc)
   pal(9,cc)
   pal(15,skc)
   spr(117,24,80)
   end
  -- spr(hs+4,cam_x+32,mahuy,2,2)
  -- spr(player2.sp+16,player2.x,player2.y,1,1,player2.flip)
   pal(10,10)
   pal(9,9)
   pal(15,15)
   spr(rank,cam_x+30,mahuy+1)
   spr(82,cam_x+105,mahuy+1,2,2)
   print(" " .. flr(coins),cam_x+103,mahuy+6,1,0,0)
  if btn(🅾️) and player.running and player.colorpal == 0 then
   hs=105
  elseif player.colorpal == 1 then
   hs=107
  elseif player.colorpal == 0 and player.wall then
   hs=75
  else
   hs=103
  end
  waittime=-5
  ang()
  if coins < 300 then
   rank=79
  elseif coins < 600 then
   rank=95
  elseif coins < 900 then
   rank=111
  else
   rank=127
  end
  --spr(rank,cam_x+30,mahuy+3)
    if matimer > 10 then
	  spr(68,cam_x,mahuy+13)
	  spr(68,cam_x+8,mahuy+13)
	  spr(68,cam_x+16,mahuy+13)
	  spr(68,cam_x+24,mahuy+13)
	  spr(68,cam_x+32,mahuy+13)
  elseif matimer > 9 then
   pal(8,10)
	  spr(39,cam_x,mahuy+13)
	  pal(8,8)
	  spr(68,cam_x+8,mahuy+13)
	  spr(68,cam_x+16,mahuy+13)
	  spr(68,cam_x+24,mahuy+13)
	  spr(68,cam_x+32,mahuy+13)
	 elseif matimer > 7 then
	  pal(8,10)
	  spr(39,cam_x,mahuy+13)
	  pal(8,8)
	  pal(8,9)
	  spr(39,cam_x+8,mahuy+13)
	  pal(8,8)
	  spr(68,cam_x+16,mahuy+13)
	  spr(68,cam_x+24,mahuy+13)
	  spr(68,cam_x+32,mahuy+13)
	 elseif matimer > 5 then
	  pal(8,10)
	  spr(39,cam_x,mahuy+13)
	  pal(8,8)
	  pal(8,9)
	  spr(39,cam_x+8,mahuy+13)
	  pal(8,8)
	  pal(8,13)
	  spr(39,cam_x+16,mahuy+13)
	  pal(8,8)
	  spr(68,cam_x+24,mahuy+13)
	  spr(68,cam_x+32,mahuy+13)
	 elseif matimer > 3 then
	  pal(8,10)
	  spr(39,cam_x,mahuy+13)
	  pal(8,8)
	  pal(8,9)
	  spr(39,cam_x+8,mahuy+13)
	  pal(8,8)
	  pal(8,13)
	  spr(39,cam_x+16,mahuy+13)
	  pal(8,8)
	  pal(8,12)
	  spr(39,cam_x+24,mahuy+13)
	  pal(8,8)
spr(68,cam_x+32,mahuy+13)
	 elseif matimer > 1 then
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
	  matimer=2
	 end
  blink2+=1
  if matimer<5 then
   if blink2 > 1 then
    blink2=0
   end
  end
 if player.y <64 then
  mahuy=0
 elseif player.y >448 then
  mahuy=384
 else
  mahuy=player.y-64
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
   coins+=10
   sfx(32)
   return true
  end
end

-->8
--player
function player_update()
 local acc=player.walk_acc
 local deltatime=time()-lasttime
 player.plytime-=deltatime
 if collide_map(player,"left",1) and btnp(⬆️) then
  cloth+=1
 end
 if collide_map(player,"left",1) then
  print("palette "..cloth,30,100,7)
 end
 if collide_map(player,"up",2) then
  player.x-=2
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
  player.x-=0.1 / 2
 end
 if collide_map(player,"left",4) then
  
 end
 if collide_map(player,"right",3) and btnp(⬆️) and tr == true then
  stop()
  if state=="game" and world == 1 then
	  music(0)
	 elseif state=="game" and world == 2 then
	  music(19)
	 else
	  music(21)
	 end
 elseif collide_map(player,"right",2) then
  matimer=11
 elseif collide_map(player,"left",7) and player.colorpal == 0 then
  player.colorpal=1
 elseif collide_map(player,"right",7) and player.colorpal == 0 then
  player.colorpal=1
 elseif collide_map(player,"up",7) and player.colorpal == 0 then
  player.colorpal=1
 elseif collide_map(player,"down",7) and player.colorpal == 0 then
  player.colorpal=1
 elseif collide_map(player,"left",7) and player.colorpal == 1 then
  player.colorpal=0
 elseif collide_map(player,"right",7) and player.colorpal == 1 then
  player.colorpal=0
 elseif collide_map(player,"up",7) and player.colorpal == 1 then
  player.colorpal=0
 elseif collide_map(player,"down",7) and player.colorpal == 1 then
  player.colorpal=0
 else
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
 if btn(⬅️) then
  player.dx-=acc
  player.running=true
  player.flip=true
 elseif btn(➡️) then
  player.dx+=acc
  player.running=true
  player.flip=false
 elseif player.running
  and not btn(⬅️)
  and not btn(➡️)
  and not player.falling
  and not player.jumping then
   player.running=false
   player.falling=false
   player.jumping=false
   player.slideing=true
  end
 if btn(🅾️) and
  player.landed==true and nescon == false then
  player.dy-=player.boost
  player.landed=false
  ?"\as3i1v6a2a<aaa<a#<b<c3c#dd#eff#<gg#a"
 elseif btn(❎) and
  player.landed==true and nescon == true then
  player.dy-=player.boost
  player.landed=false
  sfx(28)
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
    player.dy-=player.boost-3.2
    player.dx=0
    player.wall=true
   -- matimer+=2
  end
 elseif player.dx>0 then
  if collide_map(player,"right",0) then
    player.dy-=player.boost-3.2
    player.wall=true
    player.dx=0
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
 
 --if player.colorpal == 0 then
--  if btnp(⬇️) then
--    taunttimer+=1
--    if taunttimer >0 then
--   			player.sp=17+rnd(7)
--   			taunttimer=0
--   	end 
  if player.wall ==true then
           player.sp+=.3
        if player.sp>46 or player.sp < 44 then
          player.sp=44
        end
  elseif player.jumping and not player.wall then
           player.sp+=.6
       if matimer < 7 then
        if player.sp>34 or player.sp < 32 then
          player.sp=32
        end
       else
        player.sp=8
       end
  elseif player.falling and not player.wall then
       player.sp+=.6
       if matimer > 7 then 
        player.sp=9
       elseif matimer < 7 then
        if player.sp>34 or player.sp < 32 then
          player.sp=32
        end
       end
  elseif player.slideing then
    player.sp=1
  elseif player.running and btn(🅾️) then
    if time()-player.anim>.1 then
      player.anim=time()
      player.sp+=1
       if matimer > 8 then 
        if player.sp>6 or player.sp < 5 then
         player.sp=5
        end
       elseif matimer < 7 then
        if player.sp>33 or player.sp < 32 then
          player.sp=32
        end
       end
      end
  elseif player.running and not btn(🅾️) then
    if time()-player.anim>.1 then
      player.anim=time()
      player.sp+=.7
        if player.sp>5 or player.sp < 2 then
          player.sp=3
        end
      end
  elseif btn(⬆️) then
   player.acc=0
   player.running=false
   matimer=11
   --if not btn(🅾️) then
     player.sp+=.5
     if player.sp < 17 or player.sp > 23 then
		    player.sp=17
		   end
		
		--elseif btn(⬇️) then
   --player.sp=rnd(0,127)
	 end

end
  
function player2_update()
 local deltatime=time()-lasttime
 player2.plytime-=deltatime
 if collide_map(player2,"down",2) then
  friction=0.50
  player2.boost=2
 elseif collide_map(player2,"down",3) then
  friction=0.95
  player2.boost=6
 elseif collide_map(player2,"down",5) and player.y < 128 then
  reset_pl()
  _draw()
  icoin()
  ancoin()
  lives-=1
  player.plytime=300
  t=0
  icoin()
  ancoin()
  --reload(0x1000,0x1000,0x2000)
  ?"\as8v7i1b2<<bv7f3<<f<<f<<fv7f<<fv7f<<f<<fv7e<<e<<ev7d<<d<<dv7c<<cv7e2<<e<<e<<ev7e<<ev7c<<c<<c<<cccx5c"
 elseif player2.colorpal == 1 and classicluigi== false then
  friction=0.90
  spr(player2.sp+16,player2.x,player2.y,1,1,player2.flip)
  player2.boost=0
 end
 --physics--
 player2.dy+=gravity
 player2.dx*=friction
 local acc=player2.walk_acc
 if btn(4,1) then
  acc=player2.acc
 end
 --controls
 if btn(0,1) then
  player2.dx-=acc
  player2.running=true
  player2.flip=true
 end
 if btn(1,1) then
  player2.dx+=acc
  player2.running=true
  player2.flip=false
 end
  --slide
 if player2.running
  and not btn(0,1)
  and not btn(1,1)
  and not player2.falling
  and not player2.jumping then
   player2.running=false
   player2.falling=false
   player2.jumping=false
   player2.slideing=true
 end
  
  --jumping--
 if btnp(5,1) and
  player2.landed==true then
  player2.dy-=player2.boost
  player2.landed=false
  ?"\as3i1v6a2a<aaa<a#<b<c3c#dd#eff#<gg#a"
 end
 --check collision up and down
 if player2.dy>=0 then
  player2.falling=true
  player2.landed=false
  player2.jumping=false 
 if collide_map(player2,"down",6) then
  player2.falling=false 
  player2.landed=true
  player2.dy=0
  player2.y-=((player2.y+player2.h)+1)%8-1
 end
 elseif player2.dy<0 then
  player2.jumping=true
  if collide_map(player2,"up",0) then
   player2.dy=0
  end
 end

 if player2.dx<0 then
  if collide_map(player2,"left",0) then
    player2.dx=0
  end
 elseif player2.dx>0 then
  if collide_map(player2,"right",0) then
    player2.dx=0
  end
 end

 --stop slideing
 if player2.slideing then
  if abs(player2.dx)<.2   
   or player2.running then
    player2.dx=0
    player2.slideing=false
  end
 end

 player2.x+=player2.dx
 player2.y+=player2.dy
 callbacktimer-=1

end


function player2_animate()
 if player2.jumping then
  player2.sp=7
 elseif player2.falling then
  player2.sp=8
 elseif player2.slideing then
  player2.sp=9
 elseif player2.running then
  if time()-player2.anim>.1 then
   player2.anim=time()
   player2.sp+=1
   if player2.sp>6 then
    player2.sp=3
   end
  end
  else
  if time()-player2.anim>.3 then
   player2.anim=time()
   player2.sp+=1
   if player2.sp>2 then
    player2.sp=1
   end
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
  and goombas[i].stomped==false
  and player.acc<0.3 then
	   player.dy-=0.8
	   coins-=5
	   player.x-=0.1
	 elseif player.falling ==false
  and goombas[i].pixelx < player.x+8
  and goombas[i].pixelx + 8 > player.x
  and goombas[i].pixely < player.y+8
  and goombas[i].pixely + 8 >= player.y+8 
  and goombas[i].stomped==false
  and player.acc>0.3 then
   goombas[i].stomped=true
   sfx(52)
   --coins+=10
   break
  end
  
 end
 
end
__gfx__
000000000aaaaaaa000000000aaaaaaa0aaaaaaa0aaaaaaa0aaaaaaa0aaaaaaa0aaaaaaa0aaaaaaa666661668888888866666666000000000000000000000000
0000000011141f100000000011141f1011141f1011141f1011141f1011141f1011141f1011141f10666661666666666666666666000000000000000000000000
00000000014ffff000000000014ffff0014ffff0014ffff0014ffff0014ffff0014ffff0014ffff0666661666666666666666666000000000000000000000000
00000000111f7f7000000000111f7f70111f7f70111f7f7f111f7f70111f7f7ff11f7f7ff11f7f7f111111116666666666666666000000000000000000000000
0000000001a111f00000000001a111a001f111f0f1a111a000a111a0f1a111a001a111a001a111a0616666666666666666666666000000000000000000000000
0000000000faaaa00000000000faaaf100aaaaa000aaaaa100faaaaf00aaaaa100aaaaa100aaaaa0616666666666666666666666000000000770000000000000
00000000001aaa100000000001aaaaa100aaaaa001aaaaa100aaaaa001aaaaa101aaaaa101aaaaa0616666666666666666666666000000000077770000000000
00000000001101100000000001100000001101100100000000111110010000000110000001111100111111116666666666666666000000000777777000000077
04444440000000000000000000000000000000000000000000000000000000000444444000011111000000003333333300000000000000000000000000000000
422222240aa1aaaa0aa1aaaa00000000000000000aa1aaaa0aa1aaaa0aa1aaaa0f1f1ff000177777000000003333333300000000000000000000000000000000
4211222411141f1011141f100aa1aaaa0aa1aaaa11141f1011141f1011141f100f1f1ff001777777000000003333333300000000000000000000000000000000
41111224014ffff0014ffff011141f1011141f1f014ffff0014ffff0014ffff07888f180017777770000000033333333000000000000aa00000aa00000000000
41118884111f7f70111f7f70014ffff0014ffff0111f7f70111f7f70111f7f700f1111f701777777000000003333333300000000000a1aa000a1aa0000000000
4211777401a111af01a111a0111aa1a0111aaa1001a111f111a111a011a111a000f88f001777777700000000333333330000000000aaaa000aaaa00000000000
4222aaa41faaaaa001aaa1a1011111110111111001aaaaa111aaaaa0f1aaaaa0000ff000177777770000000033333333000000000aaaaaa0aaaaaa0000000000
0444444010aaaa000f1111110f111100f01111000f0000000f0000f00000000f0770077017777777000000003333333300000000aaaaaaaaaaaaaaaa00000000
0aaaaaaaaaaaaaa05555555544444444bbbbbbbb777771770000000008800000077000006666666655555155555551550aaaaaaaaaaaaaa00000000000000000
011141f1001141f15555555599999999bbbbbbbb6666616600000000088880000777700055555555555551555555515511141f1011141f100000000000000000
0014ffff0114ffff5555555500000000bbbbbbbb66666166000000000888888007777770000000005555515555555155014ffff0014ffff00000000000000000
011177f7001177f77757757700000000bbbbbbbb11111111000000000888888807777777000000001111111111111111111f7f70111f7f700000000000000000
01fa11af01fa11af7757757700000000bbbbbbbb6166666600000000088888810777777500000000515555555155555501fa111001fa11010000000000000000
00aaaaa000aaaaa05555555500000000bbbbbbbb6166666600000000088881100777755000000000515555555155555500aaaa0100aaaa100000000000000000
00aaaa0011aaaa105555555500000000bbbbbbbb6166666600000000088110000775500000000000515555555155555500aaaa1000aaaa010000000000000000
01101000100101105555555500000000bbbbbbbb1111111100000000011000000550000000000000111111111111111100000001000000100000000000000000
00000000444444440000000000000000d0d0d0d022222222d0d0d0d0000000000000000000888800000000000000000000000000000000000000000000000000
000000009999999900000000000000000d0d0d0d222222220d0d0d0d000000000000000008888880008888000000000000000000000000000000000000000000
00044000d0d0d0d00000000000000000d0d0d0d022222222d0d0d0d0000000000000000008888880088888800088880000000000000000000000000000000000
000aa0000d0d0d0d00000000000000000d0d0d0d222222220d0d0d0d000000000000000008888880088888800888888000000000000000000000000000000000
000aaa00d0d0d0d00000000000000000d0d0d0d022555525d0d0d0d0000000000000000000888800088888800888888000000000000000000000000000000000
00aaaa000d0d0d0d00000000000000000d0d0d0d256666560d0d0d0d000000000000000000000000008888000888888000000000000000000000000000000000
0aa99aa0d0d0d0d00000000067777777d0d0d0d056666666d0d0d0d0000000000000000000000000000000000088880000000000000000000000000000000000
aa0990aa0d0d0d0d00000000666666660d0d0d0d566666660d0d0d0d000000000000000000000000000000000000000000000000000000000000000000000000
000000001111100001111110000880000770000000000000000000000000000000000000000000000000000000000000000000000000000a0000000000777700
000000007777710014144141008888000777700000000000000000000000000000000000000000000000000000000000000000000000000a0000000007733770
000000007777771014144141008888000777777000000000000000000000000000000000000000000000000000000000000000000000000a0000000077377377
000000007777771014144141088888800777777700000000000000000000000000000000000000000000000000000000000000000000000a0000000077377777
000000007777771014144141088888800777777100000000000000000000000000000000000000000000000000000000000000000000000a0000000077377777
000000007777777114144141888888880777711000000000000000000000000000000000000000000000000000000000000000000000000a0000000077377377
000000007777777114144141888888880771100000000000000000000000000000000000000000000000000000000000000000000000000a0000000007733770
000000007777777101111110000000000110000000000000000000000000000000000000000000000000000000000000000000000000000a0000000000777700
0000000077777777000000000000d0d00000000000000000999999990000000000000000000000004b1bbb1b0000000000000000066666000666660000777700
00000000777777770000000000000d000000000000000000999999990000000000000000000000004b1bbb1b0000000000000000660006606606066007ccc770
00000000777777770ddddddddddddd100000000000000000999999990000000000000000000000004bb1bbbb0000000000000000660606606660666077c77c77
0000000077777777d7777777777777d10000000000000000999999990000000000000000000000004bbbbbbb0000000000000000660006606606066077ccc777
0000000077777777d7777777777777d10000000000000000999999990000000000000000000000004bb1bbbb0000000000000000066666000666660077c77c77
0000000077777777d7777777777777d10000000000000000999999990000000000000000000000004b1bbb1b0000000000000000000000000000000077c77c77
0000000077777777d7777777777777d100000000000000009999999900000000000000000000000011bb1bb10000000000000000000000000000000007ccc770
0000000077777777d7777777777777d1000000000000000099999999000000000000000000000000444414410000000000000000000000000000000000777700
0000000000000000d7777777777777d100000000fffffff97717777700000d100000011d00000d100000011d0000000000000000000000000000000000777700
0000000000000000d7777777777777d100000000ffffffff661666660000000ddddd10000000000ddddd10000000000000000000000000000000000007788770
0000000000000000d7777777777777d1000000009fffff9f661666660dddddddddddddd00dddddddddddddd00000000000000000000000000000000077877877
0000000000000000d7777777777777d100000000ffffffff11111111d222aa11aaaaaa2dd21aaaaa1aaaa2dd0000000000000000000000000000000077888877
0000000000000000d7777777777777d100000000fff999ff66666616d2aaaa7711aaaa2dd221aaa17aa122dd0000000000000000000000000000000077877877
0000000000000000d7777777777777d100000000ff99ffff66666616d2aaa7777441122dd2241417771112dd0000000000000000000000000000000077877877
00000000000000000ddddddddddddd1000000000f99fffff11111111d22a17777741122dd2277477771111dd0000000000000000000000000000000007777770
00000000000000000000000000000000000000009ffffff955555555d22177717744112dd2271417774411dd0000000000000000000000000000000000777700
0aaaaaaaa00001111111110000001010011111100111111000000000d22717717741144dd2277f77774411dd0000000000000000000000000000000000777700
11141f10a1f71aa11aaaaa000001111a1aaaaaa11414414100000000d22717717741144dd22f4f477f1111dd0000000000000000000000000000000007aaaa70
014ffff0afff1aa11aaaaa001aaf141a171aa7711174471100000000d22777777741444dd2274ff4771111dd000000000000000000000000000000007a777777
111f7f70a1f71aa10111af101aaaff4a177aa1711714417100000000d22717777744444dd22774ff47f111dd0000000000000000000000000000000077aaaa77
01fa1110a4ffaaa107f7f1111aa17f1a1ffffff1177ff77100000000d1211f777444444dd1211144111f11dd00000000000000000000000000000000777777a7
00aaaaa1a141faa10ffff4101aa1fffa111771111ffffff100000000d1114ff14444fffdd1177777777f11dd000000000000000000000000000000007a7777a7
00aaaaa1a111100001f141111aa17f1a118888111f1111f100000000d111fff711fffffdd11ffffffff1aadd0000000000000000000000000000000007aaaa70
0011111101010000aaaaaaa01110000a0111111001111110000000000dddddddddddddd00dddddddddddddd00000000000000000000000000000000000777700
a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a000000000000000d0a000000000a0a2a2a2a2a2
a2a00000000000000000a0a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a00000000000000000230000000000000000000000000000a0a2a2a000000000a0a2a2a2a2
a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a000000000000000000000000000a0a2a2a2a2a2
a2a00000000000000000a0a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a03232a0a0a0a0a0a0a0a0a0000000000000000000000000a0a2a2a000000000a0a2a2a2a2
a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a000000000000000000000000000a0a2a2a2a2a2
a0000000000000000000a0a2a2a2a2a2a2a2a2a2a2a2a2a0a0a0a0000000a000000000000000a0000000000000000000000000a0a2a00000000000a0a2a2a2a2
a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a000000000000000000000000000a0a2a2a2a2a2
a0000000000000000000a0a2a2a2a2a2a2a2a2a2a2a2a2a0000000000000a000000000000000a00000000000000000a0a0a0a0a2a2a00000000000a0a2a2a2a2
a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0a0a0a0323232323232a0a0a0a0a2a2a2a2a2a2
a0000000000000000000a0a2a2a2a2a2a2a2a2a2a2a2a2a0000000000000a0d0d0d0d0d0d000000000000000a0a0a0a2a2a2a2a2a2a00000000000a0a2a2a2a2
a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0d00000000000a0a2a2a2a2a2a2a2a2a2
a0000000000000000000a0a2a2a2a2a2a2a2a2a2a2a2a2a000000000a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a2a2a2a2a2a2a2a2a2a0000000000000a0a2a2a2
a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0d00000000000a0a2a2a2a2a2a2a2a2a0
0000000000000000000000a0a2a2a2a2a2a2a2a2a2a2a2a03232a0a0a0a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0000000000000a0a2a2a2
a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0d00000000000a0a2a2a2a2a2a2a2a2a0
000000000000000000000000a0a2a2a2a2a2a2a2a2a2a2a000d0a0a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0000000000000a0a2a2a2
a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0d00000000000a0a2a2a2a2a2a2a2a000
000000000000000000000000a0a2a2a2a2a2a2a2a2a2a2a000d0a0a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0000000000000a0a2a2a2
a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0d00000000000a0a2a2a2a2a2a2a00000
00000000000000000000000000a0a2a2a2a2a2a2a2a2a2a000d0a0a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0000000000000a0a2a2a2
a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0d00000000000a0a2a2a2a2a2a2a00000
00000000000000000000000000a0a2a2a2a2a2a2a2a2a2a000d0a0a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0000000000000a0a2a2a2
a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0d00000000000a0a2a2a2a2a2a2a00000
00000000000000000000000000a0a0a0a0a0a0a0a0a0a0a000d0a0a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0000000000000a0a2a2a2
a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0d00000000000a0a2a2a2a2a2a2a00000
00000000000000000000000000000000000000000000000000d0a0a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0000000000000a0a2a2a2
a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0d00000000000a0a2a2a2a2a2a2a00000
00000000000000000000000000000000230000230000230000d0a0a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0000000000000a0a2a2a2
a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0d00000000000a0a0a0a0a0a0a0a0a0a0
a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0000000000000a0a2a2a2
a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0d0000000000000000000000000000000
00000000000000000000000000000000a0a2a2a2a2a2a2a000000000000000000000000000a0a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0000000000000a0a2a2a2
a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0d0000000000000000000000000000000
00000000000000000000000000000000a0a2a2a2a2a2a2a000000000000000000000000000a0a2a2a2a2a2a2a2a2a2a2a2a2a2a2a000000000000000a0a2a2a2
a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0d0000000000000000000000000000000
00000000000000000000000000000000a0a2a2a2a2a2a2a000000000000000000000000000a0a2a2a2a2a2a2a2a2a2a2a2a2a2a2a000000000000000a0a2a2a2
a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0d0000000000000000000000000000000
00000000000000000000000000000000a0a2a2a2a2a2a2a000000000000000000000000000a0a2a2a2a2a2a2a2a2a2a2a2a2a2a2a000000000000000a0a2a2a2
a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0d0000000000000000000000000000000
00000000000000000000000000000000a0a2a2a2a2a2a2a00000000000d0d0d0d0d0000000a0a2a2a2a2a2a2a2a2a2a2a2a2a2a2a000000000000000a0a2a2a2
a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0d0000000000000000000000000000000
00000000000000000000000000000000a0a2a2a2a2a2a2a00000000000d0d0d0d0d0000000a0a2a2a2a2a2a2a2a2a2a2a2a2a2a2a000000000000000a0a2a2a2
a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0d0000000000000000000000000000000
00000000000000000000000000000000a0a2a2a2a2a2a2a00000000000a0a0a0a0a0000000a0a2a2a2a2a2a2a2a2a2a2a2a2a2a2a00000000000000000a0a2a2
a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0d0000000000000000000000000000000
00000000000000000000230000000000a0a2a2a2a2a2a2a00000000000a0a0a0a0a0000000a0a2a2a2a2a2a2a2a2a2a2a2a2a2a2a00000000000000000a0a2a2
a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0d0000000000000000000000000000000
00000000000032a0a0a0a0a032000000a0a2a2a2a2a2a2a000000000000000000000000000a0a2a0a0a0a0a0a0a0a0a0a0a0a0a0a00000000000000000a0a2a2
a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0d0000000000000000000000000000000
00000000000000a0a2a2a2a00000d000a0a2a2a2a2a2a2a000000000000000000000000000a0a2a0000000000000000000000000000000000000000000a0a2a2
a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0d0000000000000000000000000000000
00000000000000a0a2a2a2a000000000a0a2a2a2a2a2a2a000000000000000000000000000a0a2a0000000000000000000000000000000000000000000a0a2a2
a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a000000000000000000000000000000000
00000000000032a0a2a2a2a032000000a0a2a2a2a2a2a2a000000000000000230000000000a0a2a0000000000000000000000000000000000000000000a0a2a2
a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a000000000000000000000000000000000
00000000000000a0a2a2a2a000000000a0a0a0a0a0a0a0a00000000000a0a0a0a0a0000000a0a0a0000000000000000000000000000000000000000000a0a2a2
a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a000000000000000000000000000002323
23232300000000a0a2a2a2a00000000023230000000000000000000000a0a0a0a0a0000000003300000000000000d0d0d0d0d0d0d0d0d0d0d000000000a0a2a2
a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0
a0a0a0a0a0a0a0a0a2a2a2a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a03232323232323200a0a2a2
a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2
a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a000d0d0d0d0d0d000a0a2a2
a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2
a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0a0a0a0a0a0a0a0a0a0a2a2
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
0000000000000000000041000010000002000000000000001008004100000000000041400000000000454141000000000440002000000400210000000000000000084100000000000000000000000000000800000000000000001000000000000000000000414100000000000000000000000000c10000020000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
2a2a2a2a2a2a2a2a2a2a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a
2a2a2a2a2a2a2a2a2a2a0a000000000000000000000000000000005a5a5a000000000a00000000000000000000000000005a5a0000000000000000000000000000000000000000000000000000000000000000000000000000000a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a
2a2a2a2a2a2a2a2a2a2a0a000000000000000000000000000000005a5a5a000000000a00000000000000000000000000005a5a0000000000000000000000000000000000000000000000000000000000000000000000000000000a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a
2a2a2a2a2a2a2a2a2a2a0a000000000030000000000000000000005a5a5a000000000a00000000000000000000000000005a5a0000000000000000000000000000000000000000000000000000000000000000000000000000000a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a
2a2a2a2a2a2a2a2a2a2a0a000000000a0a0a0a0a232323232323230a0a0a0d0000000a00000000000000000000000000005a5a0000000000000000000000000000000000000000000000000000000000000000000000000000000a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a
2a2a2a2a2a2a2a2a2a2a0a000000000a2a2a2a0a000000000000000a2a0a0d0000000a00000000000000000000000000005a5a0000000000000000000000000000000000000000000000000000000000000000000000000000000a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a
2a2a2a2a2a2a2a2a2a2a0a000000000a2a2a2a0a000000000000000a2a0a0d0000000a00000000000000000000000000005a5a0000000000000000000000000000000000000000000000000000000000000000000000000000000a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a
2a2a2a2a2a2a2a2a2a2a0a000000000a2a2a2a0a000000000000000a2a0a0d0000000a00000000000000000000000000005a5a00001800000000000d0d0d000000000000300000000000000000003232323200000000000000000a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a
2a2a2a2a2a2a2a2a2a2a0a000000000a2a2a2a0a000000000000000a2a0a0d0000000a0d0000000032323200000018000a0a0a0a0a0a230000000023232300000023232323000000000000002323232323230a000000000023230a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a
2a2a2a0a2a2a2a2a2a2a0a000000000a0a0a0a0a000000000000000a2a0a000000000a0d00000a0a0a0a0a0a0a0a0a0a2a2a2a2a2a0a343636363636363636363636363636363636363636363636363636360a000000000000000a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a
0a0a0a740a0a0a0a0a0a0a000000000000000000000000000000000a2a0a000000000a0d00000000000000000a2a2a2a2a2a2a2a2a0a343636363636363636363636363636363636363636363636363636360a000000000000000a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a
0000000000000000000000000000000000000000000000000000000a2a0a0d0000000a0d00000000000000000a2a2a2a2a2a2a2a2a0a313636363636363636363636363636363636363636363636363636360a000000000000230a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a
001941000000000000000000000000000000000000005d005e00000a2a0a0d0000000a0d00000000000000000a2a2a2a2a2a2a2a2a0a343636363636363636363636363636363636363636363636363636360a000000000000000a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a
0051510010000000000000000000000000000000000000000000000a2a0a0d0000000a0d00000000000000000a2a2a2a2a2a2a2a2a0a343636363636363636363636363636363636363636363636363636360a000000000000000a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a
0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a2a0a0d0000000a0000000000000000000a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a000000000000000a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a
2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0a0d0000000a0000000000000000000a0000000000000000000000000000000000000000000000000000000000000000005a5a000000000000000000230a2a2a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a2a2a2a2a
2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0a000000000a00323232320000000d0a0000000000000000000000000000000000000000000000000000000000000000005a5a000000000000000000000a2a2a0a00000000000000000000000000000000000000000000000000000000000a2a2a2a2a
2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0a000000000a0a0a0a0a0a0a00000d0a0000000000000000000000000000000000000000000000000000000000000000005a5a000000000000000000000a2a2a0a00000000000000000000000000000000000000000000000000000000000a2a2a2a2a
2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0a0d0000000a00000000000000000d0a0000000000000000000000000000000000000000000000000000003232323232325a5a000d0d0d0d0d0d0000000a2a2a0a00000000000000000000000000000000000000000000000000000000000a2a2a2a2a
2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0a0d0000000a00000000000000000d0a000000000000000000000000000000000000000000000000000a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a2a2a2a0a00000000000000000000000000000000000000003200000000000000000a2a2a2a2a
2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0a0d0000000a00000000000000000d0a000000000000000000000000000000000000000000000000230a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0a000000000000003200000a0a0a0a0a0a0a0a0a0a0a0a0a0000000000000a2a2a2a2a
2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0a0d0000000a00000000000000000d0a000000000000000000000000000000000000000000000000000a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0a000000000023232323230a2a2a2a2a2a2a2a2a2a2a2a0a0000000000000a2a2a2a2a
2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0a0d0000000a00000000000000000d0a000000000000000000000000000000000000000000000000000a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0a000000000000000000000a0a0a0a0a2a2a0a0a0a0a0a2a0a00000000000a2a2a2a2a
2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0a00000000000000000000000000000a000000000000000000000000000000000000000000000000000a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0a00000032000000000000000000000a2a2a0a0000000a2a0a00000000000a2a2a2a2a
2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0a0000000000000d0d0d0d0d0d00000a000000000000000d0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0a23232323230000000000000000000a2a2a0a0000000a2a0a00000000000a2a2a2a2a
2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a000000000000000d0a00000000000000000000000000000000000000000a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0a00000000000000000000000000000a0a0a0a0000000a2a2a0a000000000a2a2a2a2a
2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0a000000000000000d0a00000000000000000000000000000000000000000a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0a0000000000000000000000003200000000000000000a2a2a0a000000000a2a2a2a2a
2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0a000000000000000d0a00000000000032323200000000000000000000000a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a00230a2a2a0a000000000a2a2a2a2a
2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0a000000000000000d0a0a23230a0a0a0a0a0a0a0a0a00000000000000000a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0a00000000000000000000000000000000000000000000000a2a2a0a000000000a2a2a2a2a
2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0a000000000000000d0a000000000a2a2a2a2a2a2a0a00000000000000000a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0a00000000000000000000000000000000000000000000000a2a2a0a000000000a2a2a2a2a
2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0a000000000000000d0a000000000a2a2a2a2a2a2a0a00000000000000000a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0a00000000000000000000000000000000000000000000000a2a2a0a000000000a2a2a2a2a
2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0a000000000000000d0a000000000a2a2a2a2a2a2a0a00000000000000000a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a0a00000000000000000000000000000000000000000000230a2a2a0a000000000a2a2a2a2a
__sfx__
001000002e0402d0402e0402904028040290402a0402c0402a0402904027040250402404023040240402904027040260402404026040270402604024040260400000000000000000000000000000000000000000
001000002204021040220401d0401c0401d0401e040200401e0401d0401b040190401804017040180401d0401b0401a04018040110401b0401a040180401a0401a0401a0401a0401a0401a0401a0401a0401a040
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001d0401d0401d0401d0401d0401d0401d0401d040
00100000000000000000000000000000000000000000000000000000000000000000000000000000000290402e0502e0502e0502e0502e0502e0502e0502e0502e0502d0502d0502d0502905029050290502b050
001000001a0401a0401a0401a0401a0401a0401a0401a0401a0401a0401a0401a0401a0401a0401a0401a04000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000001d0401d0401d0401d0401d0401d0401d0401d0401d0401d0401d0401d0401d0401d0401d0401d04000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000002b0502b050260502605026050260502605026050260502605026050240502405022050220502205022050220502205022050220502205026050240502405022050220502205022050220502205022050
001000002205022050220500000000000290502e0502e0502e0502e0502e0502e0502e0502e0502e0502d0502d0502d0502905029050290502b0502b0502b0502605026050260502605026050260502605026050
001000002605024050240502205022050220502205022050220502205022050220502605024050240502205022050220502205022050220502205022050220502205000000000002605026050260502605026050
001000002605026050260502605026050280502805028050260502605026050280502805028050260502605026050210502105021050210502105021050210502105021050210502105021050210502105021050
001000002105021050210500000000000290502905029050290502905029050290502905029050290502b0502d0502b0502905029050290502b0502d0502b0502905029050290502405024050240502405024050
00100000240502405024050240502405024050240502405024050240502405024050240502405024050000002d0602d0602d0602b06000000000002d0602d0602d0602b06000000000002e0602e0602d0602b060
00100000000000000000000000000000000000000000000000000000000000000000000000000000000000001d0601d0601d0601c06000000000001d0601d0601d0601c06000000000001f0601f0601d0601b060
00100000000000000000000000000000000000000000000000000000000000000000000000000000000000002106021060210601f06000000000002106021060210601f06000000000002206022060210601f060
001000002b0602e0602d0602d0602d0602d0602d0602d0602d0602d0602d0602b06000000000002d0602d0602d0602b06000000000002e0602e0602d0602b0602b0602e060290602906026060260602606026060
001000001b0601f0601d0601d0601d0601d0601d0601d0601d0601d0601d0601b06000000000001d0601d0601d0601b06000000000001f0601f0601d0601b0601b0601f0601d0601d0601d0601d0601d0601d060
350c00003013430132321343213230134301323213432132301343013230132241342e1342d1342b1342b13229134291322913229132291322913229132291322913229132291322913229132291322913229132
5d0c00000c2740c2620c2520c2320c2320c2320c2320c2220c2220c2220c2120c2120e2740e2521027410252112741126211252112320c2740c2620c2520c2321127411262112521123211274112621125211232
350c00003513432134321323513435132351323713437132391343813437134361343613236132361323613235134321343213235134351323513237134371323913439132391323913239132391323913239132
5d0c00001627416252152741525216274162521727417252182741825219274192521a2741a2521527415252132741325216274162521527415252132741325211274112520e2740e2520c2740c2521127411252
010e00002e5553155535555315552e5552e55531555335552c55530555335552c555305552c5553055533555295552c5553055529555295552c555305552c555295552c555305552c555295552c5552955535555
010e000035555005002e55500500355553555500500005003355500500005003355524500005002c555005003055500500005003055500500005002955531555005002955531555305553155529555315552c555
001400002c350173500d350173502c3501735017300173501730010350280000c350280000d00009350110000d000043500235004350023500435002350043500235004350023500435002350043500235004350
001000001f060220602106021060210602106021060210602106021060210601f06000000000002106021060210601f06000000000002206022060210601f0601f06022060220602206022060220602206022060
010c00101dc601fc6024c6022c60000001fc60000001dc60000001cc601dc601cc6016c6018c6000c0000c0000c0000c0000c0000c0000c0000c0000c0000c0000c0000c0000c0000c0000c0000c0000c0000000
0106000029c6029c602bc602bc6030c6030c602ec602ec6000000000002bc602bc60000000000029c6029c60000000000028c6028c6029c6029c6028c6028c6022c6022c6024c6024c60000000000028d6029d60
010c00100c2400a24007240052400521004240042100c2400c2100a2400c2400a2401124010240102100000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010600003f9203f9203f9203f9201ba201ba203fa203fa203fa203fa203fa233fa203fa203fa203fa233fa203fa203fa203fa233fa203fa203fa203f9203f9203f9203f920000000000000000000001ba601ba63
00010000256502d650000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00100000005001c550005000050000500115500050000500005002155000500005000050029550135500050000500005002f550005001c550005001955000500005002a550005003255000500005000050022550
d40c10001c37512355133551b3751e0051d0051c0051b0001a005000001a0001a0001b0001b0001c0001d0001f000210002200022000000000000000000000000000000000000000000000000000000000000000
000600001c050180501405012050000000e0500c0500a050080500705005050030500205000000020500305000000000000405000000050500505000000000000505000000000000000004050000000000000000
00010000256303723024650226503e100216502760027600216500d600226500d6000d6002b600286502c6502e6500f6001060032600001003560000100001000010000100001000000000000000000000000000
c50c00002f1542d154291542f1542f1522f1522d15429154281542815234154341523415434152341523415500102001020010200102001020010200102001020010200102001020010200102001020010200102
910c0000192561d236192361d256192361d236192361d236142501423023250232302325023230232202321000000000000000000000000000000000000000000000000000000000000000000000000000000000
d50c0000155750000021575000001c575000002157500000155750000021575000001c5750000021575000001a575000002157500000155750000021575000001a57500000215750000015575000002157500000
910c00000000015250212501c2501f250212501f2301525021250192501c2502125021230212201525015230000001525021250152501a250212501a2301525021250152501a2502125021230212201525015230
9001000024650276502c6503365038650396503b6503e6503f6503f6503d6503b6503865010650006502465021650000000000000000000000000000000000000000000000000000000000000000000000000000
010c000000002000020000200002210522105221052210521f0521f0521f0521f0522405224052240521d05200002000021d0521d0521d0520000200002000021c0521c0521c0521f0521f0521f0521a0521a052
910c000000000132501f2501a2501d2501f2501f230132501f2501a2501d2501f2501f2301f220132501323000000132501f250182501c2501f2501f230132501f2501f2301f2501f2301e2501e2301d2501d230
010c00000000000000000000000012620000000000000000000000000000000000001262000000000000000000000000000000000000126200000000000000000000000000000000000012620000000000000000
000c0000111200000011120000000000000000111200000010120000001012000000000000000010120000000e120000000e1200000000000000000e120000000c120000000c1200000000000000000c12000000
010c000000002000021a052000021a0521a0521a0521a0521805200002000021d0521d0521d05222052000020000200002210520000221052000021d052000021d0521d0521d0521d0521f0521f0521f0521f052
010c00000a1300a1000a1300000000000000000a13000000081300000008130000000000000000081300000006130000000613000000000000000006130000000c130000000c1300000000000000000e13000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
011000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
910c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
d4010000166551665016650166501565013650126501265012650286002d60032600316002f6002960024600246001060025600286001a6002b6000d6002e60030600336002e6002960025600266002a6002b600
c50c0000281342813228132281322413424132241321f13421134241342413224134241322413224132211341f1341f1322413424132291342813426134241342413224132241322413224132241322413224132
910c0000182501823018220182101c2501c2301c2201c2101d2501d2301d2201d2101e2501e2301e2201e2101a2501a2301a2201a2101f2501f2301f2201f2101825018230182201821018250182301822018210
00100020326203262032620326203162031620306202e6202a620256201b620136200f6200d6200c6200c6200c6200c6200c6200f620146201d620246202a6202e62030620316203362033620346203462034620
00050110150500c030180000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00010000313502c35029340233401e34018330133300e3300a3300833005330043300233000330003300000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000d0000000000000000000000001c060000001c0600000000000000000000017060000000000000000000000000000000000001c060000001c06000000000000000000000250600000023060000000000000000
000d000000000000000000000000170600000017060000000000000000000001c0600000000000000000000000000000000000017060000001706000000000000000000000170600000000000000000000000000
000d000000000000000000000000200600000020060000000000000000000000000000000000000000000000000000000000000200600000020060000000000000000000001c0600000000000000000000000000
000d0000000001c060000001c0600000000000000000000017060000000000000000000000000000000000001c060000001c06000000000000000000000250600000023060000000000000000000001c06000000
000d00000000000000170600000017060000000000000000000001c06000000000000000000000000000000000000170600000017060000000000000000000001706000000000000000000000000000000000000
000d00000000000000200600000020060000000000000000000000000000000000000000000000000000000000000200600000020060000000000000000000001c06000000000000000000000000000000000000
000d00001c0600000000000000000000017060000000000000000000000000000000000001c060000001c06000000000000000000000250600000023060000000000000000000001c060000001c0600000000000
000d0000170600000017060000000000000000000001c060000000000000000000000000000000000001706000000170600000000000000000000017060000000000000000000000000000000000001706000000
000d0000200600000020060000000000000000000000000000000000000000000000000000000000000200600000020060000000000000000000001c060000000000000000000000000000000000002006000000
000d0000000000000017060000000000000000000000000000000000001c060000001c06000000000000000000000250600000023060000000000000000000001c060000001c0600000000000000000000017060
000d000017060000000000000000000001c0600000000000000000000000000000000000017060000001706000000000000000000000170600000000000000000000000000000000000017060000001706000000
__music__
00 00010240
00 03040540
00 06404040
00 07404040
00 08404040
00 09404040
02 0a404040
00 004b4000
00 00404000
00 00404000
00 00404000
00 00004000
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

