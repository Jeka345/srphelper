script_authors("Evgeniy Zolotov")
script_version("1.0")
require ('moonloader')
local vkeys = require 'vkeys'
local sampev = require 'lib.samp.events'
defaultclist = 0
defaulttag = ""
function main()
   repeat wait(0) until isSampAvailable()
   wait(2000)
   sampAddChatMessage(string.format("{7CFC00}[SrpHelper]: {66CDAA}Скрипт был успешно загружен. Автор: {B0C4DE}%s.", table.concat(thisScript().authors, ", ")), 0x20B2AA)
   sampRegisterChatCommand("nick", cnick)
   sampRegisterChatCommand("btrans", banktransfer)
   --sampRegisterChatCommand("tparaugol", ugoldalnoboy)
  -- sampRegisterChatCommand("tparales", lesdalnoboy)
   sampRegisterChatCommand("mfull", mehfullpaket)
   -- sampRegisterChatCommand("helper", otvetinavoprosi)
  -- sampRegisterChatCommand("pchat", profchat)
   --sampRegisterChatCommand("pinv", profinvite)
   --sampRegisterChatCommand("punv", profuninvite)
   sampRegisterChatCommand("fr", advokatchat)
   sampRegisterChatCommand("lvaflood", lvaflooder)
  -- sampRegisterChatCommand("avflood", advokatflood)
   -- sampRegisterChatCommand("cd", givecard) --
   wait(1000)
   sampAddChatMessage("{7CFC00}[SrpHelper]: {4169E1}Специально для проекта: {E0FFFF}Samp-Rp.Ru!", 0x4169E1)
   while true do wait(0)
		if isKeyJustPressed(VK_B) and isKeyCheckAvailable()
		then
			screen()
		end
   end
end

function lvaflooder(arg)
	if arg:find("vost") then
		lua_thread.create(function()
			for line in ReadFile(getWorkingDirectory()..'\\config\\srphelper\\govvostlva.txt'):gmatch('[^\n]+') do
				sampSendChat(line, -1)
				wait(7000)
			end
		end)
	elseif arg:find("contract") then
		--gov1()
		lua_thread.create(function()
			for line in ReadFile(getWorkingDirectory()..'\\config\\srphelper\\govcontractlva.txt'):gmatch('[^\n]+') do
				sampSendChat(line, -1)
				wait(7000)
			end
		end)
	elseif arg:find("invite start") then
		lua_thread.create(function()
			for line in ReadFile(getWorkingDirectory()..'\\config\\srphelper\\govstartpriziv.txt'):gmatch('[^\n]+') do
				sampSendChat(line, -1)
				wait(7000)
			end
		end)
	elseif arg:find("invite prod") then
		lua_thread.create(function()
			for line in ReadFile(getWorkingDirectory()..'\\config\\srphelper\\govprodpriziv.txt'):gmatch('[^\n]+') do
				sampSendChat(line, -1)
				wait(7000)
			end
		end)
	elseif arg:find("invite end") then
		lua_thread.create(function()
			for line in ReadFile(getWorkingDirectory()..'\\config\\srphelper\\govendpriziv.txt'):gmatch('[^\n]+') do
				sampSendChat(line, -1)
				wait(7000)
			end
		end)
	elseif arg:find("invite kpp") then
		lua_thread.create(function()
			for line in ReadFile(getWorkingDirectory()..'\\config\\srphelper\\govkppinvite.txt'):gmatch('[^\n]+') do
				sampSendChat(line, -1)
				wait(7000)
			end
		end)
	elseif arg:find("invite time 1400") then
		lua_thread.create(function()
			for line in ReadFile(getWorkingDirectory()..'\\config\\srphelper\\gov1400invite.txt'):gmatch('[^\n]+') do
				sampSendChat(line, -1)
				wait(7000)
			end
		end)
	elseif arg:find("invite time 1500") then
		lua_thread.create(function()
			for line in ReadFile(getWorkingDirectory()..'\\config\\srphelper\\gov1500invite.txt'):gmatch('[^\n]+') do
				sampSendChat(line, -1)
				wait(7000)
			end
		end)
	elseif arg:find("invite time 1600") then
		lua_thread.create(function()
			for line in ReadFile(getWorkingDirectory()..'\\config\\srphelper\\gov1600invite.txt'):gmatch('[^\n]+') do
				sampSendChat(line, -1)
				wait(7000)
			end
		end)
	elseif arg:find("invite time 1700") then
		lua_thread.create(function()
			for line in ReadFile(getWorkingDirectory()..'\\config\\srphelper\\gov1700invite.txt'):gmatch('[^\n]+') do
				sampSendChat(line, -1)
				wait(7000)
			end
		end)
	elseif arg:find("invite time 1800") then
		lua_thread.create(function()
			for line in ReadFile(getWorkingDirectory()..'\\config\\srphelper\\gov1800invite.txt'):gmatch('[^\n]+') do
				sampSendChat(line, -1)
				wait(7000)
			end
		end)
	elseif arg:find("invite time 1900") then
		lua_thread.create(function()
			for line in ReadFile(getWorkingDirectory()..'\\config\\srphelper\\gov1900invite.txt'):gmatch('[^\n]+') do
				sampSendChat(line, -1)
				wait(7000)
			end
		end)
	else
		sampShowDialog(1, "{90EE90}Ключи команды {66CDAA}lvaflood", "/lvaflood vost - восстановление бойцов\n/lvaflood contract - контракты лва\n"..
		"/lvaflood invite start - призыв военкомат начат\n/lvaflood invite prod - призыв военкомат продолжается\n/lvaflood invite end - призыв военкомат закончен\n"..
		"/lvaflood invite kpp - призыв через кпп\n\n----------- Призывы по времени -------\n\n/lvaflood invite time 1400 - призыв в 14:00 военкомат\n"..
		"/lvaflood invite time 1500 - призыв в 15:00 военкомат\n/lvaflood invite time 1600 - призыв в 16:00 военкомат\n"..
		"/lvaflood invite time 1700 - призыв в 17:00 военкомат\n/lvaflood invite time 1800 - призыв в 18:00 военкомат\n/lvaflood invite time 1900 - призыв в 19:00 военкомат\n", "ОК", nil, DIALOG_STYLE_MSGBOX)
	end
end

ReadFile = function(file)
    local F = io.open(file, 'r')
    local Text = F:read('*all')
    F:close()
    return Text
end

function givecard(arg)
	if arg ~= "" then
		if sampIsPlayerConnected(arg) then
				sampSendChat("/postcard give "..arg.."")
		else
			sampAddChatMessage("[SrpHelper - givecard]: {90EE90}Невозможно выдать открытку игроку которого нет в сети", 0x01A0E9)
		end
	else
		sampShowDialog(1, "Помощь по скрипту (Script help)", "{90EE90}Используйте {B0C4DE}/cd id для дачи открытки\n\n{66CDAA}Usage {B0C4DE}/cd id", "ОК", "Отмена", DIALOG_STYLE_MSGBOX)
	end
end

function cnick(arg)
	if arg ~= "" then
		if sampIsPlayerConnected(arg) then
			name = sampGetPlayerNickname(arg) -- РїРѕР»СѓС‡Р°РµРј nickname РёРіСЂРѕРєР° РїРѕ СЂР°РЅРµРµ РїРѕР»СѓС‡РµРЅРЅРѕРјСѓ ID.
			rpnick = string.gsub(name, "_", " ")
			print(name) -- Р’С‹РІРѕРґРёРј nickname РІ РєРѕРЅСЃРѕР»СЊ Sampfuncs.
			sampAddChatMessage(string.format("[SrpHelper - Copy Nick Name]: {90EE90}Ник игрока: {66CDAA}%s, {B0C4DE}скопирован.", rpnick), 0x01A0E9)
			setClipboardText(rpnick)
		else
			sampAddChatMessage("[SrpHelper - Copy Nick Name]: {90EE90}Невозможно скопировать ник игрока которого нет в сети", 0x01A0E9)
		end
	else
		sampShowDialog(1, "Помощь по скрипту (Script help)", "{90EE90}Используйте {B0C4DE}/nick id для копирование ника\n\n{66CDAA}Usage {B0C4DE}/nick id on copy nickname", "ОК", "Отмена", DIALOG_STYLE_MSGBOX)
	end
end

function makeScreenshot(disable) -- если передать true, интерфейс и чат будут скрыты
    if disable then 
		displayHud(false) 
		sampSetChatDisplayMode(0) 
	end
    require('memory').setuint8(sampGetBase() + 0x119CBC, 1)
    if disable then 
		displayHud(true) 
		sampSetChatDisplayMode(2) 
	end
end

function screen()
	lua_thread.create(function()
		sampSendChat("/time")
		wait(2000)
		makeScreenshot()
	end)
end

function mehfullpaket(arg)
	if arg ~= "" then
		if sampIsPlayerConnected(arg) then
			lua_thread.create(function()
				sampSendChat("/refill "..arg.."")
				wait(2000)
				sampSendChat("/repair "..arg.."")
				wait(2000)
				sampSendChat("Спасибо за приобретение фулл пакета, удачи!")
			end)
		else
			sampAddChatMessage("[SrpHelper - Mehanic]: {90EE90}Невозможно предложить полный пакет игроку которого нет в сети", 0x01A0E9)
		end
	else
		sampShowDialog(1, "Помощь по скрипту (Script help)", "{90EE90}Используйте {B0C4DE}/mfull id для предложения полного пакета\n\n{66CDAA}Usage {B0C4DE}/mfull id", "ОК", "Отмена", DIALOG_STYLE_MSGBOX)
	end
end

function profchat(arg)
	if arg ~= "" then
		sampSendChat("/jf chat "..arg.."")
	else
		sampShowDialog(1, "Помощь по скрипту (Script help)", "{90EE90}Используйте {B0C4DE}/pchat text для отправки сообщения в чат профсоюза\n\n{66CDAA}Usage {B0C4DE}/pchat text", "ОК", "Отмена", DIALOG_STYLE_MSGBOX)
	end
end

function profinvite(arg)
	if arg ~= "" then
		sampSendChat("/jf addMember LEGACY_TRUCKERS1 "..arg.."")
	else
		sampShowDialog(1, "Помощь по скрипту (Script help)", "{90EE90}Используйте {B0C4DE}/pinv ID для принятия в чат профсоюза\n\n{66CDAA}Usage {B0C4DE}/pinv ID", "ОК", "Отмена", DIALOG_STYLE_MSGBOX)
	end
end

function profuninvite(arg)
	if arg ~= "" then
		sampSendChat("/jf dellMember LEGACY_TRUCKERS1 "..arg.."")
	else
		sampShowDialog(1, "Помощь по скрипту (Script help)", "{90EE90}Используйте {B0C4DE}/punv ID для исключения из чата профсоюза\n\n{66CDAA}Usage {B0C4DE}/punv ID", "ОК", "Отмена", DIALOG_STYLE_MSGBOX)
	end
end

function advokatchat(arg)
	if arg ~= "" then
		sampSendChat("/r "..defaulttag.." |: "..arg.."")
	else
		sampShowDialog(1, "Помощь по скрипту (Script help)", "{90EE90}Используйте {B0C4DE}/fr text для отправки сообщения в чат с тэгом\n\n{66CDAA}Usage {B0C4DE}/fr text", "ОК", "Отмена", DIALOG_STYLE_MSGBOX)
	end
end

function advokatflood()
	lua_thread.create(function()
               sampAddChatMessage("[SrpHelper - Флудер для адвокатов]: {90EE90}Через 5 секунд будет {B0C4DE}запущен флудер!", 0x01A0E9)
				wait(5000)
				sampSendChat("/do на груди бейджик с гравировкой сотрудник ФПА - Jeka Rep")
				wait(3000)
				sampSendChat("Я предоставляю юридическую помощь гражданам штата.")
				wait(3000)
				sampSendChat("Могу оформить ваше дело под залог.")
				wait(4000)
				sampSendChat("Назовите номер вашего дела и причину ареста.")
				wait(3000)
				sampSendChat("Передайте пожалуйста ваши документы")
				wait(3000)
				sampSendChat("/b /showpass id")
				wait(2000)
				sampAddChatMessage("[SrpHelper - Флудер для адвокатов]: {B0C4DE}Сообщения в чат отправлены!", 0x01A0E9)
       end)
end

function lesdalnoboy()
	lua_thread.create(function()
               sampAddChatMessage("[SrpHelper - Trucker Fludder]: {90EE90}Через 15 секунд будет {B0C4DE}запущен флудер!", 0x01A0E9)
				wait(15000)
				sampSendChat("/f [TFludder]: ------------ Внимание! ------------")
				wait(3000)
				sampSendChat("/f [TFludder]: Сегодня возим лес в парах просьба в одиночку не брать!")
				wait(3000)
				sampSendChat("/f [TFludder]: Уголь и Нефть разрешается возить в соло!")
				wait(4000)
				sampSendChat("/f [TFludder]: Еще кое-что важное напишу!")
				wait(3000)
				sampSendChat("/f [TFludder]: Нельзя сдавать груз если в другом порту 900 вирт")
				wait(3000)
				sampSendChat("/f [TFludder]: При сдаче по 700 вирт автоматическии ломается цена на -100 вирт!")
				wait(2000)
				sampSendChat("/f [TFludder]: Сообщение выше не действует на сломанные цены (те когда в портах...")
				wait(2000)
				sampSendChat("/f [TFludder]: ...цены 500 / 600, 600 / 600, 600 / 700, 700 / 700)")
				wait(3000)
				sampSendChat("/f [TFludder]: ------------ Спасибо за внимание! ------------")
				wait(2000)
				sampAddChatMessage("[SrpHelper - Trucker Fludder]: {B0C4DE}Сообщения в чат отправлены!", 0x01A0E9)
       end)
end

function ugoldalnoboy()
	lua_thread.create(function()
               sampAddChatMessage("[SrpHelper - Trucker Fludder]: {90EE90}Через 15 секунд будет {B0C4DE}запущен флудер", 0x01A0E9)
				wait(15000)
				sampSendChat("/f [TFludder]: ------------ Внимание! ------------")
				wait(2000)
				sampSendChat("/f [TFludder]: Сегодня возим уголь в парах просьба в одиночку не брать!")
				wait(2000)
				sampSendChat("/f [TFludder]: Лес и нефть разрешается возить в соло!")
				wait(4000)
				sampSendChat("/f [TFludder]: Еще кое что важное напишу!")
				wait(2000)
				sampSendChat("/f [TFludder]: Нельзя сдавать груз если в другом порту 900 вирт")
				wait(2000)
				sampSendChat("/f [TFludder]: При сдаче по 700 вирт автоматическии ломается цена на -100 вирт!")
				wait(2000)
				sampSendChat("/f [TFludder]: Сообщение выше не действует на сломанные цены (те когда в портах...")
				wait(2000)
				sampSendChat("/f [TFludder]: ...цены 500 / 600, 600 / 600, 600 / 700, 700 / 700)")
				wait(2000)
				sampSendChat("/f [TFludder]: ------------ Спасибо за внимание! ------------")
				wait(2000)
				sampAddChatMessage("[SrpHelper - Trucker Fludder]: {B0C4DE}Сообщения в чат отправлены!", 0x01A0E9)
       end)
end

function otvetinavoprosi()
	lua_thread.create(function()
               sampAddChatMessage("[SrpHelper - Trucker Fludder]: {90EE90}Через 15 секунд будет {B0C4DE}запущен флудер", 0x01A0E9)
				wait(15000)
				sampSendChat("/f [TFludder]: ------------ Ответы на часто задаваемые вопросы ниже! ------------")
				wait(2000)
				sampSendChat("/f [TFludder]: КД - время ожидания между загрузкой и выгрузкой груза")
				wait(3000)
				sampSendChat("/f [TFludder]: ХУД - это то что позволяет возить новичкам в паре, извоз в паре...")
				wait(2000)
				sampSendChat("/f ...без худа до 20 скилла по желанию пары!")
				wait(2000)
				sampSendChat("/f [TFludder]: ПАРА - один человек из пары едет на у1, второй человек едет на у2")
				wait(3000)
				sampSendChat("/f ,с другими складами аналогично!")
				wait(4000)
				sampSendChat("/f [TFludder]: Где взять худ? в группе vk rubin mods, рекомендуется всем...")
				wait(2000)
				sampSendChat("/f ...(кроме 30+ скиллов)")
				wait(2000)
				sampSendChat("/f [TFludder]: ------------ Спасибо за внимание! ------------")
				wait(2000)
				sampAddChatMessage("[SrpHelper - Trucker Fludder]: {B0C4DE}Сообщения в чат отправлены!", 0x01A0E9)
       end)
end

function banktransfer(arg)
	if arg:find('(.+) (.+)') then
		arg1, arg2 = arg:match('(.+) (.+)')
		if arg1 ~= "" then
			if sampIsPlayerConnected(arg1) then
				name = sampGetPlayerNickname(arg1) -- РїРѕР»СѓС‡Р°РµРј nickname РёРіСЂРѕРєР° РїРѕ СЂР°РЅРµРµ РїРѕР»СѓС‡РµРЅРЅРѕРјСѓ ID.
				sampSendChat("/transfer "..name.." "..arg2.."")
				sampAddChatMessage(string.format("[SrpHelper - Bank Transfer]: {90EE90}Деньги игроку %s переведы в сумме {B0C4DE}%d вирт(а)", name, tonumber(arg2)), 0x01A0E9)
			else
				sampAddChatMessage("[SrpHelper - Bank Transfer]: {90EE90}Перевод игроку который находится не в сети невозможен", 0x01A0E9)
			end
		end
	else
		sampShowDialog(1, "Помощь по скрипту (Script help)", "{90EE90}Используйте {B0C4DE}/btrans id summa для перевода\n\n{66CDAA}Usage {B0C4DE}/btrans id summa on transfer money", "ОК", "Отмена", DIALOG_STYLE_MSGBOX)
	end
end

function isKeyCheckAvailable()
	if not isSampLoaded() then
		return true
	end
	if not isSampfuncsLoaded() then
		return not sampIsChatInputActive() and not sampIsDialogActive()
	end
	return not sampIsChatInputActive() and not sampIsDialogActive() and not isSampfuncsConsoleActive()
end

function sampev.onServerMessage(color, text)
	lua_thread.create(function()
		if text:find("Рабочий день начат") 
		then
			sampSendChat("/r "..defaulttag.."10-8")
			wait(1400)
			sampSendChat("/clist "..defaultclist.."")
		end
		-- and ('SMS: срок (%A). Отправитель: (.+)')	and ('SMS: срок. Отправитель: (.+)') and ('SMS: (%A) срок (%A). Отправитель: (.+)')
		--  and text:match('срок (%A).') and text:match('срок.') and text:match('(%A) срок (%A).')
		if text:find('SMS: срок. Отправитель: (.+)') then
			local price = text:match('срок.')
			local nicks = text:match("Отправитель: (.+)%[(%d+)]")
			local id = text:match("%[(%d+)]")
			sampSendChat("/t "..id.." Не повышаем, ожидай 20:00")
			sampAddChatMessage(price, 0x01A0E9)
		elseif text:find('SMS: срок .+%. Отправитель: (.+)') then
			local price = text:match('срок .+%.')
			local nicks = text:match("Отправитель: (.+)%[(%d+)]")
			local id = text:match("%[(%d+)]")
			sampSendChat("/t "..id.." Не повышаем, ожидай 20:00")
			sampAddChatMessage(price, 0x01A0E9)
		elseif text:find('SMS: .+% срок .+%. Отправитель: (.+)') then
			local price = text:match('.+% срок .+%.')
			local nicks = text:match("Отправитель: (.+)%[(%d+)]")
			local id = text:match("%[(%d+)]")
			sampSendChat("/t "..id.." Не повышаем, ожидай 20:00")
			sampAddChatMessage(price, 0x01A0E9)
		elseif text:find('SMS: .+% срок. Отправитель: (.+)') then
			local price = text:match('.+% срок.')
			local nicks = text:match("Отправитель: (.+)%[(%d+)]")
			local id = text:match("%[(%d+)]")
			sampSendChat("/t "..id.." Не повышаем, ожидай 20:00")
			sampAddChatMessage(price, 0x01A0E9)
		end
	end)
	return {color, text}
end