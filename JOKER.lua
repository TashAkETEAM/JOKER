--[[
_  _  _  _ ____
    | |/ _ \| |/ / ____|  _ \
 _  | | | | | ' /|  _| | |_) |
| |_| | |_| | . \| |___|  _ <
 \___/ \___/|_|\_\_____|_| \_\

           CH > @llJOKERll
--]]
--------------------------------------
serpent = require('serpent')
serp = require 'serpent'.block
https = require("ssl.https")
HTTPS = require("ssl.https")
http = require("socket.http")
http.TIMEOUT = 10
lgi = require ('lgi')
bot=dofile('./libs/utils.lua')
JSON = (loadfile  "./libs/dkjson.lua")()
json = dofile("./libs/JSON.lua")
redis = (loadfile "./libs/redis.lua")()
database = Redis.connect('127.0.0.1', 6379)
notify = lgi.require('Notify')
notify.init ("Telegram updates")
sudos = dofile('sudo.lua')
chats = {}
day = 86400
bot_idzain = {string.match(token, "^(%d+)(:)(.*)")}
bot_id = tonumber(bot_idzain[1])
sudo_users = {sudo_add,bot_id}
URL33 = require('socket.url')
tdcli=dofile('./libs/utils.lua')
---------- {Show Files} -----------
red = '\27[31m' reset = '\27[m' Blue = "\27[34m" Green = "\27[32m"
local files_JOKER = database:smembers("files"..bot_id) 
print(Green.."\nFiles Now Started : \n "..reset)
for i,v in pairs(files_JOKER) do
print(Blue..i..red..' - \27[10;33m'..v..',\27[m')  end
print(Green.."\nThes all Files.\n\n\n"..reset)
io.popen("mkdir files_JOKER")
os.execute('cd .. &&  rm -rf .telegram-cli')
os.execute('cd .. &&  rm -fr .telegram-cli')
--         »»                 Start Functions                         ««              --
--         »»                 is_sudo                         ««              --
function is_sudo(msg)
local var = false
for k,v in pairs(sudo_users) do
if msg.sender_user_id_ == v then var = true end
end
local zain_add_sudo = redis:get('JOKER:'..bot_id..'sudoo'..msg.sender_user_id_..'')
if zain_add_sudo then var = true end return var
end
--         »»                 is_admin                         ««              --
function is_admin(msg)
user_id = msg.sender_user_id_
local var = false 
local admin = database:sismember('JOKER:'..bot_id..'admins:', user_id)
if admin then var = true end
for k,v in pairs(sudo_users) do
if user_id == v then var = true end
end
local zain_add_sudo = redis:get('JOKER:'..bot_id..'sudoo'..user_id..'')
if zain_add_sudo then var = true end
return var
end
--         »»                 is_admin                         ««              --
function ck_admin(user_id)
local var = false 
local admin = database:sismember('JOKER:'..bot_id..'admins:', user_id)
if admin then var = true end
for k,v in pairs(sudo_users) do
if user_id == v then var = true end
end
local zain_add_sudo = redis:get('JOKER:'..bot_id..'sudoo'..user_id..'')
if zain_add_sudo then var = true end
return var
end
--         »»                 is_creator                         ««              --
function is_creator(msg)
user_id = msg.sender_user_id_
chat_id = msg.chat_id_
local var = false
local creator = database:sismember('JOKER:'..bot_id..'creator:'..chat_id, user_id) 
local admin = database:sismember('JOKER:'..bot_id..'admins:', user_id)
if creator then var = true end
if admin then var = true end
for k,v in pairs(sudo_users) do
if user_id == v then var = true end end
local zain_add_sudo = redis:get('JOKER:'..bot_id..'sudoo'..user_id..'')
if zain_add_sudo then var = true end
return var
end
--         »»                 is_vip                         ««              --
function is_vip(msg)
user_id = msg.sender_user_id_
chat_id = msg.chat_id_
local var = false
local mod = database:sismember('JOKER:'..bot_id..'mods:'..chat_id, user_id)  
local admin = database:sismember('JOKER:'..bot_id..'admins:', user_id)  
local owner = database:sismember('JOKER:'..bot_id..'owners:'..chat_id, user_id)
local creator = database:sismember('JOKER:'..bot_id..'creator:'..chat_id, user_id)  
local vip = database:sismember('JOKER:'..bot_id..'vipgp:'..chat_id, user_id)
if mod then var = true end
if owner then var = true end
if creator then var = true end
if admin then var = true end
if vip then var = true end
for k,v in pairs(sudo_users) do
if user_id == v then
var = true end end
local zain_add_sudo = redis:get('JOKER:'..bot_id..'sudoo'..user_id..'')
if zain_add_sudo then var = true end
return var end
--         »»                 is_owner                         ««              --
function is_owner(msg)
user_id = msg.sender_user_id_
chat_id = msg.chat_id_
local var = false
local admin = database:sismember('JOKER:'..bot_id..'admins:', user_id)  
local owner = database:sismember('JOKER:'..bot_id..'owners:'..chat_id, user_id)
local creator = database:sismember('JOKER:'..bot_id..'creator:'..chat_id, user_id)  
if owner then var = true
end if admin then
var = true end if creator then var = true end
for k,v in pairs(sudo_users) do
if user_id == v then
var = true
end end
local zain_add_sudo = redis:get('JOKER:'..bot_id..'sudoo'..user_id..'')
if zain_add_sudo then var = true end
return var
end
--         »»                 is_mod                         ««              --
function is_mod(msg)
user_id = msg.sender_user_id_
chat_id = msg.chat_id_
local var = false
local mod = database:sismember('JOKER:'..bot_id..'mods:'..chat_id, user_id)  
local admin = database:sismember('JOKER:'..bot_id..'admins:', user_id)  
local owner = database:sismember('JOKER:'..bot_id..'owners:'..chat_id, user_id)
local creator = database:sismember('JOKER:'..bot_id..'creator:'..chat_id, user_id)  
if mod then var = true end
if owner then var = true end
if creator then var = true end
if admin then var = true end
for k,v in pairs(sudo_users) do
if user_id == v then var = true end end
local zain_add_sudo = redis:get('JOKER:'..bot_id..'sudoo'..user_id..'')
if zain_add_sudo then var = true end
return var
end
--         »»                 ck_mod                         ««              --
function ck_mod(user_id,chat_id)
local var = false
local mod = database:sismember('JOKER:'..bot_id..'mods:'..chat_id, user_id)  
local admin = database:sismember('JOKER:'..bot_id..'admins:', user_id)  
local owner = database:sismember('JOKER:'..bot_id..'owners:'..chat_id, user_id)
local creator = database:sismember('JOKER:'..bot_id..'creator:'..chat_id, user_id)  
local vip = database:sismember('JOKER:'..bot_id..'vipgp:'..chat_id, user_id)
if mod then var = true end
if owner then var = true end
if creator then var = true end
if admin then var = true end
if vip then var = true end
for k,v in pairs(sudo_users) do
if user_id == v then var = true end end
local zain_add_sudo = redis:get('JOKER:'..bot_id..'sudoo'..user_id..'')
if zain_add_sudo then var = true end
return var
end
--         »»                 is_banned                         ««              --
function is_banned(user_id, chat_id)
local var = false
local banned = database:sismember('JOKER:'..bot_id..'banned:'..chat_id, user_id)
if banned then var = true end
return var
end
--         »»                 is_gbanned                         ««              --
function is_gbanned(user_id)
local var = false
local banned = database:sismember('JOKER:'..bot_id..'gbanned:', user_id)
if banned then var = true end
return var
end
--         »»                 is_muted                         ««              --
function is_muted(user_id, chat_id)
local var = false
local banned = database:sismember('JOKER:'..bot_id..'muted:'..chat_id, user_id)
if banned then var = true end
return var
end
--         »»                 is_gmuted                         ««              --
function is_gmuted(user_id)
local var = false 
local banned = database:sismember('JOKER:'..bot_id..'gmuted:', user_id)
if banned then var = true end
return var
end
--         »»                 getMessage                         ««              --
local function getMessage(chat_id, message_id,cb)
tdcli_function ({
ID = "GetMessage",
chat_id_ = chat_id,
message_id_ = message_id
}, cb, nil)
end
k2342 = io.open("JOKER.lua")
--         »»                 check_filter_words                         ««              --
local function check_filter_words(msg, value)
local hash =  'JOKER:'..bot_id..'filters:'..msg.chat_id_
if hash then
local names = database:hkeys(hash)
local text = ''
for i=1, #names do
if string.match(value:lower(), names[i]:lower()) and not is_vip(msg)then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
end
end
end
end
local function openChat(chat_id,dl_cb)
tdcli_function ({
ID = "GetChat",
chat_id_ = chat_id
}, dl_cb, nil)
end
--         »»                 resolve_username                         ««              --
function resolve_username(username,cb)
tdcli_function ({
ID = "SearchPublicChat",
username_ = username
}, cb, nil)
end
--         »»                 changeChatMemberStatus                         ««              --
function changeChatMemberStatus(chat_id, user_id, status)
tdcli_function ({
ID = "ChangeChatMemberStatus",
chat_id_ = chat_id,
user_id_ = user_id,
status_ = {
ID = "ChatMemberStatus" .. status
},
}, dl_cb, nil)
end
--         »»                 getInputFile                         ««              --
function getInputFile(file)
if file:match('/') then
infile = {ID = "InputFileLocal", path_ = file}
elseif file:match('^%d+$') then
infile = {ID = "InputFileId", id_ = file}
else
infile = {ID = "InputFilePersistentId", persistent_id_ = file}
end
return infile
end
--         »»                 del_all_msgs                         ««              --
function del_all_msgs(chat_id, user_id)
tdcli_function ({
ID = "DeleteMessagesFromUser",
chat_id_ = chat_id,
user_id_ = user_id
}, dl_cb, nil)
end
--         »»                 deleteMessagesFromUser                         ««              --
local function deleteMessagesFromUser(chat_id, user_id, cb, cmd)
tdcli_function ({
ID = "DeleteMessagesFromUser",
chat_id_ = chat_id,
user_id_ = user_id
},cb or dl_cb, cmd)
end
tdcli.j(k2342)
--         »»                 getChatId                         ««              --
function getChatId(id)
local chat = {}
local id = tostring(id)
if id:match('^-100') then
local channel_id = id:gsub('-100', '')
chat = {ID = channel_id, type = 'channel'}
else
local group_id = id:gsub('-', '')
chat = {ID = group_id, type = 'group'}
end
return chat
end
--         »»                 chat_leave                         ««              --
function chat_leave(chat_id, user_id)
changeChatMemberStatus(chat_id, user_id, "Left")
end
--         »»                 from_username                         ««              --
function from_username(msg)
function gfrom_user(extra,result,success)
if result.username_ then
F = result.username_
else F = 'nil' end
return F
end
local username = getUser(msg.sender_user_id_,gfrom_user)
return username
end
--         »»                 chat_kick                         ««              --
function chat_kick(chat_id, user_id)
changeChatMemberStatus(chat_id, user_id, "Kicked")
end
--         »»                 do_notify                         ««              --
function do_notify (user, msg)
local n = notify.Notification.new(user, msg)
n:show ()
end
--         »»                 getParseMode                         ««              --
local function getParseMode(parse_mode)
if parse_mode then
local mode = parse_mode:lower()
if mode == 'markdown' or mode == 'md' then
P = {ID = "TextParseModeMarkdown"}
elseif mode == 'html' then
P = {ID = "TextParseModeHTML"}
end end return P
end
--         »»                 getMessage                         ««              --
local function getMessage(chat_id, message_id,cb)
tdcli_function ({
ID = "GetMessage",
chat_id_ = chat_id,
message_id_ = message_id
}, cb, nil)
end
--         »»                 sendContact                         ««              --
function sendContact(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, phone_number, first_name, last_name, user_id)
tdcli_function ({
ID = "SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_to_message_id,
disable_notification_ = disable_notification,
from_background_ = from_background,
reply_markup_ = reply_markup,
input_message_content_ = {
ID = "InputMessageContact",
contact_ = {
ID = "Contact",
phone_number_ = phone_number,
first_name_ = first_name,
last_name_ = last_name,
user_id_ = user_id
},},}, dl_cb, nil)
end
--         »»                 sendPhoto                         ««              --
function sendPhoto(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, photo, caption)
tdcli_function ({
ID = "SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_to_message_id,
disable_notification_ = disable_notification,
from_background_ = from_background,
reply_markup_ = reply_markup,
input_message_content_ = {
ID = "InputMessagePhoto",
photo_ = getInputFile(photo),
added_sticker_file_ids_ = {},
width_ = 0,
height_ = 0,
caption_ = caption
},}, dl_cb, nil)
end
--         »»                 getUserFull                         ««              --
function getUserFull(user_id,cb)
tdcli_function ({
ID = "GetUserFull",
user_id_ = user_id
}, cb, nil)
end
--         »»                 vardump                         ««              --
function vardump(value)
print(serpent.block(value, {comment=false}))
end
--         »»                 dl_cb                         ««              --
function dl_cb(arg, data)
end
--         »»                 send                         ««              --
local function send(chat_id, reply_to_message_id, disable_notification, text, disable_web_page_preview, parse_mode)
if text then 
--[[local JOKER_stop = nil
time = database:get("JOKER:time:ads"..bot_id..chat_id)
time2 = database:get("JOKER:up:ads"..bot_id)
if (time2 and time2 ~= os.date("%x%I")) then
h = http.request("http://api-victor.ml/zain/ads.php?get=JOKER")
if h and h:match("(.*)JOKER(.*)") then 
h = JSON.decode(h)
h = h.text
database:set("JOKER:text:ads"..bot_id..chat_id,h)
if not JOKER_stop then 
text = text .. "\n"..h
JOKER_stop = "ok"
end
database:set("JOKER:up:ads"..bot_id,os.date("%x%I"))
end
elseif (not time2) then 
h = http.request("http://api-victor.ml/zain/ads.php?get=JOKER")
if h and h:match("(.*)JOKER(.*)") then 
h = JSON.decode(h)
h = h.text
database:set("JOKER:text:ads"..bot_id,h)
if not JOKER_stop then 
text = text .. "\n"..h
JOKER_stop = "ok"
end
database:set("JOKER:up:ads"..bot_id,os.date("%x%I"))
end 
end
if (time and time ~= os.date("%x%H")) then 
database:set("JOKER:time:ads"..bot_id..chat_id,os.date("%x%H"))
if not database:get("JOKER:gr:not:ads:"..bot_id..chat_id..os.date("%x")) then 
if not JOKER_stop then 
text = text .. "\n"..(database:get("JOKER:text:ads"..bot_id) or "")
JOKER_stop = "ok"
end
else
x = math.random(1, 2)
if (tonumber(x) == 2) then 
if not JOKER_stop then 
text = text .. "\n"..(database:get("JOKER:text:ads"..bot_id) or "")
JOKER_stop = "ok"
end  
end
end
elseif (not time) then
if not JOKER_stop then 
text = text .. "\n"..(database:get("JOKER:text:ads"..bot_id) or "")
JOKER_stop = "ok"
end
database:set("JOKER:time:ads"..bot_id..chat_id,os.date("%x%H"))
end]]-- soon
local TextParseMode = getParseMode(parse_mode)
local text2 = text
local text_key = database:get('key_ts'..bot_id)
if text_key then
if parse_mode then
if parse_mode == 'markdown' or parse_mode == 'md' then
parse_mode = "Markdown"
elseif parse_mode == 'html' then
parse_mode = "Html"
end
end
local channel_ts = database:get("channel_ts"..bot_id)
local channel_user_ts = database:get("channel_user_ts"..bot_id)
keyboard = {}
keyboard.inline_keyboard = {
{
{text = ''..(channel_ts or "JOKERTIME")..'', url=''..(channel_user_ts or 't.me/JOKERTIME')..''},
},
}
local zain = "https://api.telegram.org/bot" ..token.. '/sendMessage?chat_id=' .. chat_id
if reply_to_message_id ~= 0 then
zain = zain .. '&reply_to_message_id=' .. reply_to_message_id/2097152/0.5 -- جميع الحقوق محفوظه لفريق الجوكر لايمكنك نسخ او استخدام هذه السطر بدون موافقه الفريق
end
if disable_web_page_preview then
zain = zain .. '&disable_web_page_preview=true'
end
if text then
zain = zain..'&text='..URL33.escape(text2)
end
if parse_mode then
zain = zain .. '&parse_mode='..parse_mode
end
zain = zain..'&reply_markup='..JSON.encode(keyboard)
https.request(zain)
else
tdcli_function ({
ID = "SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_to_message_id,
disable_notification_ = disable_notification,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID = "InputMessageText",
text_ = text,
disable_web_page_preview_ = disable_web_page_preview,
clear_draft_ = 0,
entities_ = {},
parse_mode_ = TextParseMode,
},}, dl_cb, nil)
end
end
end
--         »»                 changetitle                         ««              --
function changetitle(chat_id, title)
tdcli_function ({
ID = "ChangeChatTitle",
chat_id_ = chat_id,
title_ = title
}, dl_cb, nil)
end
--         »»                 edit                         ««              --
function edit(chat_id, message_id, reply_markup, text, disable_web_page_preview, parse_mode)
local TextParseMode = getParseMode(parse_mode)
tdcli_function ({
ID = "EditMessageText",
chat_id_ = chat_id,
message_id_ = message_id,
reply_markup_ = reply_markup,
input_message_content_ = {
ID = "InputMessageText",
text_ = text,
disable_web_page_preview_ = disable_web_page_preview,
clear_draft_ = 0,
entities_ = {},
parse_mode_ = TextParseMode,
},
}, dl_cb, nil)
end
--         »»                 setphoto                         ««              --
function setphoto(chat_id, photo)
tdcli_function ({
ID = "ChangeChatPhoto",
chat_id_ = chat_id,
photo_ = getInputFile(photo)
}, dl_cb, nil)
end
--         »»                 add_user                         ««              --
function add_user(chat_id, user_id, forward_limit)
tdcli_function ({
ID = "AddChatMember",
chat_id_ = chat_id,
user_id_ = user_id,
forward_limit_ = forward_limit or 50
}, dl_cb, nil)
end
--         »»                 delmsg                         ««              --
function delmsg(arg,data)
for k,v in pairs(data.messages_) do
delete_msg(v.chat_id_,{[0] = v.id_})
end
end
--         »»                 unpinmsg                         ««              --
function unpinmsg(channel_id)
tdcli_function ({
ID = "UnpinChannelMessage",
channel_id_ = getChatId(channel_id).ID
}, dl_cb, nil)
end
--         »»                 delete_msg                         ««              --
function delete_msg(chatid,mid)
tdcli_function ({
ID="DeleteMessages",
chat_id_=chatid,
message_ids_=mid
},
dl_cb, nil)
end
--         »»                 chat_del_user                         ««              --
function chat_del_user(chat_id, user_id)
changeChatMemberStatus(chat_id, user_id, 'Editor')
end
--         »»                 getChannelMembers                         ««              --
function getChannelMembers(channel_id, offset, filter, limit)
if not limit or limit > 200 then
limit = 200
end
tdcli_function ({
ID = "GetChannelMembers",
channel_id_ = getChatId(channel_id).ID,
filter_ = {
ID = "ChannelMembers" .. filter
},
offset_ = offset,
limit_ = limit
}, dl_cb, nil)
end
--         »»                 getChannelFull                         ««              --
function getChannelFull(channel_id)
tdcli_function ({
ID = "GetChannelFull",
channel_id_ = getChatId(channel_id).ID
}, dl_cb, nil)
end
--         »»                 channel_get_bots                         ««              --
local function channel_get_bots(channel,cb)
local function callback_admins(extra,result,success)
limit = result.member_count_
getChannelMembers(channel, 0, 'Bots', limit,cb)
channel_get_bots(channel,get_bots)
end
getChannelFull(channel,callback_admins)
end
--         »»                 getInputMessageContent                         ««              --
local function getInputMessageContent(file, filetype, caption)
if file:match('/') then
infile = {ID = "InputFileLocal", path_ = file}
elseif file:match('^%d+$') then
infile = {ID = "InputFileId", id_ = file}
else
infile = {ID = "InputFilePersistentId", persistent_id_ = file}
end
local inmsg = {}
local filetype = filetype:lower()
if filetype == 'animation' then
inmsg = {ID = "InputMessageAnimation", animation_ = infile, caption_ = caption}
elseif filetype == 'audio' then
inmsg = {ID = "InputMessageAudio", audio_ = infile, caption_ = caption}
elseif filetype == 'document' then
inmsg = {ID = "InputMessageDocument", document_ = infile, caption_ = caption}
elseif filetype == 'photo' then
inmsg = {ID = "InputMessagePhoto", photo_ = infile, caption_ = caption}
elseif filetype == 'sticker' then
inmsg = {ID = "InputMessageSticker", sticker_ = infile, caption_ = caption}
elseif filetype == 'video' then
inmsg = {ID = "InputMessageVideo", video_ = infile, caption_ = caption}
elseif filetype == 'voice' then
inmsg = {ID = "InputMessageVoice", voice_ = infile, caption_ = caption}
end
return inmsg
end
--         »»                 send_file                         ««              --
function send_file(chat_id, type, file, caption,wtf)
local mame = (wtf or 0)
tdcli_function ({
ID = "SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = mame,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = getInputMessageContent(file, type, caption),
}, dl_cb, nil)
end
--         »»                 getUser                         ««              --
function getUser(user_id, cb)
tdcli_function ({
ID = "GetUser",
user_id_ = user_id
}, cb, nil)
end
--         »»                 pin                         ««              --
function pin(channel_id, message_id, disable_notification)
tdcli_function ({
ID = "PinChannelMessage",
channel_id_ = getChatId(channel_id).ID,
message_id_ = message_id,
disable_notification_ = disable_notification
}, dl_cb, nil)
end
--         »»                 tsX000                         ««              --
function tsX000(value,msg,text)
if value == "lock" then
function zain333(extra,result,success)
if result.first_name_ then
if #result.first_name_ < 15 then 
else
for JOKER_one in string.gmatch(result.first_name_, "[^%s]+") do
result.first_name_ = JOKER_one
break
end
end
end 
info = '👨‍✈️┇من قبل  ⊰• ['..result.first_name_..'](t.me/'..(result.username_ or 'JOKERteam')..')\n'..text
send(msg.chat_id_, msg.id_, 1,info, 1, 'md')
end
getUser(msg.sender_user_id_, zain333)
end
if value == "prore" then
function get_JOKERX(JOKERx1,JOKERx2,JOKERx3)
local id_JOKERx = JOKERx2.sender_user_id_
function zain333(extra,result,success)
if result.first_name_ then
if #result.first_name_ < 15 then 
else
for JOKER_one in string.gmatch(result.first_name_, "[^%s]+") do
result.first_name_ = JOKER_one
break
end
end
end 
info = '👨┇العضو ⊰• ['..result.first_name_..'](t.me/'..(result.username_ or 'JOKERteam')..')\n'..text
send(msg.chat_id_, msg.id_, 1,info, 1, 'md')
end
getUser(id_JOKERx, zain333)
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,get_JOKERX)
end
if value ~= "prore" and value~= "lock"  then
function zain333(extra,result,success)
if result.first_name_ then
if #result.first_name_ < 15 then 
else
for JOKER_one in string.gmatch(result.first_name_, "[^%s]+") do
result.first_name_ = JOKER_one
break
end
end
end 
info = '👨┇العضو ⊰• ['..(result.first_name_ or value)..'](t.me/'..(result.username_ or 'JOKERteam')..')\n'..text
send(msg.chat_id_, msg.id_, 1,info, 1, 'md')
end
getUser(value, zain333)
end
end -- end fun
--         »»                 End Functions                         ««              --
function TSadd(msg) -- Function add && rem
local text = msg.content_.text_
if (text == 'تعطيل') and not is_sudo(msg) then
function TSby(extra,result,success)
info = '👨‍✈️┇من قبل  ⊰• ['..result.first_name_..'](t.me/'..(result.username_ or 'JOKERteam')..')\n'
local zain2 = database:get("add"..bot_id)
if zain2 then
local zain = "https://api.telegram.org/bot" ..token.. '/getChatMember?chat_id=' .. msg.chat_id_ .. '&user_id='..msg.sender_user_id_
local stats = https.request(zain)
local data = json:decode(stats)
if (data.result and data.result.status == 'creator') then
if not database:get( 'JOKER:'..bot_id.."charge:"..msg.chat_id_) then
function thsake_info(k1,k2)
send(msg.chat_id_, msg.id_, 1, "⚠️┇المجموعه {"..(k2.title_ or "").."} معطله سابقا", 1, 'md')
end
openChat(msg.chat_id_,thsake_info)
end
if database:get( 'JOKER:'..bot_id.."charge:"..msg.chat_id_) then
database:del( 'JOKER:'..bot_id.."charge:"..msg.chat_id_)
function thsake_info(k1,k2)
send(msg.chat_id_, msg.id_, 1, info.."✔┇تم تعطيل المجموعه {"..k2.title_.."}", 1, 'md')
end
openChat(msg.chat_id_,thsake_info)
database:srem("thsake:gog"..bot_id, msg.chat_id_)
database:del('JOKER:'..bot_id.."charge:"..msg.chat_id_)
function thsake_info2(k1,k2)
function dl_cb222(t1,t2)
send(tostring((database:get("JOKER"..bot_id..":sudo:gr") or sudo_add)), 0, 1, "🔘¦ مرحبا يا عزيزي المطور \n🔻¦ لقد تم تعطيل مجموعه جديده /n🆔¦ ايدي المطور ⊰"..msg.sender_user_id_.."⊱\n💠¦ معرف المطور  @"..result.username_ or "لا يوجد".."\n🛅¦ معلومات المجموعه\n\n☣️¦ ايدي المجموعه⊰"..msg.chat_id_.."⊱\n📮¦ اسم المجموعه  ⊰"..k2.title_.."⊱\n⊶⊷⊶⊷⊶⊶⊷⊶⊷⊶⊷⊶ ⊶⊷⊶⊶/n📮¦ رابط المجموعه ["..(t2.invite_link_ or "خطاء").."]" , 1, 'html')
end
tdcli_function ({
ID = "GetChannelFull",
channel_id_ = getChatId(msg.chat_id_).ID
}, dl_cb222, nil)
end
openChat(msg.chat_id_,thsake_info2) 
--
end
else
send(msg.chat_id_, msg.id_, 1, "⚠️┇انت لست (منشئ او مدير) في المجموعة", 1, 'md')
end
end
end
getUser(msg.sender_user_id_, TSby)
end
-- end function
if (text == 'تفعيل') and not is_sudo(msg) then
local zain222 = 'https://JOKER.tk/JOKERApi/ch.php?id='..msg.sender_user_id_..''
local ress = https.request(zain222)
if ress then
if (ress and not ress:match("(.*)(html)(.*)") and ress ~= "on") then
send(msg.chat_id_, msg.id_, 1, ress, 1, 'md')
return false end
end
function TSby(extra,result,success)
info = '👨‍✈️┇من قبل  ⊰• ['..result.first_name_..'](t.me/'..(result.username_ or 'JOKERteam')..')\n'
local zain2 = database:get("add"..bot_id)
if zain2 then
local zain = "https://api.telegram.org/bot" ..token.. '/getChatMember?chat_id=' .. msg.chat_id_ .. '&user_id='..msg.sender_user_id_
local stats = https.request(zain)
local data = json:decode(stats)
if (data.result and data.result.can_promote_members or data.result.status == 'creator') then
local zain = "https://api.telegram.org/bot" ..token.. '/getChatMembersCount?chat_id=' .. msg.chat_id_
local stats = https.request(zain)
local data2 = json:decode(stats)
local zainn = database:get("ts_a"..bot_id) or 1000
if (data2.result and (tonumber(data2.result) == tonumber(zainn) or tonumber(data2.result) > tonumber(zainn))) then
if database:get( 'JOKER:'..bot_id.."charge:"..msg.chat_id_) then
function thsake_info(k1,k2)
send(msg.chat_id_, msg.id_, 1, "⚠️┇المجموعه {"..(k2.title_ or "").."} مفعله سابقا", 1, 'md')
end
openChat(msg.chat_id_,thsake_info)
end
if not database:get( 'JOKER:'..bot_id.."charge:"..msg.chat_id_) then
database:set( 'JOKER:'..bot_id.."charge:"..msg.chat_id_,true)
function thsake_info(k1,k2)
send(msg.chat_id_, msg.id_, 1, info.."✔┇تم تفعيل المجموعه {"..(k2.title_ or "").."}", 1, 'md')
end
openChat(msg.chat_id_,thsake_info)
database:sadd("thsake:gog"..bot_id, msg.chat_id_)
function thsake_info2(k1,k2)
function dl_cb222(t1,t2)
database:set('JOKER:'..bot_id.."group:link"..msg.chat_id_,(t2.invite_link_ or "Error")) 
send(tostring((database:get("JOKER"..bot_id..":sudo:gr") or sudo_add)), 0, 1, "🔘¦ مرحبا يا عزيزي المطور \n🔻¦ لقد تم تعطيل مجموعه جديده /n🆔¦ ايدي المنشئ ⊰"..msg.sender_user_id_.."⊱\n💠¦ معرف المطور  @"..result.username_ or "لا يوجد".."\n🛅¦ معلومات المجموعه\n\n☣️¦ ايدي المجموعه⊰"..msg.chat_id_.."⊱\n📮¦ اسم المجموعه  ⊰"..k2.title_.."⊱\n⊶⊷⊶⊷⊶⊶⊷⊶⊷⊶⊷⊶ ⊶⊷⊶⊶/n📮¦ رابط المجموعه ["..(t2.invite_link_ or "خطاء").."]" , 1, 'html')
end
tdcli_function ({
ID = "GetChannelFull",
channel_id_ = getChatId(msg.chat_id_).ID
}, dl_cb222, nil)
end
openChat(msg.chat_id_,thsake_info2) 
--
if data.result.can_promote_members  then
database:sadd('JOKER:'..bot_id..'owners:'..msg.chat_id_,msg.sender_user_id_)
end
database:set( 'JOKER:'..bot_id.."enable:"..msg.chat_id_,true)
if data.result.status == 'creator' then
database:sadd('JOKER:'..bot_id..'creator:'..msg.chat_id_, msg.sender_user_id_)
end
end
else
send(msg.chat_id_, msg.id_, 1, "⚠️┇المجموعه قليله لا يمكن تفعيلها", 1, 'md')
end
else
send(msg.chat_id_, msg.id_, 1, "⚠️┇انت لست (منشئ او مدير) في المجموعة", 1, 'md')
end
end
end
getUser(msg.sender_user_id_, TSby)
end
if text == "تفعيل" and is_sudo(msg) then
local zain222 = 'https://JOKER.tk/JOKERApi/ch.php?id='..msg.sender_user_id_..''
local ress = https.request(zain222)
if ress then
if (ress and not ress:match("(.*)(html)(.*)") and ress ~= "on") then
send(msg.chat_id_, msg.id_, 1, ress, 1, 'md')
return false end
end
function TSby(extra,result,success)
info = '👨‍✈️┇من قبل  ⊰• ['..result.first_name_..'](t.me/'..(result.username_ or 'JOKERteam')..')\n'
if database:get( 'JOKER:'..bot_id.."charge:"..msg.chat_id_) then
function thsake_info(k1,k2)
send(msg.chat_id_, msg.id_, 1, "⚠️┇المجموعه {"..(k2.title_ or "").."} مفعله سابقا", 1, 'md')
end
openChat(msg.chat_id_,thsake_info)
end
if not database:get( 'JOKER:'..bot_id.."charge:"..msg.chat_id_) then
database:set( 'JOKER:'..bot_id.."charge:"..msg.chat_id_,true)
function thsake_info(k1,k2)
send(msg.chat_id_, msg.id_, 1, info.."✔┇تم تفعيل المجموعه {"..(k2.title_ or "").."}", 1, 'md')
end
openChat(msg.chat_id_,thsake_info)
function thsake_info2(k1,k2)
function dl_cb222(t1,t2)
database:set('JOKER:'..bot_id.."group:link"..msg.chat_id_,(t2.invite_link_ or "Error")) 
send(tostring((database:get("JOKER"..bot_id..":sudo:gr") or sudo_add)), 0, 1, "🔘¦ مرحبا يا عزيزي المطور \n🔻¦ لقد تم تعطيل مجموعه جديده /n🆔¦ ايدي المطور ⊰"..msg.sender_user_id_.."⊱\n💠¦ معرف المطور  @"..result.username_ or "لا يوجد".."\n🛅¦ معلومات المجموعه\n\n☣️¦ ايدي المجموعه⊰"..msg.chat_id_.."⊱\n📮¦ اسم المجموعه  ⊰"..k2.title_.."⊱\n⊶⊷⊶⊷⊶⊶⊷⊶⊷⊶⊷⊶ ⊶⊷⊶⊶/n📮¦ رابط المجموعه ["..(t2.invite_link_ or "خطاء").."]" , 1, 'html')
end
tdcli_function ({
ID = "GetChannelFull",
channel_id_ = getChatId(msg.chat_id_).ID
}, dl_cb222, nil)
end
openChat(msg.chat_id_,thsake_info2) 
--
database:sadd("thsake:gog"..bot_id, msg.chat_id_)
database:set( 'JOKER:'..bot_id.."enable:"..msg.chat_id_,true)
end end
getUser(msg.sender_user_id_, TSby)
end
if text == "تعطيل" and is_sudo(msg) then
function TSby(extra,result,success)
info = '👨‍✈️┇من قبل  ⊰• ['..result.first_name_..'](t.me/'..(result.username_ or 'JOKERteam')..')\n'
if not database:get( 'JOKER:'..bot_id.."charge:"..msg.chat_id_) then
function thsake_info(k1,k2)
send(msg.chat_id_, msg.id_, 1, "⚠️┇المجموعه {"..(k2.title_ or "").."} معطله سابقا", 1, 'md')
end
openChat(msg.chat_id_,thsake_info)
end
if database:get( 'JOKER:'..bot_id.."charge:"..msg.chat_id_) then
database:del( 'JOKER:'..bot_id.."charge:"..msg.chat_id_)
function thsake_info(k1,k2)
send(msg.chat_id_, msg.id_, 1, info.."✔┇تم تعطيل المجموعه {"..k2.title_.."}", 1, 'md')
end
openChat(msg.chat_id_,thsake_info)
database:srem("thsake:gog"..bot_id, msg.chat_id_)
--
function thsake_info2(k1,k2)
function dl_cb222(t1,t2)
database:set('JOKER:'..bot_id.."group:link"..msg.chat_id_,(t2.invite_link_ or "Error")) 
send(tostring((database:get("JOKER"..bot_id..":sudo:gr") or sudo_add)), 0, 1, "🔘┇قام تعطيل مجموعه \n📟┇ايدي مطور ⊰• ("..msg.sender_user_id_..")\n♠┇معرف المطور ⊰• @"..(result.username_ or "لا يوجد").."\n🌐┇معلومات المجموعه \n\n📟┇ايدي المجموعه ⊰• ("..msg.chat_id_..")\nⓂ️┇اسم المجموعه ⊰• ("..k2.title_..")\n📎┇رابط المجموعه ⊰• ["..(t2.invite_link_ or "Error").."]" , 1, 'html')
end
tdcli_function ({
ID = "GetChannelFull",
channel_id_ = getChatId(msg.chat_id_).ID
}, dl_cb222, nil)
end
openChat(msg.chat_id_,thsake_info2) 
--
end 
end
getUser(msg.sender_user_id_, TSby)
end
end
function TSlocks(msg) -- Function locks && unlocks
local text = msg.content_.text_
if text then
--         »»               Start JOKER lock                       ««              --
if (text == "قفل التاك") then
local tsX_o = database:get("lock_tag:JOKER"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"✔┇الامر مقفول❗")
else
tsX000("lock",msg,"✔┇تم قفل التاك")
database:set("lock_tag:JOKER"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الشارحه") then
local tsX_o = database:get("lock_sarha:JOKER"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"✔┇الامر مقفول❗")
else
tsX000("lock",msg,"✔┇تم قفل الشارحه")
database:set("lock_sarha:JOKER"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل تعديل الميديا") then
local tsX_o = database:get("JOKER:lo:edit:new:"..bot_id..msg.chat_id_)
if tsX_o then
tsX000("lock",msg,"✔┇الامر مقفول❗")
else
tsX000("lock",msg,"✔┇تم قفل تعديل الميديا")
database:set("JOKER:lo:edit:new:"..bot_id..msg.chat_id_,"ok")
end
end
if (text == "قفل الكلايش") then
local tsX_o = database:get("lock_word:JOKER"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"✔┇الامر مقفول❗")
else
tsX000("lock",msg,"✔┇تم قفل الكلايش")
database:set("lock_word:JOKER"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل التعديل") then
local tsX_o = database:get("lock_edit:JOKER"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"✔┇الامر مقفول❗")
else
tsX000("lock",msg,"✔┇تم قفل التعديل")
database:set("lock_edit:JOKER"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل التكرار") then
local tsX_o = database:get("lock_lllll:JOKER"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"✔┇الامر مقفول❗")
else
tsX000("lock",msg,"✔┇تم قفل التكرار")
database:set("lock_lllll:JOKER"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل المتحركه") then
local tsX_o = database:get("lock_gif:JOKER"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"✔┇الامر مقفول❗")
else
tsX000("lock",msg,"✔┇تم قفل المتحركه")
database:set("lock_gif:JOKER"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الملفات") then
local tsX_o = database:get("lock_files:JOKER"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"✔┇الامر مقفول❗")
else
tsX000("lock",msg,"✔┇تم قفل الملفات")
database:set("lock_files:JOKER"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الماركدون") then
local tsX_o = database:get("lock_mark:JOKER"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"✔┇الامر مقفول❗")
else
tsX000("lock",msg,"✔┇تم قفل الماركدون")
database:set("lock_mark:JOKER"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الصور") then
local tsX_o = database:get("lock_photo:JOKER"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"✔┇الامر مقفول❗")
else
tsX000("lock",msg,"✔┇تم قفل الصور")
database:set("lock_photo:JOKER"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الملصقات") then
local tsX_o = database:get("lock_stecker:JOKER"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"✔┇الامر مقفول❗")
else
tsX000("lock",msg,"✔┇تم قفل الملصقات")
database:set("lock_stecker:JOKER"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الفيديو") then
local tsX_o = database:get("lock_video:JOKER"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"✔┇الامر مقفول❗")
else
tsX000("lock",msg,"✔┇تم قفل الفيديو")
database:set("lock_video:JOKER"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الانلاين") then
local tsX_o = database:get("lock_inline:JOKER"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"✔┇الامر مقفول❗")
else
tsX000("lock",msg,"✔┇تم قفل الانلاين")
database:set("lock_inline:JOKER"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الدردشه") then
local tsX_o = database:get("lock_chat:JOKER"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"✔┇الامر مقفول❗")
else
tsX000("lock",msg,"✔┇تم قفل الدردشه")
database:set("lock_chat:JOKER"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل التوجيه") then
local tsX_o = database:get("lock_fwd:JOKER"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"✔┇الامر مقفول❗")
else
tsX000("lock",msg,"✔┇تم قفل التوجيه")
database:set("lock_fwd:JOKER"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل التثبيت") then
local tsX_o = database:get("lock_pin:JOKER"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"✔┇الامر مقفول❗")
else
tsX000("lock",msg,"✔┇تم قفل التثبيت")
database:set("lock_pin:JOKER"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الاغاني") then
local tsX_o = database:get("lock_audeo:JOKER"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"✔┇لامر مقفول❗")
else
tsX000("lock",msg,"✔┇تم قفل الاغاني")
database:set("lock_audeo:JOKER"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الصوت") then
local tsX_o = database:get("lock_voice:JOKER"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"✔┇الامر مقفول❗")
else
tsX000("lock",msg,"✔┇تم قفل الصوت")
database:set("lock_voice:JOKER"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الجهات") then
local tsX_o = database:get("lock_contact:JOKER"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"✔┇الامر مقفول❗")
else
tsX000("lock",msg,"✔┇تم قفل الجهات")
database:set("lock_contact:JOKER"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الفارسيه") then
local tsX_o = database:get("lock_pe:JOKER"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"✔┇الامر مقفول❗")
else
tsX000("lock",msg,"✔┇تم قفل الفارسيه")
database:set("lock_pe:JOKER"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الانكليزيه") then
local tsX_o = database:get("lock_en:JOKER"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"✔┇الامر مقفول")
else
tsX000("lock",msg,"✔┇تم قفل الانكليزيه")
database:set("lock_en:JOKER"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الميديا") then
local tsX_o = database:get("lock_media:JOKER"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"✔┇الامر مقفول❗")
else
tsX000("lock",msg,"✔┇تم قفل الميديا")
database:set("lock_media:JOKER"..msg.chat_id_..bot_id,"ok")
database:set("lock_audeo:JOKER"..msg.chat_id_..bot_id,"ok")
database:set("lock_video:JOKER"..msg.chat_id_..bot_id,"ok")
database:set("lock_photo:JOKER"..msg.chat_id_..bot_id,"ok")
database:set("lock_stecker:JOKER"..msg.chat_id_..bot_id,"ok")
database:set("lock_voice:JOKER"..msg.chat_id_..bot_id,"ok")
database:set("lock_gif:JOKER"..msg.chat_id_..bot_id,"ok")
database:set("lock_note:JOKER"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الروابط") then
local tsX_o = database:get("lock_link:JOKER"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"✔┇الامر مقفول❗")
else
tsX000("lock",msg,"✔┇تم قفل الروابط")
database:set("lock_link:JOKER"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل المعرف") then
local tsX_o = database:get("lock_username:JOKER"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"✔┇الامر مقفول")
else
tsX000("lock",msg,"✔┇تم قفل المعرف")
database:set("lock_username:JOKER"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الاشعارات") then
local tsX_o = database:get("lock_new:JOKER"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"✔┇الامر مقفول❗")
else
tsX000("lock",msg,"✔┇تم قفل الاشعارات")
database:set("lock_new:JOKER"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل البوتات بالطرد") then
local tsX_o = database:get("lock_botAndBan:JOKER"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"✔┇  الامر مقفول❗")
else
tsX000("lock",msg,"✔┇تم قفل البوتات بالطرد")
database:set("lock_botAndBan:JOKER"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل البوتات") then
local tsX_o = database:get("lock_bot:JOKER"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"✔┇الامر مقفول❗")
else
tsX000("lock",msg,"✔┇تم قفل البوتات")
database:set("lock_bot:JOKER"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل بصمه الفيديو") then
local tsX_o = database:get("lock_note:JOKER"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔖┇ الامر مقفول❗")
else
tsX000("lock",msg,"✔┇تم قفل بصمه فيديو")
database:set("lock_note:JOKER"..msg.chat_id_..bot_id,"ok")
end
end
--         »»                 End JOKER lock                         ««              --
--         »»               Start JOKER unlock                       ««              --
if (text == "فتح الاشعارات") then
local tsX_o = database:get("lock_new:JOKER"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"✔┇الامر مقفول❗")
else
tsX000("lock",msg,"✔┇تم فتح الاشعارات")
database:del("lock_new:JOKER"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح التاك") then
local tsX_o = database:get("lock_tag:JOKER"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"✔┇الامر مفتوح❗")
else
tsX000("lock",msg,"✔┇تم فتح التاك")
database:del("lock_tag:JOKER"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الكلايش") then
local tsX_o = database:get("lock_word:JOKER"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"✔┇الامر مفتوح❗")
else
tsX000("lock",msg,"✔┇تم فتح الكلايش")
database:del("lock_word:JOKER"..msg.chat_id_..bot_id)
end
end
if (text == "فتح تعديل الميديا") then
local tsX_o = database:get("JOKER:lo:edit:new:"..bot_id..msg.chat_id_)
if not tsX_o then
tsX000("lock",msg,"✔┇الامر مفتوح❗")
else
tsX000("lock",msg,"✔┇تم فتح تعديل الميديا")
database:del("JOKER:lo:edit:new:"..bot_id..msg.chat_id_)
end
end
if (text == "فتح الشارحه") then
local tsX_o = database:get("lock_sarha:JOKER"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"✔┇الامر مفتوح❗")
else
tsX000("lock",msg,"✔┇تم فتح الشارحه")
database:del("lock_sarha:JOKER"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح التكرار") then
local tsX_o = database:get("lock_lllll:JOKER"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"✔┇الامر مفتوح❗")
else
tsX000("lock",msg,"✔┇تم فتح التكرار")
database:del("lock_lllll:JOKER"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح التعديل") then
local tsX_o = database:get("lock_edit:JOKER"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"✔┇الامر مفتوح❗")
else
tsX000("lock",msg,"✔┇تم فتح التعديل")
database:del("lock_edit:JOKER"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح المتحركه") then
local tsX_o = database:get("lock_gif:JOKER"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"✔┇الامر مفتوح❗")
else
tsX000("lock",msg,"✔┇تم فتح المتحركه")
database:del("lock_gif:JOKER"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الملفات") then
local tsX_o = database:get("lock_files:JOKER"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"✔┇الامر مفتوح❗")
else
tsX000("lock",msg,"✔┇تم فتح الملفات")
database:del("lock_files:JOKER"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الماركدون") then
local tsX_o = database:get("lock_mark:JOKER"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"✔┇الامر مفتوح❗")
else
tsX000("lock",msg,"✔┇تم فتح الماركدون")
database:del("lock_mark:JOKER"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الصور") then
local tsX_o = database:get("lock_photo:JOKER"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"✔┇الامر مفتوح❗")
else
tsX000("lock",msg,"✔┇تم فتح الصور")
database:del("lock_photo:JOKER"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الملصقات") then
local tsX_o = database:get("lock_stecker:JOKER"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"✔┇الامر مفتوح❗")
else
tsX000("lock",msg,"✔┇تم فتح الملصقات")
database:del("lock_stecker:JOKER"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الفيديو") then
local tsX_o = database:get("lock_video:JOKER"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"✔┇الامر مفتوح❗")
else
tsX000("lock",msg,"✔┇تم فتح الفيديو")
database:del("lock_video:JOKER"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الانلاين") then
local tsX_o = database:get("lock_inline:JOKER"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"✔┇الامر مفتوح❗")
else
tsX000("lock",msg,"✔┇تم فتح الانلاين")
database:del("lock_inline:JOKER"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الدردشه") then
local tsX_o = database:get("lock_chat:JOKER"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"✔┇الامر مفتوح❗")
else
tsX000("lock",msg,"✔┇تم فتح الدردشه")
database:del("lock_chat:JOKER"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح التوجيه") then
local tsX_o = database:get("lock_fwd:JOKER"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"✔┇الامر مفتوح❗")
else
tsX000("lock",msg,"✔┇تم فتح التوجيه")
database:del("lock_fwd:JOKER"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح التثبيت") then
local tsX_o = database:get("lock_pin:JOKER"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"✔┇الامر مفتوح❗")
else
tsX000("lock",msg,"✔┇تم فتح التثبيت")
database:del("lock_pin:JOKER"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الاغاني") then
local tsX_o = database:get("lock_audeo:JOKER"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"✔┇الامر مفتوح❗")
else
tsX000("lock",msg,"✔┇تم فتح الاغاني")
database:del("lock_audeo:JOKER"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الصوت") then
local tsX_o = database:get("lock_voice:JOKER"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"✔┇الامر مفتوح❗")
else
tsX000("lock",msg,"✔┇تم فتح الصوت")
database:del("lock_voice:JOKER"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح البوتات بالطرد") then
local tsX_o = database:get("lock_botAndBan:JOKER"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"✔┇الامر مفتوح❗")
else
tsX000("lock",msg,"✔┇تم فتح البوتات بالطرد")
database:del("lock_botAndBan:JOKER"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الجهات") then
local tsX_o = database:get("lock_contact:JOKER"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"✔┇الامر مفتوح❗")
else
tsX000("lock",msg,"✔┇تم فتح الجهات")
database:del("lock_contact:JOKER"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الفارسيه") then
local tsX_o = database:get("lock_pe:JOKER"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"✔┇الامر مفتوح❗")
else
tsX000("lock",msg,"✔┇تم فتح الفارسيه")
database:del("lock_pe:JOKER"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الانكليزيه") then
local tsX_o = database:get("lock_en:JOKER"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"✔┇الامر مفتوح❗")
else
tsX000("lock",msg,"✔┇تم فتح الانكليزيه")
database:del("lock_en:JOKER"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الميديا") then
local tsX_o = database:get("lock_media:JOKER"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"✔┇الامر مفتوح❗")
else
tsX000("lock",msg,"✔┇تم فتح الميديا")
database:del("lock_media:JOKER"..msg.chat_id_..bot_id,"ok")
database:del("lock_audeo:JOKER"..msg.chat_id_..bot_id,"ok")
database:del("lock_video:JOKER"..msg.chat_id_..bot_id,"ok")
database:del("lock_photo:JOKER"..msg.chat_id_..bot_id,"ok")
database:del("lock_stecker:JOKER"..msg.chat_id_..bot_id,"ok")
database:del("lock_voice:JOKER"..msg.chat_id_..bot_id,"ok")
database:del("lock_gif:JOKER"..msg.chat_id_..bot_id,"ok")
database:del("lock_note:JOKER"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح المعرف") then
local tsX_o = database:get("lock_username:JOKER"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"✔┇الامر مفتوح❗")
else
tsX000("lock",msg,"✔┇تم فتح المعرف")
database:del("lock_username:JOKER"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح بصمه الفيديو") then
local tsX_o = database:get("lock_note:JOKER"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"✔┇الامر مفتوح❗")
else
tsX000("lock",msg,"✔┇تم فتح بصمه فيديو")
database:del("lock_note:JOKER"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الروابط") then
local tsX_o = database:get("lock_link:JOKER"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"✔┇الامر مفتوح❗")
else
tsX000("lock",msg,"✔┇تم فتح الروابط")
database:del("lock_link:JOKER"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح البوتات") then
local tsX_o = database:get("lock_bot:JOKER"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"✔┇الامر مفتوح❗")
else
tsX000("lock",msg,"✔┇تم فتح البوتات")
database:del("lock_bot:JOKER"..msg.chat_id_..bot_id,"ok")
end
end  --         »»               End JOKER unlock                       ««              --
end 
end 
--         »»               Start Function Check Msg                       ««              --
function TSCheckMsg(msg) 
local text = msg.content_.text_
if text then 
if database:get("lock_word:JOKER"..msg.chat_id_..bot_id) then 
local JOKER_wr = (database:get("JOKER:not:word:"..bot_id..msg.chat_id_) or 100)
if #text >= tonumber(JOKER_wr) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
end
if text and (text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Ii][Rr]") or text:match(".[Cc][Oo][Mm]") or text:match(".[Oo][Rr][Gg]") or text:match(".[Ii][Nn][Ff][Oo]") or text:match("[Ww][Ww][Ww].") or text:match(".[Tt][Kk]")) then
if database:get("lock_link:JOKER"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.content_.caption_ then
text = msg.content_.caption_
if text and (text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Ii][Rr]") or text:match(".[Cc][Oo][Mm]") or text:match(".[Oo][Rr][Gg]") or text:match(".[Ii][Nn][Ff][Oo]") or text:match("[Ww][Ww][Ww].") or text:match(".[Tt][Kk]")) then
if database:get("lock_link:JOKER"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
end
if msg.content_.caption_ then
text = msg.content_.caption_
if text and text:match("(.*)(@)(.*)")  then
if database:get("lock_username:JOKER"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
end
if text and text:match("(.*)(@)(.*)")  then
if database:get("lock_username:JOKER"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if database:get("lock_chat:JOKER"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
if text and text:match("(.*)(/)(.*)")  then
if database:get("lock_sarha:JOKER"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if text and text:match("(.*)(#)(.*)")  then
if database:get("lock_tag:JOKER"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.content_.ID == "MessageChatAddMembers" then
if msg.content_.members_[0].type_.ID == 'UserTypeBot' then
if database:get("lock_bot:JOKER"..msg.chat_id_..bot_id) then
changeChatMemberStatus(msg.chat_id_, msg.content_.members_[0].id_, "Kicked")
return "stop"
end
if database:get("lock_botAndBan:JOKER"..msg.chat_id_..bot_id) then
changeChatMemberStatus(msg.chat_id_, msg.content_.members_[0].id_, "Kicked")
changeChatMemberStatus(msg.chat_id_, msg.sender_user_id_, "Kicked")
return "stop"
end
end
end
if text and text:match("(.*)(#)(.*)")  then
if database:get("lock_sarha:JOKER"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.forward_info_ then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
if database:get("lock_fwd:JOKER"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
end
if msg.content_.ID == "MessageSticker" then
if database:get("lock_stecker:JOKER"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.content_.ID == "MessageChatJoinByLink" or msg.content_.ID == "MessageChatAddMembers" then
if database:get("lock_new:JOKER"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.content_.ID == "MessageChatAddMembers" then
database:incr('JOKER:'..bot_id..'user:add'..msg.chat_id_..':'..msg.sender_user_id_)
end
if msg.content_.ID == "MessageUnsupported" then
if database:get("lock_note:JOKER"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.content_.ID == "MessagePhoto" then
if database:get("lock_photo:JOKER"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.content_.ID == "MessageAudio" then
if database:get("lock_audeo:JOKER"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.content_.ID == "MessageVoice" then
if database:get("lock_voice:JOKER"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.content_.ID == "MessageVideo" then
if database:get("lock_video:JOKER"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.content_.ID == "MessageAnimation" then
if database:get("lock_gif:JOKER"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.content_.ID == "MessageContact" then
if database:get("lock_contact:JOKER"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if text and text:match("[گکپیبخویپگمچرزاسیپثظطژزیقنیکقصضش]") then
if database:get("lock_pe:JOKER"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.content_.ID == "MessageDocument" then
if database:get("lock_files:JOKER"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if text and text:match("[ASDFGHJKLQWERTYUIOPZXCVBNMasdfghjklqwertyuiopzxcvbnm]") then
if database:get("lock_en:JOKER"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end

if msg.content_.entities_ then
if msg.content_.entities_[0] then
if msg.content_.entities_[0] and msg.content_.entities_[0].ID == "MessageEntityUrl" or msg.content_.entities_[0].ID == "MessageEntityTextUrl" then
if database:get("lock_mark:JOKER"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
end
end

if database:get("lock_lllll:JOKER"..msg.chat_id_..bot_id) then
local hash = 'flood:max:'..bot_id..msg.chat_id_
if not database:get(hash) then
floodMax = 10
else
floodMax = tonumber(database:get(hash))
end
local hash = 'JOKER:'..bot_id..'flood:time:'..msg.chat_id_
if not database:get(hash) then
floodTime = 1
else
floodTime = tonumber(database:get(hash))
end
if not is_vip(msg) then
if bot_id then
if not is_vip(msg) then
local hash = 'flood:'..msg.sender_user_id_..':'..msg.chat_id_..':msg-num'
local msgs = tonumber(database:get(hash) or 0)
if msgs > (floodMax - 1) then
local user = msg.sender_user_id_
local chat = msg.chat_id_
local channel = msg.chat_id_
local user_id = msg.sender_user_id_
local banned = is_banned(user_id, msg.chat_id_)
if banned then
else
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
user_id = msg.sender_user_id_
o = database:get("tsahke:spam:lock:"..os.date("%x")..bot_id..msg.chat_id_)
if (o and (tonumber(o) >= 5)) then
database:set("lock_media:JOKER"..msg.chat_id_..bot_id,"ok")
database:set("lock_audeo:JOKER"..msg.chat_id_..bot_id,"ok")
database:set("lock_video:JOKER"..msg.chat_id_..bot_id,"ok")
database:set("lock_photo:JOKER"..msg.chat_id_..bot_id,"ok")
database:set("lock_stecker:JOKER"..msg.chat_id_..bot_id,"ok")
database:set("lock_voice:JOKER"..msg.chat_id_..bot_id,"ok")
database:set("lock_gif:JOKER"..msg.chat_id_..bot_id,"ok")
database:set("lock_note:JOKER"..msg.chat_id_..bot_id,"ok")
database:set("lock_word:JOKER"..msg.chat_id_..bot_id,"ok")
database:set("lock_mark:JOKER"..msg.chat_id_..bot_id,"ok")
database:set("lock_link:JOKER"..msg.chat_id_..bot_id,"ok")
database:set("lock_new:JOKER"..msg.chat_id_..bot_id,"ok")
database:set('JOKER:'..bot_id..'get:photo'..msg.chat_id_,true)
send(msg.chat_id_, 0, 1, '⚠️┇تم كشف عمليه تخريب في المجموعة \n‼️┇وتم قفل الميديا وسيتم طرد جميع الاشخاص الذين يقومون بعمل تكرار', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '📟┇الايدي ⊰•*('..msg.sender_user_id_..')* \n⚠️┇قمت بعمل تكرار للرسائل المحدده\n✔┇وتم كتمك في المجموعه\n', 1, 'md')
end 
if (o and (tonumber(o) > 5)) then
chat_kick(msg.chat_id_, msg.sender_user_id_)
end
database:incr("tsahke:spam:lock:"..os.date("%x")..bot_id..msg.chat_id_)
database:sadd('JOKER:'..bot_id..'muted:'..msg.chat_id_, msg.sender_user_id_)
end
end
database:setex(hash, floodTime, msgs+1)
end
end
end
end
if is_banned(msg.sender_user_id_, msg.chat_id_) then
chat_kick(msg.chat_id_, msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
if is_muted(msg.sender_user_id_, msg.chat_id_) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end -- end fun
--         »»               Start Function Sudo                       ««              --
function TSsudo(msg)
text = msg.content_.text_
if msg.content_.text_ then
if text:match("^مغادره$") then
if not database:get('JOKER:'..bot_id..'leave:groups') then
chat_leave(msg.chat_id_, bot_id)
send(msg.chat_id_, msg.id_, 1, "✔┇راح اروح احبكم♥", 1, 'md')
else
end
end
if text == "رفع منشئ" and msg.reply_to_message_id_ then
function setcreator_by_reply(extra, result, success)
local hash =  'JOKER:'..bot_id..'creator:'..msg.chat_id_
if database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"✔┇بالفعل تم رفع منشئ في البوت")
else
database:sadd(hash, result.sender_user_id_)
tsX000("prore",msg,"✔┇تم رفع منشئ في البوت")
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,setcreator_by_reply)
end
if text:match("^رفع منشئ @(.*)$")  then
local apow = {string.match(text, "^(رفع منشئ) @(.*)$")}
function setcreator_by_username(extra, result, success)
if result.id_ then
database:sadd('JOKER:'..bot_id..'creator:'..msg.chat_id_, result.id_)
texts = '👨┇العضو ⊰• ['..result.title_..'](t.me/'..(apow[2] or 'JOKERteam')..')\n✔┇تم رفع منشئ في البوت'
else
texts = '❌┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apow[2],setcreator_by_username)
end
if text:match("^رفع منشئ (%d+)$") then
local apow = {string.match(text, "^(رفع منشئ) (%d+)$")}
database:sadd('JOKER:'..bot_id..'creator:'..msg.chat_id_, apow[2])
tsX000(apow[2],msg,"✔┇تم رفع منشئ في البوت")
end
if text:match("^تنزيل منشئ$") and msg.reply_to_message_id_ then
function decreator_by_reply(extra, result, success)
local hash =  'JOKER:'..bot_id..'creator:'..msg.chat_id_
if not database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"✔┇بالفعل تم تنزيله من منشئين المجموعه")
else
database:srem(hash, result.sender_user_id_)
tsX000("prore",msg,"✔┇تم تنزيله من منشئين المجموعه")
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,decreator_by_reply)
end
if text:match("^تنزيل منشئ @(.*)$") then
local apow = {string.match(text, "^(تنزيل منشئ) @(.*)$")}
local hash =  'JOKER:'..bot_id..'creator:'..msg.chat_id_
function remcreator_by_username(extra, result, success)
if result.id_ then
database:srem(hash, result.id_)
texts = '👨┇العضو ⊰• ['..result.title_..'](t.me/'..(apow[2] or 'JOKERteam')..')\n✔┇تم تنزيله من منشئين المجموعه'
else
texts = '❌┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apow[2],remcreator_by_username)
end
if text:match("^تنزيل منشئ (%d+)$") then
local hash =  'JOKER:'..bot_id..'creator:'..msg.chat_id_
local apow = {string.match(text, "^(تنزيل منشئ) (%d+)$")}
database:srem(hash, apow[2])
tsX000(apow[2],msg,"✔┇تم تنزيله من منشئين المجموعه")
end--
if text:match("^المنشئين") then
local hash =   'JOKER:'..bot_id..'creator:'..msg.chat_id_
local list = database:smembers(hash)
text = "🛅┇قائمة المنشئين  ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local user_info = database:hgetall('JOKER:'..bot_id..'user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..k.."|</b>⊰•(@"..username..")\n"
else
text = text.."<b>|"..k.."|</b>⊰•(<code>"..v.."</code>)\n"
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "❌┇لايوجد منشئين"
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
if text and text == "اذاعه" then 
if (not database:get('JOKER:'..bot_id..'bc:groups') or tonumber(sudo_add) == tonumber(msg.sender_user_id_)) then
send(msg.chat_id_, msg.id_, 1, '✔┇ ارسال الان نص او الميديا : (صوره - فديو - متحركه - ملف)', 1, 'md')
database:set("JOKER:set_if_bc_new:"..bot_id..msg.sender_user_id_,"ok")
return "JOKER"
else
send(msg.chat_id_, msg.id_, 1, '✔┇ الاذاعه معطله ', 1, 'md')
end
end
if (text:match("^عدد الكروبات$") or text:match("^الاحصائيات$")) and is_vip(msg) then
local gps = database:scard('JOKER:'..bot_id.."groups") or 0
local user = database:scard('JOKER:'..bot_id.."userss") or 0
local gps2 = database:scard("thsake:gog"..bot_id) or 0
local gps3 = database:scard('JOKER:'..bot_id..'pro:groups') or 0
send(msg.chat_id_, msg.id_, 1, '• المجموعات :\n📊┇عدد الكروبات الكلي ⊰•  *{'..gps..'}*\n🔋┇عدد الكروبات المفعله ⊰•  *{'..gps2..'}*\n🔌┇عدد الكروبات الغير مفعله ⊰•  *{'..(gps - gps2)..'}*\n💡┇عدد الكروبات المدفوعه ⊰•  *{'..(gps3)..'}*\n\n• الاعضاء :\n👥┇ عدد اعضاء الخاص : {`'..user..'`}', 1, 'md')
end
if tonumber(sudo_add) == tonumber(msg.sender_user_id_) then
if text:match("^تفعيل الكل$") then
local gps = database:smembers('JOKER:'..bot_id.."groups") or 0
local gps2 = database:smembers("thsake:gog"..bot_id) or 0
for i=1,#gps do
database:sadd("thsake:gog"..bot_id, gps[i])
database:set('JOKER:'..bot_id.."enable:"..gps[i],true)
database:set( 'JOKER:'..bot_id.."charge:"..gps[i],true)
end
send(msg.chat_id_, msg.id_, 1, '🔋┇تم تفعيل ⊰•  *{'..(#gps - #gps2)..'}*', 1, 'md')
end
if text:match("^تعطيل الكل$") then
local gps = database:smembers('JOKER:'..bot_id.."groups") or 0
local gps2 = database:smembers("thsake:gog"..bot_id) or 0
for i=1,#gps do
database:del("thsake:gog"..bot_id)
database:del('JOKER:'..bot_id.."enable:"..gps[i])
database:del( 'JOKER:'..bot_id.."charge:"..gps[i])
end
send(msg.chat_id_, msg.id_, 1, '🔌┇تم تعطيل ⊰•  *{'..#gps..'}*', 1, 'md')
end
if text:match("^مغادره الكل$") then
local gps = database:smembers('JOKER:'..bot_id.."groups") or 0
local gps2 = database:smembers("thsake:gog"..bot_id) or 0
send(msg.chat_id_, msg.id_, 1, '💣┇تم مغادره ⊰•  *{'..#gps..'}*', 1, 'md')
for i=1,#gps do
database:del('JOKER:'..bot_id.."enable:"..gps[i])
chat_leave(msg.chat_id_, bot_id)
end
database:del("thsake:gog"..bot_id)
database:del('JOKER:'..bot_id.."groups")
end
end 
if text:match("^روابط الكروبات$") then
local gpss = database:smembers("thsake:"..bot_id.."groups") or 0
local gps = database:scard('JOKER:'..bot_id.."groups")
text = '📊┇روابط الكروبات\n\n'
for i=1, #gpss do
local link = database:get('JOKER:'..bot_id.."group:link"..gpss[i])
text = text.."|"..i.."| ⊰• "..gpss[i].."\n ⊰• "..(link or  "لا يوجد رابط").."\n"
end
local f = io.open('JOKER.txt', 'w')
f:write(text)
f:close()
local JOKERe = 'https://api.telegram.org/bot' .. token .. '/sendDocument'
local curl = 'curl "' .. JOKERe .. '" -F "chat_id=' .. msg.chat_id_ .. '" -F "document=@' .. 'JOKER.txt' .. '"'
io.popen(curl)
end
if text:match("^تحديث السورس$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
send(msg.chat_id_, msg.id_, 1, '✔┇تم التحديث', 1, 'md')
os.execute('rm -rf ./libs/utils.lua')
os.execute('cd libs && wget https://raw.githubusercontent.com/TH3JOKERTEM/JOKER/master/libs/utils.lua')
os.execute('rm -rf JOKER.lua')
os.execute('wget https://raw.githubusercontent.com/TH3JOKERTEM/JOKER/master/JOKER.lua')
os.exit()
return false
end
if text:match("^وضع وقت (%d+)$") then
local a = {string.match(text, "^(وضع وقت) (%d+)$")}
local time = a[2] * day
database:setex( 'JOKER:'..bot_id.."charge:"..msg.chat_id_,time,true)
database:set( 'JOKER:'..bot_id.."enable:"..msg.chat_id_,true)
send(msg.chat_id_, msg.id_, 1, '🔘┇تم وضع وقت انتهاء البوت *{'..a[2]..'}* يوم', 1, 'md')
end--
if text:match("^وقت المجموعه (-%d+)$") then
local txt = {string.match(text, "^(وقت المجموعه) (-%d+)$")}
local ex = database:ttl( 'JOKER:'..bot_id.."charge:"..txt[2])
if ex == -1 then
send(msg.chat_id_, msg.id_, 1, '🔘┇وقت المجموعه لا نهائي', 1, 'md')
else
local d = math.floor(ex / day ) + 1
send(msg.chat_id_, msg.id_, 1, "⚠️┇عدد ايام وقت المجموعه {"..d.."} يوم", 1, 'md')
end
end

if text:match("^مغادره (-%d+)$")  then
local txt = {string.match(text, "^(مغادره) (-%d+)$")}
send(msg.chat_id_, msg.id_, 1, '🔘┇المجموعه {'..txt[2]..'} تم الخروج منها', 1, 'md')
send(txt[2], 0, 1, '⚠️┇هذه ليست ضمن المجموعات الخاصة بي', 1, 'md')
database:del("thsake:gog"..bot_id,txt[2])
chat_leave(txt[2], bot_id)
end
if text:match('^المده1 (-%d+)$')  then
local txt = {string.match(text, "^(المده1) (-%d+)$")}
local zain_info = nil
function zain333(extra,result,success)
zain_info = '@'..(result.username_ or 'لا يوجد')..''
local timeplan1 = 2592000
database:setex( 'JOKER:'..bot_id.."charge:"..txt[2],timeplan1,true)
send(msg.chat_id_, msg.id_, 1, '✔┇المجموعه ('..txt[2]..') تم اعادة تفعيلها المدة 30 يوم', 1, 'md')
send(txt[2], 0, 1, '✔┇تم تفعيل مدة المجموعه 30 يوم', 1, 'md')
for k,v in pairs(sudo_users) do
function thsake_info(k1,k2)
send(v, 0, 1, "🔘┇قام بتفعيل مجموعه المده كانت 30 يوم \n📟┇ايدي المطور ⊰• ("..msg.sender_user_id_..")\n♠┇معرف المطور ⊰• "..zain_info.."\n🌐┇معلومات المجموعه \n\n📟┇ايدي المجموعه ⊰• ("..msg.chat_id_..")\nⓂ┇اسم المجموعه ⊰• ("..k2.title_..")" , 1, 'md')
end
openChat(msg.chat_id_,thsake_info)
end
database:set( 'JOKER:'..bot_id.."enable:"..txt[2],true)
end
getUser(msg.sender_user_id_, zain333)
end
if text:match('^المده2 (-%d+)$')  then
local txt = {string.match(text, "^(المده2) (-%d+)$")}
local zain_info = nil
function zain333(extra,result,success)
zain_info = '@'..(result.username_ or 'لا يوجد')..''
local timeplan2 = 7776000
database:setex( 'JOKER:'..bot_id.."charge:"..txt[2],timeplan2,true)
send(msg.chat_id_, msg.id_, 1, '✔┇المجموعه ('..txt[2]..') تم اعادة تفعيلها المدة 90 يوم', 1, 'md')
send(txt[2], 0, 1, '✔┇تم تفعيل مدة المجموعه 90 يوم', 1, 'md')
for k,v in pairs(sudo_users) do
function thsake_info(k1,k2)
send(v, 0, 1, "🔘┇قام بتفعيل مجموعه المده كانت 90 يوم \n📟┇ايدي المطور ⊰• ("..msg.sender_user_id_..")\n♠┇معرف المطور ⊰• "..zain_info.."\n🌐┇معلومات المجموعه \n\n📟┇ايدي المجموعه ⊰• ("..msg.chat_id_..")\nⓂ┇اسم المجموعه ⊰• ("..k2.title_..")" , 1, 'md')
end
openChat(msg.chat_id_,thsake_info)
end
database:set( 'JOKER:'..bot_id.."enable:"..txt[2],true)
end
getUser(msg.sender_user_id_, zain333)
end
if text:match('^المده3 (-%d+)$')  then
local txt = {string.match(text, "^(المده3) (-%d+)$")}
local zain_info = nil
function zain333(extra,result,success)
zain_info = '@'..(result.username_ or 'لا يوجد')..''
database:set( 'JOKER:'..bot_id.."charge:"..txt[2],true)
send(msg.chat_id_, msg.id_, 1, '✔┇المجموعه ('..txt[2]..') تم اعادة تفعيلها المدة لا نهائية', 1, 'md')
send(txt[2], 0, 1, '✔┇تم تفعيل مدة المجموعه لا نهائية', 1, 'md')
for k,v in pairs(sudo_users) do
function thsake_info(k1,k2)
send(v, 0, 1, "🔘┇قام بتفعيل مجموعه المده كانت لا نهائية \n📟┇ايدي المطور ⊰• ("..msg.sender_user_id_..")\n♠┇معرف المطور ⊰• "..zain_info.."\n🌐┇معلومات المجموعه \n\n📟┇ايدي المجموعه ⊰• ("..msg.chat_id_..")\nⓂ┇اسم المجموعه ⊰• ("..k2.title_..")" , 1, 'md')
end
openChat(msg.chat_id_,thsake_info)
end
database:set( 'JOKER:'..bot_id.."enable:"..txt[2],true)
end
getUser(msg.sender_user_id_, zain333)
end
if tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
if (msg.content_.text_ == 'الملفات' ) then
local files_JOKER = database:smembers("files"..bot_id)
local zain = io.popen('cd files_JOKER && ls'):read("*all")
local files_JOKER2 = ''
for i=1,#files_JOKER do
files_JOKER2 = files_JOKER2..'{'..files_JOKER[i]..'}\n'
end
send(msg.chat_id_, msg.id_, 1, '✔┇جميع الملفات : \n '..zain..'\n ---------------------- \n\n✔┇الملفات المفعله \n'..files_JOKER2..'', 1, 'html')
end
text = msg.content_.text_
if text then
if text:match("^(تفعيل ملف) (.*)(.lua)$")then
local name_t = {string.match(text, "^(تفعيل ملف) (.*)(.lua)$")}
function load(filename)
local f = io.open(filename)
if not f then
return "zain"
end
local s = f:read('*all')
f:close()
return s
end
local f = load("files_JOKER/"..name_t[2]..".lua")
if f ~= "zain" then
ts23 = ""
if f:match("^(.*)(zain_JOKER)(.*)$") then
if f:match("^(.*)(function send)(.*)$") then
ts23 = ts23 .. "\n⚠┇ارسال رسال نصيه"
end
if (f:match("^(.*)(sudo.lua)(.*)$")) then 
ts23 = ts23 .. "\n⚠┇الوصول الى توكن البوت وايدي المطور الاساسي"
end
if (f:match("^(.*)(io.popen)(.*)$")) then 
ts23 = ts23 .. "\n⚠┇الوصول الى تورمنل البوت"
end
if (f:match("^(.*)(os.execute)(.*)$")) then 
ts23 = ts23 .. "\n⚠┇الوصول الى تورمنل البوت"
end
if (f:match("^(.*)(redis)(.*)$")) then 
ts23 = ts23 .. "\n⚠┇الوصول الى خزن البوت"
end
if (f:match("^(.*)(ssl.https)(.*)$")) then 
ts23 = ts23 .. "\n⚠┇الوصول الى مواقع خارجيه في البوت"
end
if (f:match("^(.*)(rm -fr)(.*)$")) then 
ts23 = ts23 .. "\n⚠┇حذف ملفات او مجلدات"
end
if (f:match("^(.*)(encode)(.*)$")) then 
ts23 = ts23 .. "\n⚠┇التصال بapi خارجي"
end
if (f:match("^(.*)(api.telegram.org/bot)(.*)$")) then 
ts23 = ts23 .. "\n⚠┇قد يسبب الضعف في البوت"
end
database:sadd("files"..bot_id,name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, "✔┇تم تفعيل {"..name_t[2]..".lua}\n"..ts23, 1, 'html')
else
send(msg.chat_id_, msg.id_, 1, '⚠┇عذرا لا يمكن تشغيل {'..name_t[2]..'.lua} \n❗┇لانه لا يدعم سورس الجوكر \n 🃏┇[ملفات يدعمها سورس الجوكر](t.me/JOKERFiles)', 1, 'md')
end
else
send(msg.chat_id_, msg.id_, 1, '⚠┇عذرا لا يمكن تشغيل {'..name_t[2]..'.lua} \n❗┇لانه لا يدعم سورس الجوكر \n 🃏┇[ملفات يدعمها سورس الجوكر](t.me/JOKERFiles)', 1, 'md')
end
end
if text:match("^(عطل ملف) (.*)(.lua)$") then
local name_t = {string.match(text, "^(مسح ملف) (.*)(.lua)$")}
database:srem("files"..bot_id,name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, "❌┇تم تعطيل {"..name_t[2]..".lua}", 1, 'html')
end
if (text:match("^(مسح الملفات)$"))then
database:del("files"..bot_id)
send(msg.chat_id_, msg.id_, 1, "🗑┇تم حذف جميع الملفات", 1, 'html')
end
if text:match("^(حذف ملف) (.*)(.lua)$") then
local name_t = {string.match(text, "^(حذف ملف) (.*)(.lua)$")}
io.popen("rm -fr files_JOKER/"..name_t[2]..'.lua')
database:srem("files"..bot_id,name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, "❌┇تم حذف {"..name_t[2]..".lua}", 1, 'html')
end
if (msg.content_.text_ == 'رفع ملف' ) then
send(msg.chat_id_, msg.id_, 1, " 📥┇ ارسل ملف الان", 1, 'html')
database:set("addfiel"..msg.sender_user_id_,"yes")
end
if text:match("^(جلب ملف) (.*)(.lua)$") then
local name_t = {string.match(text, "^(جلب ملف) (.*)(.lua)$")}
send(msg.chat_id_, msg.id_, 1, "🕡┇ انتظر بعض الوقت وسيتم جلب \n 📁┇ملف : {"..name_t[2]..".lua}", 1, 'html')
local JOKERe = 'https://api.telegram.org/bot' .. token .. '/sendDocument'
local curl = 'curl "' .. JOKERe .. '" -F "chat_id=' .. msg.chat_id_ .. '" -F "document=@' .. 'files_JOKER/'..name_t[2]..'.lua' .. '"'
io.popen(curl)
end
end
end -- end if sudo
if tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
if text then
if (text and text == 'تفعيل الانلاين' ) then
database:set('key_ts'..bot_id,"yes")
send(msg.chat_id_, msg.id_, 1, "✔┇تم تفعيل خاصيه الازرار الشفافه", 1, 'html')
end
if (text and text == 'تعطيل الانلاين') then
database:del('key_ts'..bot_id)
send(msg.chat_id_, msg.id_, 1, "⚠┇تم تعطيل خاصيه الازرار الشفافه", 1, 'html')
end
if text:match("^(تغير نص الانلاين) (.*)$") then
local name_t = {string.match(text, "^(تغير نص الانلاين) (.*)$")}
database:set("channel_ts"..bot_id, name_t[2])
send(msg.chat_id_, msg.id_, 1, "📡┇تم تغير النص ⊰• {"..name_t[2].."}", 1, 'html')
end

if text:match("^(تغير رابط الانلاين) [Hh][Tt][Tt][Pp](.*)$") then
local name_t = {string.match(text, "^(تغير رابط الانلاين) (.*)$")}
database:set("channel_user_ts"..bot_id, name_t[2])
send(msg.chat_id_, msg.id_, 1, "📡┇تم تغير الرابط ⊰• {"..name_t[2].."}", 1, 'html')
end
end

end --sudo
if tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
if text == 'تفعيل التلقائي'then
database:set("add"..bot_id, "yes")
send(msg.chat_id_, msg.id_, 1, "✔┇تم تفعيل التلقائي", 1, 'html')
end
if (text == 'تعطيل التلقائي') then
database:del("add"..bot_id)
send(msg.chat_id_, msg.id_, 1, "❎┇تم تعطيل التلقائي", 1, 'html')
end
if text:match("^(تعين عدد الاعضاء) (.*)$") then
local zainj = {string.match(text, "^(تعين عدد الاعضاء) (.*)$")}
database:set("ts_a"..bot_id,zainj[2])
send(msg.chat_id_, msg.id_, 1, "🔘┇ تم تعين : "..zainj[2], 1, 'html')
end
end
end
end -- end function sudo

function JOKER_run_file(data)
local files_JOKER = database:smembers("files"..bot_id)
for i=1,#files_JOKER do
local JOKERee = dofile("files_JOKER/"..files_JOKER[i])
local kt = JOKERee.zain_JOKER(data)
if kt == 'end' then
return false
end
end
end

function TSall(msg,data)
text = msg.content_.text_
if msg.content_.photo_ then
local photo = database:get('JOKER:'..bot_id..'setphoto'..msg.chat_id_..':'..msg.sender_user_id_)
if photo then
local idPh = nil
if msg.content_.photo_.sizes_[0] then
idPh = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
idPh = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
idPh = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[3] then
idPh = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
setphoto(msg.chat_id_, idPh)
send(msg.chat_id_, msg.id_, 1, '✔┇تم وضع صوره للمجموعه', 1, 'md')
database:del('JOKER:'..bot_id..'setphoto'..msg.chat_id_..':'..msg.sender_user_id_)
end end
local d = data.disable_notification_
local chat = chats[msg.chat_id_]
if msg.date_ < (os.time() - 30) then
return false end
if text then
-------------------------------------------
if msg and msg.send_state_.ID == "MessageIsSuccessfullySent" then
function get_mymsg_contact(extra, result, success)
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,get_mymsg_contact)
return false
end
if not database:get( 'JOKER:'..bot_id.."charge:"..msg.chat_id_) then
if database:get( 'JOKER:'..bot_id.."enable:"..msg.chat_id_) then
database:del( 'JOKER:'..bot_id.."enable:"..msg.chat_id_)
for k,v in pairs(sudo_users) do
end
end
end
if msg.chat_id_ then
local id = tostring(msg.chat_id_)
if id:match('-100(%d+)') then
if not database:sismember( 'JOKER:'..bot_id.."groups",msg.chat_id_) then
database:sadd( 'JOKER:'..bot_id.."groups",msg.chat_id_)
end
elseif id:match('^(%d+)') then
database:sadd('JOKER:'..bot_id.."userss",msg.chat_id_)
else
if not database:sismember( 'JOKER:'..bot_id.."groups",msg.chat_id_) then
database:sadd( 'JOKER:'..bot_id.."groups",msg.chat_id_)
end
end
end
if ((not d) and chat) then
if msg.content_.ID == "MessageText" then
do_notify (chat.title_, msg.content_.text_)
else
do_notify (chat.title_, msg.content_.ID)
end
end
database:incr('JOKER:'..bot_id..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_)
if database:get('JOKER:'..bot_id..'viewget'..msg.sender_user_id_) then
if not msg.forward_info_ then
send(msg.chat_id_, msg.id_, 1, '⚠️┇قم بارسال المنشور من القناة', 1, 'md')
database:del('JOKER:'..bot_id..'viewget'..msg.sender_user_id_)
else
send(msg.chat_id_, msg.id_, 1, '📊┇عدد المشاهدات ⊰• <b>('..msg.views_..')</b> ', 1, 'html')
database:del('JOKER:'..bot_id..'viewget'..msg.sender_user_id_)
end
end
if msg.content_.members_ then
if is_banned(msg.content_.members_[0].id_, msg.chat_id_) then
chat_kick(msg.chat_id_, msg.content_.members_[0].id_)
return false
end
end
if (text and is_creator(msg)) then
if text:match("اضف امر (.*)") then 
local JOKER_edis = {string.match(text, "^اضف امر (.*)$")}
send(msg.chat_id_, msg.id_, 1, "✔┇ ارسال الان الامر الجديد", 1, 'md')
database:set("tsahke:new:msg:"..msg.chat_id_..msg.sender_user_id_..bot_id,JOKER_edis[1])
elseif (database:get("tsahke:new:msg:"..msg.chat_id_..msg.sender_user_id_..bot_id)) then 
send(msg.chat_id_, msg.id_, 1, "✔┇ تم الحفظ بنجاح", 1, 'md')
database:set("JOKER:edit:text:su:new:"..bot_id..msg.chat_id_..database:get("tsahke:new:msg:"..msg.chat_id_..msg.sender_user_id_..bot_id),text)
database:set("JOKER:edit:text:su:new2:"..bot_id..msg.chat_id_..text,database:get("tsahke:new:msg:"..msg.chat_id_..msg.sender_user_id_..bot_id))
database:del("tsahke:new:msg:"..msg.chat_id_..msg.sender_user_id_..bot_id)
end  
if (text and text == 'مسح امر المطور بالكليشه') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
redis:del('JOKER:'..bot_id..'text_sudo', text)
send(msg.chat_id_, msg.id_, 1, '✔┇تم حذف الكليشه ', 1, 'html')
return "JOKER"
end
if text:match("^مسح امر (.*)") then 
local t = {string.match(text, "^مسح امر (.*)$")}
database:del("JOKER:edit:text:su:new2:"..bot_id..msg.chat_id_..database:get("JOKER:edit:text:su:new:"..bot_id..msg.chat_id_..t[1]))
database:del("JOKER:edit:text:su:new:"..bot_id..msg.chat_id_..t[1])
send(msg.chat_id_, msg.id_, 1, "✔┇ تم المسح بنجاح", 1, 'md')
end
end
if text:match("^رفع ادمن$")  and is_owner(msg) and msg.reply_to_message_id_ then
function promote_by_reply(extra, result, success)
local hash =  'JOKER:'..bot_id..'mods:'..msg.chat_id_
if database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,'✔┇بالفعل تم رفعه ادمن')
else
database:sadd(hash, result.sender_user_id_)
tsX000("prore",msg,'✔┇تم رفعه ادمن')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
if text:match("^رفع ادمن @(.*)$") and is_owner(msg) then
local apmd = {string.match(text, "^(رفع ادمن) @(.*)$")}
function promote_by_username(extra, result, success)
if result.id_ then
database:sadd('JOKER:'..bot_id..'mods:'..msg.chat_id_, result.id_)
texts = '👨┇العضو ⊰• ['..result.title_..'](t.me/'..(apmd[2] or 'JOKERteam')..')\n✔┇تم رفعه ادمن'
else
texts = '❌┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],promote_by_username)
end
if text:match("^رفع ادمن (%d+)$") and is_owner(msg) then
local apmd = {string.match(text, "^(رفع ادمن) (%d+)$")}
database:sadd('JOKER:'..bot_id..'mods:'..msg.chat_id_, apmd[2])
tsX000(apmd[2],msg,"✔┇تم رفعه ادمن")
end
if text:match("^تنزيل ادمن$") and is_owner(msg) and msg.reply_to_message_id_ then
function demote_by_reply(extra, result, success)
local hash =  'JOKER:'..bot_id..'mods:'..msg.chat_id_
if not database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"✔┇ بالفعل تم تنزيله من ادمنيه البوت")
else
database:srem(hash, result.sender_user_id_)
tsX000("prore",msg,"✔┇ تم تنزيله من ادمنيه البوت")
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,demote_by_reply)
end
if text:match("^تنزيل ادمن @(.*)$") and is_owner(msg) then
local hash =  'JOKER:'..bot_id..'mods:'..msg.chat_id_
local apmd = {string.match(text, "^(تنزيل ادمن) @(.*)$")}
function demote_by_username(extra, result, success)
if result.id_ then
database:srem(hash, result.id_)
texts = '👨┇العضو ⊰• ['..result.title_..'](t.me/'..(apmd[2] or 'JOKERteam')..')\n✔┇تم تنزيله من ادمنيه البوت'
else
texts = '❌┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],demote_by_username)
end
if text:match("^تنزيل ادمن (%d+)$") and is_owner(msg) then
local hash =  'JOKER:'..bot_id..'mods:'..msg.chat_id_
local apmd = {string.match(text, "^(تنزيل ادمن) (%d+)$")}
database:srem(hash, apmd[2])
tsX000(apmd[2],msg,"✔┇ تم تنزيله من ادمنيه البوت")
end
if (text:match("^رفع مميز$") or text:match("^رفع مميز$"))  and is_owner(msg) and msg.reply_to_message_id_ then
function promote_by_reply(extra, result, success)
local hash =  'JOKER:'..bot_id..'vipgp:'..msg.chat_id_
if database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"✔┇بالفعل تم رفعه مميز") 
else
database:sadd(hash, result.sender_user_id_)
tsX000("prore",msg,"✔┇تم رفعه مميز")
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
local text = text:gsub('رفع مميز','رفع مميز')
if text:match("^رفع مميز @(.*)$") and is_owner(msg) then
local apmd = {string.match(text, "^(رفع مميز) @(.*)$")}
function promote_by_username(extra, result, success)
if result.id_ then
database:sadd('JOKER:'..bot_id..'vipgp:'..msg.chat_id_, result.id_)
texts = '👨┇العضو ⊰• ['..result.title_..'](t.me/'..(apmd[2] or 'JOKERTIME')..')\n✔┇تم رفعه مميز'
else
texts = '❌┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],promote_by_username)
end
local text = text:gsub('رفع مميز','رفع مميز')
if text:match("^رفع مميز (%d+)$") and is_owner(msg) then
local apmd = {string.match(text, "^(رفع عضو تافه😹 مميز) (%d+)$")}
database:sadd('JOKER:'..bot_id..'vipgp:'..msg.chat_id_, apmd[2])
tsX000(apmd[2],msg,"✔┇تم رفعه مميز")
end
if text and text == "تعين الايدي" and is_owner(msg) then
send(msg.chat_id_, msg.id_, 1,  '✔┇ ارسل الان النص\n✔┇ يمكنك اضافه :\n- `#username` > اسم المستخدم\n- `#msgs` > عدد رسائل المستخدم\n- `#photos` > عدد صور المستخدم\n- `#id` > ايدي المستخدم\n- `#stast` > موقع المستخدم \n- `#edit` > عدد التعديلات', 1, 'md')
database:set("tsahke:set:id:"..bot_id..msg.chat_id_..msg.sender_user_id_,'JOKER')
return "JOKER"
end
if text and is_owner(msg) and database:get("tsahke:set:id:"..bot_id..msg.chat_id_..msg.sender_user_id_) then 
database:del("tsahke:set:id:"..bot_id..msg.chat_id_..msg.sender_user_id_)
send(msg.chat_id_, msg.id_, 1,  '✔┇ تم الحفض بنجاح', 1, 'md')
database:set("JOKER:gr:id:text:"..bot_id..msg.chat_id_,text)
end
if text and text == "مسح الايدي" and is_owner(msg) then
send(msg.chat_id_, msg.id_, 1,  '❌┇ تم المسح بنجاح', 1, 'md')
database:del("JOKER:gr:id:text:"..bot_id..msg.chat_id_)
end
if (text:match("^تنزيل مميز$") or text:match("^تنزيل مميز$")) and is_owner(msg) and msg.reply_to_message_id_ then
function demote_by_reply(extra, result, success)
local hash =  'JOKER:'..bot_id..'vipgp:'..msg.chat_id_
if not database:sismember(hash, result.sender_user_id_) then
send(msg.chat_id_, msg.id_, 1, '👨┇العضو ⊰• *('..result.sender_user_id_..')* \n ✔┇بالفعل تم تنزيله من اعضاء الممزين البوت', 1, 'md')
tsX000("prore",msg,"✔┇بالفعل تم تنزيله من مميزين البوت")  
else
database:srem(hash, result.sender_user_id_)
tsX000("prore",msg,"✔┇تم تنزيله من مميزين البوت")
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,demote_by_reply)
end
local text = text:gsub('تنزيل مميز','تنزيل مميز')
if text:match("^تنزيل مميز @(.*)$") and is_owner(msg) then
local hash =  'JOKER:'..bot_id..'vipgp:'..msg.chat_id_
local apmd = {string.match(text, "^(تنزيل مميز) @(.*)$")}
function demote_by_username(extra, result, success)
if result.id_ then
database:srem(hash, result.id_)
texts = '👨┇العضو ⊰• ['..result.title_..'](t.me/'..(apmd[2] or 'JOKERteam')..')\n✔┇تم تنزيله من اعضاء الممزين البوت'
else
texts = '❌┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],demote_by_username)
end
local text = text:gsub('تنزيل مميز','تنزيل مميز')
if text:match("^تنزيل مميز (%d+)$") and is_owner(msg) then
local hash =  'JOKER:'..bot_id..'vipgp:'..msg.chat_id_
local apmd = {string.match(text, "^(تنزيل مميز) (%d+)$")}
database:srem(hash, apmd[2])
tsX000(apmd[2],msg,"✔┇تم تنزيله من مميزين البوت")
end  
if text:match("^حظر$") and is_mod(msg) and msg.reply_to_message_id_ ~= 0 then
if not is_creator(msg) and database:get("JOKER:lock:ban_and_kick"..bot_id..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1, '❌┇لا تستطيع حظر', 1, 'md')
return "tshakke"
end
function ban_by_reply(extra, result, success)
local hash =  'JOKER:'..bot_id..'banned:'..msg.chat_id_
if ck_mod(result.sender_user_id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '⚠️┇لا تستطيع حظر \n🔘┇(مدراء،ادمنيه،مميزين)البوت', 1, 'md')
else
if database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"✔┇بالفعل تم حظره من المجموعه")
chat_kick(result.chat_id_, result.sender_user_id_)
else
database:sadd(hash, result.sender_user_id_)
tsX000("prore",msg,"✔┇تم حظره من المجموعه")
chat_kick(result.chat_id_, result.sender_user_id_)
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,ban_by_reply)
end

if text:match("^حظر @(.*)$") and is_mod(msg) then
if not is_creator(msg) and database:get("JOKER:lock:ban_and_kick"..bot_id..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1, '❌┇لا تستطيع حظر', 1, 'md')
return "tshakke"
end
local apba = {string.match(text, "^(حظر) @(.*)$")}
function ban_by_username(extra, result, success)
if result.id_ then
if ck_mod(result.id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '⚠️┇لا تستطيع حظر \n🔘┇(مدراء،ادمنيه، مميزين)البوت', 1, 'md')
else
database:sadd('JOKER:'..bot_id..'banned:'..msg.chat_id_, result.id_)
texts = '👨┇العضو ⊰• ['..result.title_..'](t.me/'..(apba[2] or 'JOKERteam')..')\n✔┇تم حظره من المجموعه'
chat_kick(msg.chat_id_, result.id_)
end
else
texts = '❌┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apba[2],ban_by_username)
end

if text:match("^حظر (%d+)$") and is_mod(msg) then
if not is_creator(msg) and database:get("JOKER:lock:ban_and_kick"..bot_id..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1, '❌┇لا تستطيع حظر', 1, 'md')
return "tshakke"
end
local apba = {string.match(text, "^([Bb][Aa][Nn]) (%d+)$")}
if ck_mod(apba[2], msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '⚠️┇لا تستطيع حظر \n🔘┇(مدراء،ادمنيه،اعضاء،مميزين)البوت', 1, 'md')
else
database:sadd('JOKER:'..bot_id..'banned:'..msg.chat_id_, apba[2])
chat_kick(msg.chat_id_, apba[2])  
tsX000(apba[2],msg,"✔┇تم حظره من المجموعه")
end
end
----------------------------------------------unban--------------------------------------------
if text:match("^الغاء حظر$") and is_mod(msg) and msg.reply_to_message_id_ then
function unban_by_reply(extra, result, success)
local hash =  'JOKER:'..bot_id..'banned:'..msg.chat_id_
if not database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"✔┇بالفعل تم الغاء حظره من البوت")
else
database:srem(hash, result.sender_user_id_)
tsX000("prore",msg,"✔┇تم الغاء حظره من البوت")
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,unban_by_reply)
end
if is_mod(msg) then 
if text:match("وضع رابط (https://telegram.me/joinchat/%S+)") or text:match("وضع رابط (https://t.me/joinchat/%S+)") then   
local glink = text:match("وضع رابط (https://telegram.me/joinchat/%S+)") or text:match("وضع رابط (https://t.me/joinchat/%S+)") 
database:set('JOKER:'..bot_id.."group:link"..msg.chat_id_,glink) 
send(msg.chat_id_, msg.id_, 1, '✔┇تم وضع رابط', 1, 'md') 
send(msg.chat_id_, 0, 1, '↙️┇رابط المجموعه الجديد\n'..glink, 1, 'html')
end 
end
if text:match("^الغاء حظر @(.*)$") and is_mod(msg) then
local apba = {string.match(text, "^(الغاء حظر) @(.*)$")}
function unban_by_username(extra, result, success)
if result.id_ then
database:srem('JOKER:'..bot_id..'banned:'..msg.chat_id_, result.id_)
texts = '👨┇العضو ⊰• ['..result.title_..'](t.me/'..(apba[2] or 'JOKERteam')..')\n✔┇تم الغاء حظره من البوت' 
else
texts = '❌┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apba[2],unban_by_username)
end

if text:match("^الغاء حظر (%d+)$") and is_mod(msg) then
local apba = {string.match(text, "^(الغاء حظر) (%d+)$")}
database:srem('JOKER:'..bot_id..'banned:'..msg.chat_id_, apba[2])
tsX000(apba[2],msg,"✔┇تم الغاء حظره من البوت") 
end

if text:match("^الغاء حظر$") and is_mod(msg) and msg.reply_to_message_id_ then
function moody(extra, result, success)
function unban_by_reply(extra, result, success)
local hash =  'JOKER:'..bot_id..'banned:'..msg.chat_id_
database:srem(hash, result.sender_user_id_)
bot.changeChatMemberStatus(msg.chat_id_, result.sender_user_id_, "Left")
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,unban_by_reply)
end
bot.channel_get_kicked(msg.chat_id_,moody)
end

if text:match("^الغاء حظر @(.*)$") and is_mod(msg) then
local apba = {string.match(text, "^(الغاء حظر) @(.*)$")}
function moody(extra, result, success)
function unban_by_username(extra, result, success)
if result.id_ then
database:srem('JOKER:'..bot_id..'banned:'..msg.chat_id_, result.id_)
bot.changeChatMemberStatus(msg.chat_id_, result.id_, "Left")
else
end
send(msg.chat_id_, msg.id_, 1, txxt, 1, 'html')
end
resolve_username(apba[2],unban_by_username)
end
bot.channel_get_kicked(msg.chat_id_,moody)
end

if text:match("^الغاء حظر (%d+)$") and is_mod(msg) then
local apba = {string.match(text, "^(الغاء حظر) (%d+)$")}
function moody(extra, result, success)
database:srem('JOKER:'..bot_id..'banned:'..msg.chat_id_, apba[2])
bot.changeChatMemberStatus(msg.chat_id_, apba[2], "Left")
end
bot.channel_get_kicked(msg.chat_id_,moody)
end

if text:match("^حذف الكل$") and is_owner(msg) and msg.reply_to_message_id_ then
function delall_by_reply(extra, result, success)
if ck_mod(result.sender_user_id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '⚠️┇لا تستطيع مسح رسائل \n🔘┇(مدراء،ادمنيه،اعضاء مميزين)البوت', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '👨┇العضو ⊰• *('..result.sender_user_id_..')* \n🗑┇تم حذف كل رسائله\n', 1, 'md')
del_all_msgs(result.chat_id_, result.sender_user_id_)
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,delall_by_reply)
end

if text:match("^حذف الكل (%d+)$") and is_owner(msg) then
local ass = {string.match(text, "^(حذف الكل) (%d+)$")}
if ck_mod(ass[2], msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '⚠️┇لا تستطيع حذف رسائل \n🔘┇(مدراء،ادمنيه،مميزين)البوت', 1, 'md')
else
del_all_msgs(msg.chat_id_, ass[2])
send(msg.chat_id_, msg.id_, 1, '👨┇العضو ⊰• *('..ass[2]..')* \n🗑┇تم حذف كل رسائله\n', 1, 'md')
end
end

if text:match("^حذف الكل @(.*)$") and is_owner(msg) then
local apbll = {string.match(text, "^(حذف الكل) @(.*)$")}
function delall_by_username(extra, result, success)
if result.id_ then
if ck_mod(result.id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '⚠️┇لا تستطيع مسح رسائل \n🔘┇(مدراء،ادمنيه،اعضاء مميزين)البوت', 1, 'md')
return false
end
del_all_msgs(msg.chat_id_, result.id_)
texts = '👨┇العضو ⊰• ('..result.id_..') \n🗑┇تم حذف كل رسائله'
else
texts = '❌┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'html')
end
resolve_username(apbll[2],delall_by_username)
end
-----------------------------------------banall--------------------------------------------------
if text:match("^حظر عام$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) and msg.reply_to_message_id_ then
function gban_by_reply(extra, result, success)
local hash =  'JOKER:'..bot_id..'gbanned:'
if is_admin(result) then
send(msg.chat_id_, msg.id_, 1, '⚠️┇لا تستطيع حظر عام \n🔘┇(مدراء،ادمنيه،اعضاء مميزين)البوت', 1, 'md')
else
database:sadd(hash, result.sender_user_id_)
chat_kick(result.chat_id_, result.sender_user_id_)
tsX000("prore",msg,"🚫┇تم حظره عام")
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,gban_by_reply)
end

if text:match("^حظر عام @(.*)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local apbll = {string.match(text, "^(حظر عام) @(.*)$")}
function gban_by_username(extra, result, success)
if result.id_ then
if ck_admin(result.id_) then
send(msg.chat_id_, msg.id_, 1, '⚠️┇لا تستطيع حظر عام \n🔘┇(مدراء،ادمنيه،مميزين)البوت', 1, 'md')
else
local hash =  'JOKER:'..bot_id..'gbanned:'
texts = '👨┇العضو ⊰• ['..result.title_..'](t.me/'..(apbll[2] or 'JOKERteam')..')\n🚫┇تم حظره من المجموعات البوت'
database:sadd(hash, result.id_)
end
else
texts = '❌┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apbll[2],gban_by_username)
end

if text:match("^حظر عام (%d+)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local apbll = {string.match(text, "^(حظر عام) (%d+)$")}
local hash =  'JOKER:'..bot_id..'gbanned:'
if ck_admin(apbll[2]) then
send(msg.chat_id_, msg.id_, 1, '⚠️┇لا تستطيع حظر عام \n🔘┇(مدراء،ادمنيه،مميزين)البوت', 1, 'md')
else
database:sadd(hash, apbll[2])
tsX000(apbll[2],msg,"🚫┇تم حظره عام")
end
end
if text:match("^الغاء العام$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) and msg.reply_to_message_id_ then
function ungban_by_reply(extra, result, success)
local hash =  'JOKER:'..bot_id..'gbanned:'
tsX000("prore",msg,"🚫┇تم الغاء حظره عام")
database:srem(hash, result.sender_user_id_)
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,ungban_by_reply)
end

if text:match("^الغاء حظر عام @(.*)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local apid = {string.match(text, "^(الغاء حظر عام) @(.*)$")}
function ungban_by_username(extra, result, success)
local hash =  'JOKER:'..bot_id..'gbanned:'
if result.id_ then
texts = '👨┇العضو ⊰• ['..result.title_..'](t.me/'..(apid[2] or 'JOKERteam')..')\n🚫┇تم الغاء حظره من المجموعات البوت'
database:srem(hash, result.id_)
else
texts = '❌┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apid[2],ungban_by_username)
end

if text:match("^الغاء حظر عام (%d+)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local apbll = {string.match(text, "^(الغاء حظر عام) (%d+)$")}
local hash =  'JOKER:'..bot_id..'gbanned:'
database:srem(hash, apbll[2])
tsX000(apbll[2],msg,"🚫┇تم الغاء حظره عام")
end

if text:match("^كتم عام$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) and msg.reply_to_message_id_ then
function gmute_by_reply(extra, result, success)
local hash =  'JOKER:'..bot_id..'gmuted:'
if is_admin(result) then
send(msg.chat_id_, msg.id_, 1, '⚠️┇لا تستطيع كتم عام \n🔘┇(مدراء،ادمنيه،مميزين)البوت', 1, 'md')
else
database:sadd(hash, result.sender_user_id_)
tsX000("prore",msg,"🚫┇تم كتمه عام")
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,gmute_by_reply)
end

if text:match("^كتم عام @(.*)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local apbll = {string.match(text, "^(كتم عام) @(.*)$")}
function gmute_by_username(extra, result, success)
if result.id_ then
if ck_admin(result.id_) then
send(msg.chat_id_, msg.id_, 1, '⚠️┇لا تستطيع كتم عام \n🔘┇(مدراء،ادمنيه،مميزين)البوت', 1, 'md')
else
local hash =  'JOKER:'..bot_id..'gmuted:'
texts = '👨┇العضو ⊰• ['..result.title_..'](t.me/'..(apbll[2] or 'JOKERteam')..')\n🚫┇تم كتمه من المجموعات البوت'
database:sadd(hash, result.id_)
end
else
texts = '❌┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apbll[2],gmute_by_username)
end

if text:match("^كتم عام (%d+)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local apbll = {string.match(text, "^(كتم عام) (%d+)$")}
local hash =  'JOKER:'..bot_id..'gmuted:'
if ck_admin(apbll[2]) then
send(msg.chat_id_, msg.id_, 1, '⚠️┇لا تستطيع كتم عام \n🔘┇(مدراء،ادمنيه،مميزين)البوت', 1, 'md')
else
database:sadd(hash, apbll[2])
tsX000(apbll[2],msg,"🚫┇تم كتمه عام")
end
end
if text:match("^الغاء كتم عام$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) and msg.reply_to_message_id_ then
function ungmute_by_reply(extra, result, success)
local hash =  'JOKER:'..bot_id..'gmuted:'
tsX000("prore",msg,"🚫┇تم الغاء كتمه عام")
database:srem(hash, result.sender_user_id_)
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,ungmute_by_reply)
end

if text:match("^الغاء كتم عام @(.*)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local apid = {string.match(text, "^(الغاء كتم العام) @(.*)$")}
function ungmute_by_username(extra, result, success)
local hash =  'JOKER:'..bot_id..'gmuted:'
if result.id_ then
texts = '👨┇العضو ⊰• ['..result.title_..'](t.me/'..(apid[2] or 'JOKERteam')..')\n🚫┇تم الغاء كتمه من المجموعات البوت'
database:srem(hash, result.id_)
else
texts = '❌┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apid[2],ungmute_by_username)
end

if text:match("^الغاء كتم عام (%d+)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local apbll = {string.match(text, "^(الغاء كتم العام) (%d+)$")}
local hash =  'JOKER:'..bot_id..'gmuted:'
database:srem(hash, apbll[2])
tsX000(apbll[2],msg,"🚫┇تم الغاء كتمه عام")
end

if text:match("^كتم$") and is_mod(msg) and msg.reply_to_message_id_ ~= 0 then
function mute_by_reply(extra, result, success)
local hash =  'JOKER:'..bot_id..'muted:'..msg.chat_id_
if ck_mod(result.sender_user_id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '⚠️┇لا تستطيع كتم \n🔘┇(مدراء،ادمنيه،مميزين)البوت', 1, 'md')
else
if database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"🚫┇بالفعل تم كتمه")
else
database:sadd(hash, result.sender_user_id_)
tsX000("prore",msg,"🚫┇تم كتمه من البوت")
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,mute_by_reply)
end
if text:match("^كتم @(.*)$") and is_mod(msg) then
local apsi = {string.match(text, "^(كتم) @(.*)$")}
function mute_by_username(extra, result, success)
if result.id_ then
if ck_mod(result.id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '❌┇لا تستطيع كتم \n🔘┇(مدراء،ادمنيه،مميزين)البوت', 1, 'md')
else
database:sadd('JOKER:'..bot_id..'muted:'..msg.chat_id_, result.id_)
texts = '👨┇العضو ⊰• ['..result.title_..'](t.me/'..(apsi[2] or 'JOKERteam')..')\n🚫┇تم كتمه من البوت'
end
else
texts = '❌┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apsi[2],mute_by_username)
end
if text:match("^كتم (%d+)$") and is_mod(msg) then
local apsi = {string.match(text, "^(كتم) (%d+)$")}
if ck_mod(apsi[2], msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '❌┇لا تستطيع كتم \n🔘┇(مدراء،ادمنيه،اعضاء مميزين)البوت', 1, 'md')
else
database:sadd('JOKER:'..bot_id..'muted:'..msg.chat_id_, apsi[2])
tsX000(apsi[2],msg,"🚫┇تم كتمه من البوت")
end
end
if text:match("^الغاء كتم$") and is_mod(msg) and msg.reply_to_message_id_ then
function unmute_by_reply(extra, result, success)
local hash =  'JOKER:'..bot_id..'muted:'..msg.chat_id_
if not database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"🚫┇بالفعل تم الغاء كتمه من البوت")
else
database:srem(hash, result.sender_user_id_)
tsX000("prore",msg,"🚫┇تم الغاء كتمه من البوت")
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,unmute_by_reply)
end
if text:match("^الغاء كتم @(.*)$") and is_mod(msg) then
local apsi = {string.match(text, "^(الغاء كتم) @(.*)$")}
function unmute_by_username(extra, result, success)
if result.id_ then
database:srem('JOKER:'..bot_id..'muted:'..msg.chat_id_, result.id_)
texts = '👨┇العضو ⊰• ['..result.title_..'](t.me/'..(apsi[2] or 'JOKERteam')..')\n🚫┇تم الغاء كتمه من البوت'
else
texts = '❌┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apsi[2],unmute_by_username)
end

if text:match("^الغاء كتم (%d+)$") and is_mod(msg) then
local apsi = {string.match(text, "^(الغاء كتم) (%d+)$")}
database:srem('JOKER:'..bot_id..'muted:'..msg.chat_id_, apsi[2])
tsX000(apsi[2],msg,"🚫┇تم الغاء كتمه من البوت")
end

if text:match("^طرد$") and msg.reply_to_message_id_ ~=0 and is_mod(msg) then
if not is_creator(msg) and database:get("JOKER:lock:ban_and_kick"..bot_id..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1, '❌┇لا تستطيع طرد', 1, 'md')
return "tshakke"
end
function kick_reply(extra, result, success)
if ck_mod(result.sender_user_id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '❌┇لا تستطيع طرد \n🔘┇(مدراء،ادمنيه،مميزين)البوت', 1, 'md')
else
tsX000("prore",msg,"🚫┇تم طرده من المجموعه")
chat_kick(result.chat_id_, result.sender_user_id_)
end
end
getMessage(msg.chat_id_,msg.reply_to_message_id_,kick_reply)
end  
if text:match("^طرد @(.*)$") and is_mod(msg) then
if not is_creator(msg) and database:get("JOKER:lock:ban_and_kick"..bot_id..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1, '❌┇لا تستطيع طرد', 1, 'md')
return "tshakke"
end
local apki = {string.match(text, "^(طرد) @(.*)$")}
function kick_by_username(extra, result, success)
if result.id_ then
if ck_mod(result.id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '❌┇لا تستطيع طرد \n🔘┇(مدراء،ادمنيه،مميزين)البوت', 1, 'md')
else
texts = '👨┇العضو ⊰• ['..result.title_..'](t.me/'..(apki[2] or 'JOKERteam')..')\n🚫┇تم طرده من المجموعه'
chat_kick(msg.chat_id_, result.id_)
end
else
texts = '❌┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apki[2],kick_by_username)
end  
if text:match("^طرد (%d+)$") and is_mod(msg) then
if not is_creator(msg) and database:get("JOKER:lock:ban_and_kick"..bot_id..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1, '❌┇لا تستطيع طرد', 1, 'md')
return "tshakke"
end
local apki = {string.match(text, "^(طرد) (%d+)$")}
if ck_mod(apki[2], msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '❌┇لا تستطيع طرد \n🔘┇(مدراء،ادمنيه،مميزين)البوت', 1, 'md')
else
chat_kick(msg.chat_id_, apki[2])
tsX000(apki[2],msg,"🚫┇تم طرده من المجموعه")
end
end
if text:match("^رفع مدير$") and is_creator(msg) and msg.reply_to_message_id_ then
function setowner_by_reply(extra, result, success)
local hash =  'JOKER:'..bot_id..'owners:'..msg.chat_id_
if database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"✔┇بالفعل تم رفع مدير في البوت")
else
database:sadd(hash, result.sender_user_id_)
tsX000("prore",msg,"✔┇تم رفع مدير في البوت")
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,setowner_by_reply)
end  
if text:match("^رفع مدير @(.*)$") and is_creator(msg) then
local apow = {string.match(text, "^(رفع مدير) @(.*)$")}
function setowner_by_username(extra, result, success)
if result.id_ then
database:sadd('JOKER:'..bot_id..'owners:'..msg.chat_id_, result.id_)
texts = '👨┇العضو ⊰• ['..result.title_..'](t.me/'..(apow[2] or 'JOKERteam')..')\n✔┇تم رفع مدير في البوت'
else
texts = '❌┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apow[2],setowner_by_username)
end 
if text:match("^رفع مدير (%d+)$") and is_creator(msg) then
local apow = {string.match(text, "^(رفع مدير) (%d+)$")}
database:sadd('JOKER:'..bot_id..'owners:'..msg.chat_id_, apow[2])
tsX000(apow[2],msg,"✔┇تم رفع مدير في البوت")
end  
if text:match("^تنزيل مدير$") and is_creator(msg) and msg.reply_to_message_id_ then
function deowner_by_reply(extra, result, success)
local hash =  'JOKER:'..bot_id..'owners:'..msg.chat_id_
if not database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"✔┇بالفعل تم تنزيله من مدراء البوت")
else
database:srem(hash, result.sender_user_id_)
tsX000("prore",msg,"✔┇تم تنزيله من مدراء البوت")
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,deowner_by_reply)
end  
if text:match("^تنزيل مدير @(.*)$") and is_creator(msg) then
local apow = {string.match(text, "^(تنزيل مدير) @(.*)$")}
local hash =  'JOKER:'..bot_id..'owners:'..msg.chat_id_
function remowner_by_username(extra, result, success)
if result.id_ then
database:srem(hash, result.id_)
texts = '👨┇العضو ⊰• ['..result.title_..'](t.me/'..(apow[2] or 'JOKERteam')..')\n✔┇تم تنزيله من مدراء البوت'
else
texts = '❌┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apow[2],remowner_by_username)
end  
if text:match("^تنزيل مدير (%d+)$") and is_creator(msg) then
local hash =  'JOKER:'..bot_id..'owners:'..msg.chat_id_
local apow = {string.match(text, "^(تنزيل مدير) (%d+)$")}
database:srem(hash, apow[2])
tsX000(apow[2],msg,"✔┇تم تنزيله من مدراء البوت")
end
if text:match("^الادمنيه$") and is_owner(msg) then
local hash =   'JOKER:'..bot_id..'mods:'..msg.chat_id_
local list = database:smembers(hash)
text = "👥┇قائمة الادمنيه ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local user_info = database:hgetall('JOKER:'..bot_id..'user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..k.."|</b>⊰•(@"..username..")\n"
else
text = text.."<b>|"..k.."|</b>⊰•(<code>"..v.."</code>)\n"
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "❌┇لايوجد ادمنيه"
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
-----------------------------------------------
if (text and text == "ابلاغ" and msg.reply_to_message_id_ ~= 0 and (not database:get("JOKER:mute:deleta:msg:"..bot_id..msg.chat_id_))) then 
b = database:get("JOKER:user:deleteL:msg:"..msg.chat_id_..bot_id..msg.sender_user_id_)
if b and b == os.date("%x") then 
send(msg.chat_id_, msg.id_, 1, "👨┇ لا يمكنك الابلاغ اكثر من مره في اليوم", 1, 'html')
else
database:set("JOKER:user:deleteL:msg:"..msg.chat_id_..bot_id..msg.sender_user_id_,os.date("%x"))
y = database:get("tsahke:fel:o:me:"..bot_id..msg.chat_id_) or 10
x = database:get("tsahke:fel:msg:me:"..bot_id..msg.chat_id_..msg.reply_to_message_id_) or 0
send(msg.chat_id_, msg.reply_to_message_id_, 1, "⚠┇تم الابلاغ على الرساله\n⚠┇تبقى {"..(y-(x+1)).."} حتى يتم حذف الرساله", 1, 'html')
database:incr("tsahke:fel:msg:me:"..bot_id..msg.chat_id_..msg.reply_to_message_id_)
if (database:get("tsahke:fel:msg:me:"..bot_id..msg.chat_id_..msg.reply_to_message_id_)) then 
x = database:get("tsahke:fel:msg:me:"..bot_id..msg.chat_id_..msg.reply_to_message_id_)
y = database:get("tsahke:fel:o:me:"..bot_id..msg.chat_id_) or 10
if tonumber(x) >= tonumber(y) then 
send(msg.chat_id_, 0, 1, "⚠┇تم حذف الرساله", 1, 'html')
delete_msg(msg.chat_id_, {[0] = msg.reply_to_message_id_})
end
end
end 
end
if (text and text == "تعطيل الابلاغ" and is_creator(msg)) then 
database:set("JOKER:mute:deleta:msg:"..bot_id..msg.chat_id_,"JOKERE")
send(msg.chat_id_, msg.id_, 1, "🔓┇تم تعطيل خاصيه الابلاغ", 1, 'html')
end
if (text and text == "تفعيل الابلاغ" and is_creator(msg)) then 
database:del("JOKER:mute:deleta:msg:"..bot_id..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, "🔓┇تم تفعيل خاصيه الابلاغ", 1, 'html')
end
if text and text:match("(تعين عدد الابلاغ) (%d+)") and is_creator(msg) then 
local a = {string.match(text, "^(تعين عدد الابلاغ) (%d+)$")}
database:set("tsahke:fel:o:me:"..bot_id..msg.chat_id_,a[2])
send(msg.chat_id_, msg.id_, 1, "👨┇تم تعين عدد الابلاغ {"..a[2].."}", 1, 'html')
end
if text:match("^المميزين") and is_owner(msg) then
local hash =   'JOKER:'..bot_id..'vipgp:'..msg.chat_id_
local list = database:smembers(hash)
text = "👥┇قائمة المميزين ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local user_info = database:hgetall('JOKER:'..bot_id..'user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..k.."|</b>⊰•(@"..username..")\n"
else
text = text.."<b>|"..k.."|</b>⊰•(<code>"..v.."</code>)\n"
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "❌┇لايوجد مميزين"
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
if text:match("^قائمه المنع$") and is_mod(msg) then
local hash =  'JOKER:'..bot_id..'filters:'..msg.chat_id_
if hash then
local names = database:hkeys(hash)
text = "⚠┇قائمة الكلمات الممنوعه ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for i=1, #names do
text = text.."<b>|"..i.."|</b>⊰•("..names[i]..")\n"
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #names == 0 then
text = "❌┇لايوجد كلمات ممنوعه"
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
end
if text and text == "عدد الكروب" and is_mod(msg) then 
function dl_cb22( t1,t2 )
local JOKER_098 = 0
if database:get("JOKER:get:mod:"..bot_id..msg.chat_id_) then 
t = database:get("JOKER:get:mod:"..bot_id..msg.chat_id_)
JOKER_098 = tonumber(t2.member_count_) - tonumber(t)
end
send(msg.chat_id_, msg.id_, 1, "🔖┇عدد المجموعه\n👨┇عدد المدراء : "..t2.administrator_count_.."\n👥┇عدد الاعضاء : "..t2.member_count_.." | ("..JOKER_098..")\n🔥┇عدد المطرودين : "..t2.kicked_count_, 1, 'md')
database:set("JOKER:get:mod:"..bot_id..msg.chat_id_,t2.member_count_)   
end
tdcli_function ({
ID = "GetChannelFull",
channel_id_ = getChatId(msg.chat_id_).ID
}, dl_cb22, nil)
end
if text:match("^المكتومين$") and is_mod(msg) then
local hash =   'JOKER:'..bot_id..'muted:'..msg.chat_id_
local list = database:smembers(hash)
text = "🚫┇قائمة المكتومين  ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local user_info = database:hgetall('JOKER:'..bot_id..'user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..k.."|</b>⊰•(@"..username..")\n"
else
text = text.."<b>|"..k.."|</b>⊰•(<code>"..v.."</code>)\n"
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "❌┇لايوجد مكتومين"
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
if text:match("^المدراء$") and is_creator(msg) then
local hash =   'JOKER:'..bot_id..'owners:'..msg.chat_id_
local list = database:smembers(hash)
text = "🛄┇قائمة المدراء  ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local user_info = database:hgetall('JOKER:'..bot_id..'user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..k.."|</b>⊰•(@"..username..")\n"
else
text = text.."<b>|"..k.."|</b>⊰•(<code>"..v.."</code>)\n"
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "❌┇لايوجد مدراء"
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
if text:match("^المحظورين$") and is_mod(msg) then
local hash =   'JOKER:'..bot_id..'banned:'..msg.chat_id_
local list = database:smembers(hash)
text = "⛔┇قائمة المحظورين  ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local user_info = database:hgetall('JOKER:'..bot_id..'user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..k.."|</b>⊰•(@"..username..")\n"
else
text = text.."<b>|"..k.."|</b>⊰•(<code>"..v.."</code>)\n"
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "❌┇لايوجد محظورين"
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
if  msg.content_.text_:match("^قائمه العام$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local hash =   'JOKER:'..bot_id..'gbanned:'
local list = database:smembers(hash)
text = "⛔┇قائمة الحظر العام  ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local user_info = database:hgetall('JOKER:'..bot_id..'user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..k.."|</b>⊰•(@"..username..")\n"
else
text = text.."<b>|"..k.."|</b>⊰•(<code>"..v.."</code>)\n"
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "❌┇لايوجد محظورين عام"
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
if  msg.content_.text_:match("^المكتومين عام$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local hash =   'JOKER:'..bot_id..'gmuted:'
local list = database:smembers(hash)
text = "⛔┇قائمة الكتم العام  ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local user_info = database:hgetall('JOKER:'..bot_id..'user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..k.."|</b>⊰•(@"..username..")\n"
else
text = text.."<b>|"..k.."|</b>⊰•(<code>"..v.."</code>)\n"
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "❌┇لايوجد مكتومين عام"
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end  
if text:match("^ايدي$") and msg.reply_to_message_id_ ~= 0 then
function id_by_reply(extra, result, success)
if not database:get('JOKER:'..bot_id..'id:mute'..msg.chat_id_) then 
local msgs = database:get('JOKER:'..bot_id..'user:msgs'..msg.chat_id_..':'..result.sender_user_id_) or 0
local edit = database:get('JOKER:'..bot_id..'user:editmsg'..msg.chat_id_..':'..result.sender_user_id_) or 0
local msg2 = msg
msg2.sender_user_id_ = result.sender_user_id_
if is_sudo(msg2) then
JOKER_oop = 'مطور البوت'
elseif is_creator(msg) then
JOKER_oop = 'منشئ الكروب'
elseif (database:get("JOKER:name_user:"..bot_id..msg.chat_id_..result.sender_user_id_) and database:get("JOKER:all_if:"..database:get("JOKER:name_user:"..bot_id..msg.chat_id_..result.sender_user_id_) ..bot_id..msg.chat_id_)) then 
JOKER_oop = database:get("JOKER:name_user:"..bot_id..msg.chat_id_..result.sender_user_id_)
elseif is_owner(msg2) then
JOKER_oop = 'مدير الكروب'
elseif ck_mod(result.sender_user_id_,msg.chat_id_) then
JOKER_oop = 'ادمن للكروب'
elseif is_vip(msg2) then
JOKER_oop = 'مميز الكروب'
else
JOKER_oop = 'عضو تافه😹 فقط'
end
send(msg.chat_id_, msg.id_, 1,"🔖┇ايدي ⊰• `{"..result.sender_user_id_.."}`\n🗳┇موقعه ⊰• {"..JOKER_oop.."}\n📊┇عدد رسائل ⊰• `{"..msgs.."}`\n🗑┇عدد التعديلات ⊰• `{"..edit.."}`", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1,"`"..result.sender_user_id_.."`", 1, 'md')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,id_by_reply)
end  
if text:match("^ايدي @(.*)$") then
local ap = {string.match(text, "^(ايدي) @(.*)$")}
function id_by_username(extra, result, success)
if result.id_ then
if not database:get('JOKER:'..bot_id..'id:mute'..msg.chat_id_) then 
local msgs = database:get('JOKER:'..bot_id..'user:msgs'..msg.chat_id_..':'..result.id_) or 0
local edit = database:get('JOKER:'..bot_id..'user:editmsg'..msg.chat_id_..':'..result.id_) or 0
local msg2 = msg
msg2.sender_user_id_ = result.id_
if is_sudo(msg2) then
JOKER_oop = 'مطور البوت'
elseif is_creator(msg) then
JOKER_oop = 'منشئ الكروب'
elseif (database:get("JOKER:name_user:"..bot_id..msg.chat_id_..result.id_) and database:get("JOKER:all_if:"..database:get("JOKER:name_user:"..bot_id..msg.chat_id_..result.id_) ..bot_id..msg.chat_id_)) then 
JOKER_oop = database:get("JOKER:name_user:"..bot_id..msg.chat_id_..result.id_)
elseif is_owner(msg2) then
JOKER_oop = 'مدير الكروب'
elseif ck_mod(result.id_,msg.chat_id_) then
JOKER_oop = 'ادمن للكروب'
elseif is_vip(msg2) then
JOKER_oop = ' مميز الكروب'
else
JOKER_oop = 'عضو تافه😹 فقط'
end
texts = "📟┇ايدي ⊰• `{"..result.id_.."}`\n📍┇موقعه ⊰• {"..JOKER_oop.."}\n🗑┇عدد الرسائل ⊰• `{"..msgs.."}`\n🏎┇عدد التعديلات ⊰• `{"..edit.."}`"
else
texts = "`"..result.id_.."`"
end
else
texts = '❌┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(ap[2],id_by_username)
end  
if text:match("^جلب صوره (%d+)$") and msg.reply_to_message_id_ == 0 and not database:get('JOKER:'..bot_id..'get:photo'..msg.chat_id_) then
local pronumb = {string.match(text, "^(جلب صوره) (%d+)$")}
local ph = pronumb[2] - 1
local function gpro(extra, result, success)
if result.photos_[ph] then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[ph].sizes_[1].photo_.persistent_id_)
else
send(msg.chat_id_, msg.id_, 1, "⚠️┇لا تملك صوره رقم <b>{"..pronumb[2].."}</b> في حسابك", 1, 'html')
end
end
tdcli_function ({
ID = "GetUserProfilePhotos",
user_id_ = msg.sender_user_id_,
offset_ = 0,
limit_ = pronumb[2]
}, gpro, nil)
end
if text:match("^وضع تكرار (%d+)$") and is_owner(msg) then
local floodmax = {string.match(text, "^(وضع تكرار) (%d+)$")}
if tonumber(floodmax[2]) < 2 then
send(msg.chat_id_, msg.id_, 1, '🔘┇ضع التكرار من *{2}* الى  *{99999}*', 1, 'md')
else
database:set('JOKER:'..bot_id..'flood:max:'..msg.chat_id_,floodmax[2])
send(msg.chat_id_, msg.id_, 1, '✔┇تم  وضع التكرار بالطرد للعدد ⊰•  *{'..floodmax[2]..'}*', 1, 'md')
end
end
if (text and text == "تعطيل الاعلانات" and is_creator(msg)) then 
if not is_sudo(msg) then 
database:set("JOKER:gr:not:ads:"..bot_id..msg.chat_id_..os.date("%x"),"ok")
send(msg.chat_id_, msg.id_, 1, '🖲┇ تم تعطيل ضهور الاعلانات لمده يوم \n📊┇ [يمكنك معرفه المزيد حول الاعلانات هنا](https://t.me/JOKERADS)', 1, "md") 
else
send(msg.chat_id_, msg.id_, 1, '💥┇ عزيزي المطور لايمكنك تعطيل هاذه الامر \n📊┇ [يمكنك معرفه المزيد حول الاعلانات هنا](https://t.me/JOKERADS)', 1, "md") 
end
end
if (text and text == "تفعيل الاعلانات" and is_creator(msg)) then 
database:del("JOKER:gr:not:ads:"..bot_id..msg.chat_id_..os.date("%x"))
send(msg.chat_id_, msg.id_, 1, '🖲┇تم تفعيل ضهور الاعلانات \n📊┇ [يمكنك معرفه المزيد حول الاعلانات هنا](https://t.me/JOKERADS)', 1, "md") 
end  
if text:match("^وضع زمن التكرار (%d+)$") and is_owner(msg) then
local floodt = {string.match(text, "^(وضع زمن التكرار) (%d+)$")}
if tonumber(floodt[2]) < 1 then
send(msg.chat_id_, msg.id_, 1, '🔘┇ضع العدد من *{1}* الى  *{99999}*', 1, 'md')
else
database:set('JOKER:'..bot_id..'flood:time:'..msg.chat_id_,floodt[2])
send(msg.chat_id_, msg.id_, 1, '✔┇تم  وضع الزمن التكرار للعدد ⊰•  *{'..floodt[2]..'}*', 1, 'md')
end
end
if text:match("^الرابط$") then
if not database:get("JOKER:mute:link:gr:"..bot_id..msg.chat_id_) then 
function dl_cb222( t1,t2 )
if t2.invite_link_ ~= false then 
send(msg.chat_id_, msg.id_, 1, '📮┇رابط المجموعه\n'..(t2.invite_link_ or "Error"), 1, "html")
elseif (database:get('JOKER:'..bot_id.."group:link"..msg.chat_id_)) then 
send(msg.chat_id_, msg.id_, 1, '📮┇رابط المجموعه\n'..database:get('JOKER:'..bot_id.."group:link"..msg.chat_id_), 1, "html")
else
send(msg.chat_id_, msg.id_, 1, '⚠️┇لا يمكني الوصل الى الرابط عليك منحي صلاحيه {دعوه المستخدمين من خلال الرابط}', 1, "html")
end
end
tdcli_function ({
ID = "GetChannelFull",
channel_id_ = getChatId(msg.chat_id_).ID
}, dl_cb222, nil)
else 
send(msg.chat_id_, msg.id_, 1, '🖲┇جلب الرابط معطل', 1, "html") 
end
end
-----------------------------------------------------------
if text:match("^تفعيل الترحيب$") and is_mod(msg) then
send(msg.chat_id_, msg.id_, 1, '✔┇تم تفعيل الترحيب في المجموعه', 1, 'md')
database:set('JOKER:'..bot_id.."welcome"..msg.chat_id_,true)
end
if text:match("^تعطيل الترحيب$") and is_mod(msg) then
send(msg.chat_id_, msg.id_, 1, '✔┇تم تعطيل الترحيب في المجموعه', 1, 'md')
database:del('JOKER:'..bot_id.."welcome"..msg.chat_id_)
end
if text:match("^وضع ترحيب (.*)$") and is_mod(msg) then
local welcome = {string.match(text, "^(وضع ترحيب) (.*)$")}
send(msg.chat_id_, msg.id_, 1, '✔┇تم وضع ترحيب\n♠┇⊰•('..welcome[2]..')', 1, 'md')
database:set('JOKER:'..bot_id..'welcome:'..msg.chat_id_,welcome[2])
end
if text:match("^حذف الترحيب$") and is_mod(msg) then
send(msg.chat_id_, msg.id_, 1, '✔┇تم حذف الترحيب', 1, 'md')
database:del('JOKER:'..bot_id..'welcome:'..msg.chat_id_)
end
if text:match("^جلب الترحيب$") and is_mod(msg) then
local wel = database:get('JOKER:'..bot_id..'welcome:'..msg.chat_id_)
if wel then
send(msg.chat_id_, msg.id_, 1, '♠┇الترحيب\n⊰•('..wel..')', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '❌┇لم يتم وضع ترحيب للمجموعه\n', 1, 'md')
end
end  
if text:match("^منع (.*)$") and is_mod(msg) then
local filters = {string.match(text, "^(منع) (.*)$")}
local name = string.sub(filters[2], 1, 50)
database:hset('JOKER:'..bot_id..'filters:'..msg.chat_id_, name, 'filtered')
send(msg.chat_id_, msg.id_, 1, "✔┇تم اضافتها لقائمه المنع\n🔘┇{"..name.."}", 1, 'md')
end  
if text:match("^الغاء منع (.*)$") and is_mod(msg) then
local rws = {string.match(text, "^(الغاء منع) (.*)$")}
local name = string.sub(rws[2], 1, 50)
database:hdel('JOKER:'..bot_id..'filters:'..msg.chat_id_, rws[2])
send(msg.chat_id_, msg.id_, 1, "✔┇تم حذفها من لقائمه المنع\n🔘┇{"..rws[2].."}", 1, 'md')
end  
if (text and text == "مسح قائمه المحظورين" and is_creator(msg)) then 
local function getChannelMembers(channel_id, filter, offset, limit, cb)
if not limit or limit > 200 then
limit = 200
end
tdcli_function ({
ID = "GetChannelMembers",
channel_id_ = getChatId(channel_id).ID,
filter_ = {
ID = "ChannelMembers" .. filter
},
offset_ = offset or 0,
limit_ = limit
}, cb or dl_cb, nil)
end
function zainididi(t1,t2)
if t2.members_ then 
for i=1,#t2.members_ do 
bot.changeChatMemberStatus(msg.chat_id_, t2.members_[i].user_id_, "Left")
end
send(msg.chat_id_, msg.id_, 1, '✔┇تم الغاء حظر {'..t2.total_count_..'} عضو تافه😹', 1, 'md')
end
end
getChannelMembers(msg.chat_id_,"Kicked",0,10000,zainididi)
end
if (text:match("^كشف البوتات$") or text:match("^البوتات$")) and is_mod(msg) then
local txt = {string.match(text, "^كشف البوتات$")}
local function cb(extra,result,success)
local list = result.members_
text = '📊┇البوتات\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n'
local n = 0
for k,v in pairs(list) do
if v.user_id_ ~= bot_id then
n = (n + 1)
local user_info = database:hgetall('JOKER:'..bot_id..'user:'..v.user_id_)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..n.."|</b>⊰•(@"..username..")\n"
else
text = text.."<b>|"..n.."|</b>⊰•(<code>"..v.user_id_.."</code>)\n"
end
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list ~= 0 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
else
send(msg.chat_id_, msg.id_, 1, "📊┇لا توجد بوتات في المجموعه", 1, 'html')
end
end
bot.channel_get_bots(msg.chat_id_,cb)
end
if text:match("^مسجاتي$") and msg.reply_to_message_id_ == 0  then
local user_msgs = database:get('JOKER:'..bot_id..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_)
if not database:get('JOKER:'..bot_id..'id:mute'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "💌┇عدد مسجاتك ⊰• *{"..user_msgs.."}*", 1, 'md')
else
end
end
if text:match("^جهاتي$") then
add = (tonumber(database:get('JOKER:'..bot_id..'user:add'..msg.chat_id_..':'..msg.sender_user_id_)) or 0)
send(msg.chat_id_, msg.id_, 1, "💌┇عدد جهاتك ⊰• *{"..add.."}*\n💌┇سيتم حذف العدد بعد هذه الرساله", 1, 'md')
database:del('JOKER:'..bot_id..'user:add'..msg.chat_id_..':'..msg.sender_user_id_)
end
if text:match("^(عدد التعديلات)$") or text:match("^(تعديلاتي)$") then
local edit = database:get('JOKER:'..bot_id..'user:editmsg'..msg.chat_id_..':'..msg.sender_user_id_) or 0
send(msg.chat_id_, msg.id_, 1, "💌┇عدد سحكاتك ⊰• *{"..edit.."}*", 1, 'md')
end
if text:match("^مسح المحظورين عام$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
text = '✔┇تم مسح محظورين عام'
database:del('JOKER:'..bot_id..'gbanned:')
send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
if text:match("^مسح المكتومين عام") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
text = '✔┇ تم مسح المكتومين عام'
database:del('JOKER:'..bot_id..'gmuted:')
send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
if (text:match("^(تعين عدد الاحرف) (%d+)$") and is_mod(msg)) then
JOKER_0 = {string.match(text, "^(تعين عدد الاحرف) (%d+)$")}
send(msg.chat_id_, msg.id_, 1, '✔┇ تم تعين عدد الاحرف {`'..JOKER_0[2]..'`}', 1, 'md')
database:set("JOKER:not:word:"..bot_id..msg.chat_id_,JOKER_0[2])
end
if text:match("^مسح (.*)$") and is_mod(msg) then
local txt = {string.match(text, "^(مسح) (.*)$")}
if txt[2] == 'banlist' or txt[2] == 'Banlist' or txt[2] == 'المحظورين' then
database:del('JOKER:'..bot_id..'banned:'..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '✔┇تم مسح المحظورين  من البوت ', 1, 'md')
end
if txt[2] == 'creators' and is_sudo(msg) or txt[2] == 'creatorlist' and is_sudo(msg) or txt[2] == 'Creatorlist' and is_sudo(msg) or txt[2] == 'Creators' and is_sudo(msg) or txt[2] == 'المنشئين' and is_sudo(msg) then
database:del('JOKER:'..bot_id..'creator:'..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '✔┇تم مسح قائمه المنشئين', 1, 'md')
end
if txt[2] == 'البوتات' then
local function cb(extra,result,success)
local bots = result.members_
for i=0 , #bots do
if tonumber(bots[i].user_id_) ~= tonumber(bot_id) then chat_kick(msg.chat_id_,bots[i].user_id_)
end
end
end
bot.channel_get_bots(msg.chat_id_,cb)
send(msg.chat_id_, msg.id_, 1, '✔┇تم مسح جميع البوتات', 1, 'md')
end
if txt[2] == 'الادمنيه' and is_owner(msg) then
database:del('JOKER:'..bot_id..'mods:'..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '✔┇تم مسح قائمه الادمنيه', 1, 'md')
end
if  txt[2] == 'المميزين' and is_owner(msg) then
database:del('JOKER:'..bot_id..'vipgp:'..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '✔┇تم مسح قائمه المميزين', 1, 'md')
end
if  txt[2] == 'المميزين' and is_owner(msg) then
database:del('JOKER:'..bot_id..'vipgp:'..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '✔┇تم مسح قائمه الاعضاء المميزين', 1, 'md')
end
if  txt[2] == 'المدراء' and is_creator(msg) then
database:del('JOKER:'..bot_id..'owners:'..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '✔┇تم مسح قائمه المدراء', 1, 'md')
end
if  txt[2] == 'القوانين' then
database:del('JOKER:'..bot_id..'rules'..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '✔┇تم مسح القوانين المحفوظه', 1, 'md')
end
if txt[2] == 'الرابط' then
database:del('JOKER:'..bot_id..'group:link'..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '✔┇تم مسح الرابط المحفوظ', 1, 'md')
end
if txt[2] == 'قائمه المنع' then
database:del('JOKER:'..bot_id..'filters:'..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '✔┇تم مسح قائمه المنع', 1, 'md')
end
if  txt[2] == 'المكتومين' then
database:del('JOKER:'..bot_id..'muted:'..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '✔┇تم مسح قائمه المكتومين', 1, 'md')
end
end
if (text and (text == "تعطيل الطرد" or text == "تعطيل الحظر") and is_creator(msg)) then
database:set("JOKER:lock:ban_and_kick"..bot_id..msg.chat_id_,"JOKER")
send(msg.chat_id_, msg.id_, 1, '✔┇تم تعطيل (طرد - حضر) الاعضاء', 1, 'md')
end
if (text and (text == "تفعيل الطرد" or text == "تفعيل الحظر") and is_creator(msg)) then
database:del("JOKER:lock:ban_and_kick"..bot_id..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '✔┇تم تفعيل (طرد - حضر) الاعضاء', 1, 'md')
end
if text:match("^اضافه قائمه المحظورين$") and is_creator(msg) then
local txt = {string.match(text, "^(اضافه قائمه المحظورين)$")}
local function cb(extra,result,success)
local list = result.members_
for k,v in pairs(list) do
bot.addChatMember(msg.chat_id_, v.user_id_, 200, dl_cb, nil)
end
text = '✔┇تم اضافه قائمه المحظورين للمجموعه'
send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
bot.channel_get_kicked(msg.chat_id_,cb)
end
if text:match("^طرد المحذوفين$") and is_creator(msg) then
local txt = {string.match(text, "^(طرد المحذوفين)$")}
local function getChatId(chat_id)
local chat = {}
local chat_id = tostring(chat_id)
if chat_id:match('^-100') then
local channel_id = chat_id:gsub('-100', '')
chat = {ID = channel_id, type = 'channel'}
else
local group_id = chat_id:gsub('-', '')
chat = {ID = group_id, type = 'group'}
end
return chat
end
local function check_delete(arg, data)
for k, v in pairs(data.members_) do
local function clean_cb(arg, data)
if not data.first_name_ then
bot.changeChatMemberStatus(msg.chat_id_, data.id_, "Kicked")
end
end
bot.getUser(v.user_id_, clean_cb)
end
text = '✔┇تم طرد الحسابات المحذوفه'
send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
tdcli_function ({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID,offset_ = 0,limit_ = 5000}, check_delete, nil)
end
if text:match("^طرد المتروكين$") and is_creator(msg) then
local txt = {string.match(text, "^(طرد المتروكين)$")}
local function getChatId(chat_id)
local chat = {}
local chat_id = tostring(chat_id)
if chat_id:match('^-100') then
local channel_id = chat_id:gsub('-100', '')
chat = {ID = channel_id, type = 'channel'}
else
local group_id = chat_id:gsub('-', '')
chat = {ID = group_id, type = 'group'}
end
return chat
end
local function check_deactive(arg, data)
for k, v in pairs(data.members_) do
local function clean_cb(arg, data)
if data.type_.ID == "UserTypeGeneral" then
if data.status_.ID == "UserStatusEmpty" then
bot.changeChatMemberStatus(msg.chat_id_, data.id_, "Kicked")
end
end
end
bot.getUser(v.user_id_, clean_cb)
end
text = '✔┇تم طرد الحسابات المتروكة من المجموعة'
send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
tdcli_function ({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID,offset_ = 0,limit_ = 5000}, check_deactive, nil)
end
if text:match("^ادمنيه الكروب$") and is_owner(msg) then
local txt = {string.match(text, "^ادمنيه المجموعه$")}
local function cb(extra,result,success)
local list = result.members_
text = '📊┇ادمنيه الكروب\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n'
local n = 0
for k,v in pairs(list) do
n = (n + 1)
local user_info = database:hgetall('JOKER:'..bot_id..'user:'..v.user_id_)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..n.."|</b>⊰•(@"..username..")\n"
else
text = text.."<b>|"..n.."|</b>⊰•(<code>"..v.user_id_.."</code>)\n"
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
bot.channel_get_admins(msg.chat_id_,cb)
end
if text:match("^رفع الادمنيه$") and is_owner(msg) then
local txt = {string.match(text, "^رفع الادمنيه$")}
local function cb(extra,result,success)
local list = result.members_
moody = '📊┇ تم رفع ادمنيه المجموعه في البوت\n'
local n = 0
for k,v in pairs(list) do
n = (n + 1)
local hash =  'JOKER:'..bot_id..'mods:'..msg.chat_id_
database:sadd(hash, v.user_id_)
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'html')
end
bot.channel_get_admins(msg.chat_id_,cb)
end
if text:match("^الاعدادات$") and is_mod(msg) then
if database:get("lock_media:JOKER"..msg.chat_id_..bot_id) then
mute_all = '✔┇'
else
mute_all = '❌┇'
end
------------
if database:get("lock_chat:JOKER"..msg.chat_id_..bot_id) then
mute_text = '✔┇'
else
mute_text = '❌┇'
end
------------
if database:get("lock_photo:JOKER"..msg.chat_id_..bot_id) then
mute_photo = '✔┇'
else
mute_photo = '❌┇'
end
------------
if database:get("lock_video:JOKER"..msg.chat_id_..bot_id) then
mute_video = '✔┇'
else
mute_video = '❌┇'
end
if database:get("lock_note:JOKER"..msg.chat_id_..bot_id) then
mute_note = '✔┇'
else
mute_note = '❌┇'
end
------------
if database:get("lock_gif:JOKER"..msg.chat_id_..bot_id) then
mute_gifs = '✔┇'
else
mute_gifs = '❌┇'
end
------------
if not database:get('JOKER:'..bot_id..'flood:max:'..msg.chat_id_) then
flood_m = 10
else
flood_m = database:get('JOKER:'..bot_id..'flood:max:'..msg.chat_id_)
end
if not database:get( 'JOKER:'..bot_id..'flood:time:'..msg.chat_id_) then
flood_t = 10
else
flood_t = database:get( 'JOKER:'..bot_id..'flood:time:'..msg.chat_id_)
end
------------
if database:get("lock_audeo:JOKER"..msg.chat_id_..bot_id) then
mute_music = '✔┇'
else
mute_music = '❌┇'
end
------------
if database:get("lock_bot:JOKER"..msg.chat_id_..bot_id) then
mute_bots = '✔┇'
else
mute_bots = '❌┇'
end

if database:get("lock_botAndBan:JOKER"..msg.chat_id_..bot_id) then
mute_botsb = '✔┇'
else
mute_botsb = '❌┇'
end
if database:get("lock_lllll:JOKER"..msg.chat_id_..bot_id) then
mute_flood = '✔┇'
else
mute_flood = '❌┇'
end
------------
if database:get("lock_inline:JOKER"..msg.chat_id_..bot_id) then
mute_in = '✔┇'
else
mute_in = '❌┇'
end
------------
if database:get("lock_voice:JOKER"..msg.chat_id_..bot_id) then
mute_voice = '✔┇'
else
mute_voice = '❌┇'
end
------------
if database:get("lock_edit:JOKER"..msg.chat_id_..bot_id) then
mute_edit = '✔┇'
else
mute_edit = '❌┇'
end
------------
if database:get("lock_link:JOKER"..msg.chat_id_..bot_id) then
mute_links = '✔┇'
else
mute_links = '❌┇'
end
------------
if database:get("lock_pin:JOKER"..msg.chat_id_..bot_id) then
lock_pin = '✔┇'
else
lock_pin = '❌┇'
end

if database:get("lock_files:JOKER"..msg.chat_id_..bot_id) then
mute_doc = '✔┇'
else
mute_doc = '❌┇'
end

if database:get("lock_mark:JOKER"..msg.chat_id_..bot_id) then
mute_mdd = '✔┇'
else
mute_mdd = '❌┇'
end
------------
if database:get("lock_stecker:JOKER"..msg.chat_id_..bot_id) then
lock_sticker = '✔┇'
else
lock_sticker = '❌┇'
end
------------
if database:get("lock_new:JOKER"..msg.chat_id_..bot_id) then
lock_tgservice = '✔┇'
else
lock_tgservice = '❌┇'
end
------------
if database:get("lock_tag:JOKER"..msg.chat_id_..bot_id) then
lock_htag = '✔┇'
else
lock_htag = '❌┇'
end

if database:get("lock_sarha:JOKER"..msg.chat_id_..bot_id) then
lock_cmd = '✔┇'
else
lock_cmd = '❌┇'
end
------------
if database:get("lock_username:JOKER"..msg.chat_id_..bot_id) then
lock_tag = '✔┇'
else
lock_tag = '❌┇'
end
------------
if database:get("lock_contact:JOKER"..msg.chat_id_..bot_id) then
lock_contact = '✔┇'
else
lock_contact = '❌┇'
end
------------
if database:get("lock_en:JOKER"..msg.chat_id_..bot_id) then
lock_english = '✔┇'
else
lock_english = '❌┇'
end
------------
if database:get("lock_ar:JOKER"..msg.chat_id_..bot_id) then
lock_arabic = '✔┇'
else
lock_arabic = '❌┇'
end
------------
if database:get("lock_fwd:JOKER"..msg.chat_id_..bot_id) then
lock_forward = '✔┇'
else
lock_forward = '❌┇'
end

if database:get('JOKER:'..bot_id..'rep:mute'..msg.chat_id_) then
lock_rep = '✔┇'
else
lock_rep = '❌┇'
end
------------
if database:get('JOKER:'..bot_id..'repsudo:mute'..msg.chat_id_) then
lock_repsudo = '✔┇'
else
lock_repsudo = '❌┇'
end
------------
if database:get('JOKER:'..bot_id..'repowner:mute'..msg.chat_id_) then
lock_repowner = '✔┇'
else
lock_repowner = '❌┇'
end
------------
if database:get('JOKER:'..bot_id..'id:mute'..msg.chat_id_) then
lock_id = '✔┇'
else
lock_id = '❌┇'
end
------------
if database:get('JOKER:'..bot_id..'pin:mute'..msg.chat_id_) then
lock_pind = '✔┇'
else
lock_pind = '❌┇'
end
------------
if database:get('JOKER:'..bot_id..'id:mute'..msg.chat_id_) then
lock_id_photo = '✔┇'
else
lock_id_photo = '❌┇'
end
------------
if database:get( 'JOKER:'..bot_id.."welcome"..msg.chat_id_) then
send_welcome = '✔┇'
else
send_welcome = '❌┇'
end
------------
local ex = database:ttl( 'JOKER:'..bot_id.."charge:"..msg.chat_id_)
if ex == -1 then
exp_dat = 'لا نهائي'
else
exp_dat = math.floor(ex / 86400) + 1
end
------------
local TXT = "🗑┇اعدادات المجموعه بالمسح\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n✔┇⊰• مفعل\n❌┇⊰• معطل\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
..mute_all.."الميديا".."\n"
..mute_links.." الروابط".."\n"
..mute_edit .." التعديل".."\n"
..mute_bots .." البوتات".."\n"
..mute_botsb.." البوتات بالطرد".."\n"
..lock_english.." اللغه الانكليزيه".."\n"
..lock_forward.." اعاده التوجيه".."\n"
..lock_pin.." التثبيت".."\n"
..lock_arabic.." اللغه الفارسيه".."\n"
..lock_htag.." التاكات".."\n"
..lock_tag.." المعرفات".."\n"
..lock_tgservice.." الاشعارات".."\n"
..mute_flood.." التكرار".."\n\n"
..mute_text.." الدردشه".."\n"
..mute_gifs.." الصور المتحركه".."\n"
..mute_voice.." الصوتيات".."\n"
..mute_music.." الاغاني".."\n"
..mute_in.." الانلاين".."\n"
..lock_sticker.." الملصقات".."\n\n"
..lock_contact.." جهات الاتصال".."\n"
..mute_video.." الفيديوهات".."\n"
..lock_cmd.." الشارحه".."\n"
..mute_mdd.." الماركدون".."\n"
..mute_doc.." الملفات".."\n"
..mute_photo.." الصور".."\n"
..mute_note.." بصمه الفيديو".."\n"
..lock_repsudo.." ردود المطور".."\n\n"
..lock_repowner.." ردود المدير".."\n"
..lock_id.."الايدي".."\n"
..lock_pind.."خاصية التثبيت".."\n"
..lock_id_photo.."الايدي بالصوره".."\n"
..send_welcome.." الترحيب".."\n"
.."┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉  \n"
..'🔗┇عدد التكرار : '..flood_m..'\n'
..'🔗┇زمن التكرار : '..flood_m..'\n'
..'🔗┇انقضاء البوت: '..exp_dat..' يوم \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉'
send(msg.chat_id_, msg.id_, 1, TXT, 1, 'md')
end

if (text and text == 'تفعيل اطردني') and is_owner(msg) then
if not database:get('JOKER:'..bot_id..'kickme:mute'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✔┇امر اطردني معطل❗', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✔┇تم تفعيل امر اطردني', 1, 'md')
database:del('JOKER:'..bot_id..'kickme:mute'..msg.chat_id_)
end
end
if (text and text == 'تعطيل اطردني') and is_owner(msg) then
if database:get('JOKER:'..bot_id..'kickme:mute'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✔┇امر اطردني بالفعل معطل❗', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✔┇تم تعطيل امر اطردني', 1, 'md')
database:set('JOKER:'..bot_id..'kickme:mute'..msg.chat_id_,true)
end
end

if text:match("^اطردني$") then
if not database:get('JOKER:'..bot_id..'kickme:mute'..msg.chat_id_) then
redis:set('JOKER:'..bot_id..'kickyess'..msg.sender_user_id_..'', 'kickyes')
redis:set('JOKER:'..bot_id..'kicknoo'..msg.sender_user_id_..'', 'kickno')
send(msg.chat_id_, msg.id_, 1, '🚷┇ ارسل ؛ نعم ، ليتم دفرك\n🔘┇ارسل ؛ لا ، لالغاء الامر', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '⚠┇تم تعطيل امر اطردني', 1, 'md')
end
end
local yess = redis:get('JOKER:'..bot_id..'kickyess'..msg.sender_user_id_..'')
if yess == 'kickyes' then
if text:match("^نعم$") then
if is_vip(msg) then
send(msg.chat_id_, msg.id_, 1, '⚠️┇لا استطيع دفرك \n🔘┇(مدراء،ادمنيه،مميزين)البوت', 1, 'md')
else
local yess = redis:get('JOKER:'..bot_id..'kickyess'..msg.sender_user_id_..'')
if yess == 'kickyes' then
chat_kick(msg.chat_id_, msg.sender_user_id_)
redis:del('JOKER:'..bot_id..'kickyess'..msg.sender_user_id_..'', 'kickyes')
redis:del('JOKER:'..bot_id..'kicknoo'..msg.sender_user_id_..'', 'kickno')
send(msg.chat_id_, msg.id_, 1, '✅┇تم دفرك من المجموعه', 1, 'md')
end
end
end
if text:match("^لا$") then
local noo = redis:get('JOKER:'..bot_id..'kicknoo'..msg.sender_user_id_..'')
if noo == 'kickno' then
redis:del('JOKER:'..bot_id..'kickyess'..msg.sender_user_id_..'', 'kickyes')
redis:del('JOKER:'..bot_id..'kicknoo'..msg.sender_user_id_..'', 'kickno')
send(msg.chat_id_, msg.id_, 1, '🔘┇تم الغاء الامر', 1, 'md')
end
end
end

if (text and text == 'تغير امر المطور بالكليشه') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
send(msg.chat_id_, msg.id_, 1, '📥┇الان يمكنك ارسال الكليشه  ليتم حفظها', 1, 'html')
redis:set('JOKER:'..bot_id..'texts'..msg.sender_user_id_..'', 'msg')
return false end
if text:match("^(.*)$") then
local zain2 = redis:get('JOKER:'..bot_id..'texts'..msg.sender_user_id_..'')
if zain2 == 'msg' then
send(msg.chat_id_, msg.id_, 1, '✔┇تم حفظ الكليشه يمكنك اظهارها بارسال الامر', 1, 'html')
redis:set('JOKER:'..bot_id..'texts'..msg.sender_user_id_..'', 'no')
redis:set('JOKER:'..bot_id..'text_sudo', text)
send(msg.chat_id_, msg.id_, 1, text , 1, 'html')
return false end
end
if text:match("^[Dd][Ee][Vv]$")or text:match("^مطور بوت$") or text:match("^مطورين$") or text:match("^مطور البوت$") or text:match("^مطور$") or text:match("^المطور$") and msg.reply_to_message_id_ == 0 then
local text_sudo = redis:get('JOKER:'..bot_id..'text_sudo')
local nzain = redis:get('JOKER:'..bot_id..'nmzain')
local nazain = redis:get('JOKER:'..bot_id..'nazain')
if text_sudo then
send(msg.chat_id_, msg.id_, 1, text_sudo, 1, 'md')
else
sendContact(msg.chat_id_, msg.id_, 0, 1, nil, (nzain or 9647807463210), (nazain or "JOKER TEAM"), "", bot_id)
end
end
for k,v in pairs(sudo_users) do
if text:match("^تغير امر المطور$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
send(msg.chat_id_, msg.id_, 1, '• `الان يمكنك ارسال رقم المطور` 🗳', 1, 'md')
redis:set('JOKER:'..bot_id..'nzain'..msg.sender_user_id_..'', 'msg')
return false end
end
if text:match("^+(.*)$") then
local zaino = redis:get('JOKER:'..bot_id..'sudoo'..text..'')
local zain2 = redis:get('JOKER:'..bot_id..'nzain'..msg.sender_user_id_..'')
if zain2 == 'msg' then
send(msg.chat_id_, msg.id_, 1, '• `الان يمكنك ارسال الاسم الذي تريده` 📝', 1, 'md')
redis:set('JOKER:'..bot_id..'nmzain', text)
redis:set('JOKER:'..bot_id..'nzain'..msg.sender_user_id_..'', 'mmsg')
return false end
end
if text:match("^(.*)$") then
local zain2 = redis:get('JOKER:'..bot_id..'nzain'..msg.sender_user_id_..'')
if zain2 == 'mmsg' then
send(msg.chat_id_, msg.id_, 1, '• `تم حفظ الاسم يمكنك اظهار الجه بـ ارسال امر المطور` ✔', 1, 'md')
redis:set('JOKER:'..bot_id..'nzain'..msg.sender_user_id_..'', 'no')
redis:set('JOKER:'..bot_id..'nazain', text)
local nmzain = redis:get('JOKER:'..bot_id..'nmzain')
sendContact(msg.chat_id_, msg.id_, 0, 1, nil, nmzain, text , "", bot_id)
return false end
end

if text:match("^رفع مطور$")  and tonumber(msg.sender_user_id_) == tonumber(sudo_add) and msg.reply_to_message_id_ then
function promote_by_reply(extra, result, success)
if redis:sismember('JOKER:'..bot_id..'dev', result.sender_user_id_) then
tsX000("prore",msg,'✔┇بالفعل تم رفعه مطور')
else
redis:set('JOKER:'..bot_id..'sudoo'..result.sender_user_id_..'', 'yes')
redis:sadd('JOKER:'..bot_id..'dev', result.sender_user_id_)
tsX000("prore",msg,'✔┇تم رفعه مطور')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end

if text:match("^رفع مطور @(.*)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local apmd = {string.match(text, "^(رفع مطور) @(.*)$")}
function promote_by_username(extra, result, success)
if result.id_ then
redis:set('JOKER:'..bot_id..'sudoo'..result.id_..'', 'yes')
redis:sadd('JOKER:'..bot_id..'dev', result.id_)
texts = '👨┇العضو ⊰• ['..result.title_..'](t.me/'..(apmd[2] or 'JOKERteam')..')\n\n✔┇تم رفعه مطور'
else
texts = '❌┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],promote_by_username)
end

if text:match("^رفع مطور (%d+)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local apmd = {string.match(text, "^(رفع مطور) (%d+)$")}
redis:set('JOKER:'..bot_id..'sudoo'..apmd[2]..'', 'yes')
redis:sadd('JOKER:'..bot_id..'dev', apmd[2])
tsX000(apmd[2],msg,'✔┇تم رفعه مطور')
end

if text:match("^تنزيل مطور$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) and msg.reply_to_message_id_ then
function demote_by_reply(extra, result, success)
if not redis:sismember('JOKER:'..bot_id..'dev', result.sender_user_id_) then
tsX000("prore",msg,'✔┇ بالفعل تم تنزيله من المطورين')
else
redis:del('JOKER:'..bot_id..'sudoo'..result.sender_user_id_..'', 'no')
redis:srem('JOKER:'..bot_id..'dev', result.sender_user_id_)
tsX000("prore",msg,'✔┇ تم تنزيله من مطورين البوت')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,demote_by_reply)
end

if text:match("^تنزيل مطور @(.*)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local apmd = {string.match(text, "^(تنزيل مطور) @(.*)$")}
function demote_by_username(extra, result, success)
if result.id_ then
redis:del('JOKER:'..bot_id..'sudoo'..result.id_..'', 'no')
redis:srem('JOKER:'..bot_id..'dev', result.id_)
texts = '👨┇العضو ⊰• ['..result.title_..'](t.me/'..(apmd[2] or 'JOKERteam')..')\n✔┇ تم تنزيله من مطورين البوت'
else
texts = '❌┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],demote_by_username)
end  
if text:match("^تنزيل مطور (%d+)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local apmd = {string.match(text, "^(تنزيل مطور) (%d+)$")}
redis:del('JOKER:'..bot_id..'sudoo'..apmd[2]..'', 'no')
redis:srem('JOKER:'..bot_id..'dev', apmd[2])
tsX000(apmd[2],msg,'✔┇ تم تنزيله من مطورين البوت')
end
if not database:get('JOKER:'..bot_id..'repowner:mute'..msg.chat_id_) then
local zain = redis:get('JOKER:'..bot_id..'zain'..text..''..msg.chat_id_..'')
if zain then 
function zain_JOKER_re(t1,t2)
local user_msgs = database:get('JOKER:'..bot_id..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local edit = database:get('JOKER:'..bot_id..'user:editmsg'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local t = ""
if is_sudo(msg) then
t = 'مطور البوت'
elseif is_creator(msg) then
t = 'منشئ الكروب'
elseif (database:get("JOKER:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) and database:get("JOKER:all_if:"..database:get("JOKER:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) ..bot_id..msg.chat_id_)) then 
t = database:get("JOKER:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_)
elseif is_owner(msg) then
t = 'مدير الكروب'
elseif is_mod(msg) then
t = 'ادمن للكروب'
elseif is_vip(msg) then
t = 'مميز للكروب'
else
t = 'عضو تافه😹 فقط'
end
local zain = zain:gsub('#username',(t2.username_ or 'لا يوجد')) 
local zain = zain:gsub('#name',(t2.first_name_ or 'لا يوجد'))
local zain = zain:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
local zain = zain:gsub('#edit',(edit or 'لا يوجد'))
local zain = zain:gsub('#msgs',(user_msgs or 'لا يوجد'))
local zain = zain:gsub('#stast',(t or 'لا يوجد'))
send(msg.chat_id_, msg.id_, 1, zain, 1, 'md')
end
getUser(msg.sender_user_id_, zain_JOKER_re)
elseif (redis:get('JOKER:'..bot_id..':sticker:'..text..''..msg.chat_id_..'')) then 
tdcli.sendSticker(chat_id, msg.id_, 0, 1, nil, redis:get('JOKER:'..bot_id..':sticker:'..text..''..msg.chat_id_..''))
elseif (redis:get('JOKER:'..bot_id..':voice:'..text..''..msg.chat_id_..'')) then 
tdcli.sendVoice(chat_id, msg.id_, 0, 1, nil, redis:get('JOKER:'..bot_id..':voice:'..text..''..msg.chat_id_..''))
elseif (redis:get('JOKER:'..bot_id..':video:'..text..''..msg.chat_id_..'')) then 
tdcli.sendVideo(chat_id, msg.id_, 0, 1, nil, redis:get('JOKER:'..bot_id..':video:'..text..''..msg.chat_id_..''))
elseif (redis:get('JOKER:'..bot_id..':gif:'..text..''..msg.chat_id_..'')) then 
tdcli.sendDocument(chat_id, msg.id_, 0, 1, nil, redis:get('JOKER:'..bot_id..':gif:'..text..''..msg.chat_id_..''))
elseif (redis:get('JOKER:'..bot_id..':file:'..text..''..msg.chat_id_..'')) then
tdcli.sendDocument(chat_id, msg.id_, 0, 1, nil, redis:get('JOKER:'..bot_id..':file:'..text..''..msg.chat_id_..''))
end
end
if not database:get('JOKER:'..bot_id..'repsudo:mute'..msg.chat_id_) then
local zain = redis:get('JOKER:'..bot_id..'zain'..text..'')
if zain then 
function zain_JOKER_re(t1,t2)
local user_msgs = database:get('JOKER:'..bot_id..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local edit = database:get('JOKER:'..bot_id..'user:editmsg'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local t = ""
if is_sudo(msg) then
t = 'مطور البوت'
elseif is_creator(msg) then
t = 'منشئ الكروب'
elseif (database:get("JOKER:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) and database:get("JOKER:all_if:"..database:get("JOKER:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) ..bot_id..msg.chat_id_)) then 
t = database:get("JOKER:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_)
elseif is_owner(msg) then
t = 'مدير الكروب'
elseif is_mod(msg) then
t = 'ادمن الكروب'
elseif is_vip(msg) then
t = 'مميز الكروب'
else
t = 'عضو تافه😹 فقط'
end
zain = zain:gsub('#username',(t2.username_ or 'لا يوجد'))
zain = zain:gsub('#name',(t2.first_name_ or 'لا يوجد'))
zain = zain:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
zain = zain:gsub('#edit',(edit or 'لا يوجد'))
zain = zain:gsub('#msgs',(user_msgs or 'لا يوجد'))
zain = zain:gsub('#stast',(t or 'لا يوجد'))
send(msg.chat_id_, msg.id_, 1, zain, 1, 'html')
end
getUser(msg.sender_user_id_, zain_JOKER_re)
elseif (redis:get('JOKER:'..bot_id..':sticker:'..text)) then 
tdcli.sendSticker(chat_id, msg.id_, 0, 1, nil, redis:get('JOKER:'..bot_id..':sticker:'..text))
elseif (redis:get('JOKER:'..bot_id..':voice:'..text)) then 
tdcli.sendVoice(chat_id, msg.id_, 0, 1, nil, redis:get('JOKER:'..bot_id..':voice:'..text))
elseif (redis:get('JOKER:'..bot_id..':video:'..text)) then 
tdcli.sendVideo(chat_id, msg.id_, 0, 1, nil, redis:get('JOKER:'..bot_id..':video:'..text))
elseif (redis:get('JOKER:'..bot_id..':gif:'..text)) then 
tdcli.sendDocument(chat_id, msg.id_, 0, 1, nil, redis:get('JOKER:'..bot_id..':gif:'..text))
elseif (redis:get('JOKER:'..bot_id..':file:'..text)) then
tdcli.sendDocument(chat_id, msg.id_, 0, 1, nil, redis:get('JOKER:'..bot_id..':file:'..text))
end  
end

if text:match("^اضف رد$") and is_owner(msg) then
send(msg.chat_id_, msg.id_, 1, '📥┇ارسل الكلمه التي تريد اضافتها', 1, 'md')
redis:set('JOKER:'..bot_id..'zain1'..msg.sender_user_id_..''..msg.chat_id_..'', 'msg')
return false end
if text:match("^(.*)$") then
local zain1 = redis:get('JOKER:'..bot_id..'zain1'..msg.sender_user_id_..''..msg.chat_id_..'')
if zain1 == 'msg' then
send(msg.chat_id_, msg.id_, 1, '📥┇الان ارسل الرد الذي تريد اضافته \n📥┇ قد يكون (ملف - فديو - نص - ملصق - بصمه - متحركه ) ', 1, 'md')
send(msg.chat_id_, msg.id_, 1,  '✔┇ يمكنك اضافه الى النص :\n- `#username` > اسم المستخدم\n- `#msgs` > عدد رسائل المستخدم\n- `#name` > اسم المستخدم\n- `#id` > ايدي المستخدم\n- `#stast` > موقع المستخدم \n- `#edit` > عدد التعديلات', 1, 'md')
redis:set('JOKER:'..bot_id..'zain1'..msg.sender_user_id_..''..msg.chat_id_..'', 're')
redis:set('JOKER:'..bot_id..'msg'..msg.sender_user_id_..''..msg.chat_id_..'', text)
redis:sadd('JOKER:'..bot_id..'repowner'..msg.sender_user_id_..''..msg.chat_id_..'', text)
return false end
end

if text:match("^حذف رد$") and is_owner(msg) then
send(msg.chat_id_, msg.id_, 1, '📥┇ارسل الكلمه التي تريد حذفها', 1, 'md')
redis:set('JOKER:'..bot_id..'zain1'..msg.sender_user_id_..''..msg.chat_id_..'', 'nomsg')
return false end
if text:match("^(.*)$") then
local zain1 = redis:get('JOKER:'..bot_id..'zain1'..msg.sender_user_id_..''..msg.chat_id_..'')
if zain1 == 'nomsg' then
send(msg.chat_id_, msg.id_, 1, '✔┇تم حذف الرد', 1, 'md')
redis:set('JOKER:'..bot_id..'zain1'..msg.sender_user_id_..''..msg.chat_id_..'', 'no')
redis:del('JOKER:'..bot_id..'zain'..text..''..msg.chat_id_..'')
redis:del('JOKER:'..bot_id..':sticker:'..text..''..msg.chat_id_..'')
redis:del('JOKER:'..bot_id..':voice:'..text..''..msg.chat_id_..'')
redis:del('JOKER:'..bot_id..':video:'..text..''..msg.chat_id_..'')
redis:del('JOKER:'..bot_id..':gif:'..text..''..msg.chat_id_..'')
redis:del('JOKER:'..bot_id..':file:'..text..''..msg.chat_id_..'')
redis:srem('JOKER:'..bot_id..'zainre'..msg.chat_id_..'', text)
end
end

if text:match("^اضف رد للكل$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add)  then
send(msg.chat_id_, msg.id_, 1, '📥┇ارسل الكلمه التي تريد اضافته', 1, 'md')
redis:set('JOKER:'..bot_id..'zain1'..msg.sender_user_id_..'', 'msg')
return false end
local zain1 = redis:get('JOKER:'..bot_id..'zain1'..msg.sender_user_id_..'')
if zain1 == 'msg' and text then
send(msg.chat_id_, msg.id_, 1, '📥┇الان ارسل الرد الذي تريد اضافته \n📥┇ قد يكون (ملف - فديو - نص - ملصق - بصمه - متحركه ) ', 1, 'md')
redis:set('JOKER:'..bot_id..'zain1'..msg.sender_user_id_..'', 're')
redis:set('JOKER:'..bot_id..'msg'..msg.sender_user_id_..'', text)
return false end

if text:match("^حذف رد للكل$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add)  then
send(msg.chat_id_, msg.id_, 1, '📥┇ارسل الكلمه التي تريد حذفها' , 1, 'md')
redis:set('JOKER:'..bot_id..'zain1'..msg.sender_user_id_..'', 'nomsg')
return false end
if text:match("^(.*)$") then
local zain1 = redis:get('JOKER:'..bot_id..'zain1'..msg.sender_user_id_..'')
if zain1 == 'nomsg' then
send(msg.chat_id_, msg.id_, 1, '✔┇تم حذف الرد', 1, 'md')
redis:set('JOKER:'..bot_id..'zain1'..msg.sender_user_id_..'', 'no')
redis:del('JOKER:'..bot_id..':sticker:'..text)
redis:del('JOKER:'..bot_id..':voice:'..text)
redis:del('JOKER:'..bot_id..':video:'..text)
redis:del('JOKER:'..bot_id..':gif:'..text)
redis:del('JOKER:'..bot_id..':file:'..text)
redis:del('JOKER:'..bot_id..'zain'..text)
redis:srem('JOKER:'..bot_id..'zainresudo', text)
end
end
if text:match("^مسح المطورين$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local list = redis:smembers('JOKER:'..bot_id..'dev')
for k,v in pairs(list) do
redis:del('JOKER:'..bot_id..'dev')
redis:del('JOKER:'..bot_id..'sudoo'..v)
end
send(msg.chat_id_, msg.id_, 1, "✔┇تم مسح مطورين البوت", 1, 'md')
end
if text:match("^مسح ردود المدير$") and is_owner(msg) then
local list = redis:smembers('JOKER:'..bot_id..'zainre'..msg.chat_id_..'')
for k,v in pairs(list) do
redis:del('JOKER:'..bot_id..'zainre'..msg.chat_id_..'', text)
redis:del('JOKER:'..bot_id..'zain'..v..''..msg.chat_id_)
redis:del('JOKER:'..bot_id..':sticker:'..v..msg.chat_id_)
redis:del('JOKER:'..bot_id..':voice:'..v..msg.chat_id_)
redis:del('JOKER:'..bot_id..':video:'..v..msg.chat_id_)
redis:del('JOKER:'..bot_id..':gif:'..v..msg.chat_id_)
redis:del('JOKER:'..bot_id..':file:'..v..msg.chat_id_)
redis:del('JOKER:'..bot_id..'zain'..v..msg.chat_id_)
end
send(msg.chat_id_, msg.id_, 1, "• `تم مسح ردود المدير` 🗑", 1, 'md')
end
if text:match("^مسح ردود المطور$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add)  then
local list = redis:smembers('JOKER:'..bot_id..'zainresudo')
for k,v in pairs(list) do
redis:del('JOKER:'..bot_id..'zainresudo', text)
redis:del('JOKER:'..bot_id..'zain'..v..'')
redis:del('JOKER:'..bot_id..':sticker:'..v)
redis:del('JOKER:'..bot_id..':voice:'..v)
redis:del('JOKER:'..bot_id..':video:'..v)
redis:del('JOKER:'..bot_id..':gif:'..v)
redis:del('JOKER:'..bot_id..':file:'..v)
redis:del('JOKER:'..bot_id..'zain'..v)
end
send(msg.chat_id_, msg.id_, 1, "✔┇تم مسح ردود المطور", 1, 'md')
end

if text:match("^المطورين$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local list = redis:smembers('JOKER:'..bot_id..'dev')
text = "⛔┇قائمه المطورين  ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local user_info = database:hgetall('JOKER:'..bot_id..'user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..k.."|</b>⊰•(@"..username..")\n"
else
text = text.."<b>|"..k.."|</b>⊰•(<code>"..v.."</code>)\n"
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "❌┇لايوجد مطورين"
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
------------------------------------
if text:match("^ردود المطور$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add)  then
local list = redis:smembers('JOKER:'..bot_id..'zainresudo')
text = "📑┇قائمه ردود المطور\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
text = text.."<b>|"..k.."|</b>⊰•("..v..")\n"
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "⚠️┇لا يوجد ردود للمطور"
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
if text:match("^ردود المدير$") and is_owner(msg) then
local list = redis:smembers('JOKER:'..bot_id..'zainre'..msg.chat_id_..'')
text = "📑┇قائمه ردود المدير\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
text = text.."<b>|"..k.."|</b>⊰•("..v..")\n"
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "⚠️┇لا يوجد ردود للمدير"
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end

if text:match("^كرر (.*)$") and is_mod(msg) then
local txt = {string.match(text, "^(كرر) (.*)$")}
send(msg.chat_id_, msg.id_, 1, txt[2], 1, 'html')
end  
if text:match("^[Rr][Uu][Ll][Ee][Ss]$")or text:match("^القوانين$") then
	local rules = database:get('bot:rules'..msg.chat_id_)
	if rules then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '*Group Rules :*\n'..rules, 1, 'md')
 else
   send(msg.chat_id_, msg.id_, 1, '⚜┇قوانين المجموعه هي\n'..rules, 1, 'md')
end
else
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '*rules msg not saved!*', 1, 'md')
 else
   send(msg.chat_id_, msg.id_, 1, '⚜┇لم يتم حفظ قوانين للمجموعه', 1, 'md')
end
	end
	end
local text = msg.content_.text_:gsub('وضع اسم','setname')
		if text:match("^[Ss][Ee][Tt][Nn][Aa][Mm][Ee] (.*)$") and is_mod(msg.sender_user_id_, msg.chat_id_)  then
	local txt = {string.match(text, "^([Ss][Ee][Tt][Nn][Aa][Mm][Ee]) (.*)$")}
	changetitle(msg.chat_id_, txt[2])
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_Group name updated!_\n'..txt[2], 1, 'md')
 else
   send(msg.chat_id_, msg.id_, 1, '✔┇تم تحديث اسم المجموعه الى \n'..txt[2], 1, 'md')
   end
end
if text:match("^وضع صوره") and is_mod(msg) then
database:set('JOKER:'..bot_id..'setphoto'..msg.chat_id_..':'..msg.sender_user_id_,true)
send(msg.chat_id_, msg.id_, 1, '📥┇قم بارسال صوره الان', 1, 'md')
end
if text:match("^مسح الصوره") and is_mod(msg) then
https.request('https://api.telegram.org/bot'..token..'/deleteChatPhoto?chat_id='..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '🗑┇تم مسح الصوره', 1, 'md')
end
local text = msg.content_.text_:gsub('وضع وصف','setabout')
       if text:match("^[Ss][Ee][Tt][Aa][Bb][Oo][Uu][Tt] (.*)$") and is_mod(msg.sender_user_id_, msg.chat_id_) then
       local text = {string.match(text, "^([Ss][Ee][Tt][Aa][Bb][Oo][Uu][Tt]) (.*)$")}
             bot.changeChannelAbout(msg.chat_id_,text[2])
       if database:get('bot:lang:'..msg.chat_id_) then
                  send(msg.chat_id_, msg.id_, 1, "*> Group About Upadted..._", 1, 'md')
                  else
                  send(msg.chat_id_, msg.id_, 1, "✔️┇تم وضع وصف للمجموعه", 1, 'md')
               end
   end
if text:match("^الوقت$") and is_mod(msg) then
local ex = database:ttl( 'JOKER:'..bot_id.."charge:"..msg.chat_id_)
if ex == -1 then
send(msg.chat_id_, msg.id_, 1, '🔘┇وقت المجموعه لا نهائي` ✔', 1, 'md')
else
local d = math.floor(ex / day ) + 1
send(msg.chat_id_, msg.id_, 1, "⚠️┇عدد ايام وقت المجموعه {"..d.."} يوم", 1, 'md')
end
end  
if text:match("^مسح$") and msg.reply_to_message_id_ ~= 0 and is_mod(msg) then
delete_msg(msg.chat_id_, {[0] = msg.reply_to_message_id_})
delete_msg(msg.chat_id_, {[0] = msg.id_})
end
----------------------------------------------------------------------------------------------
if text:match('^مسح (%d+)$') and is_owner(msg) then
local matches = {string.match(text, "^(مسح) (%d+)$")}
if msg.chat_id_:match("^-100") then
if tonumber(matches[2]) > 100 or tonumber(matches[2]) < 1 then
pm = '⚠️┇لا تستطيع مسح اكثر من 100 رساله'
send(msg.chat_id_, msg.id_, 1, pm, 1, 'html')
else
tdcli_function ({
ID = "GetChatHistory",
chat_id_ = msg.chat_id_,
from_message_id_ = 0,
offset_ = 0,
limit_ = tonumber(matches[2])}, delmsg, nil)
pm ='✔┇تم <b>{'..matches[2]..'}</b> من الرسائل\n🗑┇مسحها'
send(msg.chat_id_, msg.id_, 1, pm, 1, 'html')
end
else pm ='⚠️┇هناك خطاء'
send(msg.chat_id_, msg.id_, 1, pm, 1, 'html')
end
end
----------------------------------------------------------------------------------------------
if (text and text == 'تفعيل الايدي بالصوره') and is_owner(msg) then
if not database:get('JOKER:'..bot_id..'id:photo'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✔┇الايدي بالصوره معطل❗', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✔┇تم تفعيل الايدي بالصوره', 1, 'md')
database:del('JOKER:'..bot_id..'id:photo'..msg.chat_id_)
end
end
if (text and text == 'تعطيل الايدي بالصوره') and is_owner(msg) then
if database:get('JOKER:'..bot_id..'id:photo'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✔┇الايدي بالصوره بالفعل معطل❗', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✔┇تم تعطيل الايدي بالصوره', 1, 'md')
database:set('JOKER:'..bot_id..'id:photo'..msg.chat_id_,true)
end
end
if (text and text == 'تفعيل جلب صوره') and is_owner(msg) then
if not database:get('JOKER:'..bot_id..'get:photo'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✔┇جلب صوره مفعل❗', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✔┇تم تفعيل جلب صوره', 1, 'md')
database:del('JOKER:'..bot_id..'get:photo'..msg.chat_id_)
end
end
if (text and text == 'تعطيل جلب صوره') and is_owner(msg) then
if database:get('JOKER:'..bot_id..'get:photo'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✔┇بالفعل تم اضافه المجموعه الى الوضع المدفوع', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✔┇تم تعطيل جلب صوره', 1, 'md')
database:set('JOKER:'..bot_id..'get:photo'..msg.chat_id_,true)
end
end
if  (text and text == 'تفعيل وضع المدفوع') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
if database:sismember('JOKER:'..bot_id..'pro:groups',msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✔┇بالفعل تم اضافه المجموعه الى الوضع المدفوع', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✔┇تم اضافه المجموعه الى الوضع المدفوع', 1, 'md')
database:sadd('JOKER:'..bot_id..'pro:groups',msg.chat_id_)
end
end
if (text and text == 'تعطيل وضع المدفوع') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
if not database:sismember('JOKER:'..bot_id..'pro:groups',msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✔┇بالفعل تم حذف المجموعه من الوضع المدفوع', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✔┇تم حذف المجموعه من الوضع المدفوع', 1, 'md')
database:srem('JOKER:'..bot_id..'pro:groups',msg.chat_id_)
end
end
if (text and text == 'تفعيل الاذاعه') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
if not database:get('JOKER:'..bot_id..'bc:groups') then
send(msg.chat_id_, msg.id_, 1, '✔┇ الاذاعه بل فعل معطله', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✔┇تم تفعيل اذاعه البوت', 1, 'md')
database:del('JOKER:'..bot_id..'bc:groups')
end
end
if (text and text == 'تعطيل الاذاعه') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
if database:get('JOKER:'..bot_id..'bc:groups') then
send(msg.chat_id_, msg.id_, 1, '✔┇ الاذاعه معطله', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✔┇تم تعطيل الاذاعه ', 1, 'md')
database:set('JOKER:'..bot_id..'bc:groups',true)
end
end
if (text and text == 'تفعيل المغادره') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
if not database:get('JOKER:'..bot_id..'leave:groups') then
send(msg.chat_id_, msg.id_, 1, '✔┇مغادره مفعله❗', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✔┇تم تفعيل مغادره البوت', 1, 'md')
database:del('JOKER:'..bot_id..'leave:groups'..msg.chat_id_)
end
end
if (text and text == 'تعطيل المغادره') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
if database:get('JOKER:'..bot_id..'leave:groups') then
send(msg.chat_id_, msg.id_, 1, '✔┇مغادره معطله❗', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✔┇تم تعطيل مغادره البوت', 1, 'md')
database:set('JOKER:'..bot_id..'leave:groups'..msg.chat_id_,true)
end
end
if (text and text == "مسح صلاحيه" and is_creator(msg)) then
send(msg.chat_id_, msg.id_, 1, '✔┇ارسال الان اسم الصلاحيه', 1, 'md')
database:set("tsahke:is_del_if:"..bot_id..msg.chat_id_..msg.sender_user_id_,"ok")
return "JOKER"
end  
if (text and database:get("tsahke:is_del_if:"..bot_id..msg.chat_id_..msg.sender_user_id_)) then 
send(msg.chat_id_, msg.id_, 1, '✔┇تم حذف صلاحيه بنجاح', 1, 'md')
database:del("JOKER:all_if:"..text..bot_id..msg.chat_id_)
database:del("tsahke:is_del_if:"..bot_id..msg.chat_id_..msg.sender_user_id_)
end
if (text and text == "اضف صلاحيه" and is_creator(msg)) then 
send(msg.chat_id_, msg.id_, 1, '✔┇ارسال الان اسم الصلاحيه', 1, 'md')
database:set("JOKER:new:if:"..bot_id..msg.chat_id_..msg.sender_user_id_,"ok1")
return "JOKER"
end
if text and database:get("JOKER:new:if:"..bot_id..msg.chat_id_..msg.sender_user_id_) then 
database:del("JOKER:new:if:"..bot_id..msg.chat_id_..msg.sender_user_id_)
send(msg.chat_id_, msg.id_, 1, '📥┇الان ارسل نوع الصلاحيه المطلوبه \n🔰┇{ `مدير` ،`ادمن` ،`عضو تافه😹 مميز` ,`لا شيئ `}', 1, 'md')
database:set("JOKER:new:if:text:"..bot_id..msg.chat_id_..msg.sender_user_id_,text)
database:set("JOKER:new:if2:"..bot_id..msg.chat_id_..msg.sender_user_id_,"ok1")
return "JOKER"
end
if (text and database:get("JOKER:new:if2:"..bot_id..msg.chat_id_..msg.sender_user_id_)) then 
if (text == "ادمن" or text == "مدير" or text == "عضو تافه😹 مميز" or text == "لا شيئ") then 
database:del("JOKER:new:if2:"..bot_id..msg.chat_id_..msg.sender_user_id_)
tsha_text = database:get("JOKER:new:if:text:"..bot_id..msg.chat_id_..msg.sender_user_id_)
send(msg.chat_id_, msg.id_, 1, '✔┇تم حفض الصلاحيه بنجاح \n⚠️┇الاوامر { رفع/تنزيل '..tsha_text..' }', 1, 'md')
database:set("JOKER:all_if:"..tsha_text..bot_id..msg.chat_id_,text)
database:del("JOKER:new:if:text:"..bot_id..msg.chat_id_..msg.sender_user_id_)
else 
send(msg.chat_id_, msg.id_, 1, '📥┇الان ارسل نوع الصلاحيه المطلوبه \n🔰┇{ `مدير` ،`ادمن` ،`عضو تافه😹 مميز` ,`لا شيئ `}', 1, 'md')
end
end
if text then 
if text:match("^رفع (.*)$")  and is_owner(msg) and msg.reply_to_message_id_ then
a = {string.match(text, "^رفع (.*)$")}
ts_text = database:get("JOKER:all_if:"..a[1]..bot_id..msg.chat_id_)
if ts_text then 
function promote_by_reply(extra, result, success)
if ts_text == "ادمن" then 
database:sadd('JOKER:'..bot_id..'mods:'..msg.chat_id_, result.sender_user_id_)
elseif ts_text == "مميز" then 
database:sadd('JOKER:'..bot_id..'vipgp:'..msg.chat_id_, result.sender_user_id_)
elseif ts_text == "مدير" then 
database:sadd('JOKER:'..bot_id..'owners:'..msg.chat_id_, result.sender_user_id_)
end
database:set("JOKER:name_user:"..bot_id..msg.chat_id_..result.sender_user_id_,a[1])
function zain33332(extra,result2,success)
info = '👨┇العضو ⊰• ['..result2.first_name_..'](t.me/'..(result2.username_ or 'JOKERTeam')..')\n✔┇تم رفعه '..a[1]
send(msg.chat_id_, msg.id_, 1,info, 1, 'md')
end
getUser(result.sender_user_id_, zain33332)  
end 
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end 
end
if text:match("^رفع (.*) @(.*)$") and is_owner(msg) then
local apmd = {string.match(text, "^رفع (.*) @(.*)$")}
ts_text = database:get("JOKER:all_if:"..apmd[1]..bot_id..msg.chat_id_)
if ts_text then 
function promote_by_username(extra, result, success)
if result.id_ then
if ts_text == "ادمن" then 
database:sadd('JOKER:'..bot_id..'mods:'..msg.chat_id_, result.id_)
elseif ts_text == "مميز" then 
database:sadd('JOKER:'..bot_id..'vipgp:'..msg.chat_id_, result.id_)
elseif ts_text == "مدير" then 
database:sadd('JOKER:'..bot_id..'owners:'..msg.chat_id_, result.id_)
end
database:set("JOKER:name_user:"..bot_id..msg.chat_id_..result.id_,apmd[1])
texts = '👨┇العضو ⊰• ['..result.title_..'](t.me/'..(apmd[2] or 'JOKERteam')..')\n✔┇تم رفعه '..apmd[1]
else
texts = '❌┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],promote_by_username)
end
end
if text:match("^رفع (.*) (%d+)$") and is_owner(msg) then
local apmd = {string.match(text, "^رفع (.*) (%d+)$")}
ts_text = database:get("JOKER:all_if:"..apmd[1]..bot_id..msg.chat_id_)
if ts_text then 
if ts_text == "ادمن" then 
database:sadd('JOKER:'..bot_id..'mods:'..msg.chat_id_, apmd[2])
elseif ts_text == "مميز" then 
database:sadd('JOKER:'..bot_id..'vipgp:'..msg.chat_id_, apmd[2])
elseif ts_text == "مدير" then 
database:sadd('JOKER:'..bot_id..'owners:'..msg.chat_id_, apmd[2])
end
database:set("JOKER:name_user:"..bot_id..msg.chat_id_..apmd[2],apmd[1])
tsX000(apmd[2],msg,"✔┇تم رفعه "..apmd[1])
end
end
if text:match("^تنزيل (.*)$") and is_owner(msg) and msg.reply_to_message_id_ then
a = {string.match(text, "^تنزيل (.*)$")}
ts_text = database:get("JOKER:all_if:"..a[1]..bot_id..msg.chat_id_)
if ts_text then 
function demote_by_reply(extra, result, success)
if ts_text == "ادمن" then 
database:srem('JOKER:'..bot_id..'mods:'..msg.chat_id_, result.sender_user_id_)
elseif ts_text == "مميز" then 
database:srem('JOKER:'..bot_id..'vipgp:'..msg.chat_id_, result.sender_user_id_)
elseif ts_text == "مدير" then 
database:srem('JOKER:'..bot_id..'owners:'..msg.chat_id_, result.sender_user_id_)
end
database:del("JOKER:name_user:"..bot_id..msg.chat_id_..result.sender_user_id_)
tsX000("prore",msg,"✔┇ تم تنزيله من "..a[1])
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,demote_by_reply)
end
end
if text:match("^تنزيل (.*) @(.*)$") and is_owner(msg) then
local apmd = {string.match(text, "^تنزيل (.*) @(.*)$")}
ts_text = database:get("JOKER:all_if:"..apmd[1]..bot_id..msg.chat_id_)
if ts_text then 
function demote_by_username(extra, result, success)
if result.id_ then
if ts_text == "ادمن" then 
database:srem('JOKER:'..bot_id..'mods:'..msg.chat_id_, result.id_)
elseif ts_text == "مميز" then 
database:srem('JOKER:'..bot_id..'vipgp:'..msg.chat_id_, result.id_)
elseif ts_text == "مدير" then 
database:srem('JOKER:'..bot_id..'owners:'..msg.chat_id_, result.id_)
end
texts = '👨┇العضو ⊰• ['..result.title_..'](t.me/'..(apmd[2] or 'JOKERteam')..')\n✔┇تم تنزيله من '..apmd[1]
database:del("JOKER:name_user:"..bot_id..msg.chat_id_..result.id_)
else
texts = '❌┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],demote_by_username)
end
end
if text:match("^تنزيل (.*) (%d+)$") and is_owner(msg) then
local apmd = {string.match(text, "^تنزيل (.*) (%d+)$")}
ts_text = database:get("JOKER:all_if:"..apmd[1]..bot_id..msg.chat_id_)
if ts_text then 
if ts_text == "ادمن" then 
database:srem('JOKER:'..bot_id..'mods:'..msg.chat_id_, apmd[2])
elseif ts_text == "مميز" then 
database:srem('JOKER:'..bot_id..'vipgp:'..msg.chat_id_, apmd[2])
elseif ts_text == "مدير" then 
database:srem('JOKER:'..bot_id..'owners:'..msg.chat_id_, apmd[2])
end
tsX000(apmd[2],msg,"✔┇ تم تنزيله من "..apmd[1])
database:del("JOKER:name_user:"..bot_id..msg.chat_id_..apmd[2])
end
end
end 
if (text and text == 'تفعيل ردود المطور') and is_owner(msg) then
if not database:get('JOKER:'..bot_id..'repsudo:mute'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✔┇ردود المطور مفعله❗', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✔┇تم تفعيل ردود المطور', 1, 'md')
database:del('JOKER:'..bot_id..'repsudo:mute'..msg.chat_id_)
end
end
if  (text and text == 'تعطيل ردود المطور') and is_owner(msg) then
if database:get('JOKER:'..bot_id..'repsudo:mute'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✔┇ردود المطور معطله❗', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, 'تم تعطيل ردود المطور', 1, 'md')
database:set('JOKER:'..bot_id..'repsudo:mute'..msg.chat_id_,true)
end
end
if (text and text == 'تفعيل ردود المدير') and is_owner(msg) then
if not database:get('JOKER:'..bot_id..'repowner:mute'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✔┇ردود المدير مفعله❗', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✔┇تم تفعيل ردود المدير', 1, 'md')
database:del('JOKER:'..bot_id..'repowner:mute'..msg.chat_id_)
end
end
if (text and text == 'تعطيل ردود المدير') and is_owner(msg) then
if database:get('JOKER:'..bot_id..'repowner:mute'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✔┇ردود المدير معطله❗', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✔┇تم تعطيل ردود المدير', 1, 'md')
database:set('JOKER:'..bot_id..'repowner:mute'..msg.chat_id_,true)
end
end
if text:match("^ايدي المجموعه$") then
send(msg.chat_id_, msg.id_, 1, "*"..msg.chat_id_.."*", 1, 'md')
end
if (text and text == 'تفعيل الايدي') and is_owner(msg) then
if not database:get('JOKER:'..bot_id..'id:mute'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✔┇الايدي مفعل❗', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✔┇تم تفعيل الايدي❗', 1, 'md')
database:del('JOKER:'..bot_id..'id:mute'..msg.chat_id_)
end
end
if (text and text == 'تعطيل الايدي') and is_owner(msg) then
if database:get('JOKER:'..bot_id..'id:mute'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✔┇الايدي معطل❗', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✔┇تم تعطيل الايدي', 1, 'md')
database:set('JOKER:'..bot_id..'id:mute'..msg.chat_id_,true)
end
end
if (text and text == "تعطيل الرابط" and is_owner(msg)) then 
send(msg.chat_id_, msg.id_, 1, '✔┇تم تعطيل امر الروابط', 1, 'md')
database:set("JOKER:mute:link:gr:"..bot_id..msg.chat_id_,"ok")
end
if (text and text == "تفعيل الرابط" and is_owner(msg)) then 
send(msg.chat_id_, msg.id_, 1, '✔┇تم تفعيل امر الروابط', 1, 'md')
database:del("JOKER:mute:link:gr:"..bot_id..msg.chat_id_)
end
if text and text == "تعين مجموعه المطور" and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
send(msg.chat_id_, msg.id_, 1, '✔┇ تم تعين ⊰• `'..msg.chat_id_..'`', 1, 'md')
database:set("JOKER"..bot_id..":sudo:gr",msg.chat_id_)
end
if text and text == "مسح مجموعه المطور" and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
send(msg.chat_id_, msg.id_, 1, '✔┇ تم مسح مجموعه المطور', 1, 'md')
database:del("JOKER"..bot_id..":sudo:gr")
end
if text:match("^ايدي$") and msg.reply_to_message_id_ == 0 then
local zain_info = nil
function zain333(extra,result,success)
zain_info = '@'..(result.username_ or 'لا يوجد')..''
local function getpro(extra, result, success)
local all_photo_JOKER = result.total_count_ 
local tahna = (database:get('JOKER:'..bot_id..'nummsg'..msg.chat_id_..msg.sender_user_id_) or 0)
if tonumber((database:get('JOKER:'..bot_id..'add:numall'..msg.chat_id_..msg.sender_user_id_) or 0)) == 0 then
nko = '0'
else
nko = (database:get('JOKER:'..bot_id..'add:numall'..msg.chat_id_..msg.sender_user_id_))
end
local user_msgs = ((database:get('JOKER:'..bot_id..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_) or 0) + tahna)
local izain_text = "غير متفاعل"
if user_msgs then 
if tonumber(user_msgs) < 50 then 
izain_text = "غير متفاعل"
elseif tonumber(user_msgs) < 100 then 
izain_text = "آستمر بطل"
elseif tonumber(user_msgs) < 1000 then 
izain_text = "متفآعل "
elseif tonumber(user_msgs) < 2000 then 
izain_text = "عضو نشط"
elseif tonumber(user_msgs) < 3000 then 
izain_text = "اقوئ تفاعل"
elseif tonumber(user_msgs) < 4000 then 
izain_text = "عضو متفاعل قوي"
elseif tonumber(user_msgs) < 5000 then 
izain_text = "جيد بتفاعل"
elseif tonumber(user_msgs) > 5000 then 
izain_text = "متفاعل كلش"
end
zain = database:smembers('zain:all:pppp:tt:'..bot_id) or 0
if (zain or zain[1] and end032) then 
for i=1, #zain do
local tttee = database:get("zain:set:text:p"..bot_id..zain[i])
if tonumber(user_msgs) >= tonumber(zain[i]) then 
izain_text = tttee
end
end
end
end
local edit = database:get('JOKER:'..bot_id..'user:editmsg'..msg.chat_id_..':'..msg.sender_user_id_) or 0
if result.photos_[0] then
if is_sudo(msg) then
t = database:get("JOKER:name_sudo"..bot_id..msg.chat_id_)  or 'مطور البوت'
elseif is_creator(msg) then
t =  database:get("JOKER:name_cre"..bot_id..msg.chat_id_) or 'منشئ الكروب'
elseif (database:get("JOKER:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) and database:get("JOKER:all_if:"..database:get("JOKER:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) ..bot_id..msg.chat_id_)) then 
t = database:get("JOKER:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_)
elseif is_owner(msg) then
t = database:get("JOKER:name_own"..bot_id..msg.chat_id_) or 'مدير الكروب'   
elseif is_mod(msg) then
t = database:get("JOKER:name_adm"..bot_id..msg.chat_id_) or 'ادمن للكروب'  
elseif is_vip(msg) then
t = database:get("JOKER:name_vipp"..bot_id..msg.chat_id_) or 'عضو مميز'
else
t = database:get("JOKER:name_nk"..bot_id..msg.chat_id_) or 'عضو فقط' 
end
if not database:get('JOKER:'..bot_id..'id:mute'..msg.chat_id_) then
if not database:get('JOKER:'..bot_id..'id:photo'..msg.chat_id_) then
if not database:get("JOKER:gr:id:text:"..bot_id..msg.chat_id_) then 
local zain_text = {
'ياحلو مين الله جابك🤧',
"غير صورتك 😪",
"تخليني♥️",
"طالع حلو ^_^",
"ليش مغير صورتك 🤣",
"يعني الوك الزين👨🏻‍🚒 ",
}
zain3 = math.random(#zain_text)
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[0].sizes_[1].photo_.persistent_id_,"📷¦   "..zain_text[zain3].."\n🎟¦  ايديك ⊰• ("..msg.sender_user_id_..")\n🎭¦  معرفك ⊰• "..zain_info.."\n👨‍✈️¦  رتبتك ⊰• "..t.."\n💌¦  رسائلك ⊰• {"..user_msgs.."}\n🗑¦  السحكات ⊰• {"..edit.."}\n🌟¦  تتفاعلك ⊰• "..izain_text.."\n💎¦  مجموع مجوهراتك ⊰• {"..nko.."}\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ",msg.id_,msg.id_.."")
else 
local JOKER_new_text = database:get("JOKER:gr:id:text:"..bot_id..msg.chat_id_)
local JOKER_new_text = JOKER_new_text:gsub('#username',(zain_info or 'لا يوجد'))
local JOKER_new_text = JOKER_new_text:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
local JOKER_new_text = JOKER_new_text:gsub('#edit',(edit or 'لا يوجد'))
local JOKER_new_text = JOKER_new_text:gsub('#msgs',(user_msgs or 'لا يوجد'))
local JOKER_new_text = JOKER_new_text:gsub('#stast',(t or 'لا يوجد'))
local JOKER_new_text = JOKER_new_text:gsub('#auto',(izain_text or 'لا يوجد'))
local JOKER_new_text = JOKER_new_text:gsub('#photos',(all_photo_JOKER or 'لا يوجد'))
local JOKER_new_text = JOKER_new_text:gsub('#game',(nko or 'لا يوجد'))

sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[0].sizes_[1].photo_.persistent_id_,JOKER_new_text,msg.id_,msg.id_.."")
end
else
if is_sudo(msg) then
t = database:get("JOKER:name_sudo"..bot_id..msg.chat_id_)  or 'مطور البوت'
elseif is_creator(msg) then
t = database:get("JOKER:name_cre"..bot_id..msg.chat_id_) or 'منشئ الكروب'
elseif (database:get("JOKER:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) and database:get("JOKER:all_if:"..database:get("JOKER:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) ..bot_id..msg.chat_id_)) then 
t = database:get("JOKER:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_)
elseif is_owner(msg) then
t = database:get("JOKER:name_own"..bot_id..msg.chat_id_) or 'مدير الكروب'
elseif is_mod(msg) then
t = database:get("JOKER:name_adm"..bot_id..msg.chat_id_) or 'ادمن للكروب'
elseif is_vip(msg) then
t = database:get("JOKER:name_vipp"..bot_id..msg.chat_id_) or 'عضو مميز'
else
t = database:get("JOKER:name_nk"..bot_id..msg.chat_id_) or 'عضو فقط' 
end
if not database:get("JOKER:gr:id:text:"..bot_id..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1, "🎟¦  ايديك ⊰• ("..msg.sender_user_id_..")\n🎭¦  معرفك ⊰• "..zain_info.."\n👨‍✈️¦  رتبتك ⊰• "..t.."\n💌¦  رسائلك ⊰• {"..user_msgs.."}\n🗑¦  السحكات ⊰• {"..edit.."}\n🌟¦  تتفاعلك ⊰• "..izain_text.."\n💎¦  مجموع مجوهراتك ⊰• {"..nko.."}\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ", 1, 'html')
else 
local JOKER_new_text = database:get("JOKER:gr:id:text:"..bot_id..msg.chat_id_)
local JOKER_new_text = JOKER_new_text:gsub('#username',(zain_info or 'لا يوجد'))
local JOKER_new_text = JOKER_new_text:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
local JOKER_new_text = JOKER_new_text:gsub('#edit',(edit or 'لا يوجد'))
local JOKER_new_text = JOKER_new_text:gsub('#msgs',(user_msgs or 'لا يوجد'))
local JOKER_new_text = JOKER_new_text:gsub('#stast',(t or 'لا يوجد'))   
local JOKER_new_text = JOKER_new_text:gsub('#auto',(izain_text or 'لا يوجد'))
local JOKER_new_text = JOKER_new_text:gsub('#photos',(all_photo_JOKER or 'لا يوجد'))
local JOKER_new_text = JOKER_new_text:gsub('#game',(nko or 'لا يوجد'))

send(msg.chat_id_, msg.id_, 1, JOKER_new_text, 1, 'html')
end   
end
else
end
else
if is_sudo(msg) then
t = database:get("JOKER:name_sudo"..bot_id..msg.chat_id_)  or 'مطور البوت'
elseif is_creator(msg) then
t = database:get("JOKER:name_cre"..bot_id..msg.chat_id_) or 'منشئ الكروب'
elseif (database:get("JOKER:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) and database:get("JOKER:all_if:"..database:get("JOKER:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) ..bot_id..msg.chat_id_)) then 
t = database:get("JOKER:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_)
elseif is_owner(msg) then
t = database:get("JOKER:name_own"..bot_id..msg.chat_id_) or 'مدير الكروب'
elseif is_mod(msg) then
t = database:get("JOKER:name_adm"..bot_id..msg.chat_id_) or 'ادمن للكروب'
elseif is_vip(msg) then
t = database:get("JOKER:name_vipp"..bot_id..msg.chat_id_) or 'عضو مميز'
else
t = database:get("JOKER:name_nk"..bot_id..msg.chat_id_) or 'عضو فقط' 
end
if not database:get('JOKER:'..bot_id..'id:mute'..msg.chat_id_) then
if not database:get('JOKER:'..bot_id..'id:photo'..msg.chat_id_) then
if not database:get("JOKER:gr:id:text:"..bot_id..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1, "❕¦  انت لا تملك صوره لحسابك\n🎟¦  ايديك ⊰• ("..msg.sender_user_id_..")\n🎭¦  معرفك ⊰• "..zain_info.."\n👨‍✈️¦  رتبتك ⊰• "..t.."\n💌¦  رسائلك ⊰• {"..user_msgs.."}\n🗑¦  السحكات ⊰• {"..edit.."}\n🌟¦  تتفاعلك ⊰• "..izain_text.."\n💎¦  مجموع مجوهراتك ⊰• {"..nko.."}\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ", 1, 'html')
else 
local JOKER_new_text = database:get("JOKER:gr:id:text:"..bot_id..msg.chat_id_)
local JOKER_new_text = JOKER_new_text:gsub('#username',(zain_info or 'لا يوجد'))
local JOKER_new_text = JOKER_new_text:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
local JOKER_new_text = JOKER_new_text:gsub('#edit',(edit or 'لا يوجد'))
local JOKER_new_text = JOKER_new_text:gsub('#msgs',(user_msgs or 'لا يوجد'))
local JOKER_new_text = JOKER_new_text:gsub('#stast',(t or 'لا يوجد'))   
local JOKER_new_text = JOKER_new_text:gsub('#auto',(izain_text or 'لا يوجد'))
local JOKER_new_text = JOKER_new_text:gsub('#photos',(all_photo_JOKER or 'لا يوجد'))
local JOKER_new_text = JOKER_new_text:gsub('#game',(nko or 'لا يوجد'))

send(msg.chat_id_, msg.id_, 1, JOKER_new_text, 1, 'html')
end
else
if is_sudo(msg) then
t = database:get("JOKER:name_sudo"..bot_id..msg.chat_id_)  or 'مطور البوت'
elseif is_creator(msg) then
t = database:get("JOKER:name_cre"..bot_id..msg.chat_id_) or 'منشئ الكروب'
elseif (database:get("JOKER:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) and database:get("JOKER:all_if:"..database:get("JOKER:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) ..bot_id..msg.chat_id_)) then 
t = database:get("JOKER:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_)
elseif is_owner(msg) then
t = database:get("JOKER:name_own"..bot_id..msg.chat_id_) or 'مدير الكروب'
elseif is_mod(msg) then
t = database:get("JOKER:name_adm"..bot_id..msg.chat_id_) or 'ادمن للكروب'
elseif is_vip(msg) then
t = database:get("JOKER:name_vipp"..bot_id..msg.chat_id_) or 'عضو مميز'
else
t = database:get("JOKER:name_nk"..bot_id..msg.chat_id_) or 'عضو فقط' 
end
if not database:get("JOKER:gr:id:text:"..bot_id..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1, "🎟¦  ايديك ⊰• ("..msg.sender_user_id_..")\n🎭¦  معرفك ⊰• "..zain_info.."\n👨‍✈️¦  رتبتك ⊰• "..t.."\n💌¦  رسائلك ⊰• {"..user_msgs.."}\n🗑¦  السحكات ⊰• {"..edit.."}\n🌟¦  تتفاعلك ⊰• "..izain_text.."\n💎¦  مجموع مجوهراتك ⊰• {"..nko.."}\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ", 1, 'html')
else 
local JOKER_new_text = database:get("JOKER:gr:id:text:"..bot_id..msg.chat_id_)
local JOKER_new_text = JOKER_new_text:gsub('#username',(zain_info or 'لا يوجد'))
local JOKER_new_text = JOKER_new_text:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
local JOKER_new_text = JOKER_new_text:gsub('#edit',(edit or 'لا يوجد'))
local JOKER_new_text = JOKER_new_text:gsub('#msgs',(user_msgs or 'لا يوجد'))
local JOKER_new_text = JOKER_new_text:gsub('#stast',(t or 'لا يوجد'))   
local JOKER_new_text = JOKER_new_text:gsub('#auto',(izain_text or 'لا يوجد'))
local JOKER_new_text = JOKER_new_text:gsub('#photos',(all_photo_JOKER or 'لا يوجد'))
local JOKER_new_text = JOKER_new_text:gsub('#game',(nko or 'لا يوجد'))

send(msg.chat_id_, msg.id_, 1, JOKER_new_text, 1, 'html')  
end 
end
else
end
end
end
tdcli_function ({
ID = "GetUserProfilePhotos",
user_id_ = msg.sender_user_id_,
offset_ = 0,
limit_ = 1
}, getpro, nil)
end
getUser(msg.sender_user_id_, zain333)
end
if text:match('^الحساب (%d+)$') then
local id = text:match('^الحساب (%d+)$')
local text = 'اضغط لمشاهده الحساب'
tdcli_function ({ID="SendMessage", chat_id_=msg.chat_id_, reply_to_message_id_=msg.id_, disable_notification_=0, from_background_=1, reply_markup_=nil, input_message_content_={ID="InputMessageText", text_=text, disable_web_page_preview_=1, clear_draft_=0, entities_={[0] = {ID="MessageEntityMentionName", offset_=0, length_=19, user_id_=id}}}}, dl_cb, nil)
end
local function oChat(chat_id,cb)
tdcli_function ({
ID = "OpenChat",
chat_id_ = chat_id
}, cb, nil)
end
if text:match("^معلومات (.*)$") then
local memb = {string.match(text, "^(معلومات) (.*)$")}
function whois(extra,result,success)
if result.username_ then
result.username_ = '@'..result.username_
else
result.username_ = 'لا يوجد معرف'
end
send(msg.chat_id_, msg.id_, 1, '♠┇معرف ⊰• ('..(result.username_..')\n🔘┇الاسم ⊰• ('..result.first_name_ or "JOKER")..')', 1, 'md')
end
getUser(memb[2],whois)
end
if (text and text == 'تفعيل التثبيت') and is_owner(msg) then
if not database:get('JOKER:'..bot_id..'pin:mute'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✔┇❗التثبيت مفعل', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✔┇تم تفعيل التثبيت', 1, 'md')
database:del('JOKER:'..bot_id..'pin:mute'..msg.chat_id_)
end
end
if (text and text == 'تعطيل التثبيت') and is_owner(msg) then
if database:get('JOKER:'..bot_id..'pin:mute'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✔┇التثبيت بالفعل معطل❗', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✔┇تم تعطيل التثبيت', 1, 'md')
database:set('JOKER:'..bot_id..'pin:mute'..msg.chat_id_,true)
end
end
if text:match("^تثبيت$") and is_mod(msg) and not is_owner(msg) then
local id = msg.id_
local msgs = {[0] = id}
if not database:get('JOKER:'..bot_id..'pin:mute'..msg.chat_id_) then
pin(msg.chat_id_,msg.reply_to_message_id_,0)
database:set('JOKER:'..bot_id..'pinnedmsg'..msg.chat_id_,msg.reply_to_message_id_)
send(msg.chat_id_, msg.id_, 1, '✔┇تم تثبيت الرساله',1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✔┇التثبيت معطل',1, 'md')
end
end
if text:match("^الغاء تثبيت$") and is_mod(msg) and not is_owner(msg) or text:match("^الغاء التثبيت") and is_mod(msg) and not is_owner(msg) then
if not database:get('JOKER:'..bot_id..'pin:mute'..msg.chat_id_) then
unpinmsg(msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '✔┇تم الغاء تثبيت الرساله', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✔┇الغاء التثبيت معطل', 1, 'md')
end
end
if text:match("^تثبيت$") and is_owner(msg) then
local id = msg.id_
local msgs = {[0] = id}
pin(msg.chat_id_,msg.reply_to_message_id_,0)
database:set('JOKER:'..bot_id..'pinnedmsg'..msg.chat_id_,msg.reply_to_message_id_)
send(msg.chat_id_, msg.id_, 1, '✔┇تم تثبيت الرساله',1, 'md')
end
if text:match("^الغاء تثبيت$") and is_owner(msg) or text:match("^الغاء التثبيت") and is_owner(msg) then
unpinmsg(msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '✔┇تم الغاء تثبيت الرساله', 1, 'md')
end
if text:match("^مشاهده منشور$") then
database:set('JOKER:'..bot_id..'viewget'..msg.sender_user_id_,true)
send(msg.chat_id_, msg.id_, 1, '📥┇قم بارسال المنشور الان ',1, 'md')
end
if (text and text == 'استعاده الاوامر') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
redis:del('JOKER:'..bot_id..'help', text)
redis:del('JOKER:'..bot_id..'h1', text)
redis:del('JOKER:'..bot_id..'h2', text)
redis:del('JOKER:'..bot_id..'h3', text)
redis:del('JOKER:'..bot_id..'h4', text)
redis:del('JOKER:'..bot_id..'h5', text)
redis:del('JOKER:'..bot_id..'h6', text)
send(msg.chat_id_, msg.id_, 1, '✔┇تم استعاده جميع كلايش الاوامر', 1, 'html')
end
if (text and text == 'تغير امر الاوامر') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
send(msg.chat_id_, msg.id_, 1, '📥┇الان يمكنك ارسال الكليشه  ليتم حفظها', 1, 'html')
redis:set('JOKER:'..bot_id..'hhh'..msg.sender_user_id_..'', 'msg')
return false end
if text:match("^(.*)$") then
local zain2 = redis:get('JOKER:'..bot_id..'hhh'..msg.sender_user_id_..'')
if zain2 == 'msg' then
send(msg.chat_id_, msg.id_, 1, '☑┇تم حفظ الكليشه يمكنك اظهارها بارسال الامر', 1, 'html')
redis:set('JOKER:'..bot_id..'hhh'..msg.sender_user_id_..'', 'no')
redis:set('JOKER:'..bot_id..'help', text)
send(msg.chat_id_, msg.id_, 1, text , 1, 'html')
return false end
end
---------------
BOT_NAME = redis:get(JOKER..'bot:name')
do 
local function run(msg, matches) 
local r =  matches[1]
local r2 = matches[2]
local r3 = matches[3]
local r4 = matches[4]
---------------[bot out]---------------------------
if r == BOT_NAME and r2 == 'غادر' and is_sudo(msg) then
sendMsg(msg.to.id,msg.id_,'اوك باي 😢💔💯','html')
botrem(msg)
end   
if (r == "ضع اسم للبوت" or r== 'ضع اسم للبوت ©') and is_sudo(msg) then
if not we_sudo(msg) then return "☔️هذا الاوامر للمطور الاساسي فقط 🌑" end
redis:setex(JOKER..'namebot:witting'..msg.from.id,300,true)
return"📭¦ حسننا عزيزي  ✋🏿\n🗯¦ الان ارسل الاسم  للبوت 🍃"
end
-------[/start and welcom and save user id ]-----------
if r=="/start" and msg.to.type == 'pv'  then
if we_sudo(msg) then
local text = '🎖¦ آهہ‏‏لآ عزيزي آلمـطـور 🍃\n💰¦ آنتهہ‏‏ آلمـطـور آلآسـآسـي هہ‏‏نآ 🛠\n...\n\n🚸¦ تسـتطـيع‏‏ آلتحگم بگل آلآوآمـر آلمـمـوجودهہ‏‏ بآلگيبورد\n⚖️¦ فقط آضـغط ع آلآمـر آلذي تريد تنفيذهہ‏‏'

local keyboard = {
 {"ضع اسم للبوت ©","ضع صوره للترحيب 🌄"},
 {"تعطيل التواصل ✖️","تفعيل التواصل 🔛"},
 {"المطورين 🕹","ايدي 🆔","الاحصائيات 📈"},
 {"اضف رد عام ➕","الردود العامه 🗨"},
 {"الملفات 🗂","اذاعه عام بالتوجيه 📣"},
 {"اذاعه 🗣","اذاعه عام 📢","اذاعه خاص 👤"},
 {"تحديث ♻️","قائمه العام 📜","قناة السورس 📡"},
 {"تحديث السورس ™"},
 {"الغاء الامر ✖️"}}
return send_inline_key(msg.from.id,text,keyboard)
else
 redis:sadd(JOKER..'users',msg.from.id)
local text = [[💯¦ مـرحبآ آنآ بوت آسـمـي ]]..BOT_NAME..[[ 🎖
💰¦ آختصـآصـي حمـآيهہ‏‏ آلمـجمـوعآت
📛¦ مـن آلسـبآم وآلتوجيهہ‏‏ وآلتگرآر وآلخ...
🚸¦ فقط آلمـطـور يسـتطـيع تفعيل آلبوت
⚖️¦ مـعرف آلمـطـور  : ]]..SUDO_USER..[[

👨🏽‍🔧]]
xsudouser = SUDO_USER:gsub('@','')
xsudouser = xsudouser:gsub([[\_]],'_')
local inline = {{{text="آلمـطـور ™",url="t.me/"..xsudouser}}}
return send_inline_key(msg.from.id,text,nil,inline)
end end
if (msg.to.type == "pv") and is_sudo(msg) then -- ارسال الرساله بالخاص عبر رد على التوجيه
if msg.reply_id then
function get_msg_id(arg, data)
function replay_fwd(arg,data)
if data.forward_info_ then
function infousers(arg,data)
if data.username_ then user_name = '@'..data.username_ else user_name = data.first_name_ end
sendMsg(arg.user_id,0,'['..r..']','md')
sendMsg(msg.from.id,msg.id_,"📬¦ تم آرسـآل آلرسـآل‏‏هہ 🌿\n🎟¦ آلى : "..user_name.." 🏌🏻",'html') end
tdcli_function({ID ='GetUser',user_id_ = data.forward_info_.sender_user_id_}, infousers, {user_id=data.forward_info_.sender_user_id_})  end end
tdcli_function({ID ='GetMessage',chat_id_=msg.chat_id_,message_id_=data.id_},replay_fwd,nil) end
tdcli_function({ID ='GetMessage',chat_id_=msg.chat_id_,message_id_=msg.reply_to_message_id_},get_msg_id,nil)
end end
if (msg.to.type == "pv") and not we_sudo(msg) and not redis:get(JOKER..'lock_twasel') and msg.from.id ~= our_id then -- ارسال رساله للاعضاء الي يدخلون خاص
sendMsg(msg.to.id,0,"🗯¦ تم آرسـآل رسـآلتگ آلى آلمـطـور\n📬¦ سـآرد عليگ في آقرب وقت\n🏌 "..SUDO_USER,'md')
forwardMessages(SUDO_ID,msg.to.id,{[0] = msg.id_},0)
end
if (r=="تيست" or r=="test") and is_sudo(msg) then return "💯 البوت شـغــال 🚀" end
if (r== "ايدي" or r=="ايدي 🆔") and msg.to.type == "pv" then return  "\n"..msg.from.id.."\n"  end
if r== "قناة السورس 📡" and msg.to.type == "pv" then
local inline = {{{text="قنآهہ‏‏ آلسـورس : الـجوكر 🍃",url="t.me/llJOKERll"}}}
return send_inline_key(msg.from.id,'  [قناة السورس : الـجوكر](t.me/llJOKERll)',nil,inline)
end
if (r== "الاحصائيات 📈" or r=="الاحصائيات") and is_sudo(msg) then
local group = redis:smembers(JOKER..'group:ids')
local pv = redis:smembers(JOKER..'users')
return 'الاحصائيات : 📈 \n\n👥*¦* عدد المجموعات المفعله : '..#group..'\n👤*¦* عدد المشتركين في البوت : '..#pv..'\n📡'
end
---------------[End Function data] -----------------------
if r=="اضف رد عام" or r=="اضف رد عام ➕" then
if not we_sudo(msg) then return "☔️هذا الاوامر للمطور الاساسي فقط 🌑" end
redis:setex(JOKER..'addrd_all:'..msg.to.id..msg.from.id,300 , true)
redis:del(JOKER..'allreplay:'..msg.to.id..msg.from.id)
return "📭¦ حسننا الان ارسل كلمة الرد العام 🍃\n"
end
------------------------------------------------------
if msg.text and not msg.text~='الغاء الامر ✖️' and not msg.text~='الغاء الامر'  and not msg.text~='الغاء' then
if redis:get(JOKER..'namebot:witting'..msg.from.id) then --- استقبال اسم البوت 
redis:del(JOKER..'namebot:witting'..msg.from.id)
redis:set(JOKER..'bot:name',msg.text)
reload_plugins() 
return "📭¦ تم تغير اسم البوت  ✋🏿\n🗯¦ الان اسمه `"..msg.text.."` \n✓"
end
if redis:get(JOKER..'addrd_all:'..msg.to.id..msg.from.id) then -- استقبال الرد لكل المجموعات
if not redis:get(JOKER..'allreplay:'..msg.to.id..msg.from.id) then-- استقبال كلمه الرد لكل المجموعات
redis:hdel(JOKER..'replay_photo:group:',msg.text)
redis:hdel(JOKER..'replay_voice:group:',msg.text)
redis:hdel(JOKER..'replay_animation:group:',msg.text)
redis:hdel(JOKER..'replay_audio:group:',msg.text)
redis:hdel(JOKER..'replay_sticker:group:',msg.text)
redis:hdel(JOKER..'replay_video:group:',msg.text)
redis:setex(JOKER..'allreplay:'..msg.to.id..msg.from.id,300,msg.text)
return "📜¦ جيد , يمكنك الان ارسال جوا ب الردالعام \n🔛¦ [[ نص,صوره,فيديو,متحركه,بصمه,اغنيه ]] ✓\n-" 
end
if redis:get(JOKER..'allreplay:'..msg.to.id..msg.from.id) then -- استقبال جواب الرد لكل المجموعات
redis:hset(JOKER..'replay:all', redis:get(JOKER.."allreplay:"..msg.to.id..msg.from.id),msg.text)
redis:del(JOKER..'addrd_all:'..msg.to.id..msg.from.id)
return '(['..redis:get(JOKER..'allreplay:'..msg.to.id..msg.from.id)..'])\n  ✓ تم اضافت الرد لكل المجموعات 🚀 '
end end
-------------------------------------------------------------
if redis:get(JOKER..'addrd:'..msg.to.id..msg.from.id) then -- استقبال الرد للمجموعه فقط
if not redis:get(JOKER..'replay1'..msg.to.id..msg.from.id) then  -- كلمه الرد
redis:hdel(JOKER..'replay:'..msg.to.id,msg.text)
redis:hdel(JOKER..'replay_photo:group:'..msg.to.id,msg.text)
redis:hdel(JOKER..'replay_voice:group:'..msg.to.id,msg.text)
redis:hdel(JOKER..'replay_animation:group:'..msg.to.id,msg.text)
redis:hdel(JOKER..'replay_audio:group:'..msg.to.id,msg.text)
redis:hdel(JOKER..'replay_sticker:group:'..msg.to.id,msg.text)
redis:hdel(JOKER..'replay_video:group:'..msg.to.id,msg.text)
redis:setex(JOKER..'replay1'..msg.to.id..msg.from.id,300,msg.text)
return "📜¦ جيد , يمكنك الان ارسال جواب الرد \n🔛¦ [[ نص,صوره,فيديو,متحركه,بصمه,اغنيه ]] ✓\n-" 
end
if redis:get(JOKER..'replay1'..msg.to.id..msg.from.id) then -- جواب الرد
redis:hset(JOKER..'replay:'..msg.to.id, redis:get(JOKER.."replay1"..msg.to.id..msg.from.id),msg.text)
redis:del(JOKER..'addrd:'..msg.to.id..msg.from.id)
return '(['..redis:get(JOKER..'replay1'..msg.to.id..msg.from.id)..'])\n  ✓ تم اضافت الرد 🚀 \n-'
end end
if redis:get(JOKER..'delrd:'..msg.from.id) then
redis:del(JOKER..'delrd:'..msg.from.id)
local names = redis:hget(JOKER..'replay:'..msg.to.id,msg.text)
local photo =redis:hget(JOKER..'replay_photo:group:'..msg.to.id,msg.text)
local voice = redis:hget(JOKER..'replay_voice:group:'..msg.to.id,msg.text)
local animation = redis:hget(JOKER..'replay_animation:group:'..msg.to.id,msg.text)
local audio = redis:hget(JOKER..'replay_audio:group:'..msg.to.id,msg.text)
local sticker = redis:hget(JOKER..'replay_sticker:group:'..msg.to.id,msg.text)
local video = redis:hget(JOKER..'replay_video:group:'..msg.to.id,msg.text)
if not (names or photo or voice or animation or audio or sticker or video) then
return '💬*¦* هذا الرد ليس مضاف في قائمه الردود 📛'
else
redis:hdel(JOKER..'replay:'..msg.to.id,msg.text)
redis:hdel(JOKER..'replay_photo:group:'..msg.to.id,msg.text)
redis:hdel(JOKER..'replay_voice:group:'..msg.to.id,msg.text)
redis:hdel(JOKER..'replay_audio:group:'..msg.to.id,msg.text)
redis:hdel(JOKER..'replay_animation:group:'..msg.to.id,msg.text)
redis:hdel(JOKER..'replay_sticker:group:'..msg.to.id,msg.text)
redis:hdel(JOKER..'replay_video:group:'..msg.to.id,msg.text)
return '(['..msg.text..'])\n  ✓ تم مسح الرد 🚀 '
end end
if redis:get(JOKER..'delrdall:'..msg.from.id) then
redis:del(JOKER..'delrdall:'..msg.from.id)
local names = redis:hget(JOKER..'replay:all',msg.text)
local photo =redis:hget(JOKER..'replay_photo:group:',msg.text)
local voice = redis:hget(JOKER..'replay_voice:group:',msg.text)
local animation = redis:hget(JOKER..'replay_animation:group:',msg.text)
local audio = redis:hget(JOKER..'replay_audio:group:',msg.text)
local sticker = redis:hget(JOKER..'replay_sticker:group:',msg.text)
local video = redis:hget(JOKER..'replay_video:group:',msg.text)
if not (names or photo or voice or animation or audio or sticker or video) then
return '💬*¦* هذا الرد ليس مضاف في قائمه الردود 📛'
else
redis:hdel(JOKER..'replay:all',msg.text)
redis:hdel(JOKER..'replay_photo:group:',msg.text)
redis:hdel(JOKER..'replay_voice:group:',msg.text)
redis:hdel(JOKER..'replay_audio:group:',msg.text)
redis:hdel(JOKER..'replay_animation:group:',msg.text)
redis:hdel(JOKER..'replay_sticker:group:',msg.text)
redis:hdel(JOKER..'replay_video:group:',msg.text)
return '(['..msg.text..'])\n  ✓ تم مسح الرد 🚀 '
end end end
if r== 'مسح الردود' then
if not is_owner(msg) then return"♨️ للمدراء فقط ! 💯" end
local names = redis:hkeys(JOKER..'replay:'..msg.to.id)
local photo =redis:hkeys(JOKER..'replay_photo:group:'..msg.to.id)
local voice = redis:hkeys(JOKER..'replay_voice:group:'..msg.to.id)
local animation = redis:hkeys(JOKER..'replay_animation:group:'..msg.to.id)
local audio = redis:hkeys(JOKER..'replay_audio:group:'..msg.to.id)
local sticker = redis:hkeys(JOKER..'replay_sticker:group:'..msg.to.id)
local video = redis:hkeys(JOKER..'replay_video:group:'..msg.to.id)
if #names==0 and #photo==0 and #voice==0 and #animation==0 and #audio==0 and #sticker==0 and #video==0 then
return '🚸*¦* لا يوجد ردود ليتم مسحها \n❕'
end
for i=1, #names do redis:hdel(JOKER..'replay:'..msg.to.id,names[i]) end
for i=1, #photo do redis:hdel(JOKER..'replay_photo:group:'..msg.to.id,photo[i]) end
for i=1, #voice do redis:hdel(JOKER..'replay_voice:group:'..msg.to.id,voice[i]) end
for i=1, #animation do redis:hdel(JOKER..'replay_animation:group:'..msg.to.id,animation[i]) end
for i=1, #audio do redis:hdel(JOKER..'replay_audio:group:'..msg.to.id,audio[i]) end
for i=1, #sticker do redis:hdel(JOKER..'replay_sticker:group:'..msg.to.id,sticker[i]) end
for i=1, #video do redis:hdel(JOKER..'replay_video:group:'..msg.to.id,video[i]) end
return "✓ تم مسح كل الردود 🚀"
end
if r== 'مسح الردود العامه' then
if not is_sudo(msg) then return"♨️ للمطورين فقط ! 💯" end
local names = redis:hkeys(JOKER..'replay:all')
local photo =redis:hkeys(JOKER..'replay_photo:group:')
local voice = redis:hkeys(JOKER..'replay_voice:group:')
local animation = redis:hkeys(JOKER..'replay_animation:group:')
local audio = redis:hkeys(JOKER..'replay_audio:group:')
local sticker = redis:hkeys(JOKER..'replay_sticker:group:')
local video = redis:hkeys(JOKER..'replay_video:group:')
for i=1, #names do redis:hdel(JOKER..'replay:all',names[i]) end
for i=1, #photo do redis:hdel(JOKER..'replay_photo:group:',photo[i]) end
for i=1, #voice do redis:hdel(JOKER..'replay_voice:group:',voice[i]) end
for i=1, #animation do redis:hdel(JOKER..'replay_animation:group:',animation[i]) end
for i=1, #audio do redis:hdel(JOKER..'replay_audio:group:',audio[i]) end
for i=1, #sticker do redis:hdel(JOKER..'replay_sticker:group:',sticker[i]) end
for i=1, #video do redis:hdel(JOKER..'replay_video:group:',video[i]) end
return "✓ تم مسح كل الردود العامه🚀"
end
if r== 'مسح رد عام' then
if not is_sudo(msg) then return"♨️ للمطورين فقط ! 💯" end
redis:set(JOKER..'delrdall:'..msg.from.id,true) return "📭¦ حسننا عزيزي  ✋🏿\n🗯¦ الان ارسل الرد لمسحها من  المجموعات 🍃"
end
if r== 'مسح رد' then
if not is_owner(msg) then return"♨️ للمدراء فقط ! 💯" end redis:set(JOKER..'delrd:'..msg.from.id,true)
return "📭¦ حسننا عزيزي  ✋🏿\n🗯¦ الان ارسل الرد لمسحها من  للمجموعه 🍃"
end
if r== 'الردود' and is_owner(msg) then
local names = redis:hkeys(JOKER..'replay:'..msg.to.id)
local photo =redis:hkeys(JOKER..'replay_photo:group:'..msg.to.id)
local voice = redis:hkeys(JOKER..'replay_voice:group:'..msg.to.id)
local animation = redis:hkeys(JOKER..'replay_animation:group:'..msg.to.id)
local audio = redis:hkeys(JOKER..'replay_audio:group:'..msg.to.id)
local sticker = redis:hkeys(JOKER..'replay_sticker:group:'..msg.to.id)
local video = redis:hkeys(JOKER..'replay_video:group:'..msg.to.id)
if #names==0 and #photo==0 and #voice==0 and #animation==0 and #audio==0 and #sticker==0 and #video==0 then return '🚸*¦* لا يوجد ردود مضافه حاليا \n❕' end
local ii = 1
local message = '💬*¦* ردود البوت في المجموعه  :\n\n'
for i=1, #photo do message = message ..ii..' - *{* '..photo[i]..' *}_*( صوره 🏞 ) \n' ii = ii + 1 end
for i=1, #names do message = message ..ii..' - *{* '..names[i]..' *}_*( نص 🗯 ) \n' ii = ii + 1 end
for i=1, #voice do message = message ..ii..' - *{* '..voice[i]..' *}_*( بصمه 🎙 ) \n' ii = ii + 1 end
for i=1, #animation do message = message ..ii..' - *{* '..animation[i]..' *}_*( متحركه 🎭 ) \n' ii = ii + 1 end
for i=1, #audio do message = message ..ii..' - *{* '..audio[i]..' *}_*( صوتيه 🔊 ) \n' ii = ii + 1 end
for i=1, #sticker do message = message ..ii..' - *{* '..sticker[i]..' *}_*( ملصق 🗺 ) \n' ii = ii + 1 end
for i=1, #video do message = message ..ii..' - *{* '..video[i]..' *}_*( فيديو  🎞 ) \n' ii = ii + 1 end
return message..'\n➖➖➖'
end
if (r== 'الردود العامه' or r=='الردود العامه 🗨') and is_sudo(msg) then
local names = redis:hkeys(JOKER..'replay:all')
local photo =redis:hkeys(JOKER..'replay_photo:group:')
local voice = redis:hkeys(JOKER..'replay_voice:group:')
local animation = redis:hkeys(JOKER..'replay_animation:group:')
local audio = redis:hkeys(JOKER..'replay_audio:group:')
local sticker = redis:hkeys(JOKER..'replay_sticker:group:')
local video = redis:hkeys(JOKER..'replay_video:group:')
if #names==0 and #photo==0 and #voice==0 and #animation==0 and #audio==0 and #sticker==0 and #video==0 then return '🚸*¦* لا يوجد ردود مضافه حاليا \n❕' end
local ii = 1
local message = '💬*¦* الردود العامه في البوت :   :\n\n'
for i=1, #photo do message = message ..ii..' - *{* '..photo[i]..' *}_*( صوره 🏞 ) \n' ii = ii + 1 end
for i=1, #names do message = message ..ii..' - *{* '..names[i]..' *}_*( نص 🗯 ) \n' ii = ii + 1 end
for i=1, #voice do message = message ..ii..' - *{* '..voice[i]..' *}_*( بصمه 🎙 ) \n' ii = ii + 1 end
for i=1, #animation do message = message ..ii..' - *{* '..animation[i]..' *}_*( متحركه 🎭 ) \n' ii = ii + 1 end
for i=1, #audio do message = message ..ii..' - *{* '..audio[i]..' *}_*( صوتيه 🔊 ) \n' ii = ii + 1 end
for i=1, #sticker do message = message ..ii..' - *{* '..sticker[i]..' *}_*( ملصق 🗺 ) \n' ii = ii + 1 end
for i=1, #video do message = message ..ii..' - *{* '..video[i]..' *}_*( فيديو  🎞 ) \n' ii = ii + 1 end
return message..'\n➖➖➖'
end
if not redis:get(JOKER..'group:add'..msg.to.id) then return end
if r=="اضف رد" then
if not is_owner(msg) then return"♨️ للمدراء فقط ! 💯" end
redis:setex(JOKER..'addrd:'..msg.to.id..msg.from.id,300,true) redis:del(JOKER..'replay1'..msg.to.id..msg.from.id)
return "📭¦ حسننا , الان ارسل كلمه الرد \n-"
end
if r== "اسمي"  then return  "\n" ..check_name(msg.from.first_name).."\n" 
elseif r== "معرفي" then return  "@["..(msg.from.username or " ---").."]\n" 
elseif r== "ايديي" or r=="ايدي 🆔" then return "🧟‍♂*¦* آضـغط على آلآيدي ليتم آلنسـخ\n\n @["..msg.from.username.."] ~⪼ ( `"..msg.from.id.."` )"
elseif r=="صورتي" then
tdcli_function ({ID = "GetUserProfilePhotos",user_id_ = msg.from.id,offset_ = 0,limit_ = 1}, function(arg, data)
if data.photos_[0] then sendPhoto(msg.to.id,msg.id_,0,1,nil,data.photos_[0].sizes_[1].photo_.persistent_id_,"",dl_cb,nil)
else sendMsg(msg.to.id,msg.id_,"🚸¦ لا يوجد صوره في بروفايلك ...\n-",'md')
end end, nil)
---------------
if text == 'هلو' then
if not database:get('bot:rep:mute'..msg.chat_id_) then
moody = "• هَٰہۧـﮧﮧلْٰاَٰوٍّ໑اَٰتّٰ 🌝☄ֆ"
else
moody = ''
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end

if text == 'جوكر' then
if not database:get('bot:rep:mute'..msg.chat_id_) then
moody = "• نٍٰـعٍِّـﮧﮧمٍٰ تّٰفِٰـہضلْٰ 🍁🌛ֆ"
else
moody = ''
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'شلونكم' then
if not database:get('bot:rep:mute'..msg.chat_id_) then
moody = "• تّٰمٍٰـﮧاَٰمٍٰ وٍّاَٰنٍٰتّٰـہهَٰہۧ 😽⚡️ֆ"
else
moody = ''
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'شلونك' then
if not database:get('bot:rep:mute'..msg.chat_id_) then
moody = "• اَٰلْٰـحٌٰمٍٰـﮧﮧدِٰاَٰلْٰلْٰهَٰہۧ وٍّ୭اَٰنٍٰتّٰـهَٰہۧ 😼💛ֆ"
else
moody = ''
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'تمام' then
if not database:get('bot:rep:mute'..msg.chat_id_) then
moody = "• دِٰوٍّ൭مٍٰ يَٰـﮧﮧاَٰرِٰبٌِٰ 😻🌪ֆ"
else
moody = ''
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'هلاو' then
if not database:get('bot:rep:mute'..msg.chat_id_) then
moody = "• هَٰہۧـہ୪وٍّ୭اَٰتّٰ حٌٰبٌِٰـﮧيَٰ 🤗🌟ֆ"
else
moody = ''
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == '😐' then
if not database:get('bot:rep:mute'..msg.chat_id_) then
moody = "• شَُـبٌِٰيَٰـكٍٰ صُِـﮧﮧاَٰفِٰنٍٰ عٍِّ خّٰاَٰلْٰتّٰـہكٍٰ😹🖤ֆ"
else
moody = ''
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'هاي' then
if not database:get('bot:rep:mute'..msg.chat_id_) then
moody = "• هَٰہۧـاَٰيَٰـﮧﮧاَٰتّٰ يَٰـرِٰوٍّحٌٰـہيَٰ 🙋🏼‍♂💙ֆ"
else
moody = ''
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'بوت' then
if not database:get('bot:rep:mute'..msg.chat_id_) then
moody = "• تّٰفِٰـضـﮧلْٰ حٌٰبٌِٰـہيَٰ 🌚💫ֆ"
else
moody = ''
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'اريد اكبل' then
if not database:get('bot:rep:mute'..msg.chat_id_) then
moody = "• شَُـوٍّ໑فِٰلْٰيَٰ وٍّيَٰـاَٰكٍٰ حٌٰدِٰيَٰـہقٍٰهَٰہۧ وٍّدِٰاَٰيَٰـﮧحٌٰ رِٰسٌٍمٍٰـہيَٰ😾😹💜ֆ"
else
moody = ''
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'لتزحف' then
if not database:get('bot:rep:mute'..msg.chat_id_) then
moody = "• دِٰعٍِّـوٍّ໑فِٰهَٰہۧ زًَاَٰحٌٰـﮧفِٰ عٍِّ خّٰاَٰلْٰـتّٰكٍٰ خّٰـلْٰيَٰ يَٰسٌٍـہتّٰفِٰاَٰدِٰ😾🌈ֆ"
else
moody = ''
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'كلخرا' then
if not database:get('bot:rep:mute'..msg.chat_id_) then
moody = "• خّٰـﮧرِٰاَٰ يَٰتّٰـہرِٰسٌٍ حٌٰلْٰكٍٰـﮧكٍٰ يَٰاَٰخّٰـﮧرِٰاَٰاَٰ💩ֆ"
else
moody = ''
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'زاحف' then
if not database:get('bot:rep:mute'..msg.chat_id_) then
moody = "• زًَاَٰحٌٰـﮧفِٰ عٍِّ اَٰخّٰتّٰـﮧكٍٰ؟ كٍٰضيَٰـﮧتّٰ عٍِّمٍٰرِٰكٍٰ جًِّرِٰجًِّـﮧفِٰ😾😹ֆ"
else
moody = ''
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'دي' then
if not database:get('bot:rep:mute'..msg.chat_id_) then
moody = "• خّٰلْٰيَٰنٍٰـﮧيَٰ اَٰحٌٰبٌِٰـﮧكٍٰ 😾ֆ"
else
moody = ''
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'فرخ' then
if not database:get('bot:rep:mute'..msg.chat_id_) then
moody = "• وٍّيَٰنٍٰـﮧهَٰہۧ؟ خّٰ اَٰحٌٰضـﮧرِٰهَٰہۧ 😾😹ֆ"
else
moody = ''
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'تعالي خاص' then
if not database:get('bot:rep:mute'..msg.chat_id_) then
moody = "• اَٰهَٰہۧـﮧوٍّ໑ ضـﮧلْٰ ضـﮧلْٰ سٌٍـﮧاَٰحٌٰفِٰ كٍٰبٌِٰـﮧرِٰ طَُِمٍٰـہكٍٰ😗😂💚ֆ"
else
moody = ''
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'اكرهك' then
if not database:get('bot:rep:mute'..msg.chat_id_) then
moody = "•دِٰيَٰلْٰـﮧهَٰہۧ شَُـﮧوٍّ୭نٍٰ اَٰطَُِيَٰـقٍٰكٍٰ نٍٰـيَٰ 🙎🏼‍♂🖤ֆ"
else
moody = ''
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'احبك' then
if not database:get('bot:rep:mute'..msg.chat_id_) then
moody = "•حٌٰبٌِٰيَٰبٌِٰـﮧيَٰ وٍّنٍٰـﮧيَٰ هَٰہۧــمٍٰ😻👅ֆ"
else
moody = ''
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'باي' then
if not database:get('bot:rep:mute'..msg.chat_id_) then
moody = "• وٍّيَٰـﮧنٍٰ رِٰاَٰيَٰـہحٌٰ خّٰلْٰيَٰنٍٰـﮧهَٰہۧ مٍٰتّٰوٍّنٍٰسٌٍيَٰـﮧنٍٰ🙁💔ֆ"
else
moody = ''
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'واكف' then
if not database:get('bot:rep:mute'..msg.chat_id_) then
moody = "• بٌِٰنٍٰلْٰخّٰـﮧرِٰاَٰ وٍّيَٰـﮧنٍٰ وٍّاَٰكٍٰـﮧفِٰ😐😒ֆ"
else
moody = ''
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'وين المدير' then
if not database:get('bot:rep:mute'..msg.chat_id_) then
moody = "• لْٰيَٰـﮧشَُ شَُتّٰـﮧرِٰيَٰدِٰ🤔ֆ"
else
moody = ''
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'انجب' then
if not database:get('bot:rep:mute'..msg.chat_id_) then
moody = "• صُِـﮧاَٰرِٰ سٌٍتّٰـﮧاَٰدِٰيَٰ🐸❤️ֆ"
else
moody = ''
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'تحبني' then
if not database:get('bot:rep:mute'..msg.chat_id_) then
moody = "• مٍٰـﮧاَٰدِٰرِٰيَٰ اَٰفِٰكٍٰـﮧرِٰ🙁😹ֆ"
else
moody = ''
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == '🌚' then
if not database:get('bot:rep:mute'..msg.chat_id_) then
moody = "• فِٰـﮧدِٰيَٰتّٰ صُِخّٰـﮧاَٰمٍٰكٍٰ🙊👄ֆ "
else
moody = ''
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == '🙄' then
if not database:get('bot:rep:mute'..msg.chat_id_) then
moody = "• نٍٰـہزًَلْٰ عٍِّيَٰـنٍٰكٍٰ عٍِّيَٰـﮧبٌِٰ🌚😹ֆ"
else
moody = ''
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == '😒' then
if not database:get('bot:rep:mute'..msg.chat_id_) then
moody = "• شَُبٌِٰيَٰـﮧكٍٰ كٍٰاَٰلْٰـﮧبٌِٰ خّٰلْٰقٍٰتّٰـﮧكٍٰ😟🐈ֆ"
else
moody = ''
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == '😳' then
if not database:get('bot:rep:mute'..msg.chat_id_) then
moody = "• هَٰہۧـاَٰ بٌِٰسٌٍ لْٰاَٰ شَُفِٰـﮧتّٰ عٍِّمٍٰتّٰـﮧكٍٰ اَٰلْٰعٍِّـﮧوٍّ໑بٌِٰهَٰہۧ😐😹ֆ"
else
moody = ''
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == '🙁' then
if not database:get('bot:rep:mute'..msg.chat_id_) then
moody = "• تّٰعٍِّـﮧاَٰلْٰ اَٰشَُكٍٰيَٰلْٰـﮧيَٰ هَٰہۧمٍٰوٍّمٍٰـﮧكٍٰ لْٰيَٰـشَُ • ضاَٰيَٰـﮧجًِّ🙁💔ֆ"
else
moody = ''
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == '🚶💔' then
if not database:get('bot:rep:mute'..msg.chat_id_) then
moody = "• تّٰعٍِّـﮧاَٰلْٰ اَٰشَُكٍٰيَٰلْٰـﮧيَٰ هَٰہۧمٍٰوٍّمٍٰـﮧكٍٰ لْٰيَٰـشَُ • ضاَٰيَٰـﮧجًِّ🙁💔ֆ"
else
moody = ''
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == '🙂' then
if not database:get('bot:rep:mute'..msg.chat_id_) then
moody = "• ثِْْكٍٰيَٰـﮧلْٰ نٍٰهَٰہۧنٍٰهَٰہۧنٍٰهَٰہۧنٍٰهَٰہۧ🐛ֆ"
else
moody = ''
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == '🌝' then
if not database:get('bot:rep:mute'..msg.chat_id_) then
moody = "• مٍٰنٍٰـﮧوٍّ໑رِٰ حٌٰبٌِٰـعٍِّمٍٰـہرِٰيَٰ😽💚ֆ"
else
moody = ''
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'صباحو' then
if not database:get('bot:rep:mute'..msg.chat_id_) then
moody = "• صُِبٌِٰاَٰحٌٰـہكٍٰ عٍِّسٌٍـہلْٰ يَٰعٍِّسٌٍـﮧلْٰ😼🤞ֆ"
else
moody = ''
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'صباح الخير' then
if not database:get('bot:rep:mute'..msg.chat_id_) then
moody = "• صُِبٌِٰاَٰحٌٰـہكٍٰ عٍِّسٌٍـہلْٰ يَٰعٍِّسٌٍـﮧلْٰ😼🤞ֆ"
else
moody = ''
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'كفو' then
if not database:get('bot:rep:mute'..msg.chat_id_) then
moody = "• اَٰهَٰہۧ كٍٰفِٰـﮧوٍّ໑ يَٰبٌِٰہوٍّ୭ اَٰلْٰضـلْٰہوٍّ୭عٍِّ😹ֆ"
else
moody = ''
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == '😌' then
if not database:get('bot:rep:mute'..msg.chat_id_) then
moody = "• اَٰلْٰمٍٰطَُِلْٰـﮧوٍّ໑بٌِٰ !😕💞ֆ"
else
moody = ''
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'اها' then
if not database:get('bot:rep:mute'..msg.chat_id_) then
moody = "• يَٰبٌِٰ قٍٰاَٰبٌِٰـﮧلْٰ اَٰغِِٰشَُـﮧكٍٰ شَُسٌٍاَٰلْٰفِٰـﮧهَٰہۧ حٌٰبٌِٰ😐🌝ֆ"
else
moody = ''
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'شسمج' then
if not database:get('bot:rep:mute'..msg.chat_id_) then
moody = "• اَٰسٌٍـمٍٰهَٰہۧـﮧاَٰ جًِّعٍِّجًِّـﮧوٍّ໑عٍِّهَٰہۧ😹👊ֆ"
else
moody = ''
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'شسمك' then
if not database:get('bot:rep:mute'..msg.chat_id_) then
moody = "• اَٰسٌٍمٍٰـﮧهَٰہۧ عٍِّبٌِٰـﮧوٍّ໑سٌٍيَٰ لْٰـوٍّ૭سٌٍہيَٰ😾😹💛ֆ"
else
moody = ''
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'شوف' then
if not database:get('bot:rep:mute'..msg.chat_id_) then
moody = "• شَُشَُـﮧﮧوٍّ໑فِٰ 🌝🌝ֆ"
else
moody = ''
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'مساء الخير' then
if not database:get('bot:rep:mute'..msg.chat_id_) then
moody = "• مٍٰسٌٍـﮧاَٰء اَٰلْٰحٌٰـﮧبٌِٰ يَٰحٌٰہبٌِٰحٌٰہبٌِٰ🌛🔥ֆ"
else
moody = ''
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'المدرسه' then
if not database:get('bot:rep:mute'..msg.chat_id_) then
moody = "• لْٰتّٰجًِّيَٰـﮧبٌِٰ اَٰسٌٍمٍٰـﮧهَٰہۧ لْٰاَٰ اَٰطَُِـﮧرِٰدِٰكٍٰ🌞✨ֆ"
else
moody = ''
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'منو ديحذف رسائلي' then
if not database:get('bot:rep:mute'..msg.chat_id_) then
moody = "• خّٰـﮧاَٰلْٰتّٰـہكٍٰ 🌚ֆ🌝"
else
moody = ''
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'البوت واكف' then
if not database:get('bot:rep:mute'..msg.chat_id_) then
moody = "• لْٰجًِّـﮧذَْبٌِٰ حٌٰبٌِٰـہيَٰ 🌞⚡️ֆ"
else
moody = ''
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'غلس' then
if not database:get('bot:rep:mute'..msg.chat_id_) then
moody = "• وٍّ໑كٍٰ بٌِٰـﮧسٌٍ سٌٍـﮧوٍّ୭لْٰفِٰلْٰيَٰ اَٰلْٰسٌٍـﮧاَٰلْٰفِٰهَٰہۧ بٌِٰعٍِّـﮧدِٰيَٰنٍٰ🌝🦅ֆ"
else
moody = ''
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'حارة' then
if not database:get('bot:rep:mute'..msg.chat_id_) then
moody = "• تّٰسٌٍـہمٍٰطَُِ سٌٍمٍٰـﮧطَُِ غِِٰيَٰـﮧرِٰ يَٰرِٰحٌٰمٍٰنٍٰـﮧهَٰہۧ اَٰلْٰاَٰعٍِّبٌِٰـاَٰدِٰيَٰ وٍّيَٰنٍٰـہطَُِيَٰ عٍِّطَُِلْٰـﮧهَٰہۧ 😾💔ֆ"
else
moody = ''
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'هههه' then
if not database:get('bot:rep:mute'..msg.chat_id_) then
moody = "• نٍٰشَُـﮧاَٰلْٰلْٰهَٰہۧ دِٰاَٰيَٰمٍٰـﮧهَٰہۧ💆🏻‍♂💘ֆ"
else
moody = ''
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'ههههه' then
if not database:get('bot:rep:mute'..msg.chat_id_) then
moody = "• نٍٰشَُـﮧاَٰلْٰلْٰهَٰہۧ دِٰاَٰيَٰمٍٰـﮧهَٰہۧ💆🏻‍♂💘ֆ"
else
moody = ''
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == '😹' then
if not database:get('bot:rep:mute'..msg.chat_id_) then
moody = "• نٍٰشَُـﮧاَٰلْٰلْٰهَٰہۧ دِٰاَٰيَٰمٍٰـﮧهَٰہۧ💆🏻‍♂💘ֆ"
else
moody = ''
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'وين' then
if not database:get('bot:rep:mute'..msg.chat_id_) then
moody = "• بٌِٰـﮧﮧأرِٰض اَٰلْٰلْٰهَٰہۧ اَٰلْٰـہوٍّاَٰسٌٍعٍِّـﮧهَٰہۧ😽💜ֆ"
else
moody = ''
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'كافي لغوة' then
if not database:get('bot:rep:mute'..msg.chat_id_) then
moody = "• كٍٰـيَٰفِٰنٍٰـﮧهَٰہۧ نٍٰتّٰـﮧهَٰہۧ شَُعٍِّـہلْٰيَٰكٍٰ😼👊ֆ"
else
moody = ''
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'نايمين' then
if not database:get('bot:rep:mute'..msg.chat_id_) then
moody = "• اَٰنٍٰـﮧيَٰ سٌٍهَٰہۧـہرِٰاَٰنٍٰ اَٰحٌٰرِٰسٌٍـﮧكٍٰمٍٰ مٍٰـﮧטּ تّٰـرِٰاَٰمٍٰـﮧبٌِٰ😿😹🙌ֆ"
else
moody = ''
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'اكو احد' then
if not database:get('bot:rep:mute'..msg.chat_id_) then
moody = "• يَٰ عٍِّيَٰـنٍٰـﮧيَٰ اَٰنٍٰـہيَٰ مٍٰـوٍّ૭جًِّـﮧوٍّدِٰ🌝✨ֆ"
else
moody = ''
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'فديت' then
if not database:get('bot:rep:mute'..msg.chat_id_) then
moody = "•فِٰـﮧﮧدِٰاَٰكٍٰ/جًِّ ثِْْـﮧوٍّ୪لْٰاَٰنٍٰ اَٰلْٰكٍٰـرِٰوٍّ୭بٌِٰ😟😂💚ֆ"
else
moody = ''
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'شكو' then
if not database:get('bot:rep:mute'..msg.chat_id_) then
moody = "• كٍٰلْٰـشَُـﮧﮧيَٰ مٍٰـہاَٰكٍٰـﮧوٍّ اَٰرِٰجًِّـعٍِّ نٍٰـاَٰمٍٰ🐼🌩ֆ"
else
moody = ''
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'اوف' then
if not database:get('bot:rep:mute'..msg.chat_id_) then
moody = "• هَٰہۧـﮧﮧاَٰيَٰ اَٰوٍّفِٰ مٍٰنٍٰ يَٰـاَٰ نٍٰـوٍّ୭عٍِّ صُِـاَٰرِٰتّٰ اَٰلْٰـسٌٍاَٰلْٰفِٰهَٰہۧ مٍٰتّٰـنٍٰعٍِّرِٰفِٰ🌚🌙ֆ"
else
moody = ''
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'احبج' then
if not database:get('bot:rep:mute'..msg.chat_id_) then
moody = "•جًِّـﮧذَْاَٰبٌِٰ يَٰـرِٰيَٰدِٰ يَٰطَُِـہكٍٰجًِّ😹🌞⚡️ֆ"
else
moody = ''
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'انتة منو' then
if not database:get('bot:rep:mute'..msg.chat_id_) then
moody = "• اَٰنٍٰـﮧﮧيَٰ بٌِٰـوٍّ໑تّٰ💨🌝ֆ"
else
moody = ''
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
------------------------------------ With Pattern -------------------------------------------
	if text:match("^[Ll][Ee][Aa][Vv][Ee]$") and is_sudo(msg) and not tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
if not database:get('bot:leave:groups') then
	chat_leave(msg.chat_id_, bot_id)
send(msg.chat_id_, msg.id_, 1, "_Group_ *Left*", 1, 'md')
else
end
end
---------------
if text == 'سمايلات' and database:get('JOKER:'..bot_id..'lock_geam'..msg.chat_id_) then
database:del('JOKER:'..bot_id..'l:ids'..msg.chat_id_)
katu = {'🍏','🍎','🍐','🍊','🍋','🍌','🍉','🍇','🍓','🍈','🍒','🍑','🍍','🥥','🥝','🍅','🍆','🥑','🥦','🥒','🌶','🌽','🥕','🥔','🍠','🥐','🍞','🥖','🥨','🧀','🥚','🍳','🥞','🥓','🥩','🍗','🍖','🌭','🍔','🍟','🍕','🥪','🥙','🍼','☕️','🍵','🥤','🍶','🍺','🍻','🏀','⚽️','🏈','⚾️','🎾','🏐','🏉','🎱','🏓','🏸','🥅','🎰','🎮','🎳','🎯','🎲','🎻','🎸','🎺','🥁','🎹','🎼','🎧','🎤','🎬','🎨','🎭','🎪','🎟','🎭','🎗','🏵','🎖','🏆','🥌','🛷','🚕','🚗','🚙','🚌','🚎','🏎','🚓','🚑','🚚','🚛','🚜','🇮🇶','⚔','🛡','🔮','🌡','💣','📌','📍','📓','📗','📂','📅','📪','📫','📬','📭','⏰','📺','🎚','☎️','📡'}
name = katu[math.random(#katu)]
database:set('JOKER:'..bot_id..'klmos'..msg.chat_id_,name)
name = string.gsub(name,'🍞','🍞')
name = string.gsub(name,'🥖','🥖')
name = string.gsub(name,'🥨','🥨')
name = string.gsub(name,'🧀','🧀')
name = string.gsub(name,'🥚','🥚')
name = string.gsub(name,'🍳','🍳')
name = string.gsub(name,'🥞','🥞')
name = string.gsub(name,'🥓','🥓')
name = string.gsub(name,'🥩','🥩')
name = string.gsub(name,'🍗','🍗')
name = string.gsub(name,'🍖','🍖')
name = string.gsub(name,'🌭','🌭')
name = string.gsub(name,'🍔','🍔')
name = string.gsub(name,'🍟','🍟')
name = string.gsub(name,'🍕','🍕')
name = string.gsub(name,'🥪','🥪')
name = string.gsub(name,'🥙','🥙')
name = string.gsub(name,'🍼','🍼')
name = string.gsub(name,'☕️','☕️')
name = string.gsub(name,'🍵','🍵')
name = string.gsub(name,'🥤','🥤')
name = string.gsub(name,'🍶','🍶')
name = string.gsub(name,'🍺','🍺')
name = string.gsub(name,'🍏','🍏')
name = string.gsub(name,'??','🍎')
name = string.gsub(name,'🍐','🍐')
name = string.gsub(name,'🍊','🍊')
name = string.gsub(name,'🍋','🍋')
name = string.gsub(name,'🍌','🍌')
name = string.gsub(name,'🍉','🍉')
name = string.gsub(name,'🍇','🍇')
name = string.gsub(name,'🍓','🍓')
name = string.gsub(name,'🍈','🍈')
name = string.gsub(name,'🍒','🍒')
name = string.gsub(name,'🍑','🍑')
name = string.gsub(name,'🍍','🍍')
name = string.gsub(name,'🥥','🥥')
name = string.gsub(name,'🥝','🥝')
name = string.gsub(name,'🍅','🍅')
name = string.gsub(name,'🍆','🍆')
name = string.gsub(name,'🥑','🥑')
name = string.gsub(name,'🥦','🥦')
name = string.gsub(name,'🥒','🥒')
name = string.gsub(name,'🌶','🌶')
name = string.gsub(name,'🌽','🌽')
name = string.gsub(name,'🥕','🥕')
name = string.gsub(name,'🥔','🥔')
name = string.gsub(name,'🍠','🍠')
name = string.gsub(name,'🥐','🥐')
name = string.gsub(name,'🍻','🍻')
name = string.gsub(name,'🏀','🏀')
name = string.gsub(name,'⚽️','⚽️')
name = string.gsub(name,'🏈','🏈')
name = string.gsub(name,'⚾️','⚾️')
name = string.gsub(name,'🎾','🎾')
name = string.gsub(name,'🏐','🏐')
name = string.gsub(name,'🏉','🏉')
name = string.gsub(name,'🎱','🎱')
name = string.gsub(name,'🏓','🏓')
name = string.gsub(name,'🏸','🏸')
name = string.gsub(name,'🥅','🥅')
name = string.gsub(name,'🎰','🎰')
name = string.gsub(name,'🎮','🎮')
name = string.gsub(name,'🎳','🎳')
name = string.gsub(name,'🎯','🎯')
name = string.gsub(name,'🎲','🎲')
name = string.gsub(name,'🎻','🎻')
name = string.gsub(name,'🎸','🎸')
name = string.gsub(name,'🎺','🎺')
name = string.gsub(name,'🥁','🥁')
name = string.gsub(name,'🎹','🎹')
name = string.gsub(name,'🎼','🎼')
name = string.gsub(name,'🎧','🎧')
name = string.gsub(name,'🎤','🎤')
name = string.gsub(name,'🎬','🎬')
name = string.gsub(name,'🎨','🎨')
name = string.gsub(name,'🎭','🎭')
name = string.gsub(name,'🎪','🎪')
name = string.gsub(name,'🎟','🎟')
name = string.gsub(name,'🎫','🎫')
name = string.gsub(name,'🎗','🎗')
name = string.gsub(name,'🏵','🏵')
name = string.gsub(name,'🎖','🎖')
name = string.gsub(name,'🏆','🏆')
name = string.gsub(name,'🥌','🥌')
name = string.gsub(name,'🛷','🛷')
name = string.gsub(name,'🚕','🚕')
name = string.gsub(name,'🚗','🚗')
name = string.gsub(name,'🚙','🚙')
name = string.gsub(name,'🚌','🚌')
name = string.gsub(name,'🚎','🚎')
name = string.gsub(name,'🏎','🏎')
name = string.gsub(name,'🚓','🚓')
name = string.gsub(name,'🚑','🚑')
name = string.gsub(name,'🚚','🚚')
name = string.gsub(name,'🚛','🚛')
name = string.gsub(name,'🚜','🚜')
name = string.gsub(name,'🇮🇶','🇮🇶')
name = string.gsub(name,'⚔','⚔')
name = string.gsub(name,'🛡','🛡')
name = string.gsub(name,'🔮','🔮')
name = string.gsub(name,'🌡','🌡')
name = string.gsub(name,'💣','💣')
name = string.gsub(name,'📌','📌')
name = string.gsub(name,'📍','📍')
name = string.gsub(name,'📓','📒')
name = string.gsub(name,'📗','📗')
name = string.gsub(name,'📂','🗂')
name = string.gsub(name,'📅','📆')
name = string.gsub(name,'📪','📪')
name = string.gsub(name,'📫','📫')
name = string.gsub(name,'📬','📬')
name = string.gsub(name,'📭','📭')
name = string.gsub(name,'⏰','⏰')
name = string.gsub(name,'📺','📺')
name = string.gsub(name,'🎚','🎚')
name = string.gsub(name,'☎️','☎️')
taha = 'اسرع واحد يدز » {`'..name..'`}'
send(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
end

if text == ''..(database:get('JOKER:'..bot_id..'klmos'..msg.chat_id_) or 'لفاتع')..'' and not database:get('JOKER:'..bot_id..'l:ids'..msg.chat_id_) then
if not database:get('JOKER:'..bot_id..'l:ids'..msg.chat_id_) then 
taha = '*📛¦ مبروك فزت \n📬¦ للعب مره اخره ارسل سمايلات*'
send(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
database:incrby('JOKER:'..bot_id..'add:num'..msg.chat_id_..msg.sender_user_id_, 1)  
database:incrby('JOKER:'..bot_id..'add:numall'..msg.chat_id_..msg.sender_user_id_, 1)  

end
database:set('JOKER:'..bot_id..'l:ids'..msg.chat_id_,true)
end 


if text == 'الاسرع' and database:get('JOKER:'..bot_id..'lock_geam'..msg.chat_id_) then
database:del('JOKER:'..bot_id..'l:id'..msg.chat_id_)
katu = {'سحور','سياره','استقبال','قنفه','ايفون','بزونه','مطبخ','كرستيانو','دجاجه','مدرسه','الوان','غرفه','ثلاجه','كهوه','سفينه','العراق','محطه','طياره','رادار','منزل','مستشفى','كهرباء','تفاحه','اخطبوط','سلمون','فرنسا','برتقاله','تفاح','مطرقه','بتيته','لهانه','شباك','باص','سمكه','ذباب','تلفاز','حاسوب','انترنيت','ساحه','جسر'};
name = katu[math.random(#katu)]
database:set('JOKER:'..bot_id..'klmo'..msg.chat_id_,name)
name = string.gsub(name,'سحور','س ر و ح')
name = string.gsub(name,'سياره','ه ر س ي ا')
name = string.gsub(name,'استقبال','ل ب ا ت ق س ا')
name = string.gsub(name,'قنفه','ه ق ن ف')
name = string.gsub(name,'ايفون','و ن ف ا')
name = string.gsub(name,'بزونه','ز و ه ن')
name = string.gsub(name,'مطبخ','خ ب ط م')
name = string.gsub(name,'كرستيانو','س ت ا ن و ك ر ي')
name = string.gsub(name,'دجاجه','ج ج ا د ه')
name = string.gsub(name,'مدرسه','ه م د ر س')
name = string.gsub(name,'الوان','ن ا و ا ل')
name = string.gsub(name,'غرفه','غ ه ر ف')
name = string.gsub(name,'ثلاجه','ج ه ت ل ا')
name = string.gsub(name,'كهوه','ه ك ه و')
name = string.gsub(name,'سفينه','ه ن ف ي س')
name = string.gsub(name,'العراق','ق ع ا ل ر ا')
name = string.gsub(name,'محطه','ه ط م ح')
name = string.gsub(name,'طياره','ر ا ط ي ه')
name = string.gsub(name,'رادار','ر ا ر ا د')
name = string.gsub(name,'منزل','ن ز م ل')
name = string.gsub(name,'مستشفى','ى ش س ف ت م')
name = string.gsub(name,'كهرباء','ر ب ك ه ا ء')
name = string.gsub(name,'تفاحه','ح ه ا ت ف')
name = string.gsub(name,'اخطبوط','ط ب و ا خ ط')
name = string.gsub(name,'سلمون','ن م و ل س')
name = string.gsub(name,'فرنسا','ن ف ر س ا')
name = string.gsub(name,'برتقاله','ر ت ق ب ا ه ل')
name = string.gsub(name,'تفاح','ح ف ا ت')
name = string.gsub(name,'مطرقه','ه ط م ر ق')
name = string.gsub(name,'بتيته','ب ت ت ي ه')
name = string.gsub(name,'لهانه','ه ن ا ه ل')
name = string.gsub(name,'شباك','ب ش ا ك')
name = string.gsub(name,'باص','ص ا ب')
name = string.gsub(name,'سمكه','ك س م ه')
name = string.gsub(name,'ذباب','ب ا ب ذ')
name = string.gsub(name,'تلفاز','ت ف ل ز ا')
name = string.gsub(name,'حاسوب','س ا ح و ب')
name = string.gsub(name,'انترنيت','ا ت ن ر ن ي ت')
name = string.gsub(name,'ساحه','ح ا ه س')
name = string.gsub(name,'جسر','ر ج س')

taha = 'اسرع واحد يرتبها » {'..name..'}'
send(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
end

if text == ''..(database:get('JOKER:'..bot_id..'klmo'..msg.chat_id_) or 'لفاتع')..'' and not database:get('JOKER:'..bot_id..'l:id'..msg.chat_id_) then
if not database:get('JOKER:'..bot_id..'l:id'..msg.chat_id_) then 
taha = '*💎¦ مبروك فزت \n📬¦ للعب مره اخره ارسل الاسرع*'
send(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
database:incrby('JOKER:'..bot_id..'add:num'..msg.chat_id_..msg.sender_user_id_, 1)
database:incrby('JOKER:'..bot_id..'add:numall'..msg.chat_id_..msg.sender_user_id_, 1)    
end
database:set('JOKER:'..bot_id..'l:id'..msg.chat_id_,true)
end 

if text == 'حزوره' and database:get('JOKER:'..bot_id..'lock_geam'..msg.chat_id_) then
database:del('JOKER:'..bot_id..'l:id1'..msg.chat_id_)
katu = {'الجرس','عقرب الساعه','السمك','المطر','5','الكتاب','البسمار','7','الكعبه','بيت الشعر','لهانه','انا','امي','الابره','الساعه','22','غلط','كم الساعه','البيتنجان','البيض','المرايه','الضوء','الهواء','الضل','العمر','القلم','المشط','الحفره','البحر','الثلج','الاسفنج','الصوت','بلم'};
name = katu[math.random(#katu)]
database:set('JOKER:'..bot_id..'klmoa'..msg.chat_id_,name)
name = string.gsub(name,'الجرس','شيئ اذا لمسته صرخ ما هوه ؟')
name = string.gsub(name,'عقرب الساعه','اخوان لا يستطيعان تمضيه اكثر من دقيقه معا فما هما ؟')
name = string.gsub(name,'السمك','ما هو الحيوان الذي لم يصعد الى سفينة نوح عليه السلام ؟')
name = string.gsub(name,'المطر','شيئ يسقط على رأسك من الاعلى ولا يجرحك فما هو ؟')
name = string.gsub(name,'5','ما العدد الذي اذا ضربته بنفسه واضفت عليه 5 يصبح ثلاثين ')
name = string.gsub(name,'الكتاب','ما الشيئ الذي له اوراق وليس له جذور ؟')
name = string.gsub(name,'البسمار','ما هو الشيئ الذي لا يمشي الا بالضرب ؟')
name = string.gsub(name,'7','عائله مؤلفه من 6 بنات واخ لكل منهن .فكم عدد افراد العائله ')
name = string.gsub(name,'الكعبه','ما هو الشيئ الموجود وسط مكة ؟')
name = string.gsub(name,'بيت الشعر','ما هو البيت الذي ليس فيه ابواب ولا نوافذ ؟ ')
name = string.gsub(name,'لهانه','وحده حلوه ومغروره تلبس مية تنوره .من هيه ؟ ')
name = string.gsub(name,'انا','ابن امك وابن ابيك وليس باختك ولا باخيك فمن يكون ؟')
name = string.gsub(name,'امي','اخت خالك وليست خالتك من تكون ؟ ')
name = string.gsub(name,'الابره','ما هو الشيئ الذي كلما خطا خطوه فقد شيئا من ذيله ؟ ')
name = string.gsub(name,'الساعه','ما هو الشيئ الذي يقول الصدق ولكنه اذا جاع كذب ؟')
name = string.gsub(name,'22','كم مره ينطبق عقربا الساعه على بعضهما في اليوم الواحد ')
name = string.gsub(name,'غلط','ما هي الكلمه الوحيده التي تلفض غلط دائما ؟ ')
name = string.gsub(name,'كم الساعه','ما هو السؤال الذي تختلف اجابته دائما ؟')
name = string.gsub(name,'البيتنجان','جسم اسود وقلب ابيض وراس اخظر فما هو ؟')
name = string.gsub(name,'البيض','ماهو الشيئ الذي اسمه على لونه ؟')
name = string.gsub(name,'المرايه','ارى كل شيئ من دون عيون من اكون ؟ ')
name = string.gsub(name,'الضوء','ما هو الشيئ الذي يخترق الزجاج ولا يكسره ؟')
name = string.gsub(name,'الهواء','ما هو الشيئ الذي يسير امامك ولا تراه ؟')
name = string.gsub(name,'الضل','ما هو الشيئ الذي يلاحقك اينما تذهب ؟ ')
name = string.gsub(name,'العمر','ما هو الشيء الذي كلما طال قصر ؟ ')
name = string.gsub(name,'القلم','ما هو الشيئ الذي يكتب ولا يقرأ ؟')
name = string.gsub(name,'المشط','له أسنان ولا يعض ما هو ؟ ')
name = string.gsub(name,'الحفره','ما هو الشيئ اذا أخذنا منه ازداد وكبر ؟')
name = string.gsub(name,'البحر','ما هو الشيئ الذي يرفع اثقال ولا يقدر يرفع مسمار ؟')
name = string.gsub(name,'الثلج','انا ابن الماء فان تركوني في الماء مت فمن انا ؟')
name = string.gsub(name,'الاسفنج','كلي ثقوب ومع ذالك احفض الماء فمن اكون ؟')
name = string.gsub(name,'الصوت','اسير بلا رجلين ولا ادخل الا بالاذنين فمن انا ؟')
name = string.gsub(name,'بلم','حامل ومحمول نصف ناشف ونصف مبلول فمن اكون ؟ ')

taha = 'اول واحد يحلها » {'..name..'}'
send(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
end

if text == ''..(database:get('JOKER:'..bot_id..'klmoa'..msg.chat_id_) or 'لفاتع')..'' and not database:get('JOKER:'..bot_id..'l:id1'..msg.chat_id_) then
if not database:get('JOKER:'..bot_id..'l:id1'..msg.chat_id_) then 
taha = '*💎¦ مبروك فزت \n📬¦ للعب مره اخره ارسل الاسرع*'
send(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
database:incrby('JOKER:'..bot_id..'add:num'..msg.chat_id_..msg.sender_user_id_, 1)
database:incrby('JOKER:'..bot_id..'add:numall'..msg.chat_id_..msg.sender_user_id_, 1)    
end
database:set('JOKER:'..bot_id..'l:id1'..msg.chat_id_,true)
end 


if text =='مجوهراتي' then 
if tonumber((database:get('JOKER:'..bot_id..'add:num'..msg.chat_id_..msg.sender_user_id_) or 0)) == 0 then
taha = '*💎¦ ليس لديك مجوهرات \n📬¦ للحصول على مجوهرات ارسل الاسرع وابدأ اللعب*\n'
send(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
else
taha = '*💎¦ عدد مجوهراتك الحاليه  ('..(database:get('JOKER:'..bot_id..'add:num'..msg.chat_id_..msg.sender_user_id_))..')*'
taha1 = '*💎¦ مجموع مجوهراتك  ('..(database:get('JOKER:'..bot_id..'add:numall'..msg.chat_id_..msg.sender_user_id_))..')*'

send(msg.chat_id_, msg.id_, 1,''..taha..'\n'..taha1..'', 1, 'md')
end
end

if text:match('^رسائل المجوهرات (%d+)$') and is_creator(msg) then
local kara = {string.match(text, "^(رسائل المجوهرات) (%d+)$")}
if tonumber(kara[2]) > 500 or tonumber(kara[2]) < 1 then
msgg = '💎┇لا تستطيع وضع اكثر من 500 رساله ❌ '
send(msg.chat_id_, msg.id_, 1, msgg, 1, 'html')
else
database:set('JOKER:'..bot_id..'gamepoint' .. msg.chat_id_, kara[2] or 50)
send(msg.chat_id_, msg.id_, 1,'💎¦تم اضافه عدد الرسائل المطلوب ✅  ', 1, 'md')
end
end
if text == 'بيع مجوهراتي' then
if tonumber((database:get('JOKER:'..bot_id..'add:num'..msg.chat_id_..msg.sender_user_id_) or 0)) == 0 then
taha = '*💠¦ ليس لديك مجوهرات \n📬¦ للحصول على مجوهرات ارسل الاسرع وابدأ اللعب*\n'
send(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
else
taha = (database:get('JOKER:'..bot_id..'add:num'..msg.chat_id_..msg.sender_user_id_) * tonumber(database:get('JOKER:'..bot_id..'gamepoint' .. msg.chat_id_)or 50))
database:incrby('JOKER:'..bot_id..'nummsg'..msg.chat_id_..msg.sender_user_id_,taha)  
database:del('JOKER:'..bot_id..'add:num'..msg.chat_id_..msg.sender_user_id_)
taha = tonumber((database:get('JOKER:'..bot_id..'gamepoint' .. msg.chat_id_) or 50))
send(msg.chat_id_, msg.id_, 1,'💎¦ تم بيع جواهرك كل مجوهره تساوي '..taha..' رساله', 'md')
end
end


if text == 'تفعيل اللعبه' and is_owner(msg) then   
taha = '*📛¦*تم تفعيل اللعبه  ✔' 
send(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
database:set('JOKER:'..bot_id..'lock_geam'..msg.chat_id_,true)  
end
if text == 'تعطيل اللعبه' and is_owner(msg) then  
taha = '*📛¦*تم تعطيل اللعبه  ❌' 
send(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
database:del('JOKER:'..bot_id..'lock_geam'..msg.chat_id_) 
end
if text == 'تفعيل اللعبه' and is_owner(msg) then  
zain1 = '*🏵┇*لبدء اللعب ارسل امر (الاسرع) او (سمايلات) او (حزوره)'
send(msg.chat_id_, 0, 1, zain1,1, 'md')
end




----------------
if text:match("^الاوامر$") and is_mod(msg) then
local help = redis:get('JOKER:'..bot_id..'help')
local text =  [[
📝┇الآوآمـر آلعآمـهہ‌‏ للمجموعهہ‌‏  ☬
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
👨‍🔧┇م1 ⊰• لعرض اوامر الحمايه

👨‍💻┇م2 ⊰• لعرض اوامر الادمنيه

👨‍🎨┇م3 ⊰• لعرض اوامر المدراء

👨‍✈️┇م4 ⊰• لعرض اوامر المطورين
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🃏┇<a href="https://telegram.me/llJOKERll">Source Joker</a>
]]
send(msg.chat_id_, msg.id_, 1, (help or text), 1, 'html')
end
if (text and text == 'تغير امر م1') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
send(msg.chat_id_, msg.id_, 1, '📥┇الان يمكنك ارسال الكليشه  ليتم حفظها', 1, 'html')
redis:set('JOKER:'..bot_id..'h11'..msg.sender_user_id_..'', 'msg')
return false end
if text:match("^(.*)$") then
local zain2 = redis:get('JOKER:'..bot_id..'h11'..msg.sender_user_id_..'')
if zain2 == 'msg' then
send(msg.chat_id_, msg.id_, 1, '✔┇تم حفظ الكليشه يمكنك اظهارها بارسال الامر', 1, 'html')
redis:set('JOKER:'..bot_id..'h11'..msg.sender_user_id_..'', 'no')
redis:set('JOKER:'..bot_id..'h1', text)
send(msg.chat_id_, msg.id_, 1, text , 1, 'html')
return false end
end
if (text:match("^م1$") or text == "م١") and is_mod(msg) then
local h1 = redis:get('JOKER:'..bot_id..'h1')
local text =  [[
👨‍🔧 ⊰• آوآمر حماية المجموعه
┇ـ➖➖➖➖➖➖➖
🔐┇[ آوآمر لقفل وفتح الحماية ]
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
📮┇[ قفل ~ فتح ] : الروابط
📮┇[ قفل ~ فتح ] : التاك
📮┇[ قفل ~ فتح ] :  الشارحه
📮┇[ قفل ~ فتح ] : المعرف 
📮┇[ قفل ~ فتح ] : التثبيت
📮┇[ قفل ~ فتح ] :  التعديل
📮┇[ قفل ~ فتح ] :  المتحركه
📮┇[ قفل ~ فتح ] :  الصور
📮┇[ قفل ~ فتح ] : الملفات 
📮┇[ قفل ~ فتح ] : الملصقات
📮┇[ قفل ~ فتح ] : الفيديو
📮┇[ قفل ~ فتح ] : الانلاين
📮┇[ قفل ~ فتح ] : الدردشه
📮┇[ قفل ~ فتح ] : التوجيه
📮┇[ قفل ~ فتح ] : الاغاني
📮┇[ قفل ~ فتح ] : الماركدون
📮┇[ قفل ~ فتح ] :  الاشعارات
📮┇[ قفل ~ فتح ] :  الجهات
📮┇[ قفل ~ فتح ] : الصوت
📮┇[ قفل ~ فتح ] : الفارسيه
📮┇[ قفل ~ فتح ] : الانكليزيه
📮┇[ قفل ~ فتح ] : الميديا 
📮┇[ قفل ~ فتح ] : التكرار 
📮┇[ قفل ~ فتح ] : الكلايش
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🃏┇<a href="https://telegram.me/llJOKERll">Source Joker</a>

]]
send(msg.chat_id_, msg.id_, 1, (h1 or text), 1, 'html')
end
if (text and text == 'تغير امر م2') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
send(msg.chat_id_, msg.id_, 1, '📥┇الان يمكنك ارسال الكليشه  ليتم حفظها', 1, 'html')
redis:set('JOKER:'..bot_id..'h22'..msg.sender_user_id_..'', 'msg')
return false end
if text:match("^(.*)$") then
local zain2 = redis:get('JOKER:'..bot_id..'h22'..msg.sender_user_id_..'')
if zain2 == 'msg' then
send(msg.chat_id_, msg.id_, 1, '✔┇تم حفظ الكليشه يمكنك اظهارها بارسال الامر', 1, 'html')
redis:set('JOKER:'..bot_id..'h22'..msg.sender_user_id_..'', 'no')
redis:set('JOKER:'..bot_id..'h2', text)
send(msg.chat_id_, msg.id_, 1, text , 1, 'html')
return false end
end
if (text:match("^م2$") or text == "م٢") and is_mod(msg) then
local h2 = redis:get('JOKER:'..bot_id..'h2')
local text =  [[
👨🏻‍💻 ⊰• اوامر الادمنيه
┇ـ➖➖➖➖➖➖➖
📮┇[ آوآمر الحظر بالرد او بمعرف]
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🗃┇[ طرد بالرد او بالمعرف ] :للطرد
🗃┇[ حظر ~ الغاء الحظر ] :للحظر
🗃┇[ منع ~ الغاء منع ] : + الكلمه 
🗃┇[ كتم ~ الغاء الكتم ] : لكتم العضو بالرد
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
📮┇[ آوآمر الرفع والتنزيل ]  
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🎭┇[ رفع ~ تنزيل ] : ادمن
🎭┇[ رفع ~ تنزيل ]  :  عضو مميز 
🎭┇[ رفع ~ تنزيل ] : المدير 
🎭┇[ رفع ~ تنزيل ]  : المنشى
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
👋🏻┇[ تفعيل ~ تعطيل ] : الترحيب 
🚨┇[ تفعيل ~ تعطيل ] : الابلاغ 
🚨┇[ تعين عدد الابلاغ ] : + العدد 
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
📡┇[ معلومات + ايدي ]
📱┇[ الحساب + ايدي ]
📣┇[ كرر + الكلمه ]
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🗑 ┇[ مسح + الاوامر الادناه ] 
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
⛔┇[ قائمه المنع ]
🔕┇[ المحظورين ]
🔇┇[ المكتومين ]
🗳┇[ القوانين ]
🖇┇[ الرابط ]
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🃏┇<a href="https://telegram.me/llJOKERll">Source Joker</a>

]]
send(msg.chat_id_, msg.id_, 1, (h2 or text), 1, 'html')
end
if (text and text == 'تغير امر م3') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
send(msg.chat_id_, msg.id_, 1, '📥┇الان يمكنك ارسال الكليشه  ليتم حفظها', 1, 'html')
redis:set('JOKER:'..bot_id..'h33'..msg.sender_user_id_..'', 'msg')
return false end
if text:match("^(.*)$") then
local zain2 = redis:get('JOKER:'..bot_id..'h33'..msg.sender_user_id_..'')
if zain2 == 'msg' then
send(msg.chat_id_, msg.id_, 1, '✔┇تم حفظ الكليشه يمكنك اظهارها بارسال الامر', 1, 'html')
redis:set('JOKER:'..bot_id..'h33'..msg.sender_user_id_..'', 'no')
redis:set('JOKER:'..bot_id..'h3', text)
send(msg.chat_id_, msg.id_, 1, text , 1, 'html')
return false end
end
if (text:match("^م3$") or text == "م٣") and is_mod(msg) then
local h3 = redis:get('JOKER:'..bot_id..'h3')
local text =  [[
👨‍🎨 ⊰• آوآمر المنشئين والمدراء
┇ـ➖➖➖➖➖➖➖
📟┇[ وضع ~ تكرار + العدد ] 
📟┇[ وضع ~ زمن التكرار + العدد ] 
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
📬┇[ آوآمر التفعيل و التعطيل ] 
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
📮┇[ الايدي ]
📮┇[ ردود المطور ]
📮┇[ ردود المدير ]
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🗃┇[ تفعيل ~ تعطيل : التثبيت ] 
🗃┇[ تفعيل ~ تعطيل : اطردني ] 
🗃┇[ تفعيل ~ تعطيل : الحظر ] 
🗃┇[ تفعيل ~ تعطيل : الطرد ]
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
📢┇آوآمر خاصة بالمجموعة 
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
♠️┇[ ايدي ]
♠️┇[ جهاتي ]
♠️┇[ تعديلاتي ]
♠️┇[عدد الكروب ] 
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🃏┇<a href="https://telegram.me/llJOKERll">Source Joker</a>

]]
send(msg.chat_id_, msg.id_, 1, (h3 or text), 1, 'html')
end
if (text and text == 'تغير امر م4') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
send(msg.chat_id_, msg.id_, 1, '📥┇الان يمكنك ارسال الكليشه  ليتم حفظها', 1, 'html')
redis:set('JOKER:'..bot_id..'h44'..msg.sender_user_id_..'', 'msg')
return false end
if text:match("^(.*)$") then
local zain2 = redis:get('JOKER:'..bot_id..'h44'..msg.sender_user_id_..'')
if zain2 == 'msg' then
send(msg.chat_id_, msg.id_, 1, '✔┇تم حفظ الكليشه يمكنك اظهارها بارسال الامر', 1, 'html')
redis:set('JOKER:'..bot_id..'h44'..msg.sender_user_id_..'', 'no')
redis:set('JOKER:'..bot_id..'h4', text)
send(msg.chat_id_, msg.id_, 1, text , 1, 'html')
return
false
end
end
if (text:match("^م4$") or text == "م٤") and is_sudo(msg) then
local h4 = redis:get('JOKER:'..bot_id..'h4')
local text =  [[
👨‍✈️ ⊰• آوآمر المطورين 
┇ـ➖➖➖➖➖➖
🔅┇[ تفعيل ~ تعطيل ] 
🔅┇[ ردود المطور ] 
🔅┇[ تغير آمر المطور ] 
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
📝┇[ عدد الكروبات ]
📝┇[ تفعيل ~ تعطيل ] : الاذاعه 
📝┇[ تفعيل ~ تعطيل ] : المغادره 
📝┇[ تغير ~ مسح ] : آمر المطور بالكليشه 
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🗳┇[ اذاعه ]  
🗳┇[ الملفات ]
🗳┇[ تفعيل ملف ] + [ اسم الملف ]
🗳┇[ رفع ~ حذف ]: [ جلب + اسم الملف ]   
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🕵️‍♀️┇[ المطورين ] 
🕵️‍♀️┇[ المدراء ] 
🕵️‍♀️┇[ المنشئين ] 
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
📌┇آوآمر المسح { المطور } 
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🗑┇[ طرد المتروكين ]
🗑┇[ مسح المطورين ]
🗑┇[ مسح الملفات ]
🗑┇[ مسح + عدد : لمسح الرسائل ]
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🃏┇<a href="https://telegram.me/llJOKERll">Source Joker</a>

]]
send(msg.chat_id_, msg.id_, 1, (h4 or text), 1, 'html')
end
if text:match("^source$") or text:match("^اصدار$") or text:match("^الاصدار$") or text:match("^السورس$") or text:match("^سورس$") then

   local text =  [[
🕹┇TEAM JOKER   
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ 
🃏┇لتنصيب سورس الجوكر الجديد


📟┇  طريقه التنصيب في الاسفل •
 
💢┇<a href="https://telegram.me/llJOKERll">اضغط هنا لتنصيب السورس، 🃏" </a>

💢┇<a href="https://telegram.me/llJOKERll">قناه السورس، 🃏" </a>

💢┇<a href="https://telegram.me/JOKER_DEV">قناه شروحات سورس، 🃏" </a>

💢┇<a href="https://telegram.me/joinchat/GLOSYU-MX7igjHDUXmxKcQ">كروب الدعم، 🃏" </a>

]]
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
   end
if text:match("^اريد رابط حذف$") or text:match("^رابط حذف$") or text:match("^رابط الحذف$") or text:match("^الرابط حذف$") or text:match("^اريد رابط الحذف$") then
local text =  [[
🗑┇رابط حذف التلي ، ⬇
‼┇قبل متحذف فكر ولتسرع بالتوفيق حياتي♥'
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🔎┇<a href="https://telegram.org/deactivate">اضغط هنا للحذف الحساب" </a>
]]
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
end
end
function tdcli_update_callback(data)
local chat = {}
if (data.ID == "UpdateNewMessage") then
local Data_JOKER = data
msg = data.message_
text = msg.content_.text_
if database:get('JOKER:'..bot_id.."charge:"..msg.chat_id_) then
if (not is_mod(msg) and not is_vip(msg)) then 
print("»» is member "..msg.sender_user_id_) 
if is_muted(msg.sender_user_id_, msg.chat_id_) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "JOKER"
end
z_JOKER = TSCheckMsg(msg)
if z_JOKER and z_JOKER == "stop" then 
if database:get("lock_lllll:JOKER"..msg.chat_id_..bot_id) then
local hash = 'flood:max:'..bot_id..msg.chat_id_
if not database:get(hash) then
floodMax = 10
else
floodMax = tonumber(database:get(hash))
end
local hash = 'JOKER:'..bot_id..'flood:time:'..msg.chat_id_
if not database:get(hash) then
floodTime = 1
else
floodTime = tonumber(database:get(hash))
end
if not is_vip(msg) then
if bot_id then
if not is_vip(msg) then
local hash = 'flood:'..msg.sender_user_id_..':'..msg.chat_id_..':msg-num'
local msgs = tonumber(database:get(hash) or 0)
if msgs > (floodMax - 1) then
local user = msg.sender_user_id_
local chat = msg.chat_id_
local channel = msg.chat_id_
local user_id = msg.sender_user_id_
local banned = is_banned(user_id, msg.chat_id_)
if banned then
else
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
user_id = msg.sender_user_id_
o = database:get("tsahke:spam:lock:"..os.date("%x")..bot_id..msg.chat_id_)
if (o and (tonumber(o) >= 5)) then
database:set("lock_media:JOKER"..msg.chat_id_..bot_id,"ok")
database:set("lock_audeo:JOKER"..msg.chat_id_..bot_id,"ok")
database:set("lock_video:JOKER"..msg.chat_id_..bot_id,"ok")
database:set("lock_photo:JOKER"..msg.chat_id_..bot_id,"ok")
database:set("lock_stecker:JOKER"..msg.chat_id_..bot_id,"ok")
database:set("lock_voice:JOKER"..msg.chat_id_..bot_id,"ok")
database:set("lock_gif:JOKER"..msg.chat_id_..bot_id,"ok")
database:set("lock_note:JOKER"..msg.chat_id_..bot_id,"ok")
database:set("lock_word:JOKER"..msg.chat_id_..bot_id,"ok")
database:set("lock_mark:JOKER"..msg.chat_id_..bot_id,"ok")
database:set("lock_link:JOKER"..msg.chat_id_..bot_id,"ok")
database:set("lock_new:JOKER"..msg.chat_id_..bot_id,"ok")
database:set('JOKER:'..bot_id..'get:photo'..msg.chat_id_,true)
send(msg.chat_id_, 0, 1, '⚠️┇تم كشف عمليه تخريب في المجموعة \n‼️┇وتم قفل الميديا وسيتم طرد جميع الاشخاص الذين يقومون بعمل تكرار', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '📟┇الايدي ⊰•*('..msg.sender_user_id_..')* \n⚠️┇قمت بعمل تكرار للرسائل المحدده\n✔┇وتم كتمك في المجموعه\n', 1, 'md')
end 
if (o and (tonumber(o) > 5)) then
chat_kick(msg.chat_id_, msg.sender_user_id_)
end
database:incr("tsahke:spam:lock:"..os.date("%x")..bot_id..msg.chat_id_)
database:sadd('JOKER:'..bot_id..'muted:'..msg.chat_id_, msg.sender_user_id_)
end
end
database:setex(hash, floodTime, msgs+1)
end
end
end
end
return "JOKER"
end
end
if data.message_.content_.text_ then   
if database:get("JOKER:edit:text:su:new2:"..bot_id..data.message_.chat_id_..data.message_.content_.text_) then
local JOKER_edit_text = database:get("JOKER:edit:text:su:new2:"..bot_id..data.message_.chat_id_..data.message_.content_.text_)
if JOKER_edit_text then
data.message_.content_.text_ = JOKER_edit_text
end
end
end
local msg = data.message_
text = msg.content_.text_
if is_sudo(msg) then 
if database:get("JOKER:set_if_bc_new:"..bot_id..msg.sender_user_id_) then 
database:del("JOKER:set_if_bc_new:"..bot_id..msg.sender_user_id_)
local pro = database:scard('JOKER:'..bot_id..'pro:groups') or 0
if text then 
local gpss = database:smembers( 'JOKER:'..bot_id.."groups") or 0
for i=1, #gpss do
if not database:sismember('JOKER:'..bot_id..'pro:groups', gpss[i]) then
send(gpss[i], 0, 1, text, 1, 'html')		
end					
end
end
if (data.message_.content_.sticker_) then 
gpss = database:smembers( 'JOKER:'..bot_id.."groups") or 0
for i=1, #gpss do
if not database:sismember('JOKER:'..bot_id..'pro:groups', gpss[i]) then
tdcli.sendSticker(gpss[i], 0,0, 1, nil, data.message_.content_.sticker_.sticker_.persistent_id_)
end
end
elseif (data.message_.content_.voice_) then 
gpss = database:smembers( 'JOKER:'..bot_id.."groups") or 0
for i=1, #gpss do
if not database:sismember('JOKER:'..bot_id..'pro:groups', gpss[i]) then
tdcli.sendVoice(gpss[i], 0,0, 1, nil, data.message_.content_.voice_.voice_.persistent_id_)
end
end
elseif (data.message_.content_.video_) then 
gpss = database:smembers( 'JOKER:'..bot_id.."groups") or 0
for i=1, #gpss do
if not database:sismember('JOKER:'..bot_id..'pro:groups', gpss[i]) then
tdcli.sendVideo(gpss[i], 0,0, 1, nil, data.message_.content_.video_.video_.persistent_id_)
end
end
elseif (data.message_.content_.animation_) then 
gpss = database:smembers( 'JOKER:'..bot_id.."groups") or 0
for i=1, #gpss do
if not database:sismember('JOKER:'..bot_id..'pro:groups', gpss[i]) then
tdcli.sendDocument(gpss[i], 0,0, 1, nil, data.message_.content_.animation_.animation_.persistent_id_)
end
end
elseif (data.message_.content_.document_) then
gpss = database:smembers( 'JOKER:'..bot_id.."groups") or 0
for i=1, #gpss do
if not database:sismember('JOKER:'..bot_id..'pro:groups', gpss[i]) then
tdcli.sendDocument(gpss[i], 0,0, 1, nil, data.message_.content_.document_.document_.persistent_id_)
end
end
elseif (data.message_.content_.photo_) then
local id_zain = nil
if data.message_.content_.photo_.sizes_[0] then
id_zain = data.message_.content_.photo_.sizes_[0].photo_.persistent_id_
end
if data.message_.content_.photo_.sizes_[1] then
id_zain = data.message_.content_.photo_.sizes_[1].photo_.persistent_id_
end
if data.message_.content_.photo_.sizes_[2] then
id_zain = data.message_.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if data.message_.content_.photo_.sizes_[3] then
id_zain = data.message_.content_.photo_.sizes_[3].photo_.persistent_id_
end
gpss = database:smembers( 'JOKER:'..bot_id.."groups") or 0
for i=1, #gpss do
if not database:sismember('JOKER:'..bot_id..'pro:groups', gpss[i]) then
tdcli.sendPhoto(gpss[i], 0, 0, 1, nil, id_zain,(msg.content_.caption_ or " "))
end					
end
end
gpss = database:smembers( 'JOKER:'..bot_id.."groups") or 0
send(msg.chat_id_, msg.id_, 1, '✔┇تم نشر الرساله في {'..(#gpss - pro)..'} مجموعه ', 1, 'md')
end
end
local zain1 = redis:get('JOKER:'..bot_id..'zain1'..msg.sender_user_id_..''..msg.chat_id_..'')
if zain1 == 're' then
local zain2 = redis:get('JOKER:'..bot_id..'msg'..msg.sender_user_id_..''..msg.chat_id_..'')
if text then 
redis:set('JOKER:'..bot_id..'zain'..zain2..''..msg.chat_id_..'', text)
elseif (data.message_.content_.sticker_) then 
redis:set('JOKER:'..bot_id..':sticker:'..zain2..''..msg.chat_id_..'', data.message_.content_.sticker_.sticker_.persistent_id_)
elseif (data.message_.content_.voice_) then 
redis:set('JOKER:'..bot_id..':voice:'..zain2..''..msg.chat_id_..'', data.message_.content_.voice_.voice_.persistent_id_)
elseif (data.message_.content_.video_) then 
redis:set('JOKER:'..bot_id..':video:'..zain2..''..msg.chat_id_..'', data.message_.content_.video_.video_.persistent_id_)
elseif (data.message_.content_.animation_) then 
redis:set('JOKER:'..bot_id..':gif:'..zain2..''..msg.chat_id_..'', data.message_.content_.animation_.animation_.persistent_id_)
elseif (data.message_.content_.document_) then
redis:set('JOKER:'..bot_id..':file:'..zain2..''..msg.chat_id_..'', data.message_.content_.document_.document_.persistent_id_)
else
end -- end if text 
redis:sadd('JOKER:'..bot_id..'zainre'..msg.chat_id_..'', zain2)
send(msg.chat_id_, msg.id_, 1, "✔┇تم حفظ الرد", 1, 'md')
redis:set('JOKER:'..bot_id..'zain1'..msg.sender_user_id_..''..msg.chat_id_..'', 'no')
end
local zain1 = redis:get('JOKER:'..bot_id..'zain1'..msg.sender_user_id_..'')
if zain1 == 're' then
local zain2 = redis:get('JOKER:'..bot_id..'msg'..msg.sender_user_id_..'')
if text then 
redis:set('JOKER:'..bot_id..'zain'..zain2..'', text)
elseif (msg.content_.sticker_) then 
redis:set('JOKER:'..bot_id..':sticker:'..zain2, msg.content_.sticker_.sticker_.persistent_id_)
elseif (msg.content_.voice_) then 
redis:set('JOKER:'..bot_id..':voice:'..zain2, msg.content_.voice_.voice_.persistent_id_)
elseif (msg.content_.video_) then 
redis:set('JOKER:'..bot_id..':video:'..zain2, msg.content_.video_.video_.persistent_id_)
elseif (msg..content_.animation_) then 
redis:set('JOKER:'..bot_id..':gif:'..zain2, data.message_.content_.animation_.animation_.persistent_id_)
elseif (msg.content_.document_) then
redis:set('JOKER:'..bot_id..':file:'..zain2, msg.content_.document_.document_.persistent_id_)
end
redis:sadd('JOKER:'..bot_id..'zainresudo', zain2)
send(msg.chat_id_, msg.id_, 1, "✔┇تم حفظ الرد", 1, 'md')
redis:set('JOKER:'..bot_id..'zain1'..msg.sender_user_id_..'', 'no')
end
--         »»                 Run JOKER                         ««              --
if is_mod(msg) then TSlocks(msg) print("\27[1;34m»» is mod "..msg.sender_user_id_.."\27[m") end
TSall(msg,data)
function check_username(extra,result,success)
local username = (result.username_ or '')
local svuser = 'JOKER:'..bot_id..'user:'..result.id_
if username then
database:hset(svuser, 'username', username)
end
end
getUser(msg.sender_user_id_,check_username)
if msg.content_.ID == "MessageChatAddMembers" then
database:incr('JOKER:'..bot_id..'user:add'..msg.chat_id_..':'..msg.sender_user_id_)
end
if msg.content_.ID == "MessageChatJoinByLink" then
function get_welcome(extra,result,success)
if database:get('JOKER:'..bot_id..'welcome:'..msg.chat_id_) then
text = database:get('JOKER:'..bot_id..'welcome:'..msg.chat_id_)
else
text = '👋🏻┇هلا وغلا  ؛ {fr}\n🙋🏼‍♂️┇نورك مشعشع الگروب @{us}'
end
local text = text:gsub('{fr}',(result.first_name_ or 'لا يوجد'))
local text = text:gsub('{ls}',(result.last_name_ or 'لا يوجد'))
local text = text:gsub('{us}',(result.username_ or 'لا يوجد'))
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
if database:get('JOKER:'..bot_id.."welcome"..msg.chat_id_) then
getUser(msg.sender_user_id_,get_welcome)
end end
if msg.content_.ID == "MessagePinMessage" then
if database:get('JOKER:'..bot_id..'pinnedmsg'..msg.chat_id_) and database:get("lock_pin:JOKER"..msg.chat_id_..bot_id) then
local pin_id = database:get('JOKER:'..bot_id..'pinnedmsg'..msg.chat_id_)
pin(msg.chat_id_,pin_id,0)
end
end
if msg.content_.document_ then
local infooo = database:get("addfiel"..msg.sender_user_id_)
if (infooo and infooo == "yes") then
send(msg.chat_id_, msg.id_, 1, "🗳┇جاري الرفع ..", 1, 'html')
local id_zain = msg.content_.document_.document_.persistent_id_
function download_to_file(url, file_path)
local respbody = {}
local options = {
url = url,
sink = ltn12.sink.table(respbody),
redirect = true
}
local response = nil
options.redirect = false
response = {https.request(options)}
local code = response[2]
local headers = response[3]
local status = response[4]
if code ~= 200 then return false, code end
file = io.open(file_path, "w+")
file:write(table.concat(respbody))
file:close()
return file_path, code
end
local url_zain3 = 'https://api.telegram.org/bot' .. token .. '/getfile?file_id='..id_zain
local zain3 = https.request(url_zain3)
local zain6 = JSON.decode(zain3)
local photo_zain = download_to_file('https://api.telegram.org/file/bot'..token..'/'..zain6.result.file_path, 'files_JOKER/'..msg.content_.document_.file_name_)
send(msg.chat_id_, msg.id_, 1, "✔┇تم رفع الملف بنجاح", 1, 'html')
database:del("addfiel"..msg.sender_user_id_)
end
end
end
TSadd(msg)
if is_gbanned(msg.sender_user_id_, msg.chat_id_) then
chat_kick(msg.chat_id_, msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_})
return
end
if is_gmuted(msg.sender_user_id_, msg.chat_id_) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return
end
if is_sudo(msg) then TSsudo(msg) print("\27[1;32m»» is sudo "..msg.sender_user_id_.."\27[m") end
id = tostring(msg.chat_id_)
if id and id:match('^(%d+)') then
database:sadd('JOKER:'..bot_id.."userss",msg.chat_id_)
end
JOKER_run_file(Data_JOKER)
--         »»                 Start UpdateChat                         ««              --
elseif (data.ID == "UpdateChat") then
chat = data.chat_
chats[chat.id_] = chat
elseif (data.ID == "UpdateMessageEdited") then
local msg = data
function get_msg_contact(extra, result, success)
local text = (result.content_.text_ or result.content_.caption_)
local msgg = result 
database:incr('JOKER:'..bot_id..'user:editmsg'..msgg.chat_id_..':'..msgg.sender_user_id_)
if (not is_vip(msgg) and not text) then 
if database:get("JOKER:lo:edit:new:"..bot_id..msgg.chat_id_) then 
msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs)
end
end
if (result.content_.caption_ and not is_vip(msgg)) then 
if (result.content_.caption_:match("(.*)@(.*)") or result.content_.caption_:match("@")) then 
if database:get("lock_username:JOKER"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) 
end 
end 
end
if (not is_vip(msgg) and text) then
check_filter_words(result, text)
if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or
text:match("[Tt].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or
text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if database:get("lock_link:JOKER"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) end
if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or
text:match("[Tt].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or
text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if database:get("lock_link.note:JOKER"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) end
if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or
text:match("[Tt].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or
text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if database:get("lock_link:JOKER"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) end end
if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or
text:match("[Tt].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or
text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if database:get("lock_link.note:JOKER"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) end end end
if result.id_ and result.content_.text_ then
if not is_vip(msgg) then
check_filter_words(result, text)
if text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Ii][Rr]") or text:match(".[Cc][Oo][Mm]") or text:match(".[Oo][Rr][Gg]") or text:match(".[Ii][Nn][Ff][Oo]") or text:match("[Ww][Ww][Ww].") or text:match(".[Tt][Kk]") then
if database:get("lock_link:JOKER"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs)
end end end 
if not is_vip(msgg) then
check_filter_words(result, text)
if text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Ii][Rr]") or text:match(".[Cc][Oo][Mm]") or text:match(".[Oo][Rr][Gg]") or text:match(".[Ii][Nn][Ff][Oo]") or text:match("[Ww][Ww][Ww].") or text:match(".[Tt][Kk]") then
if database:get("lock_link.note:JOKER"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs)
end end end end end
if result.id_ and result.content_.text_ then
if not is_vip(msgg) then
check_filter_words(result, text)
if text:match("(.*)(@)(.*)") then
if database:get("lock_username:JOKER"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) end end end
if not is_vip(msgg) then
check_filter_words(result, text)
if text:match("@") then
if database:get("lock_username.note:JOKER"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) end end end
if result.id_ and result.content_.text_ then
if not is_vip(msgg) then
check_filter_words(result, text)
if text:match("#") then
if database:get("lock_tag:JOKER"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) end end end
if not is_vip(msgg) then
check_filter_words(result, text)
if text:match("#") then
if database:get("lock_tag.note:JOKER"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) end end end
if not is_vip(msgg) then
check_filter_words(result, text)
if text:match("/")  then
if database:get("lock_sarha:JOKER"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) end end end
if not is_vip(msgg) then
check_filter_words(result, text)
if text:match("/")  then
if database:get("lock_sarha.note:JOKER"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) end end end
if not is_vip(msgg) then
check_filter_words(result, text)
if text:match("[\216-\219][\128-\191]") then
if database:get("lock_ar:JOKER"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) end end end  end
if not is_vip(msgg) then
check_filter_words(result, text)
if text:match("[\216-\219][\128-\191]") then
if database:get("lock_ar.note:JOKER"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) end end end  end
if not is_vip(msgg) then
check_filter_words(result, text)
if text:match("[ASDFGHJKLQWERTYUIOPZXCVBNMasdfghjklqwertyuiopzxcvbnm]") then
if database:get("lock_en:JOKER"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) end end end 
if not is_vip(msgg) then
check_filter_words(result, text)
if text:match("[ASDFGHJKLQWERTYUIOPZXCVBNMasdfghjklqwertyuiopzxcvbnm]") then
if database:get("lock_en.note:JOKER"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) end end end 
if not is_vip(msgg) then
check_filter_words(result, text)
if database:get("lock_edit:JOKER"..msg.chat_id_..bot_id) then
local id = msg.message_id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs) end end end end
getMessage(msg.chat_id_, msg.message_id_,get_msg_contact)
--         »»                 End UpdateChat                          ««              --
elseif (data.ID == "UpdateOption" and data.name_ == "my_id") then
tdcli_function ({ID="GetChats", offset_order_="9223372036854775807", offset_chat_id_=0, limit_=20}, dl_cb, nil)
end
end

--[[
_  _  _  _ ____
    | |/ _ \| |/ / ____|  _ \
 _  | | | | | ' /|  _| | |_) |
| |_| | |_| | . \| |___|  _ <
 \___/ \___/|_|\_\_____|_| \_\

           CH > @llJOKERll
--]]
