script_name('SkupChik')
script_authors('Mayako')
script_description('Script dlya Baryg na Arizone RPG')
script_version(0.1)

require("lib.moonloader")
require 'sampfuncs'
local inicfg = require ('inicfg')
local fa = require 'fAwesome5'
local sampev = require 'samp.events'
local vk = require "vkeys"
local imgui = require "imgui"
local encoding = require 'encoding'
encoding.default = 'CP1251'
u8 = encoding.UTF8

function apply_custom_style()
	imgui.SwitchContext()
	local style = imgui.GetStyle()
	local colors = style.Colors
	local clr = imgui.Col
	local ImVec4 = imgui.ImVec4
	style.WindowRounding = 5.0
	style.WindowTitleAlign = imgui.ImVec2(0.5, 0.84)
	style.ChildWindowRounding = 2.0
	style.FrameRounding = 2.0
	style.ItemSpacing = imgui.ImVec2(5.0, 4.0)
	style.ScrollbarSize = 10.0
	style.ScrollbarRounding = 1
	style.GrabMinSize = 8.0
	style.GrabRounding = 1.0
	colors[clr.Text]                   = ImVec4(1.00, 1.00, 1.00, 1.00)
	colors[clr.TextDisabled]           = ImVec4(0.50, 0.50, 0.50, 1.00)
	colors[clr.WindowBg]               = ImVec4(0.06, 0.06, 0.06, 0.94)
	colors[clr.ChildWindowBg]          = ImVec4(1.00, 1.00, 1.00, 0.00)
	colors[clr.PopupBg]                = ImVec4(0.08, 0.08, 0.08, 0.94)
	colors[clr.ComboBg]                = colors[clr.PopupBg]
	colors[clr.Border]                 = ImVec4(0.43, 0.43, 0.50, 0.50)
	colors[clr.BorderShadow]           = ImVec4(0.00, 0.00, 0.00, 0.00)
	colors[clr.FrameBg]                = ImVec4(0.16, 0.29, 0.48, 0.54)
	colors[clr.FrameBgHovered]         = ImVec4(0.26, 0.59, 0.98, 0.40)
	colors[clr.FrameBgActive]          = ImVec4(0.26, 0.59, 0.98, 0.67)
	colors[clr.TitleBg]                = ImVec4(0.04, 0.04, 0.04, 1.00)
	colors[clr.TitleBgActive]          = ImVec4(0.16, 0.29, 0.48, 1.00)
	colors[clr.TitleBgCollapsed]       = ImVec4(0.00, 0.00, 0.00, 0.51)
	colors[clr.MenuBarBg]              = ImVec4(0.14, 0.14, 0.14, 1.00)
	colors[clr.ScrollbarBg]            = ImVec4(0.02, 0.02, 0.02, 0.53)
	colors[clr.ScrollbarGrab]          = ImVec4(0.31, 0.31, 0.31, 1.00)
	colors[clr.ScrollbarGrabHovered]   = ImVec4(0.41, 0.41, 0.41, 1.00)
	colors[clr.ScrollbarGrabActive]    = ImVec4(0.51, 0.51, 0.51, 1.00)
	colors[clr.CheckMark]              = ImVec4(0.26, 0.59, 0.98, 1.00)
	colors[clr.SliderGrab]             = ImVec4(0.24, 0.52, 0.88, 1.00)
	colors[clr.SliderGrabActive]       = ImVec4(0.26, 0.59, 0.98, 1.00)
	colors[clr.Button]                 = ImVec4(0.26, 0.59, 0.98, 0.40)
	colors[clr.ButtonHovered]          = ImVec4(0.26, 0.59, 0.98, 1.00)
	colors[clr.ButtonActive]           = ImVec4(0.06, 0.53, 0.98, 1.00)
	colors[clr.Header]                 = ImVec4(0.26, 0.59, 0.98, 0.31)
	colors[clr.HeaderHovered]          = ImVec4(0.26, 0.59, 0.98, 0.80)
	colors[clr.HeaderActive]           = ImVec4(0.26, 0.59, 0.98, 1.00)
	colors[clr.Separator]              = colors[clr.Border]
	colors[clr.SeparatorHovered]       = ImVec4(0.26, 0.59, 0.98, 0.78)
	colors[clr.SeparatorActive]        = ImVec4(0.26, 0.59, 0.98, 1.00)
	colors[clr.ResizeGrip]             = ImVec4(0.26, 0.59, 0.98, 0.25)
	colors[clr.ResizeGripHovered]      = ImVec4(0.26, 0.59, 0.98, 0.67)
	colors[clr.ResizeGripActive]       = ImVec4(0.26, 0.59, 0.98, 0.95)
	colors[clr.CloseButton]            = ImVec4(0.41, 0.41, 0.41, 0.50)
	colors[clr.CloseButtonHovered]     = ImVec4(0.98, 0.39, 0.36, 1.00)
	colors[clr.CloseButtonActive]      = ImVec4(0.98, 0.39, 0.36, 1.00)
	colors[clr.PlotLines]              = ImVec4(0.61, 0.61, 0.61, 1.00)
	colors[clr.PlotLinesHovered]       = ImVec4(1.00, 0.43, 0.35, 1.00)
	colors[clr.PlotHistogram]          = ImVec4(0.90, 0.70, 0.00, 1.00)
	colors[clr.PlotHistogramHovered]   = ImVec4(1.00, 0.60, 0.00, 1.00)
	colors[clr.TextSelectedBg]         = ImVec4(0.26, 0.59, 0.98, 0.35)
	colors[clr.ModalWindowDarkening]   = ImVec4(0.80, 0.80, 0.80, 0.35)
end
apply_custom_style()

local path = getWorkingDirectory() .. "\\SkupChik"
if not doesDirectoryExist(path) then
	createDirectory(path)
end
local path = getWorkingDirectory() .. "\\SkupChik\\img"
if not doesDirectoryExist(path) then
	createDirectory(path)
end
local path = getWorkingDirectory() .. "\\SkupChik\\settings"
if not doesDirectoryExist(path) then
	createDirectory(path)
end
local path_ini = '..\\SkupChik\\settings\\skupka.ini'
local mainIni = inicfg.load({
    config = {
		bruletka = false,
		brulkol = 0,
		brulchena = 0,
		sruletka = false,
		srulkol = 0,
		srulchena = 0,
		zruletka = false,
		zrulkol = 0,
		zrulchena = 0,
		pruletka = false,
		prulkol = 0,
		prulchena = 0,
		famtalon = false,
		famtalonkol = 0,
		famtalonchena = 0,
		podarok = false,
		podarokkol = 0,
		podarokchena = 0,
		grazhdan = false,
		grazhdankol = 0,
		grazhdanchena = 0,
		skidok = false,
		skidokkol = 0,
		skidokchena = 0,
		tochilka = false,
		tochilkakol = 0,
		tochilkachena = 0,
		kamen = false,
		kamenkol = 0,
		kamenchena = 0,
		metal = false,
		metalkol = 0,
		metalchena = 0,
		serebro = false,
		serebrokol = 0,
		serebrochena = 0,
		zoloto = false,
		zolotokol = 0,
		zolotochena = 0,
		bronza = false,
		bronzakol = 0,
		bronzachena = 0,
		len = false,
		lenkol = 0,
		lenchena = 0,
		hlopok = false,
		hlopokkol = 0,
		hlopokchena = 0,
		jizzy = false,
		jizzykol = 0,
		jizzychena = 0,
		binco = false,
		bincokol = 0,
		bincochena = 0,
		cbell = false,
		cbellkol = 0,
		cbellchena = 0,
		totmichka = false,
		totmichkakol = 0,
		totmichkachena = 0,
		tushkaolen = false,
		tushkaolenkol = 0,
		tushkaolenchena = 0,
		delayskup = 10 
    }
},path_ini)

function saveIniFile()
    local inicfgsaveparam = inicfg.save(mainIni,path_ini)
end
saveIniFile()

local tag = "{0A6EEA}[SkupChik for Arizona RP]: {FFFFFF}"
local main_window_state = imgui.ImBool(false)
local main_window_state_2 = imgui.ImBool(false)
local author = 'Автор скрипта: Mayako'
local selected = 1

bruletka = imgui.ImBool(mainIni.config.bruletka)
brulkolvo = imgui.ImBuffer(''..mainIni.config.brulkol, 20)
brulchena = imgui.ImBuffer(''..mainIni.config.brulchena, 20)

sruletka = imgui.ImBool(mainIni.config.sruletka)
srulkolvo = imgui.ImBuffer(''..mainIni.config.srulkol, 20)
srulchena = imgui.ImBuffer(''..mainIni.config.srulchena, 20)

zruletka = imgui.ImBool(mainIni.config.zruletka)
zrulkolvo = imgui.ImBuffer(''..mainIni.config.zrulkol, 20)
zrulchena = imgui.ImBuffer(''..mainIni.config.zrulchena, 20)

pruletka = imgui.ImBool(mainIni.config.pruletka)
prulkolvo = imgui.ImBuffer(''..mainIni.config.prulkol, 20)
prulchena = imgui.ImBuffer(''..mainIni.config.prulchena, 20)

famtalon = imgui.ImBool(mainIni.config.famtalon)
famtalonkolvo = imgui.ImBuffer(''..mainIni.config.famtalonkol, 20)
famtalonchena = imgui.ImBuffer(''..mainIni.config.famtalonchena, 20)

podarok = imgui.ImBool(mainIni.config.podarok)
podarokkolvo = imgui.ImBuffer(''..mainIni.config.podarokkol, 20)
podarokchena = imgui.ImBuffer(''..mainIni.config.podarokchena, 20)

grazhdan = imgui.ImBool(mainIni.config.grazhdan)
grazhdankolvo = imgui.ImBuffer(''..mainIni.config.grazhdankol, 20)
grazhdanchena = imgui.ImBuffer(''..mainIni.config.grazhdanchena, 20)

skidok = imgui.ImBool(mainIni.config.skidok)
skidokkolvo = imgui.ImBuffer(''..mainIni.config.skidokkol, 20)
skidokchena = imgui.ImBuffer(''..mainIni.config.skidokchena, 20)

tochilka = imgui.ImBool(mainIni.config.tochilka)
tochilkakolvo = imgui.ImBuffer(''..mainIni.config.tochilkakol, 20)
tochilkachena = imgui.ImBuffer(''..mainIni.config.tochilkachena, 20)

kamen = imgui.ImBool(mainIni.config.kamen)
kamenkolvo = imgui.ImBuffer(''..mainIni.config.kamenkol, 20)
kamenchena = imgui.ImBuffer(''..mainIni.config.kamenchena, 20)

metal = imgui.ImBool(mainIni.config.metal)
metalkolvo = imgui.ImBuffer(''..mainIni.config.metalkol, 20)
metalchena = imgui.ImBuffer(''..mainIni.config.metalchena, 20)

serebro = imgui.ImBool(mainIni.config.serebro)
serebrokolvo = imgui.ImBuffer(''..mainIni.config.serebrokol, 20)
serebrochena = imgui.ImBuffer(''..mainIni.config.serebrochena, 20)

zoloto = imgui.ImBool(mainIni.config.zoloto)
zolotokolvo = imgui.ImBuffer(''..mainIni.config.zolotokol, 20)
zolotochena = imgui.ImBuffer(''..mainIni.config.zolotochena, 20)

bronza = imgui.ImBool(mainIni.config.bronza)
bronzakolvo = imgui.ImBuffer(''..mainIni.config.bronzakol, 20)
bronzachena = imgui.ImBuffer(''..mainIni.config.bronzachena, 20)

len = imgui.ImBool(mainIni.config.len)
lenkolvo  = imgui.ImBuffer(''..mainIni.config.lenkol, 20)
lenchena = imgui.ImBuffer(''..mainIni.config.lenchena, 20)

hlopok = imgui.ImBool(mainIni.config.hlopok)
hlopokkolvo = imgui.ImBuffer(''..mainIni.config.hlopokkol, 20)
hlopokchena = imgui.ImBuffer(''..mainIni.config.hlopokchena, 20)

jizzy = imgui.ImBool(mainIni.config.jizzy)
jizzykolvo = imgui.ImBuffer(''..mainIni.config.jizzykol, 20)
jizzychena = imgui.ImBuffer(''..mainIni.config.jizzychena, 20)

binco = imgui.ImBool(mainIni.config.binco)
bincokolvo = imgui.ImBuffer(''..mainIni.config.bincokol, 20)
bincochena = imgui.ImBuffer(''..mainIni.config.bincochena, 20)

cbell = imgui.ImBool(mainIni.config.cbell)
cbellkolvo = imgui.ImBuffer(''..mainIni.config.cbellkol, 20)
cbellchena = imgui.ImBuffer(''..mainIni.config.cbellchena, 20)

totmichka = imgui.ImBool(mainIni.config.totmichka)
totmichkakolvo = imgui.ImBuffer(''..mainIni.config.totmichkakol, 20)
totmichkachena = imgui.ImBuffer(''..mainIni.config.totmichkachena, 20)

tushkaolen = imgui.ImBool(mainIni.config.tushkaolen)
tushkaolenkolvo = imgui.ImBuffer(''..mainIni.config.tushkaolenkol, 20)
tushkaolenchena = imgui.ImBuffer(''..mainIni.config.tushkaolenchena, 20)

function main()
    if not isSampLoaded() then return end
	while not isSampAvailable() do wait(100) end
    autoupdate("https://raw.githubusercontent.com/MayakoN/SkupChik/main/autoupdate.json", '['..string.upper(thisScript().name)..']: ', "https://raw.githubusercontent.com/MayakoN/SkupChik/main/autoupdate.json")
	img = imgui.CreateTextureFromFile(getGameDirectory() .. "\\moonloader\\SkupChik\\img\\logos.png")
    sampRegisterChatCommand("skpka", function()
        main_window_state.v = not main_window_state.v
	end)
	sampRegisterChatCommand("fskup", function()
		sampSendChat('/lavka')
		sampSendDialogResponse(3021, 1, 1, '')
		sampSendDialogResponse(3020, 1, 0, 'ОЧЕНЬ ДОРОГОЙ СКУП')
		sampSendDialogResponse(3030, 1, 6, '')
		skupka()
    end)
    sampRegisterChatCommand("cupdate", function()
        sampAddChatMessage(tag .. 'У вас скрипт версий {0A6EEA}'..thisScript().version, -1)
    end)
    
	wait(500)
    sampAddChatMessage(tag ..'Скрипт успешно {00FF1E}загружен! {FFFFFF}Для активации используйте команду {0A6EEA}/skpka', -1)
    sampAddChatMessage(tag ..'Автор скрипта - {0A6EEA}Mayako', -1)
    wait(1000)
    loadfile()
    while true do
        wait(0)
		imgui.Process = main_window_state.v
    end 
end

local fontsize = nil
function imgui.BeforeDrawFrame()
    if fontsize == nil then
        fontsize = imgui.GetIO().Fonts:AddFontFromFileTTF(getFolderPath(0x14) .. '\\trebucbd.ttf', 12.0, nil, imgui.GetIO().Fonts:GetGlyphRangesCyrillic()) -- вместо 30 любой нужный размер
    end
end

local fa_font = nil
local fa_glyph_ranges = imgui.ImGlyphRanges({ fa.min_range, fa.max_range })
function imgui.BeforeDrawFrame()
    if fa_font == nil then
        local font_config = imgui.ImFontConfig()
        font_config.MergeMode = true
        fa_font = imgui.GetIO().Fonts:AddFontFromFileTTF('moonloader/resource/fonts/fa-solid-900.ttf', 13.0, font_config, fa_glyph_ranges)
    end
end

function imgui.Hint(text, delay, action)
    if imgui.IsItemHovered() then
        if go_hint == nil then go_hint = os.clock() + (delay and delay or 0.0) end
        local alpha = (os.clock() - go_hint) * 5
        if os.clock() >= go_hint then
            imgui.PushStyleVar(imgui.StyleVar.WindowPadding, imgui.ImVec2(10, 10))
            imgui.PushStyleVar(imgui.StyleVar.Alpha, (alpha <= 1.0 and alpha or 1.0))
                imgui.PushStyleColor(imgui.Col.PopupBg, imgui.ImVec4(0.11, 0.11, 0.11, 1.00))
                    imgui.BeginTooltip()
                    imgui.PushTextWrapPos(450)
                    imgui.TextColored(imgui.GetStyle().Colors[imgui.Col.ButtonHovered], u8' Подсказка:')
                    imgui.TextUnformatted(text)
                    if action ~= nil then
                        imgui.TextColored(imgui.GetStyle().Colors[imgui.Col.TextDisabled], '\n '..action)
                    end
                    if not imgui.IsItemVisible() and imgui.GetStyle().Alpha == 1.0 then go_hint = nil end
                    imgui.PopTextWrapPos()
                    imgui.EndTooltip()
                imgui.PopStyleColor()
            imgui.PopStyleVar(2)
        end
    end
end

function imgui.VerticalSeparator()
    local p = imgui.GetCursorScreenPos()
    imgui.GetWindowDrawList():AddLine(imgui.ImVec2(p.x, p.y), imgui.ImVec2(p.x, p.y + imgui.GetContentRegionMax().y), imgui.GetColorU32(imgui.GetStyle().Colors[imgui.Col.Separator]))
end

function imgui.OnDrawFrame()
    local sw, sh = getScreenResolution()
    if main_window_state.v then 
        imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
        imgui.SetNextWindowSize(imgui.ImVec2(810, 510), imgui.Cond.FirstUseEver)
        imgui.Begin(u8'SkupChik for Arizona RP | Хелпер для барыг | By Mayako', main_window_state, imgui.WindowFlags.NoResize + imgui.WindowFlags.NoCollapse)
		imgui.BeginChild("##menu", imgui.ImVec2(200, 474), true)
		imgui.SetCursorPos(imgui.ImVec2(0, -1))
		imgui.Image(img, imgui.ImVec2(200, 200))
		imgui.Separator()
		imgui.SetCursorPos(imgui.ImVec2(3, 210))
		if imgui.Button(fa.ICON_FA_HOME .. u8' Главное меню',imgui.ImVec2(194, 35)) then selected = 1 end
		imgui.SetCursorPos(imgui.ImVec2(3, 250))
		if imgui.Button(fa.ICON_FA_SHOPPING_BASKET .. u8' Скупка товаров',imgui.ImVec2(194, 35)) then selected = 2 end
		imgui.SetCursorPos(imgui.ImVec2(3, 290))
		if imgui.Button(fa.ICON_FA_COMMENT .. u8' Авто Пиар',imgui.ImVec2(194, 35)) then selected = 3 end
		imgui.SetCursorPos(imgui.ImVec2(3, 330))
		if imgui.Button(fa.ICON_FA_BULLHORN .. u8' Уведомления',imgui.ImVec2(194, 35)) then selected = 4 end
		imgui.SetCursorPos(imgui.ImVec2(3, 370))
		if imgui.Button(fa.ICON_FA_STOPWATCH .. u8' АФК Тулс',imgui.ImVec2(194, 35)) then selected = 5 end
		imgui.SetCursorPos(imgui.ImVec2(3, 410))
		if imgui.Button(fa.ICON_FA_COGS .. u8' Прочее',imgui.ImVec2(194, 35)) then selected = 6 end
		imgui.SetCursorPos(imgui.ImVec2(60, 452))
		imgui.PushFont(fontsize)
		imgui.Text(u8(author))
		imgui.PopFont()
		imgui.EndChild()
		if selected == 0 then
			imgui.SetCursorPos(imgui.ImVec2(215, 28))
			imgui.BeginChild(u8"##info", imgui.ImVec2(587, 474), true)
			imgui.EndChild()			
		elseif selected == 1 then
			imgui.SetCursorPos(imgui.ImVec2(215, 28))
			imgui.BeginChild(u8"##glmenu", imgui.ImVec2(587, 474), true)
			imgui.EndChild()	
		elseif selected == 2 then
			imgui.SetCursorPos(imgui.ImVec2(215, 28))
			imgui.BeginChild(u8"#skupka", imgui.ImVec2(587, 474), true)
			imgui.Checkbox(u8"Бронзовая рулетка", bruletka)
			imgui.SameLine()
			imgui.SetCursorPos(imgui.ImVec2(250, 7))
			imgui.PushItemWidth(50)
			imgui.InputText(u8"Кол-во##1", brulkolvo)
			imgui.PopItemWidth()
			imgui.SameLine()
			imgui.SetCursorPos(imgui.ImVec2(350, 7))
			imgui.PushItemWidth(65)
			imgui.InputText(u8"Цена за шт##2", brulchena)
			imgui.PopItemWidth()
			imgui.Checkbox(u8"Серебряная рулетка", sruletka)
			imgui.SameLine()
			imgui.SetCursorPos(imgui.ImVec2(250, 31))
			imgui.PushItemWidth(50)
			imgui.InputText(u8"Кол-во##3", srulkolvo)
			imgui.PopItemWidth()
			imgui.SameLine()
			imgui.SetCursorPos(imgui.ImVec2(350, 31))
			imgui.PushItemWidth(65)
			imgui.InputText(u8"Цена за шт##4", srulchena)
			imgui.PopItemWidth()
			imgui.Checkbox(u8"Золотая рулетка", zruletka)
			imgui.SameLine()
			imgui.SetCursorPos(imgui.ImVec2(250, 55))
			imgui.PushItemWidth(50)
			imgui.InputText(u8"Кол-во##5", zrulkolvo)
			imgui.PopItemWidth()
			imgui.SameLine()
			imgui.SetCursorPos(imgui.ImVec2(350, 55))
			imgui.PushItemWidth(65)
			imgui.InputText(u8"Цена за шт##6", zrulchena)
			imgui.PopItemWidth()
			imgui.Checkbox(u8"Платиновая рулетка", pruletka)
			imgui.SameLine()
			imgui.SetCursorPos(imgui.ImVec2(250, 79))
			imgui.PushItemWidth(50)
			imgui.InputText(u8"Кол-во##7", prulkolvo)
			imgui.PopItemWidth()
			imgui.SameLine()
			imgui.SetCursorPos(imgui.ImVec2(350, 79))
			imgui.PushItemWidth(65)
			imgui.InputText(u8"Цена за шт##8", prulchena)
			imgui.PopItemWidth()
			imgui.Checkbox(u8"Семейные талоны", famtalon)
			imgui.SameLine()
			imgui.SetCursorPos(imgui.ImVec2(250, 103))
			imgui.PushItemWidth(50)
			imgui.InputText(u8"Кол-во##9", famtalonkolvo)
			imgui.PopItemWidth()
			imgui.SameLine()
			imgui.SetCursorPos(imgui.ImVec2(350, 103))
			imgui.PushItemWidth(65)
			imgui.InputText(u8"Цена за шт##10", famtalonchena)
			imgui.PopItemWidth()
			imgui.Checkbox(u8"Подарок", podarok)
			imgui.SameLine()
			imgui.SetCursorPos(imgui.ImVec2(250, 127))
			imgui.PushItemWidth(50)
			imgui.InputText(u8"Кол-во##11", podarokkolvo)
			imgui.PopItemWidth()
			imgui.SameLine()
			imgui.SetCursorPos(imgui.ImVec2(350, 127))
			imgui.PushItemWidth(65)
			imgui.InputText(u8"Цена за шт##12", podarokchena)
			imgui.PopItemWidth()
			imgui.Checkbox(u8"Гражданский талон", grazhdan)
			imgui.SameLine()
			imgui.SetCursorPos(imgui.ImVec2(250, 151))
			imgui.PushItemWidth(50)
			imgui.InputText(u8"Кол-во##13", grazhdankolvo)
			imgui.PopItemWidth()
			imgui.SameLine()
			imgui.SetCursorPos(imgui.ImVec2(350, 151))
			imgui.PushItemWidth(65)
			imgui.InputText(u8"Цена за шт##14", grazhdanchena)
			imgui.PopItemWidth()
			imgui.Checkbox(u8"Скидочник", skidok)
			imgui.SameLine()
			imgui.SetCursorPos(imgui.ImVec2(250, 175))
			imgui.PushItemWidth(50)
			imgui.InputText(u8"Кол-во##15", skidokkolvo)
			imgui.PopItemWidth()
			imgui.SameLine()
			imgui.SetCursorPos(imgui.ImVec2(350, 175))
			imgui.PushItemWidth(65)
			imgui.InputText(u8"Цена за шт##16", skidokchena)
			imgui.PopItemWidth()
			imgui.Checkbox(u8"Точильные камни", tochilka)
			imgui.SameLine()
			imgui.SetCursorPos(imgui.ImVec2(250, 199))
			imgui.PushItemWidth(50)
			imgui.InputText(u8"Кол-во##17", tochilkakolvo)
			imgui.PopItemWidth()
			imgui.SameLine()
			imgui.SetCursorPos(imgui.ImVec2(350, 199))
			imgui.PushItemWidth(65)
			imgui.InputText(u8"Цена за шт##18", tochilkachena)
			imgui.PopItemWidth()
			imgui.Checkbox(u8"Камень", kamen)
			imgui.SameLine()
			imgui.SetCursorPos(imgui.ImVec2(250, 223))
			imgui.PushItemWidth(50)
			imgui.InputText(u8"Кол-во##19", kamenkolvo)
			imgui.PopItemWidth()
			imgui.SameLine()
			imgui.SetCursorPos(imgui.ImVec2(350, 223))
			imgui.PushItemWidth(65)
			imgui.InputText(u8"Цена за шт##20", kamenchena)
			imgui.PopItemWidth()
			imgui.Checkbox(u8"Металл", metal)
			imgui.SameLine()
			imgui.SetCursorPos(imgui.ImVec2(250, 247))
			imgui.PushItemWidth(50)
			imgui.InputText(u8"Кол-во##21", metalkolvo)
			imgui.PopItemWidth()
			imgui.SameLine()
			imgui.SetCursorPos(imgui.ImVec2(350, 247))
			imgui.PushItemWidth(65)
			imgui.InputText(u8"Цена за шт##22", metalchena)
			imgui.PopItemWidth()
			imgui.Checkbox(u8"Cеребро", serebro)
			imgui.SameLine()
			imgui.SetCursorPos(imgui.ImVec2(250, 271))
			imgui.PushItemWidth(50)
			imgui.InputText(u8"Кол-во##23", serebrokolvo)
			imgui.PopItemWidth()
			imgui.SameLine()
			imgui.SetCursorPos(imgui.ImVec2(350, 271))
			imgui.PushItemWidth(65)
			imgui.InputText(u8"Цена за шт##24", serebrochena)
			imgui.PopItemWidth()
			imgui.Checkbox(u8"Золото", zoloto)
			imgui.SameLine()
			imgui.SetCursorPos(imgui.ImVec2(250, 295))
			imgui.PushItemWidth(50)
			imgui.InputText(u8"Кол-во##25", zolotokolvo)
			imgui.PopItemWidth()
			imgui.SameLine()
			imgui.SetCursorPos(imgui.ImVec2(350, 295))
			imgui.PushItemWidth(65)
			imgui.InputText(u8"Цена за шт##26", zolotochena)
			imgui.PopItemWidth()
			imgui.Checkbox(u8"Бронза", bronza)
			imgui.SameLine()
			imgui.SetCursorPos(imgui.ImVec2(250, 319))
			imgui.PushItemWidth(50)
			imgui.InputText(u8"Кол-во##27", bronzakolvo)
			imgui.PopItemWidth()
			imgui.SameLine()
			imgui.SetCursorPos(imgui.ImVec2(350, 319))
			imgui.PushItemWidth(65)
			imgui.InputText(u8"Цена за шт##28", bronzachena)
			imgui.PopItemWidth()
			imgui.Checkbox(u8"Лён", len)
			imgui.SameLine()
			imgui.SetCursorPos(imgui.ImVec2(250, 343))
			imgui.PushItemWidth(50)
			imgui.InputText(u8"Кол-во##29", lenkolvo)
			imgui.PopItemWidth()
			imgui.SameLine()
			imgui.SetCursorPos(imgui.ImVec2(350, 343))
			imgui.PushItemWidth(65)
			imgui.InputText(u8"Цена за шт##30", lenchena)
			imgui.PopItemWidth()
			imgui.Checkbox(u8"Хлопок", hlopok)
			imgui.SameLine()
			imgui.SetCursorPos(imgui.ImVec2(250, 367))
			imgui.PushItemWidth(50)
			imgui.InputText(u8"Кол-во##31", hlopokkolvo)
			imgui.PopItemWidth()
			imgui.SameLine()
			imgui.SetCursorPos(imgui.ImVec2(350, 367))
			imgui.PushItemWidth(65)
			imgui.InputText(u8"Цена за шт##32", hlopokchena)
			imgui.PopItemWidth()
			imgui.Checkbox(u8"Стикер Jizzy", jizzy)
			imgui.SameLine()
			imgui.SetCursorPos(imgui.ImVec2(250, 391))
			imgui.PushItemWidth(50)
			imgui.InputText(u8"Кол-во##33", jizzykolvo)
			imgui.PopItemWidth()
			imgui.SameLine()
			imgui.SetCursorPos(imgui.ImVec2(350, 391))
			imgui.PushItemWidth(65)
			imgui.InputText(u8"Цена за шт##34", jizzychena)
			imgui.PopItemWidth()
			imgui.Checkbox(u8"Стикер Binco", binco)
			imgui.SameLine()
			imgui.SetCursorPos(imgui.ImVec2(250, 415))
			imgui.PushItemWidth(50)
			imgui.InputText(u8"Кол-во##35", bincokolvo)
			imgui.PopItemWidth()
			imgui.SameLine()
			imgui.SetCursorPos(imgui.ImVec2(350, 415))
			imgui.PushItemWidth(65)
			imgui.InputText(u8"Цена за шт##36", bincochena)
			imgui.PopItemWidth()
			imgui.Checkbox(u8"Стикер Cluckin' Bell", cbell)
			imgui.SameLine()
			imgui.SetCursorPos(imgui.ImVec2(250, 439))
			imgui.PushItemWidth(50)
			imgui.InputText(u8"Кол-во##37", cbellkolvo)
			imgui.PopItemWidth()
			imgui.SameLine()
			imgui.SetCursorPos(imgui.ImVec2(350, 439))
			imgui.PushItemWidth(65)
			imgui.InputText(u8"Цена за шт##38", cbellchena)
			imgui.PopItemWidth()
			imgui.Checkbox(u8"Тюремные отмычки", totmichka)
			imgui.SameLine()
			imgui.SetCursorPos(imgui.ImVec2(250, 463))
			imgui.PushItemWidth(50)
			imgui.InputText(u8"Кол-во##39", totmichkakolvo)
			imgui.PopItemWidth()
			imgui.SameLine()
			imgui.SetCursorPos(imgui.ImVec2(350, 463))
			imgui.PushItemWidth(65)
			imgui.InputText(u8"Цена за шт##40", totmichkachena)
			imgui.PopItemWidth()
			imgui.Checkbox(u8"Тушка олени", tushkaolen)
			imgui.SameLine()
			imgui.SetCursorPos(imgui.ImVec2(250, 487))
			imgui.PushItemWidth(50)
			imgui.InputText(u8"Кол-во##41", tushkaolenkolvo)
			imgui.PopItemWidth()
			imgui.SameLine()
			imgui.SetCursorPos(imgui.ImVec2(350, 487))
			imgui.PushItemWidth(65)
			imgui.InputText(u8"Цена за шт##42", tushkaolenchena)
			imgui.PopItemWidth()
			if imgui.Button(fa.ICON_FA_SAVE .. u8' Сохранить настройки',imgui.ImVec2(585, 29)) then
				mainIni.config.bruletka = bruletka.v
				mainIni.config.brulkol = brulkolvo.v
				mainIni.config.brulchena = brulchena.v
				mainIni.config.sruletka = sruletka.v
				mainIni.config.srulkol = srulkolvo.v
				mainIni.config.srulchena = srulchena.v
				mainIni.config.zruletka = zruletka.v
				mainIni.config.zrulkol = zrulkolvo.v
				mainIni.config.zrulchena = zrulchena.v
				mainIni.config.pruletka = pruletka.v
				mainIni.config.prulkol = prulkolvo.v
				mainIni.config.prulchena = prulchena.v 
				mainIni.config.famtalon = famtalon.v
				mainIni.config.famtalonkol = famtalonkolvo.v
				mainIni.config.famtalonchena = famtalonchena.v
				mainIni.config.podarok = podarok.v
				mainIni.config.podarokkol = podarokkolvo.v
				mainIni.config.podarokchena = podarokchena.v
				mainIni.config.grazhdan = grazhdan.v
				mainIni.config.grazhdankol = grazhdankolvo.v 
				mainIni.config.grazhdanchena = grazhdanchena.v
				mainIni.config.skidok = skidok.v
				mainIni.config.skidokkol = skidokkolvo.v
				mainIni.config.skidokchena = skidokchena.v
				mainIni.config.tochilka = tochilka.v
				mainIni.config.tochilkakol = tochilkakolvo.v
				mainIni.config.tochilkachena = tochilkachena.v 
				mainIni.config.kamen = kamen.v
				mainIni.config.kamenkol = kamenkolvo.v 
				mainIni.config.kamenchena = kamenchena.v 
				mainIni.config.metal = metal.v 
				mainIni.config.metalkol = metalkolvo.v
				mainIni.config.metalchena = metalchena.v  
				mainIni.config.serebro = serebro.v
				mainIni.config.serebrokol = serebrokolvo.v
				mainIni.config.serebrochena = serebrochena.v 
				mainIni.config.zoloto = zoloto.v
				mainIni.config.zolotokol = zolotokolvo.v 
				mainIni.config.zolotochena = zolotochena.v 
				mainIni.config.bronza = bronza.v
				mainIni.config.bronzakol = bronzakolvo.v
				mainIni.config.bronzachena = bronzachena.v
				mainIni.config.len = len.v
				mainIni.config.lenkol = lenkolvo.v
				mainIni.config.lenchena = lenchena.v
				mainIni.config.hlopok = hlopok.v
				mainIni.config.hlopokkol = hlopokkolvo.v 
				mainIni.config.hlopokchena = hlopokchena.v
				mainIni.config.jizzy = jizzy.v
				mainIni.config.jizzykol = jizzykolvo.v
				mainIni.config.jizzychena = jizzychena.v
				mainIni.config.binco = binco.v
				mainIni.config.bincokol = bincokolvo.v
				mainIni.config.bincochena = bincochena.v
				mainIni.config.cbell = cbell.v
				mainIni.config.cbellkol = cbellkolvo.v
				mainIni.config.cbellchena = cbellchena.v
				mainIni.config.totmichka = totmichka.v
				mainIni.config.totmichkakol = totmichkakolvo.v
				mainIni.config.totmichkachena = totmichkachena.v 
				mainIni.config.tushkaolen = tushkaolen.v
				mainIni.config.tushkaolenkol = tushkaolenkolvo.v
				mainIni.config.tushkaolenchena = tushkaolenchena.v
				saveIniFile()
				sampAddChatMessage(tag .. 'Настройки успешно сохранены!',-1)
			end
			if imgui.Button(fa.ICON_FA_PLAY .. u8' Начать скупку',imgui.ImVec2(585, 65)) then
				skupka()
			end
			imgui.SetCursorPos(imgui.ImVec2(545, 7))
			if imgui.Button(fa.ICON_FA_COG .. u8'',imgui.ImVec2(25, 25)) then
				main_window_state_2.v = not main_window_state_2.v
			end
			imgui.EndChild()	
		elseif selected == 3 then
			imgui.SetCursorPos(imgui.ImVec2(215, 28))
			imgui.BeginChild(u8"##piar", imgui.ImVec2(587, 474), true)
			imgui.EndChild()	
		elseif selected == 4 then
			imgui.SetCursorPos(imgui.ImVec2(215, 28))
			imgui.BeginChild(u8"##notic", imgui.ImVec2(587, 474), true)
			imgui.EndChild()	
		elseif selected == 5 then
			imgui.SetCursorPos(imgui.ImVec2(215, 28))
			imgui.BeginChild(u8"##afktools", imgui.ImVec2(587, 474), true)
			imgui.EndChild()	
		elseif selected == 6 then
			imgui.SetCursorPos(imgui.ImVec2(215, 28))
			imgui.BeginChild(u8"##other", imgui.ImVec2(587, 474), true )
			imgui.EndChild()
		end
		imgui.End()
		if main_window_state_2.v then
			imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
        	imgui.SetNextWindowSize(imgui.ImVec2(200, 200), imgui.Cond.FirstUseEver)
        	imgui.Begin(u8'SkupChik', main_window_state, imgui.WindowFlags.NoResize + imgui.WindowFlags.NoCollapse)
			imgui.BeginChild("##menu2", imgui.ImVec2(50, 50), true)
			imgui.EndChild()
			imgui.End()
		end
    end
end

function loadfile()
    local urllogos = 'https://raw.githubusercontent.com/MayakoN/SkupChik/main/logos.png'
    local logos_path = getWorkingDirectory() .. '/SkupChik/img/logos.png'
    if not doesFileExist(logos_path) then
        sampAddChatMessage(tag .. 'Загружаю файлы для работы скрипта...', -1)
        download_id = downloadUrlToFile(urllogos, logos_path, download_handler)
    end
end

function skupka()
	lua_thread.create(function()
	wait(100)
	if bruletka.v then
		sampSendDialogResponse(3040, 1, 0, '')
		sampSendDialogResponse(3050, 1, 19, '')
		sampSendDialogResponse(3050, 1, 8, '')
		sampSendDialogResponse(3060, 1, 0, mainIni.config.brulkol..' '..mainIni.config.brulchena)
	end
	wait(100)
	if sruletka.v then
		sampSendDialogResponse(3040, 1, 0, '')
		sampSendDialogResponse(3050, 1, 19, '')
		sampSendDialogResponse(3050, 1, 9, '')
		sampSendDialogResponse(3060, 1, 0, mainIni.config.srulkol..' '..mainIni.config.srulchena)
	end
	wait(100)
	if zruletka.v then
		sampSendDialogResponse(3040, 1, 0, '')
		sampSendDialogResponse(3050, 1, 19, '')
		sampSendDialogResponse(3050, 1, 10, '')
		sampSendDialogResponse(3060, 1, 0, mainIni.config.zrulkol..' '..mainIni.config.zrulchena)
	end 
	wait(100)
	if pruletka.v then
		sampSendDialogResponse(3040, 1, 0, '')
		sampSendDialogResponse(3050, 1, 19, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 10, '')
		sampSendDialogResponse(3060, 1, 0, mainIni.config.prulkol..' '..mainIni.config.prulchena)
	end
	wait(100)
	if famtalon.v then
		sampSendDialogResponse(3040, 1, 0, '')
		sampSendDialogResponse(3050, 1, 12, '')	
		sampSendDialogResponse(3060, 1, 0, mainIni.config.famtalonkol..' '..mainIni.config.famtalonchena)
	end
	wait(100)
	if podarok.v then
		sampSendDialogResponse(3040, 1, 0, '')
		sampSendDialogResponse(3050, 1, 19, '')
		sampSendDialogResponse(3050, 1, 5, '')
		sampSendDialogResponse(3060, 1, 0, mainIni.config.podarokkol..' '..mainIni.config.podarokchena)	
	end
	wait(100)
	if grazhdan.v then
		sampSendDialogResponse(3040, 1, 0, '')
		sampSendDialogResponse(3050, 1, 19, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 5, '')
		sampSendDialogResponse(3060, 1, 0, mainIni.config.grazhdankol..' '..mainIni.config.grazhdanchena)
	end
	wait(100)
	if skidok.v then
		sampSendDialogResponse(3040, 1, 0, '')
		sampSendDialogResponse(3050, 1, 19, '')
		sampSendDialogResponse(3050, 1, 4, '')
		sampSendDialogResponse(3060, 1, 0, mainIni.config.skidokkol..' '..mainIni.config.skidokchena)
	end
	wait(100)
	if tochilka.v then
		sampSendDialogResponse(3040, 1, 0, '')
		sampSendDialogResponse(3050, 1, 19, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 18, '')
		sampSendDialogResponse(3060, 1, 0, mainIni.config.tochilkakol..' '..mainIni.config.tochilkachena)
	end
	wait(100)
	if kamen.v then
		sampSendDialogResponse(3040, 1, 0, '')
		sampSendDialogResponse(3050, 1, 19, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 4, '')
		sampSendDialogResponse(3060, 1, 0, mainIni.config.kamenkol..' '..mainIni.config.kamenchena)
	end
	wait(100)
	if metal.v then
		sampSendDialogResponse(3040, 1, 0, '')
		sampSendDialogResponse(3050, 1, 19, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 5, '')
		sampSendDialogResponse(3060, 1, 0, mainIni.config.metalkol..' '..mainIni.config.metalchena)
	end
	wait(100)
	if serebro.v then
		sampSendDialogResponse(3040, 1, 0, '')
		sampSendDialogResponse(3050, 1, 19, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 7, '')
		sampSendDialogResponse(3060, 1, 0, mainIni.config.serebrokol..' '..mainIni.config.serebrochena)	
	end
	wait(100)
	if zoloto.v then
		sampSendDialogResponse(3040, 1, 0, '')
		sampSendDialogResponse(3050, 1, 19, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 8, '')
		sampSendDialogResponse(3060, 1, 0, mainIni.config.zolotokol..' '..mainIni.config.zolotochena)
	end
	wait(100)
	if bronza.v then
		sampSendDialogResponse(3040, 1, 0, '')
		sampSendDialogResponse(3050, 1, 19, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 6, '')
		sampSendDialogResponse(3060, 1, 0, mainIni.config.bronzakol..' '..mainIni.config.bronzachena)	
	end
	wait(100)
	if len.v then
		sampSendDialogResponse(3040, 1, 0, '')
		sampSendDialogResponse(3050, 1, 19, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 3, '')
		sampSendDialogResponse(3060, 1, 0, mainIni.config.lenkol..' '..mainIni.config.lenchena)
	end
	wait(100)
	if hlopok.v then
		sampSendDialogResponse(3040, 1, 0, '')
		sampSendDialogResponse(3050, 1, 19, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 2, '')
		sampSendDialogResponse(3060, 1, 0, mainIni.config.hlopokkol..' '..mainIni.config.hlopokchena)
	end
	wait(100)
	if jizzy.v then
		sampSendDialogResponse(3040, 1, 0, '')
		sampSendDialogResponse(3050, 1, 19, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 9, '')
		sampSendDialogResponse(3060, 1, 0, mainIni.config.jizzykol..' '..mainIni.config.jizzychena)
	end
	wait(100)
	if binco.v then
		sampSendDialogResponse(3040, 1, 0, '')
		sampSendDialogResponse(3050, 1, 19, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 8, '')
		sampSendDialogResponse(3060, 1, 0, mainIni.config.bincokol..' '..mainIni.config.bincochena)
	end
	wait(100)
	if cbell.v then
		sampSendDialogResponse(3040, 1, 0, '')
		sampSendDialogResponse(3050, 1, 19, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 4, '')
		sampSendDialogResponse(3060, 1, 0, mainIni.config.cbellkol..' '..mainIni.config.cbellchena)
	end
	wait(100)
	if totmichka.v then
		sampSendDialogResponse(3040, 1, 0, '')
		sampSendDialogResponse(3050, 1, 19, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 7, '')
		sampSendDialogResponse(3060, 1, 0, mainIni.config.totmichkakol..' '..mainIni.config.totmichkachena)
	end
	wait(100)
	if tushkaolen.v then
		sampSendDialogResponse(3040, 1, 0, '')
		sampSendDialogResponse(3050, 1, 19, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 20, '')
		sampSendDialogResponse(3050, 1, 12, '')
		sampSendDialogResponse(3060, 1, 0, mainIni.config.tushkaolenkol..' '..mainIni.config.tushkaolenchena)
	end 
	end)
end

function autoupdate(json_url, prefix, url)
	local dlstatus = require('moonloader').download_status
	local json = getWorkingDirectory() .. '\\'..thisScript().name..'-version.json'
	if doesFileExist(json) then os.remove(json) end
	downloadUrlToFile(json_url, json,
	  function(id, status, p1, p2)
		if status == dlstatus.STATUSEX_ENDDOWNLOAD then
		  if doesFileExist(json) then
			local f = io.open(json, 'r')
			if f then
			  local info = decodeJson(f:read('*a'))
			  updatelink = info.updateurl
			  updateversion = info.latest
			  f:close()
			  os.remove(json)
			  if updateversion ~= thisScript().version then
				lua_thread.create(function(prefix)
				  local dlstatus = require('moonloader').download_status
				  local color = -1
				  sampAddChatMessage((tag .. 'Обнаружено обновление. Пытаюсь обновиться c '..thisScript().version..' на '..updateversion), color)
				  wait(250)
				  downloadUrlToFile(updatelink, thisScript().path,
					function(id3, status1, p13, p23)
					  if status1 == dlstatus.STATUS_DOWNLOADINGDATA then
						print(string.format('Загружено %d из %d.', p13, p23))
					  elseif status1 == dlstatus.STATUS_ENDDOWNLOADDATA then
						print('Загрузка обновления завершена.')
						sampAddChatMessage((tag .. 'Обновление завершено!'), -1)
						goupdatestatus = true
						lua_thread.create(function() wait(500) thisScript():reload() end)
					  end
					  if status1 == dlstatus.STATUSEX_ENDDOWNLOAD then
						if goupdatestatus == nil then
						  sampAddChatMessage((tag .. 'Обновление прошло неудачно. Запускаю устаревшую версию..'), color)
						  update = false
						end
					  end
					end
				  )
				  end, prefix
				)
			  else
				update = false
				print('v'..thisScript().version..': Обновление не требуется.')
			  end
			end
		  else
			print('v'..thisScript().version..': Не могу проверить обновление. Смиритесь или проверьте самостоятельно на '..url)
			update = false
		  end
		end
	  end
	)
	while update ~= false do wait(100) end
  end
