pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
--update and draw--
function _update()
  --physics--
  if minigame==true then
   player_update()
   player_animate()
   if player.x<0 then
    player.x=0
   end
   collect_pickup(player,4,0)

   pal(8,8+128,1)
   --camera--
    local world=0
	   local camy=0

  elseif minigame==false then
  	if btnp(❎) then
  	 minigame=true
  	end
  end
end

function _draw() 
  camy=128
   if player.y <64 then
  camy=0
 elseif player.y >266 then
  camy=200
 else
  camy=player.y-64
 end
  cls(1)
  if minigame == false then
   player.y=312
  end
  if minigame == true then
	  pal(13,13)
	  cls(12)
	  anstrs()
   starfield()

	  --pal(15,15+128,1)
	  if player.x < 64 then
	   camx=0
	  elseif player.x > 960 then
	   camx=896
	  else
	   camx=player.x-63
	  end
	  if player.x>128 then
	   world=1
	  elseif player.x>256 then
	   world=2
	  else
	   world=0
	  end
	  camera(camx,camy)
	  map(0,50,camx-(camx/2)%96,camy,128,16)
   map()
   spr(player.sp,player.x,player.y,1,1,player.flip)
     rectfill(camx,camy+110,camx+128,camy+128,6)
     if player.running then
    spr(72,camx+16,camy+111,2,2)
   else
    spr(70,camx+16,camy+111,2,2)
   end
   ancoin()
  end
end

  
  

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
  minigame=false
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

function starfield()
 for i=1,#starx do
  rectfill(starx[i]-strszes[i].x,stary[i]+strszes[i].y,starx[i]+strszes[i].x,stary[i]-strszes[i].y,7)
 end
end

function anstrs()
 for i=1,#starx do
  local sx=starx[i]
  sx=sx+starspd[i]
  if sx>1096 then
   sx=sx-1200
  end
   starx[i]=sx
 end
end


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
   coins+=100
   if combo > 0 then
   
   combotimer=60
   end
   return true
  end
end


  
  --player
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
  function player2_update()
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
    player2.slideing=true
  end
  
  --jumping--
  if btnp(5,1) and
    player2.landed==true then
    player2.dy-=player2.boost
    player2.landed=false
    sfx(0)
  end
  
  
  --check collision up and down
  if player2.dy>0 then
    player2.falling=true
    player2.landed=false
    player2.jumping=false 
  if collide_map(player2,"down",0) then
    player2.falling=false 
    player2.landed=true
    player2.dy=0
    player2.y-=(player2.y+player2.h)%8
  end
elseif player2.dy<0 then
  player2.jumping=true
  if collide_map(player2,"up",1) then
    player2.dy=0
  end
end

if player2.dx<0 then
  if collide_map(player2,"left",1) then
    player2.dx=0
  end
elseif player2.dx>0 then
  if collide_map(player2,"right",1) then
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

end

function player_update()
  --physics--
  player.dy+=gravity
  player.dx*=friction
    if collide_map(player,"down",2) then
    friction=0.50
    player.boost=2
  elseif collide_map(player,"down",3) then
    friction=0.95
  else
    friction=0.85
    player.boost=4
  end
  local acc=player.walk_acc
  
  if btn() then
   acc=player.acc
  end
  --controls
  if btn(⬅️) then
    player.dx-=acc
    player.running=true
    player.flip=true
  end
  if btn(➡️) then
    player.dx+=acc
    player.running=true
    player.flip=false
  end
  
  --slide
  if player.running
  and not btn(⬅️)
  and not btn(➡️)
  and not player.falling
  and not player.jumping then
    player.running=false
    player.slideing=true
  end
  
  --jumping--
  if btnp(❎) and
    player.landed==true then
    player.dy-=player.boost
    player.landed=false
    sfx(0)
  end
  
  
  --check collision up and down
  if player.dy>0 then
    player.falling=true
    player.landed=false
    player.jumping=false 
  if collide_map(player,"down",0) then
    player.falling=false 
    player.landed=true
    player.dy=0
    player.y-=(player.y+player.h)%8
  end
elseif player.dy<0 then
  player.jumping=true
  if collide_map(player,"up",1) then
    player.dy=0
    
  end
end

if player.dx<0 then
  if collide_map(player,"left",1) then
    player.dx=0
    if btnp(❎) and not collide_map(player,"up",1) and
 not collide_map(player,"down",0) then
 
     player.dy-=player.boost
	    player.landed=false
	    sfx(0)
	    player.flip=false
	    player.dx+=3
    end
  end
elseif player.dx>0 then
  if collide_map(player,"right",1) then
    player.dx=0
        player.dx=0
    if btnp(❎) and not collide_map(player,"up",1) and
 not collide_map(player,"down",0) then
  
     player.dy-=player.boost
	    player.landed=false
	    sfx(0)
	    player.dx-=3
	    player.flip=true
    end
  end
end

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

end

function player_animate()
  if player.jumping then
    player.sp=7
  elseif player.falling then
    player.sp=8
  elseif player.slideing then
    player.sp=9
  elseif player.running then

      player.sp+=0.5
        if player.sp>6 then
          player.sp=3
        end
    else
      if time()-player.anim>.3 then
        player.anim=time()
        player.sp+=1
      if player.sp>2 then
        player.sp=1
      end
    end
  end
end

-->8


function ancoin()
 csp=57
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
__gfx__
00000000009997000099970000999700009997000099970000999700009997000099970000999700000000000000000000000000000000000000000000000000
00000000099999990999999909999999099999990999999909999999099999990999999909999999000000000000000000000000000000000000000000000000
0000000011ff1f1011ff1f1011ff1f1011ff1f1011ff1f1011ff1f1011ff1f1011ff1f1011ff1f10000000000000000000000000000000000000000000000000
00000000111fff00111fff00111fff00111fff00111fff00111fff00111fff00771fff77111fff00000000000000000000000000000000000000000000000000
00000000119191001191910077919177177191701977910017719170779191777791917711919100000000000000000000000000000000000000000000000000
00000000771a1a66177a1a60771a1a77177a1a741a771a00177a1a74771a1a770a1a1a00177a1a60000000000000000000000000000000000000000000000000
0000000077111166a7711160aa11110041111114aa111100411111144111111441111100a7711160000000000000000000000000000000000000000000000000
00000000aa44a440aa44a440aa4444004aaaa000aa4444004aaaa0004aaaa0004444a000aa44a440000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000888888880000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000088008800000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000088008800000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000088008800000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000888888880000000000000000000000000000000000000000000000000000000000000000
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
000000009999111100000000000000003bb3bbbbbbbb3bb300009999999000000000999999900000000000000000000000000000000000000000000000000000
00000000999911110000000000000000b3bbb3bbbb3bbb3b00099999797900000009999979790000000000000000000000000000000000000000000000000000
00000000999911110000000000000000bb3bbbbbbbbbb3bb00999997979799990099999797979999000000000000000000000000000000000000000000000000
00000000999911110000000000000000bbb3bbb33bbb3bbb09999997979999990999919797999199000000000000000000000000000000000000000000000000
000000001111999900000000000000003bbb3bbbbbb3bbb309999911191119900999991119111990000000000000000000000000000000000000000000000000
00000000111199990000000000000000bbb3b3bbbb3b3bbb011111f77f77f10001111ff77f77f000000000000000000000000000000000000000000000000000
00000000111199990000000000000000bbbbbb3bb3bbbbbb01ff1f771f17700001ff1f771f177000000000000000000000000000000000000000000000000000
00000000111199990000000000000000bb3bbbb33bbbb3bb01ff1f771f17700001ff1f771f177000000000000000000000000000000000000000000000000000
000000004444111100000000000000033bbbbbb33000000001ffff771f17700001ffff771f177000000000000000000000000000000000000000000000000000
0000000044441111000000000000003bbbbbbbbbb30000001111fff77f77f0001111fff77f77f000000000000000000000000000000000000000000000000000
000000004444111100000000000003bbbb3bbbbbbb300000111ffffffffff000111ffffffffff000000000000000000000000000000000000000000000000000
00000000444411110000000000003bbbbbbbbb3bbbb30000111ffffffffff000111f77777f777000000000000000000000000000000000000000000000000000
0000000011114444000000000003bbb3bbbbbbbb3bbb30001111ffffffff0000111f777777777000000000000000000000000000000000000000000000000000
000000001111444400000000003b3bbbbbb3bbbbbbb3b30011111111111000001111f77777777000000000000000000000000000000000000000000000000000
00000000111144440000000003bbbbbbbbbbb3bbbbbbbb30111111111110000011111fffffff0000000000000000000000000000000000000000000000000000
0000000011114444000000003bbbb3bbbbbbbbbbbb3bbbb311111111110000001111111111000000000000000000000000000000000000000000000000000000
bbb344f4888888884f443bbb4444e444000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bb34444408800880444443bb44444464000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3344444408800880444444334f444444000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
44644444088008804444464444444554000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
444444e4888888884e44444445545335000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4e44444400000000444444e453353bb3000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
44444f440000000044f444443bb3bbbb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
444444440000000044444444bbbbbbbb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
11119999111111104444444444444444000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1111999911119991f444e44444f44444000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1111999911119991444444f4444444e4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1111999911119991444444444e444444000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
19991111999911113444444444444644000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1999111199991111b346444444444433000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1999111199991111bb344e44444443bb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0111111199991111bb3444444f443bbb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
14000000000000000000000000000014151515151515151515151515140000000000000000000000000000000000000000147272721415151514000000000000
00000000001415151515151515147272727272141515151515151515151414141414141414000000000000000000000000000014151515151515151515151515
14000000000000000000000000000014151515151515151515151515140000000000000023000000230000000000000000140000001415151514000000000000
00000000001415151515151515140000000000141515151515151515151515151515151514000000000000000000000000000014151515151515151515151515
14000000000000000000000000000014151515151515151515151515140000000000141414141414141414000000000000147272721415151514000000000000
00000000001415151515151515140000000000141515151515151515151515151515151514720000000000000000000000000014141415151515151515151515
14000000000000000000000000000014151515151515151515151515140000000000141515151515151514000000000000140000001415151514000000000000
00000000001415151515151515140000000000141515151515151515151515151515151514000000000000000000000000000000001415151515151515151515
14000000000000000000000000000014141414141414141414141414140000000000141515151515151514000000000000147272721415151514000000000000
00000000001414141414141414140000000000141515151515151515151515151515151514000000000000000000000000000000001415151515151515151515
140000000000000000000000000000470000470000470000470000471400000000001415151515151515140000000000001400b1001415151514000000000000
000000000000a5a5a5a5000000000000000000141515151515151515151515151515151514720000000000000000000000000000001415151515151515151515
14000000000000000000000000000047000047000047000047000047000000000000141515151515151514000000000000140072001415151514000000000000
000000000000a5a5a5a5000000000000000000141515151515151515151515151515151514000000000000000000000000000000001415151515151515151515
14000000000000d000d000d0002300470000470000470000470000472300d0d0d000141515151515151514000000002300000000001415151514000023002300
230023000033a5a5a5a500d0d0d0d0d0d0d0d0141515151515151515151515151515151514000000000000000000000000000000001415151515151515151515
14141414141414141414141414141414141414141414141414141414141414141414141515151515151514141414141414141414141415151514141414141414
14141414141414141414141414141414141414141515151515151515151515151515151514141414141414141414141414141414141415151515151515151515
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001a111111add11000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000111d11d11dd11000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001dd1d1ddddd11000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001d11d1ddddd11000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011dddd1dddd11000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011dddd1dddd11000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001d11111dddd11000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011ddddd1ddd11000
0000000000000000000000000000000000000000000000000000000000000000aa15aa000000000000000000aa15aa0000000000000000001ddddddd1dd11000
0000000000000000000000000000000000000000000000000000000000aaaaaa11141f1000000000000aaaaa01141f10000000000000000011111111d1d11000
0000000000000000000000000000000000000000000000000000000000001515014ffff00000000000001515114ffff000000000000000001dddddddd1d11000
000000000000000000000000000000000000000000000000000000008844ffff11177f7f000000000844ffff01177f7000000000000000001dddddddddd11000
000000000000000000000000000000000000000000000000000000008e4f7777f1151114000000008e4f777701f111f00000000000000000111111ddddd11000
000000000000000000000000000000000000000000000000000000000e4f777700aaaa15000000008e4f777700aaaa0000000000000000001dddddddddd11000
65656565000000000000006565656565000000000000006565656565884444401111aa11000000000044444000aa110000000000000000001dddddddddd11000
00000000000000000000000000000000000000000000000000000000000000001100011000000000000000000011100000000000000000001111111111111000
656565656565656565656565656565656565656565656565656565650aaaaa14000000000aaaaa140aaaaa140aaaaa140aaaaa1400aaaaaa00aaaaaa0aaaaaa7
00000000000000000000000000000000000000000000000000000000001515000000000000151500001515000015150000151500000a1a10000a1a1000151509
6565656565656565656565656565656565656565656565656565656500fffff00000000000fffff000fffff000fffff000fffff0000fffff000fffff00fffff9
000000000000000000000000000000000000000000000000000000000f11711000aaaa140f1171100f1171100f1171100f11711000f1171100f117110fff7ff7
656565656565656565656565656565656565656565656565656565650f188810000115000f7888170f188810771888100f18881077f1888177f188810fff8ff7
000000000000000000000000000000000000000000000000000000009aa9a914077fff7799a9a90a97a9a97099a9a9779aa9a91499a9a97799a9a9779aa79a99
6565656565656565656565656565656565656565656565656565656579aaaa079f77777f9aaaaaaa99aaaa009aa99aa979aaaa079aa99aa99aa99aa999aaaaa9
000000000000000000000000000000000000000000000000000000009aaa9a1499aa9aa99a99990099aaaa00799779979aaa9a14799779977997799799999aa7
656565656565656565656565656565656565656565656565656565650aaaaa140aaaaa140aaaaa140aaaaa149600006000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000a1a17000a1a1000151500000a1a100061610000aaaaaa000aaaaa0000000000000000
65656565656565656565656565656565656565656565656565656565000fffff000fffff00fffff0000fffff00fffff700001515000015150000000000000000
0000000000000000000000000000000000000000000000000000000000f7777799f777770f11711099f777770f1171178844ffff0844ffff0000000000000000
6565656565656565656565656565656565656565656565656565656599f7777799f777770718881799f777770f1888168e4f77778e4f77770000000000000000
000000000000000000000000000000000000000000000000000000009779a9009779a90009a9a90a9779a900076969070e4f77778e4f77770000000000000000
656565650000000000000065656565650000000000000065656565659aa99a140aa99a149aaaaaaa0aa99a149900006088444440004444400000000000000000
0000000000000000000000000000000000000000000000000000000079977997799779979a999000799779979600060000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000aaaaa1400aaaa140aaaaa1400887778aa15aa00aa15aa000000000000000000
00000000000000000000000000000000000000000000000000000000000000000015150000011500001515000088171811141f1001141f100000000000000000
000000000000000000000000000000000000000000000000000000000000000000fffff000fffff000fffff0008fffff014ffff0114ffff00000000000000000
00000000000000000000000000000000000000000000000000000000000000000f1171100f77777f0f11711009f7777711177f7f01177f700000000000000000
0000000000000000000000000000000000000000000000000000000000000000471888170f77777f0f18881077f77777f115111401f111f00000000000000000
000000000000000000000000000000000000000000000000000000000000000044a9a90a07999aa7a779a97a77a9a97a00aaaa1500aaaa000000000000000000
00000000000000000000000000000000000000000000000000000000000000008aaaaaaa07aaa997a888888a44aaaaaa1111aa1100aa11000000000000000000
00000000000000000000000000000000000000000000000000000000000000009a99900009aa9aa999977900a999900011000110001110000000000000000000
__label__
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd

__gff__
0000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000030000000000000000000000000000000300000000000000000000000000000001000300000000000000000000000003030000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
4141414141414141414141414141414141414141414141414141414141414141414141414141414141414141415151414141414141414141414141414141415151515151515141414141414141414141414141414141414141414141414141515151515141414141414141414141414141414141414141414141414141414141
4100000000000000000000000000000000000000000000000000000000000000000000000000000000000000415151410000000000000000000000000000415151515151515141000000000000000000000000000000000000000000000041515151515141000000000000000000000000000000000000000000000000000041
4100000000000000000000000000000000000000000000000000000000000000000000000000000000000000415151410000000000000000000000000000415151515151515141000000000000000000000000000000000000000000000041515151515141000000000000000000000000000000000000000000000000000041
4100000000000000000000000000000000000000000000000000000000000000000000000000000000000000415151410000000000000000000000000000415151515151515141000000000000000000000000000000000000000000000041515151515141000000000000000000000000000000000000000000000000000041
4100000000000000000000000000000000000000000000000000000000000000000000000000000000000000415151410000000000000000000000000000415151515151515141000000000000000000000000000000000000000000000041515151515141000000000000000000000000000000000000000000000000000041
4100000000000000000000000000000000000000000000000000000000000000000000000000000000000000415151410000000000000000000000000000415151515151515141000000000000000000000000000000000000000000000041515151515141000000000000000000000000000000000000000000000000000041
4100000000000000000000000000000000000000000000000000000000000000000000000000000000000000415151410000000000000000000000000000415151515151515141000000000000000000000000000000000000000000000041515151515141000000000000000000000000000000000000000000000000000041
4100000000000000000000000000000000000000000000000000000000000000000000000000000000000000415151410000000000000000000000000000415151515151515141000000000000000000000000000000000000000000000041515151515141000000000000000000004141410000000000000000000000000041
4100000000000000000000000000000000000000000000000000000000000000000000000000000000000000414141410000000000000000000000000000414141414141414141000000000000000000000000000000000000000000000041414141414141000000000000000000414141414100000000000000000000000041
410000000000000032000000323232323200320000001800320000180032000018003232323232000000005a000000000000004141414100000d0d0d0d0d5a5a5a5a5a5a5a5a5a000032000000003300003200000d0d0d0d0d0d0d0d0d0000000000000000000000003200000032414141414100330000003200003200000041
4100000000004141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414100002741
4100000000004151514100000000000000000000000000410000000000000000000000000000000000000000000000000000000000000000000000000000000000000000415151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151514141000041
4100000000004151514100000000000000000000000000410000000000000000000000000000000000000000000000000000000000000000000000000000000000000000415151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151514100000041
4100000000004141414100000000000000000000000000410000000000000000000000003200000000000000000000000000000000000000000000000000000000000000415151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151514100000041
4100000000000000000000000000000000000000000000410000000000000000004141414141414141410000000000000000000000000000000000000000000000000000415151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151514100000041
4100000000000000000000000000000000000000000000410000000000000000004151515151515151410000000000000000000000000000000000000000000000000000415151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151514100000041
4100000000000000000000000000000000000000000000410000000000000000004151515151515151410000000000000000000000000000000000000000000000000000415151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151514100000041
4141414141414141414127272700320000000000000000410000000000000000004151515151515151410000000000000000000000000000000000000000000000000000415151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151514100004141
5151515151515151514100000000272700320000000000410000000000000000004151515151515151410000000000000000000000000000000000000000000000000000415151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151514100000041
5151515151515151514100000000000000272700320000410000000000000000004151515151515151410000000000000000000000000000000000000000000000000000415151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151514100000041
515151515151515151410d0d0d0d0d0000000000272700340032000d0d0d003200415151515151515141000000003200000d0d0d0d000032000032323232000018000000415151515151515151414141414141414141414141414141414141414141414141414151515151515151515151515151515151515151514100000041
5151515151515151514141414141414141414141414141414141414141414141414151515151515151414141414141414141414141414141414141414141414141414141414151515151515151410000000000000000000000000000000000000000000000004151515141414141414141414141414141414141414100000041
5151515151515151515151515151515151515151515151515151515151515151515151515151515151410000000000000000000000000000003400000000000000000000004151515151515151410000000000000000000000000000000000000000000000004151515141000000000000000000000000000000414100000041
5151515151515151515151515151515151515151515151515151515151515151515151515151515151410000000000000000000000000000003400000000000000000000004151515151515151410000000000000d0d0d0d0d0d0d00330000000000000000004141414141000000000000000000000000000000414100000041
5151515151515151515151515151515151515151515151515151515151515151515151515151515151410000000000000000000000000000003400000000000000000000004151515151515151410000272727414141414141414141414100000000000000000000000000000000000000000000000000000000414100000041
5151515151515151515151515151515151515151515151515151515141414141414141414141414141410000000000000000000000000000003400000000000000000000004151515151515151410000000000415151515151515151514100000000000000000000000000000000000000000000000000000000414100000041
5151515151515151515151515151515151515151515151515151515141000000000000000000000000000000000000414141000000000000003400000000000000000000004151515151515151410000000000415151515151515151514100000000000000000000000000000000000000000000000000000000000000000041
5151515151515151515151515151515151515151515151515151515141000000000000000000000000000000000000000041000000000000003400000000000000000000004151515151515151410000000000415151515151515151514100000000000000000000000000000000000000000000000000000000000000000041
5151515151515151515151515151515151515151515151515151515141000000000000000000000000000000000000000041000000000000003400000000000000000000004151515151515151410000000000415151515151515151514100000000000000000000000000000000000000000000000000000000000000000041
51515151515151515151515151515151515151515151515151515151412727270000000000000000000000000000000000410d0d0d0d0d0d0d3400000000000000000000004151515151515151410000000000415151515151515151514100000000000000000000000000000000000000000000003200003200003200000041
51515151515151515151515151515151515151515151515151515151410000000000000000000000000000000000000000412727274141414141000000000000000000000041515151515151514100000000004151515151515151515141000000000000000000000000000d0d0d000000000041414141414141414141414141
41414141414141414141414141414141515151515151515151515151410000000000000000000000000000000000000000410000004151515141000000000000000000000041515151515151514100000000004151515151515151515141000d0d0d0d0d00000000000041414141410000000041515151515151515151515151
__sfx__
0103000021360213602135021350213502135022340233302432025320263202732028320293202a3202b3102c3102d3100000000000000000000000000000000000000000000000000000000000000000000000
__music__
00 01424344
00 01424344

