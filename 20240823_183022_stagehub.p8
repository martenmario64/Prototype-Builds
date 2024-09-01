pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
sp = 0
cam_x = 0
nx = -8
mahuy = 0
heatmeter = 0
blink = 0
selected = 1
lst=""
world = 1


function _update60()
 cam_x+=3
 
 if nx > 73 then
  nx = 73
 end
 if cam_x > 700 then
  cam_x = 0
 end
 if time() > 5 then
  nx+=7
 else
  nx = cam_x-8
 end
 sp+=0.5
 blink+=1
 if blink > 1 then
  blink = 0
 end
 if sp > 2 then
  sp = 0
 end
 if selected == 1 then
  if btnp(❎) then
   load("stage1")
  end
 elseif selected == 2 then
  if btnp(❎) then
   load("stage2")
  end
 elseif selected == 3 then
  if btnp(❎) then
   load("stage3")
  end
 elseif selected == 4 then
  if btnp(❎) then
   load("stage4")
  end
 elseif selected == 5 then
  if btnp(❎) then
   load("exit1")
  end
 end
 if selected < 1 then
  selected=1
 elseif selected > 5 then
  selected=5
 end
 if btnp(⬅️) then
  selected-=1
 elseif btnp(➡️) then
  selected+=1
 end
  if selected == 2 then
  lst="      stage2"
 elseif selected == 3 then
  lst="      stage3"
 elseif selected == 4 then
  lst="      stage4"
 elseif selected == 5 then
  lst="      exit 1"
 elseif selected == 1 then
  lst="      stage1"
 end
end

function _draw()
 camera(cam_x,0)
	cls(2)
	map()
	sspr((14 % 16) * 8,flr(14 / 16) * 8,16,16, cam_x+96,-4,26,26)
 if blink == 1 then
  spr(78,cam_x+63,104)
 end
 pal(9,2)
 pal(6,2)
 pal(4,5)
 spr(sp,cam_x+39,104)
 pal()
 pal(9,3)
 pal(6,3)
 pal(4,5)
 spr(sp,cam_x+51,104)
 pal()
 spr(sp,cam_x+63,104)
 spr(93,cam_x+36,mahuy+1)
 spr(71,cam_x+1,mahuy+9,2,1)
 spr(72,cam_x+17,mahuy+9,1,1)
 spr(87,cam_x+25,mahuy+9)
 spr(221,cam_x+15,mahuy+13)
 spr(222,cam_x+1,mahuy+17)
 spr(73,cam_x+9,mahuy+5,2,1)
 spr(73,cam_x+1,mahuy+5,2,1)
 spr(89,cam_x+25,mahuy+5,1,1)
 score=tostring(flr(coins))
 digit_color={2,3,14,7,8,2,9}
 digit_v_offset={0,0,0,0,0,0,0}
 char2={5,5,2,6,2,2,5}  
 for c=1, #score do
  local char = sub(score,c,c)
  print(char,cam_x+6+c*4,flr(mahuy+5),char2[c])
  print(char,cam_x+5+c*4,flr(mahuy+5),digit_color[c])
 end
 pal()
 print("    pico remix",cam_x+3,35,7)
 spr(128,cam_x+1,1,10,4)
 print("\n       world "..world,cam_x+22.5,50,7)
 --print("  pizza tower levels",24,60,7)
 print("\n\n\n "..lst,cam_x+24,50,7)
 spr(156,cam_x+90,50,3,3)
 print("❎ - jump\n⬅️ / ➡️ - move\n🅾️ - run\n⬆️ - taunt\n⬇️ - grab",cam_x+70,90,7)
 print("\n\n\n "..lst,cam_x+24,50,7)

end
__gfx__
066616600666166006661660ddd1dddd555155550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
011151910011519100115191ddd1dddd555155554ff8f00000000000000000000000000000000000000000000000000000000000000000000000000000000000
00159999011599990015999911111111111111114ffffff000000000000000000000000000000000000000000000000000000000000000000ddddddddddddd10
911166969111669691116696dddddd1d555555154ffff8ff0000000000000000000000000000000000000000000000000000000000000000d6616661666666d1
001611100016111000161110dddddd1d555555154f8ffff00000000000000000000000000000000000000000000000000000000000000000d2661616666112d1
00666660006666600066666011111111111111114ffff0000000000000000000000000000000000000000000000000000000000000000000d2266166661111d1
011666100061116001166110ddd1dddd55515555000000000000000000000000000000000000000000000000000000000000000000000000d2261516661112d1
0100111000111000011001101111111111111111000000000000000000000000000000000000000000000000000000000000000000000000d2261516665511d1
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d2266966665512d1
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d2265951691111d1
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d2265995669121d1
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d2266599566911d1
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d2266659566911d1
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d2211115111911d1
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d2266666666911d1
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ddddddddddddd10
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
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000900000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000900000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000900000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000900000000
00000000000000000000000000000000000000000000000000000000151111111111111159999999999999990000000000000000000000000000000900000000
00000000000000000000000000000000000000000000000000000000151000001000000059999999999999990000000000000000000000000000000900000000
00000000000000000000000000000000000000000000000000000000151111111111111159999999999999990000000000000000000000000000000900000000
00000000000000000000000000000000000000000000000000000000011111111111111105555555555555550000000000000000000000000000000900000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006666000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000066661100000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000666665560000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000666655560000000000000000
00000000000000000000000000000000000000000000000000000000111111510000000099999995000000000000000000000000655555660000000000000000
00000000000000000000000000000000000000000000000000000000100001510000000099999995000000000000000000000000655556660000000000000000
00000000000000000000000000000000000000000000000000000000111111510000000099999995000000000000000000000000065566600000000000000000
00000000000000000000000000000000000000000000000000000000111111100000000055555550000000000000000000000000006666000000000000000000
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
0000000005fffffffff5000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000005ffffffffffffff00022888200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000ffffffffffff888ff00028882000000000000005f5000000000000000000028ffff800000000000000000000000000000000000000000000000000000000
0000fffffff0fff8888ff0000022000000000000222fff00ff82222fffff5000288fffff80000000000000000000000000000000000000000000000000000000
0000fffffffffff88888f0000000000000000028888fff00ff88888fffff5000888fffff88200000000000000000000000000000000000000000000000000000
0000ff88fffffff88888f0000ff8220000fff888888ff100fff888ffffff50088fffffff88820000000000000000000000000000000000000000000000000000
000ff8888fffffff888f50ffffff8808fffffff888fff008fffffffffff8005fff500fff88882000000000000000000000000000000000000000000000000000
000f88888fffffffff8000ffffffff0dffffffffffff005fffffffff882000ffff000fff88888000000000000000000000000000000000000000000000000000
000f88888ffffffff50000f8888fff0ff5000ffffff500005ffffff8820000fffffffffff88ff000000000000000000000000000000000000000000000000000
005ff888fffffff500000188888fff0500005fffff50000000005ff8800001fffffffffffffff000000000000000000000000000000000000000000000000000
008fffffff5550000000088888ffff00000ffffff505d8000000fff8000005f888fffffffffff000000000000000000000000000000770000000000000000000
002fffffff00000000000ff88ffff80000ffffff88ffff00008fffffffff0888888ffffffffff000000000000000000000000000007777000000000000000000
0088ffffff800000000099ffffff82000ffffff8888fff00028ffffffff5088888850ffffffff000000000000000000000000000077777700000000000000000
028fffff88200000000099999f9882008ffffff88888ff00288fffffff500888888005fffffff000000000000000000000000000000770000000000000000000
58ffffff8880000000009990000000008888fff88888f802888fffffff000ff88ff001fffff82000000000000000000000000000000770000000000000000000
899ffff888820000000000000000000088888ff8888ff90288ffffff950009fffff0059999982000000000000000000000000000000770000000000000000000
89999888444400000000000000000000488889ff9898880005899999800009999f80000555500000000000000000000000000000000000000000000000000000
55000000000000000000000000000000044448555000000000000888000008888500000000000000000000000000000000007000000000000007000000000000
00000000000000000555000000000000000000000000000000000000000000000000000000000000000000000000000000077000000000000007700000000000
0000000000055ddd5ddd000000000000000000000000000000000000000000000000000000000000000000000000000000777777000000007777770000000000
0005dddddddddddddddd500055ddd10555550000055500000000000000000000055ddd5000000000000000000000000000777777000000007777770000000000
0005dddddddddd5ddddd505dddddddd5dddd05d005ddd5d00001555d5000015d55ddddd500000000000000000000000000077000000000000007700000000000
0005dddddddddddddddd50dddddddddddddd1dd11ddddd5055ddddddd005ddddddddddd500000000000000000000000000007000000000000007000000000000
0005dddddddddddd551105dddddddddd5ddddddd5dddd505ddddddddd005dddd11ddddd500000000000000000000000000000000000000000000000000000000
0005dddddddddddd00000ddddddddddd5dd5ddd5ddddd005ddd55551000ddddd005dddd000000000000000000000000000000000000770000000000000000000
0005555100dddddd00005ddddddddd5d1dddddd5dddd500dddddddd5000ddddd55dddd5000000000000000000000000000000000000770000000000000000000
0000000000ddd5dd10005dddd0dddddd1dddddddddd50005ddddddd50005dddddddddd0000000000000000000000000000000000000770000000000000000000
0000000000dddddd50005ddddddddddd1ddd1dddddd0000ddd5111000005ddddddddd00000000000000000000000000000000000077777700000000000000000
0000000000ddd5ddd000dddddddddddd0ddd0dddd510001dddd555000005ddddddd5100000000000000000000000000000000000007777000000000000000000
0000000005dddddd5000dddddddddddd05d505d5d500005dddddd500000dddddddddd10000000000000000000000000000000000000770000000000000000000
0000000005ddddddd1000ddddddddd5105d100ddd000005ddddddd00000ddd55ddddd51000000000000000000000000000000000000000000000000000000000
0000000005dddddddd0000dddddd5500001000000000005ddd555100000dddd5ddddddd500000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000065000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000555500000660066000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000555500000600006000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000055000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000600006000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000660066000000000
__label__
1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1dddddddddddddddddddddd11ddddddd
1ddddddd1d5fffffffff5ddd1ddddddd1ddddd6666dddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddddd666116666116666666666d11dddddd
11111115ffffffffffffff11122888211111166661111111111111111111111111111111111111111111111111111111dd666116666116666666666d11111111
ddd1dffffffffffff888ffddd28882ddddd1666665565f5dddd1ddddddd1dddddd28ffff8dd1ddddddd1ddddddd1dddddd266661661666666611122d11d1dddd
ddd1dfffffffdfff8888ffddddd22dddddd166665222fffddff82222fffff5ddd288fffff8d1ddddddd1ddddddd1dddddd222666116666661111111d11d1dddd
11111fffffffffff88888f1111111111111165528888fff11ff88888fffff5111888fffff88211111111111111111111dd222666116666661111111d11111111
1ddddff88fffffff88888fdd1dff822d1ddfff888888ff1d1fff888ffffff5dd88fffffff8882ddd1ddddddd1ddddddddd222661551666661111122d11dddddd
1111ff8888fffffff888f51ffffff8818fffffff888fff118fffffffffff8115fff511fff88882111111111111111111dd222661551666665555111d11111111
1dddf88888fffffffff8dddffffffffddffffffffffffdd5fffffffff882dddffffdddfff88888dd1ddddddd1ddddddddd222661551666665555111d11dddddd
1599f88888ffffffff59999f8888fff9ff5dddffffff5ddd15ffffff882ddddfffffffffff88ffdd1ddddddd1ddddddddd222666996666665555122d11dddddd
1595ff888fffffff599999188888fff9511115fffff51111111115ff8811111fffffffffffffff111111111111111111dd222666996666665555122d11111111
d598fffffff5559999999988888ffff95dd1ffffff515d8dddd1dfff8dd1dd5f888fffffffffffddddd1ddddddd1dddddd222665995116691111111d11d1dddd
dd52fffffff55555555555ff88ffff85dddffffff88ffffdddd8fffffffffd888888ffffffffffddddd1ddddddd1dddddd222665999556669911211d11d1dddd
11588ffffff811116511199ffffff82511ffffff8888fff11128ffffffff5188888851ffffffff111111111111111111dd222665999556669911211d11111111
1128fffff882ddd5555dd99999f9882518ffffff88888ffd1288fffffff5dd888888dd5fffffffdd1ddddddd1ddddddddd222666559995566699111d11dddddd
158ffffff8881115555119991111111518888fff88888f812888fffffff111ff88ff111fffff82111111111111111111dd222666559995566699111d11111111
1899ffff888821115511111111111111188888ff8888ff9d288ffffff95ddd9fffffdd59999982dd1ddddddd1ddddddddd222666665995566699111d11dddddd
1899998884444ddd1ddddddd1ddddddd1488889ff989888d1d58999998dddd9999f8dddd5555dddd1ddddddd1ddddddddd222111111551111199111d11dddddd
155611661111111111111111111111111144448555111111111111888111118888511111111111111111111111111111dd222111111551111199111d11111111
dd61ddd6ddd1dddddd555dddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1dddddd222666666666666699111d11d1dddd
ddd1ddddddd155ddd5ddddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddddddddddddddddddddddd1ddd1dddd
11115dddddddddddddddd511155ddd11555551111155511111111111111111111155ddd511111111111111111111111111ddddddddddddddddddddd111111111
1d6d5dddddddddd5ddddd5d5dddddddd5ddddd5d1d5ddd5d1ddd1555d5dddd15d55ddddd5ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd
11665dddddddddddddddd51dddddddddddddd1dd11ddddd5155ddddddd115ddddddddddd51111111111111111111111111111111111111111111111111111111
1ddd5dddddddddddd5511d5dddddddddd5ddddddd5dddd5d5ddddddddddd5dddd11ddddd5ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd
1ddd5dddddddddddddddddddddddddddd5dd5ddd5ddddddd5ddd55551dddddddddd5dddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd
11115555111dddddd11115ddddddddd5d1dddddd5dddd511dddddddd5111ddddd55dddd511111111111111111111111111111111111111111111111111111111
ddd1dddddddddd5dd1d1d5ddddddddddd1dddddddddd5ddd5ddddddd5dd15dddddddddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1dddd
ddd1ddddddddddddd5d1d5ddddddddddd1ddd1ddddddddddddd5111dddd15dddddddddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1dddd
11111111111ddd5ddd111dddddddddddd1ddd1dddd511111dddd555111115ddddddd511111111111111111111111111111111111111111111111111111111111
1ddddddd1d5dddddd5dddddddddddddddd5d5d5d5d5dddd5dddddd5d1ddddddddddddd1d1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd
11111111115ddddddd1111ddddddddd5115d111ddd111115ddddddd11111ddd55ddddd5111111111111111111111111111111111111111111111111111111111
1ddddddd1d5dddddddddddddddddd55d1dd1dddd1dddddd5ddd5551d1ddddddd5ddddddd5ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd
1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
ddd1ddddddd1ddddddd777d777d177dd77d1ddd777d777d777d777d7d7d1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1dddd
ddd1ddddddd1ddddddd7d7dd7dd7ddd7d7d1ddd7d7d7ddd777d17dd7d7d1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1dddd
11111111111111111117771171171117171111177117711717117111711111111111111111111111111111111111111111111111111111111111111111111111
1ddddddd1ddddddd1dd7dddd7dd7ddd717ddddd717d7ddd717dd7dd717dddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd
11111111111111111117111777117717711111171717771717177717171111111111111111111111111111111111111111111111111111111111111111111111
1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd
1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
ddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1dddd
ddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1dddd
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
15555555155555551555555515555555155555551555555515555555155555551555555515555555155555551555555515555555155555551555555515555555
15555555155555551555555515555555155555551555555515555555155555551555555515555555155555551555555515555555155555551555555515555555
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
55515555555155555551555555515555555155555551555555515555555155555551555555515555555155555551555555515555555155555551555555515555
55515555555155555551555555515555555155555551555555515555555155555551555555515555555155555551555555515775555155555551555555515555
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111117777111111111111111111111111
15555555155555551555555515555555155555551555555515555555155555551555555515555555155555551555555515577777755555551555555515555555
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111771111111111111111111111111
15555555155555551555555515555555155555551555555515757557757775751577555515775555155555551555555515555775155555551555555515555555
15555555155555551555555515555555155555551555555515757575757575751575755515575555155555551555555515555775155555551555555515555555
11111111111111111111111111111111111111111111111111717171717711711171711111171111111111111111111111111111111111111111111111111111
55515555555155555551555555515555555155555551555555777575757175755571755555575555555155555551557555515555555157555551555555515555
55515555555155555551555555515555555155555551555555777577557175777577755555777555555155555551577555515555555157755551555555515555
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111777777111111117777771111111111111111
15555555155555551555555515555555155555551555555515555555155555551555555515555555155555551555777777555555157777771555555515555555
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111177111111111111117711111111111111111
15555555155555551555555515555555155555551555555515555555155555551555555515555555155555551555557515555555155557551555555515555555
15555555155555551555555515555555155555551555555515555555155555551555555515555555155555551555555515555555155555551555555515555555
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111771111111111111111111111111
55515555555155555551555555515555555155555551555555515555555155555551555555515555555155555551555555515775555155555551555555515555
55515555555155555551555555515555555155555551555555515775777177755771777577515555555155555551555555515775555155555551555555515555
11111111111111111111111111111111111111111111111111117111171171717111711117111111111111111111111111177777711111111111111111111111
15555555155555551555555515555555155555551555555515557775175577757555775517555555155555551555555515557777155555551555555515555555
11111111111111111111111111111111111111111111111111111171171171717171711117111111111111111111111111111771111111111111111111111111
15555555155555551555555515555555155555551555555515557755175575757775777577755555155555551555555515555555155555551555555515555555
15555555155555551555555515555555155555551555555515555555155555551555555515555555155555551555555515555555155555551555555515555555
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
55515555555155555551555555515555555155555551555555515555555155555551555555515555555155555551555555515555555155555551555555515555
55515555555155555551555555515555555155555551555555515555555155555551555555515555555155555551555555515555555155555551555555515555
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
15555555155555551555555515555555155555551555555515555555155555551555555515555555155555551555555515555555155555551555555515555555
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
15555555155555551555555515555555155555551555555515555555155555551555555515555555155555551555555515555555155555551555555515555555
15555555155555551555555515555555155555551555555515555555155555551555555515555555155555551555555515555555155555551555555515555555
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
55515555555155555551555555515555555155555551555555515555555155555551555555515555555155555551555555515555555155555551555555515555
55515555555155555551555555515555555155555551555555515555555155555551555555515555555155555551555555515555555155555551555555515555
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
15555555155555551555555515555555155555551555555515555555155555551555555515555555155555551555555515555555155555551555555515555555
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
15555555155555551555555515555555155555551555555515555555155555551555555515555555155555551555555515555555155555551555555515555555
15555555155555551555555515555555155555551555555515555555155555551555555515555555155555551555555515555555155555551555555515555555
11111111111111111111111111111111111111111111111111111111111111111111111777771111111111111177717171777177711111111111111111111111
55515555555155555551555555515555555155555551555555515555555155555551557757577555555155555557557575777575755155555551555555515555
55515555555155555551555555515555555155555551555555515555555155555551557775777555557775555557557575717577755155555551555555515555
11111111111111111111111111111111111111111111111111111111111111111111117717177111111111111117117171717171111111111111111111111111
15555555155555551555555515555555155555551555555515555555155555551555555777775555155555551577555775757575155555551555555515555555
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
15555555155555551555555515555555155555551555555515555555155555551555555777775555155575551557777715555555155555777557757575777555
15555555155555551555555515555555155555551555555515555555155555551555557775577555155755551577557775555555155555777575757575755555
11111111111111111111111111111111111111111111111111111111111111111111117711177111111711111177111771111177711111717171717171771111
55515555555155555551555555515555555155555551555555515555555155555551557775577555555755555577557775515555555155757571757775715555
55515555555155555551555555515555555155555551555555515555555155555551555777775555557155555557777755515555555155757577555755777555
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
15555555155555551555555515555555155555551555555515555555155555551555555777775555155555551577757575775555155555551555555515555555
11111111111111111111111111111111111111111111111111111111111111111111117711177111111111111171717171717111111111111111111111111111
15555555155555551555555515555555155555552221225515553331335555556661667717577555157775551577557575757555155555551555555515555555
15555555155555551555555515555555155555551115121515551115131555551115197715577555155555551575757575757555155555551555555515555555
11111111111111111111111111111111111111111152222111111153333111111159999777771111111111111171711771717111111111111111111111111111
55515555555155555551555555515555555155521112222555531113333155591116696555515555555155555551555555515555555155555551555555515555
55515555555155555551555555515555555155555121115555515131115155555161119777775555555155555577757775717577557775555551555555515555
11111111111111111111111111111111111111111222221111111333331111111666667771777111111111111117117171717171711711111111111111111111
15555555155555551555555515555555155555551122215515551133315555551166617715577555157775551557557775757575755755551555555515555555
11111111111111111111111111111111111111111111111111111111111111111111117711177111111111111117117171717171711711111111111111111111
1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1dddddd77777dddd1ddddddd1dd7dd7d7dd77d7d7dd7dddd1ddddddd1ddddddd
1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd
11111111111111111111111111111111111111111111111111111111111111111111111777771111111111111117717771777177711111111111111111111111
ddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1dd77ddd77dddddd1dddddd71dd7d7d717d7d7dd1ddddddd1ddddddd1dddd
ddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1dd77ddd77ddddd777ddddd71dd77dd777d77ddd1ddddddd1ddddddd1dddd
11111111111111111111111111111111111111111111111111111111111111111111117771777111111111111171717171717171711111111111111111111111
1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1dddddd77777dddd1ddddddd1d777d7d7d7d7d777ddddddd1ddddddd1ddddddd
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd
1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
ddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1dddd
ddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1dddd
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111

__gff__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000410010000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303
0303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303
0303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303
0303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303
0303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303
0303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303
0404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404
0404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404
0404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404
0404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404
0404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404
0404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404
0404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404
0404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404
0303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303
0303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303
