
# bgm = IO.popen("/usr/bin/mplayer -loop 99 -slave -quiet tamhe08_loop.ogg", "r+")
# 
# #def se
# #  system("/usr/bin/mplayer -quiet bigshot1.wav 2>&1 >/dev/null &")
# #end
# se = IO.popen("/usr/bin/mplayer -quiet -slave tamhe08_loop.ogg", "r+")
# 
# while true
#     print ">"
#     val = gets
#     if val.chomp == "q" && bgm != nil
#         # http://www.mplayerhq.hu/DOCS/tech/slave.txt
#         bgm.puts "quit"
#         bgm.close_write
#     else
#         se.puts "path bigshot1.wav"
#     end
#     puts val
# end
