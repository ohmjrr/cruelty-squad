extends Node





var t = 0
var rng = RandomNumberGenerator.new()
var stocks: Array
var FISH_FOUND: Array
var ORGANS_FOUND: Array
var timer: Timer
var total_assets = 0
onready var weekday = OS.get_date().weekday
var TOILET_FISH = ["BNBO"]
var POSSIBLE_FISH = [
	["SLRP", "FLSH", "CIV ", "BRNY"], 
	["POOL", "DRMP", "BRNY", "BLLS"], 
	["POOL", "GLOM", "SMLL", "BIG ", "NGHT", "HUMN", "BRST"], 
	["FISH", "ZOOP", "BLRP", "MOON", "NGHT", "CARB", "EEL ", "FLND", "GFLD", "DEAD", "HDRA"], 
	["PSYK", "GLOM", "NGHT", "HUMN", "DEAD", "BNCY"], 
	["FISH", "DEAD"], 
	["FISH", "DEAD"], 
	["UNI ", "BUBL", "DRMP", "FISH", "FLIP", "NGHT", "NOCT", "OCTO", "HEXA", "DLPH", "GRAB", "FRAG", "SKIP", "DEAD"], 
	["SLRP", "BOG ", "SWMP", "SBOG", "HUMN", "SPKE", "GEEL", "PIPE"], 
	["LUCK", "BNBO", "WLTH", "COIN", "WOF ", "ZIPP", "PAIN"], 
	["BRRN", "AGON", "CREP", "DLTA", "ETRN"], 
	["DOS ", "POOL", "DEAD", "DRMP", "BRNY"], 
	["MSTK", "FISH", "CUBE", "SLRP", "DEAD", "SCCS", "SUN "], 
	["GLRM", "DSLR", "DFSH", "DSCK"], 
	["ICE ", "ICBE"], 
	["BLSM", "CHTH", "ENGN", "HEAD", "POND", "HELI"], 
	["SLRP", "FLSH", "CIV ", "PSYK", "TRNC"], 
	["HELI", "FUZZ", "SCCS", "BLLS"], 
	["HEAD", "DLTA", "MSTK", "PSYK", "PAIN", "SOUL", "GLOM", "HDRA", "DEAD", "HUMN"], 
]

class stock:
	var price: float = 100
	
	
	var description: String = "We're currently gathering data on this asset."
	var index = 0
	var asset_type: String = "equity"
	var values: Array
	var issued_shares: float = 1238299
	var last_price: float = 100
	var max_price: float = 200
	var min_price: float = 20
	var extreme_action: float = 200
	var ticker = "TST"
	var s_name = "Test Stock"
	var owned: float = 0
	var bankrupt = 600
	var price_action_day = 600
	var price_action = 0.1
	var volatility: float = 1
	var trend: float = 0
	var night = false
	var starting_price = price
	var starting_trend = trend
	var fish_speed = 1
	var fish_chance = 100
	var fish_night = false
	var fish_rain = false
	var fish_hell = false
	func get_data() -> Dictionary:
		var stock_data = {
			"ticker": ticker, 
			"owned": owned, 
			"price": price, 
			"l_price": last_price, 
			"trend": trend
		}
		return stock_data

func _enter_tree():
	
	var new_stock = stock.new()
	new_stock.ticker = "CRUS"
	new_stock.s_name = "Cruelty Squad"
	new_stock.description = "บริษัทบลูชิปมั่นคงในธุรกิจรักษาความปลอดภัย."
	new_stock.price = 1237
	new_stock.issued_shares = 2912812
	new_stock.max_price = 1999
	new_stock.min_price = 500
	new_stock.trend = 0.01
	new_stock.volatility = 1
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)
	
	new_stock = stock.new()
	new_stock.ticker = "GDHD"
	new_stock.description = "เคยเป็นบริษัทยิ่งใหญ่ แต่สูญเสียอำนาจไปเมื่อเร็วๆนี้."
	new_stock.s_name = "Godhead Heavy Industries"
	new_stock.price = 732
	new_stock.min_price = 12
	new_stock.max_price = 820
	new_stock.volatility = 1.5
	new_stock.trend = - 0.01
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	
	new_stock = stock.new()
	new_stock.ticker = "GTC "
	new_stock.description = "สตาร์ทอัพมาแรงที่จะปฏิวัติคอมพิวเตอร์และอาหาร ซื้อเลย."
	new_stock.s_name = "G-Tech"
	new_stock.max_price = 600
	new_stock.price = 89
	new_stock.volatility = 7
	new_stock.trend = 0.1
	new_stock.bankrupt = 3
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "PIHO"
	new_stock.description = "เชนอาหารจานด่วนที่ดีที่สุดเท่าที่เคยมี ประวัติยาวนับศตวรรษและมีสาขาหลายหมื่นทั่วโลก พิซซ่าเปปเปอโรนีทำให้ประสาทสัมผัสสุดๆ."
	new_stock.s_name = "Pizza House"
	new_stock.max_price = 510
	new_stock.price = 123
	new_stock.volatility = 7
	new_stock.trend = 0.05
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "AOI "
	new_stock.description = "โซลูชั่นอวกาศศตวรรษที่ 22."
	new_stock.s_name = "Advanced Orbital Instruments"
	new_stock.max_price = 774
	new_stock.price = 530
	new_stock.volatility = 5
	new_stock.trend = 0.02
	new_stock.price_action_day = 4
	new_stock.price_action = 0.01
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "GAGA"
	new_stock.s_name = "GamesGames"
	new_stock.description = "เชนร้านเกมที่กำลังล้มละลาย."
	new_stock.max_price = 700
	new_stock.price = 165
	new_stock.extreme_action = 6
	new_stock.bankrupt = 7
	
	
	new_stock.volatility = 10
	new_stock.trend = - 0.05
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)


	new_stock = stock.new()
	new_stock.ticker = "PWR "
	new_stock.description = "เดิมโด่งดังเพราะติดอาวุธหนักให้กองเรือเพื่อต่อต้านโจรสลัด แต่ได้สถานะผูกขาดเมื่อพบว่าจมคู่แข่งก็ได้เหมือนกัน."
	new_stock.s_name = "Power Monger Shipping Company"
	new_stock.max_price = 1500
	new_stock.price = 205
	new_stock.volatility = 7
	new_stock.trend = - 0.05
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	
	new_stock = stock.new()
	new_stock.ticker = "VEME"
	new_stock.s_name = "Veggo's Meatoids"
	new_stock.description = "ผู้มาใหม่ลึกลับในอุตสาหกรรมเนื้อเทียมเจียน คู่แข่งของธุรกิจ goofood ของ G-TECH."
	new_stock.max_price = 1521
	new_stock.price = 20
	new_stock.volatility = 15
	new_stock.price_action_day = 3
	new_stock.price_action = 0.02
	new_stock.trend = 0.02
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)


	new_stock = stock.new()
	new_stock.ticker = "FBCA"
	new_stock.s_name = "Fatberg Casino"
	new_stock.description = "คาสิโนอันโด่งดังของท่าน Sir Fatberg ในหนองบึงทางตะวันตก."
	new_stock.max_price = 643
	new_stock.price = 405
	new_stock.volatility = 7
	new_stock.trend = 0.05
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	
	new_stock = stock.new()
	new_stock.ticker = "SCRD"
	new_stock.description = "ไม่ค่อยมีใครรู้เรื่องบริษัทรักษาความปลอดภัยนี้ พนักงานดูแปลกๆและพูดไม่ได้ มีแฟนคลั่ง."
	new_stock.s_name = "Security Redefined"
	new_stock.max_price = 320
	new_stock.price = 153
	new_stock.volatility = 7
	new_stock.trend = - 0.05
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "PURE"
	new_stock.s_name = "Pure Optics"
	new_stock.max_price = 1200
	new_stock.price = 630
	new_stock.description = "เลนส์ระดับกองทัพ กับอย่างอื่นๆ."
	new_stock.volatility = 4
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "CSFT"
	new_stock.s_name = "Consumer Softproducts"
	new_stock.description = "ผู้พัฒนาเกมฮิตใหญ่ Gorbino's Quest."
	new_stock.max_price = 1200
	new_stock.price = 413
	new_stock.volatility = 3
	new_stock.trend = 0.05
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)
	
	new_stock = stock.new()
	new_stock.ticker = "BRN "
	new_stock.s_name = "สมอง"
	new_stock.description = "วัตถุดิบที่อุตสาหกรรม AI ใช้."
	new_stock.asset_type = "part"
	new_stock.max_price = 99
	new_stock.min_price = 2
	new_stock.price = 40
	new_stock.volatility = 3
	new_stock.trend = 0.01
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "AUGB"
	new_stock.s_name = "สมองอัพเกรด"
	new_stock.description = "สมองอัพเกรดคุณภาพต่ำ ประมวลผลเร็วแลกกับความโรคจิตสุดขีด."
	new_stock.asset_type = "part"
	new_stock.max_price = 200
	new_stock.min_price = 120
	new_stock.price = 130
	new_stock.volatility = 0.1
	new_stock.trend = 0.01
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "PSYB"
	new_stock.s_name = "สมองจิต"
	new_stock.description = "สมองของตัวควบคุมจิตกำเนิดหรือไซเกอร์ มีความสามารถรับรู้."
	new_stock.asset_type = "part"
	new_stock.max_price = 3000
	new_stock.min_price = 1500
	new_stock.price = 2000
	new_stock.volatility = 0.1
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "WRMB"
	new_stock.s_name = "สมองหนอน"
	new_stock.description = "เต็มไปด้วยปรสิตจากแล็บ."
	new_stock.asset_type = "part"
	new_stock.max_price = 3000
	new_stock.min_price = 1500
	new_stock.price = 2000
	new_stock.volatility = 0.1
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "LIVR"
	new_stock.s_name = "ตับ"
	new_stock.description = "อะไหล่ทดแทนที่ผู้บริหารต้องการบ่อยที่สุด."
	new_stock.asset_type = "part"
	new_stock.max_price = 52
	new_stock.min_price = 2
	new_stock.price = 20
	new_stock.volatility = 2
	new_stock.trend = - 0.01
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "TLVR"
	new_stock.s_name = "ตับแท็กติกอล"
	new_stock.description = "ดูเท่."
	new_stock.asset_type = "part"
	new_stock.max_price = 200
	new_stock.min_price = 100
	new_stock.price = 150
	new_stock.volatility = 1
	new_stock.trend = - 0.01
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "KDNY"
	new_stock.s_name = "ไต"
	new_stock.description = "เยอะแยะและเปลี่ยนง่ายกว่าอย่างอื่น."
	new_stock.asset_type = "part"
	new_stock.max_price = 20
	new_stock.min_price = 2
	new_stock.price = 10
	new_stock.volatility = 0.5
	new_stock.trend = - 0.01
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "HERT"
	new_stock.s_name = "หัวใจ"
	new_stock.description = "ปั๊มพ์ชีวภาพตัวเล็กๆที่ดื้อดึงน่าขยะแขง."
	new_stock.asset_type = "part"
	new_stock.max_price = 300
	new_stock.min_price = 150
	new_stock.price = 200
	new_stock.volatility = 1
	new_stock.trend = 0.01
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "BHRT"
	new_stock.s_name = "หัวใจดำ"
	new_stock.description = "หัวใจที่ทำงานเต็มประสิทธิภาพ."
	new_stock.asset_type = "part"
	new_stock.max_price = 2000
	new_stock.min_price = 1000
	new_stock.price = 1500
	new_stock.volatility = 1
	new_stock.trend = 0.01
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "INTS"
	new_stock.s_name = "ลำไส้"
	new_stock.description = "คนที่นั่งอยู่บนเบาะคนขับ โฮมันคูลัส."
	new_stock.asset_type = "part"
	new_stock.max_price = 400
	new_stock.min_price = 200
	new_stock.price = 300
	new_stock.volatility = 1
	new_stock.trend = 0.01
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "PINT"
	new_stock.s_name = "ลำไส้เน่า"
	new_stock.description = "กลิ่นแย่ที่สุดที่แกเคยได้กลิ่น สิ่งนี้กินอะไรมาวะ?"
	new_stock.asset_type = "part"
	new_stock.max_price = 500
	new_stock.min_price = 300
	new_stock.price = 400
	new_stock.volatility = 1
	new_stock.trend = 0.01
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "APNX"
	new_stock.s_name = "ไส้ติ่ง"
	new_stock.description = "ที่นั่งดั้งเดิมของวิญญาณ."
	new_stock.asset_type = "part"
	new_stock.max_price = 2000
	new_stock.min_price = 1000
	new_stock.price = 1500
	new_stock.volatility = 1
	new_stock.trend = 0.01
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "SPNE"
	new_stock.s_name = "กระดูกสันหลัง"
	new_stock.description = "เครื่องหมายของนักโทษสวรรค์."
	new_stock.asset_type = "part"
	new_stock.max_price = 1200
	new_stock.min_price = 600
	new_stock.price = 800
	new_stock.volatility = 1
	new_stock.trend = 0.01
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "RSPN"
	new_stock.s_name = "กระดูกสันหลังเน่า"
	new_stock.description = "โครงสร้างภายในของสิ่งมีชีวิตที่ถูกเลือกลงโทษนิรันดร์."
	new_stock.asset_type = "part"
	new_stock.max_price = 5200
	new_stock.min_price = 600
	new_stock.price = 3000
	new_stock.volatility = 1
	new_stock.trend = 0.01
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "GUT "
	new_stock.s_name = "กระเพาะ"
	new_stock.description = "ต้นกำเนิดของความตาย."
	new_stock.asset_type = "part"
	new_stock.max_price = 127
	new_stock.min_price = 84
	new_stock.price = 101
	new_stock.volatility = 0.5
	new_stock.trend = 0.01
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "NGUT"
	new_stock.s_name = "กระเพาะนิวเคลียร์"
	new_stock.description = "สามารถเปลี่ยนวัสดุแตกตัวเป็นพลังงานชีวภาพ ไม่ป้องกันกัมมันตภาพรังสีรอบๆ."
	new_stock.asset_type = "part"
	new_stock.max_price = 1270
	new_stock.min_price = 840
	new_stock.price = 1010
	new_stock.volatility = 0.5
	new_stock.trend = 0.01
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "PNCR"
	new_stock.s_name = "ตับอ่อน"
	new_stock.description = "ควบคุมระดับน้ำตาลในเลือด ไม่มีประโยชน์เลยเพราะความก้าวหน้าของอุตสาหกรรมอาหาร."
	new_stock.asset_type = "part"
	new_stock.max_price = 1
	new_stock.min_price = 1
	new_stock.price = 1
	new_stock.volatility = 1
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "ADVP"
	new_stock.s_name = "ตับอ่อนอัพเกรด"
	new_stock.description = "ตับอ่อนตัวนี้ถูกดัดแปลงให้หลั่งสารกระตุ้นสังเคราะห์."
	new_stock.asset_type = "part"
	new_stock.max_price = 1000
	new_stock.min_price = 500
	new_stock.price = 603
	new_stock.volatility = 1
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "FLSH"
	new_stock.s_name = "หนูเนื้อ"
	new_stock.description = "เฮ้! นั่นหนูเนื้อ! น่าขยะแขง."
	new_stock.asset_type = "fish"
	new_stock.fish_chance = 30
	new_stock.fish_speed = 0.7
	new_stock.max_price = 10
	new_stock.min_price = 2
	new_stock.price = 5
	new_stock.volatility = 0.5
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "CIV "
	new_stock.s_name = "พลเรือน"
	new_stock.description = "มีเต็มไปหมด ไม่ค่อยได้ราคา"
	new_stock.asset_type = "fish"
	new_stock.fish_chance = 5
	new_stock.fish_speed = 0.7
	new_stock.max_price = 5
	new_stock.min_price = 1
	new_stock.price = 2.5
	new_stock.volatility = 0.05
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "BRNY"
	new_stock.s_name = "สมองไว"
	new_stock.description = "ฉลาดเกินไปสำหรับตัวเอง เกลียดการอยู่ในสังคมปลา."
	new_stock.asset_type = "fish"
	new_stock.fish_night = true
	new_stock.fish_chance = 30
	new_stock.max_price = 400
	new_stock.min_price = 170
	new_stock.price = 200
	new_stock.volatility = 1
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "POOL"
	new_stock.s_name = "ดูดสระ"
	new_stock.description = "อาศัยอยู่กับเมือกสระ."
	new_stock.asset_type = "fish"
	new_stock.max_price = 56
	new_stock.min_price = 3
	new_stock.price = 32
	new_stock.volatility = 2
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "BRST"
	new_stock.s_name = "กำมะถัน"
	new_stock.description = "สีสวยมาจากเคลือบกำมะถัน."
	new_stock.asset_type = "fish"
	new_stock.fish_speed = 0.5
	new_stock.fish_chance = 30
	new_stock.max_price = 500
	new_stock.min_price = 300
	new_stock.price = 400
	new_stock.volatility = 1
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "DRMP"
	new_stock.s_name = "ดริมป์"
	new_stock.description = "ปลาตกแต่งสวยๆที่เป็นที่ต้องการ."
	new_stock.asset_type = "fish"
	new_stock.fish_speed = 0.6
	new_stock.fish_chance = 50
	new_stock.max_price = 200
	new_stock.min_price = 25
	new_stock.price = 120
	new_stock.volatility = 3
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)
	
	new_stock = stock.new()
	new_stock.ticker = "GLOM"
	new_stock.s_name = "กลูมอยด์"
	new_stock.description = "กินบาป."
	new_stock.asset_type = "fish"
	new_stock.fish_speed = 0.4
	new_stock.fish_chance = 40
	new_stock.max_price = 300
	new_stock.min_price = 40
	new_stock.price = 200
	new_stock.volatility = 3
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)
	
	new_stock = stock.new()
	new_stock.ticker = "SMLL"
	new_stock.s_name = "คนเล็ก"
	new_stock.description = "จับยาก ถือว่าเป็นอาหารชั้นเลิศแต่มีสารก่อมะเร็ง."
	new_stock.asset_type = "fish"
	new_stock.fish_speed = 0.35
	new_stock.fish_chance = 15
	new_stock.max_price = 1000
	new_stock.min_price = 310
	new_stock.price = 765
	new_stock.volatility = 3
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "BIG "
	new_stock.s_name = "คนใหญ่"
	new_stock.description = ""
	new_stock.asset_type = "fish"
	new_stock.fish_speed = 0.45
	new_stock.fish_hell = true
	new_stock.fish_chance = 15
	new_stock.max_price = 2000
	new_stock.min_price = 620
	new_stock.price = 1420
	new_stock.volatility = 1
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "FISH"
	new_stock.s_name = "ปลา"
	new_stock.description = "อุดมคติของปลา."
	new_stock.asset_type = "fish"
	new_stock.max_price = 52
	new_stock.min_price = 2
	new_stock.price = 25
	new_stock.volatility = 2
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)
	
	new_stock = stock.new()
	new_stock.ticker = "NGHT"
	new_stock.s_name = "ปีศาจกลางคืน"
	new_stock.description = "โผล่ขึ้นมาจากก้นลึกตอนกลางคืน ภาพสะท้อนในดวงตามันไม่ใช่แก."
	new_stock.asset_type = "fish"
	new_stock.fish_night = true
	new_stock.fish_chance = 50
	new_stock.max_price = 200
	new_stock.min_price = 15
	new_stock.price = 111
	new_stock.volatility = 2
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "ZOOP"
	new_stock.s_name = "ซูเปอร์"
	new_stock.description = "ซูเปอร์ติดตามเรือสินค้าและส่งเสียงแปลกๆ."
	new_stock.asset_type = "fish"
	new_stock.fish_speed = 0.8
	new_stock.fish_chance = 80
	new_stock.max_price = 100
	new_stock.min_price = 5
	new_stock.price = 52
	new_stock.volatility = 3
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "CARB"
	new_stock.s_name = "คาราบีโน"
	new_stock.description = "นักรบที่วิกลจริตเกินช่วย."
	new_stock.asset_type = "fish"
	new_stock.fish_speed = 0.32
	new_stock.fish_chance = 80
	new_stock.max_price = 600
	new_stock.min_price = 300
	new_stock.price = 400
	new_stock.volatility = 1
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "MOON"
	new_stock.s_name = "ปลาจันทร์"
	new_stock.description = "ปลาสวยที่ใช้ทำอาวุธเคมี."
	new_stock.asset_type = "fish"
	new_stock.fish_speed = 0.5
	new_stock.fish_chance = 2
	new_stock.fish_night = true
	new_stock.max_price = 10000
	new_stock.min_price = 3000
	new_stock.price = 8000
	new_stock.volatility = 6
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "EEL "
	new_stock.s_name = "ปลาไหล"
	new_stock.description = "ปลาลื่นคล้ายงูที่ชอบฝน."
	new_stock.asset_type = "fish"
	new_stock.fish_speed = 0.5
	new_stock.fish_chance = 80
	new_stock.fish_rain = true
	new_stock.max_price = 500
	new_stock.min_price = 300
	new_stock.price = 400
	new_stock.volatility = 1
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "FLND"
	new_stock.s_name = "ปลาลิ้น"
	new_stock.description = "ผิดรูปจากบาป ปลาขี้ขลาด."
	new_stock.asset_type = "fish"
	new_stock.fish_speed = 0.6
	new_stock.fish_chance = 60
	new_stock.fish_rain = true
	new_stock.max_price = 700
	new_stock.min_price = 400
	new_stock.price = 522
	new_stock.volatility = 1
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "GFLD"
	new_stock.s_name = "ปลาลิ้นยักษ์"
	new_stock.description = "ผิดรูปจากอำนาจ ปลาโกรธา."
	new_stock.asset_type = "fish"
	new_stock.fish_speed = 0.6
	new_stock.fish_chance = 10
	new_stock.fish_rain = true
	new_stock.fish_night = true
	new_stock.max_price = 20000
	new_stock.min_price = 15000
	new_stock.price = 10000
	new_stock.volatility = 1
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "BLRP"
	new_stock.s_name = "เบลอโป"
	new_stock.description = "เบลอโปเป็นปลาน้ำเค็มที่เหม็นที่สุดในตลาด รสชาติที่ต้องชิน."
	new_stock.asset_type = "fish"
	new_stock.fish_speed = 0.7
	new_stock.fish_chance = 50
	new_stock.max_price = 200
	new_stock.min_price = 10
	new_stock.price = 101
	new_stock.volatility = 3
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "HDRA"
	new_stock.s_name = "ไฮดรา"
	new_stock.description = "พระเจ้าแห่งปลา."
	new_stock.asset_type = "fish"
	new_stock.fish_hell = true
	new_stock.fish_night = true
	new_stock.fish_speed = 0.25
	new_stock.fish_chance = 1
	new_stock.max_price = 1100000
	new_stock.min_price = 990000
	new_stock.price = 1000000
	new_stock.volatility = 3
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "PSYK"
	new_stock.s_name = "ปลาจิต"
	new_stock.description = "ดูดพลังงานจิตจากมนุษย์ใกล้เคียง."
	new_stock.asset_type = "fish"
	new_stock.fish_speed = 0.5
	new_stock.fish_chance = 35
	new_stock.max_price = 620
	new_stock.min_price = 120
	new_stock.price = 320
	new_stock.volatility = 3
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "BNCY"
	new_stock.s_name = "บ้านลม"
	new_stock.description = "ปลาตัวนี้สัมผัสกับฮอร์โมนสุดขีดทดลอง."
	new_stock.asset_type = "fish"
	new_stock.fish_speed = 0.5
	new_stock.fish_chance = 35
	new_stock.fish_rain = true
	new_stock.max_price = 2000
	new_stock.min_price = 1200
	new_stock.price = 1000
	new_stock.volatility = 1
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "UNI "
	new_stock.s_name = "ยูนิดอร์"
	new_stock.description = "ปลาเขตร้อนหายากที่ใช้ประโยชน์ได้หลายอย่างในอุตสาหกรรมไบโอ."
	new_stock.asset_type = "fish"
	new_stock.fish_speed = 0.6
	new_stock.fish_chance = 5
	new_stock.max_price = 5000
	new_stock.min_price = 1400
	new_stock.price = 3000
	new_stock.volatility = 3
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)
	
	new_stock = stock.new()
	new_stock.ticker = "NOCT"
	new_stock.s_name = "นอคเตอร์"
	new_stock.description = "ปลาเขตร้อนที่ดูดพลังงานจากการซื้อขายความถี่สูง."
	new_stock.asset_type = "fish"
	new_stock.fish_night = true
	new_stock.fish_speed = 0.5
	new_stock.fish_chance = 5
	new_stock.max_price = 10000
	new_stock.min_price = 5000
	new_stock.price = 7500
	new_stock.volatility = 3
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "HUMN"
	new_stock.s_name = "มนุษย์"
	new_stock.description = "ปลาประหลาดหุ้มพลาสติกดำเงาวับ เหม็นแย่มาก."
	new_stock.asset_type = "fish"
	new_stock.fish_speed = 0.5
	new_stock.fish_chance = 5
	new_stock.max_price = 1
	new_stock.min_price = 10
	new_stock.price = 5
	new_stock.volatility = 0.1
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "BUBL"
	new_stock.s_name = "ปลาฟอง"
	new_stock.description = "ถ้าทำไม่ดีมีโอกาสทำให้กระเพาะเป็นแผล น่ารักมาก ปล่อยมันคืนเถอะ."
	new_stock.asset_type = "fish"
	new_stock.fish_speed = 1.0
	new_stock.fish_chance = 60
	new_stock.max_price = 300
	new_stock.min_price = 100
	new_stock.price = 160
	new_stock.volatility = 3
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "FRAG"
	new_stock.s_name = "ปลาระเบิด"
	new_stock.description = "ระเบิดเป็นเศษโลหะความเร็วสูงเมื่อถูกคุกคาม ทะลุตัวเรือได้สบายๆ."
	new_stock.asset_type = "fish"
	new_stock.fish_hell = true
	new_stock.fish_speed = 1.0
	new_stock.fish_chance = 60
	new_stock.max_price = 2000
	new_stock.min_price = 1000
	new_stock.price = 1600
	new_stock.volatility = 3
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)
	
	new_stock = stock.new()
	new_stock.ticker = "FLIP"
	new_stock.s_name = "ฟลิปปี้"
	new_stock.description = "ปลาเขตร้อนธรรมดา มีสติปัญญาร่วม โจมตีเครื่องยนต์เรือแบบพลีชีพ."
	new_stock.asset_type = "fish"
	new_stock.fish_speed = 0.6
	new_stock.fish_chance = 90
	new_stock.max_price = 200
	new_stock.min_price = 50
	new_stock.price = 99
	new_stock.volatility = 3
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "SKIP"
	new_stock.s_name = "สกิปปี้"
	new_stock.description = "หมุนร่างจานของมันเพื่อกระโดดข้ามผิวน้ำ."
	new_stock.asset_type = "fish"
	new_stock.fish_speed = 0.4
	new_stock.fish_chance = 60
	new_stock.max_price = 500
	new_stock.min_price = 300
	new_stock.price = 360
	new_stock.volatility = 1
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "GRAB"
	new_stock.s_name = "ฉลามจับ"
	new_stock.description = "กดดันนักว่ายน้ำโดยลากไปก้นมหาสมุทร."
	new_stock.asset_type = "fish"
	new_stock.fish_hell = true
	new_stock.fish_speed = 0.4
	new_stock.fish_chance = 15
	new_stock.max_price = 5000
	new_stock.min_price = 3100
	new_stock.price = 4200
	new_stock.volatility = 1
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "DLPH"
	new_stock.s_name = "โลมา"
	new_stock.description = "ว่ากันว่าเป็นผลจากการแปลงมนุษย์เป็นปลา."
	new_stock.asset_type = "fish"
	new_stock.fish_speed = 0.4
	new_stock.fish_chance = 15
	new_stock.max_price = 1200
	new_stock.min_price = 650
	new_stock.price = 800
	new_stock.volatility = 1
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "OCTO"
	new_stock.s_name = "อ็อกโตซอร์"
	new_stock.description = "ชอบจมนักดำน้ำโดยปล่อยกรดเมฆ."
	new_stock.asset_type = "fish"
	new_stock.fish_rain = true
	new_stock.fish_speed = 0.8
	new_stock.fish_chance = 60
	new_stock.max_price = 600
	new_stock.min_price = 300
	new_stock.price = 450
	new_stock.volatility = 1
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "HEXA"
	new_stock.s_name = "เฮ็กซาซอร์"
	new_stock.description = "มีอำนาจเหนืออ็อกโตซอร์ทั้งหมด."
	new_stock.asset_type = "fish"
	new_stock.fish_rain = true
	new_stock.fish_speed = 0.3
	new_stock.fish_chance = 4
	new_stock.max_price = 23000
	new_stock.min_price = 19000
	new_stock.price = 20000
	new_stock.volatility = 1
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "SLRP"
	new_stock.s_name = "ดูด"
	new_stock.description = "เฮ้ย น่าขยะแขง ใครจะเอาวะ?"
	new_stock.asset_type = "fish"
	new_stock.fish_speed = 1.0
	new_stock.fish_chance = 100
	new_stock.max_price = 10
	new_stock.min_price = 1
	new_stock.price = 4
	new_stock.volatility = 0.5
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "PIPE"
	new_stock.s_name = "ไพเปอร์"
	new_stock.description = "ส่งเสียงน้ำไหลผ่านท่อ."
	new_stock.asset_type = "fish"
	new_stock.fish_hell = true
	new_stock.fish_speed = 1.0
	new_stock.fish_chance = 100
	new_stock.max_price = 20
	new_stock.min_price = 8
	new_stock.price = 15
	new_stock.volatility = 0.5
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "BOG "
	new_stock.s_name = "บอกโด"
	new_stock.description = "โผล่มาจากก้นลึกหนองบึงและส่งเสียงครางน่าขยะแขง กินซาก."
	new_stock.asset_type = "fish"
	new_stock.fish_speed = 0.6
	new_stock.fish_chance = 70
	new_stock.max_price = 450
	new_stock.min_price = 100
	new_stock.price = 350
	new_stock.volatility = 3
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "SBOG"
	new_stock.s_name = "ซูเปอร์บอกโด"
	new_stock.description = "เสียงร้องน่าสะพรึงกลัวดังขึ้นเหนือหนองบึง มันคือซูเปอร์บอกโด กินบอกโด."
	new_stock.asset_type = "fish"
	new_stock.fish_night = true
	new_stock.fish_speed = 0.3
	new_stock.fish_chance = 3
	new_stock.max_price = 22000
	new_stock.min_price = 20000
	new_stock.price = 18000
	new_stock.volatility = 3
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "SWMP"
	new_stock.s_name = "ดูดหนองบึง"
	new_stock.description = "ต่างจากดูดสระที่ไม่มีพิษ ตัวนี้กินเฉพาะเนื้อมนุษย์."
	new_stock.asset_type = "fish"
	new_stock.fish_speed = 0.4
	new_stock.fish_chance = 30
	new_stock.max_price = 700
	new_stock.min_price = 400
	new_stock.price = 620
	new_stock.volatility = 3
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)
	
	new_stock = stock.new()
	new_stock.ticker = "SPKE"
	new_stock.s_name = "หนาม"
	new_stock.description = "หนามแข็งพอทะลุแผ่นเหล็กป้องกัน นิยมใช้ทำกับดัก."
	new_stock.asset_type = "fish"
	new_stock.fish_speed = 0.5
	new_stock.fish_chance = 50
	new_stock.max_price = 500
	new_stock.min_price = 250
	new_stock.price = 400
	new_stock.volatility = 1
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)
	
	new_stock = stock.new()
	new_stock.ticker = "GEEL"
	new_stock.s_name = "ปลาไหลเมือก"
	new_stock.description = "เคลือบด้วยเมือกหอมหลอนประสาทหนาหนา."
	new_stock.asset_type = "fish"
	new_stock.fish_speed = 0.5
	new_stock.fish_chance = 80
	new_stock.fish_rain = true
	new_stock.max_price = 1000
	new_stock.min_price = 600
	new_stock.price = 800
	new_stock.volatility = 1
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "LUCK"
	new_stock.s_name = "ดูดโชค"
	new_stock.description = "ความรู้สึกเต้นเต้นดิ้นเต็มหัว กินโชคขี้โชคร้ายออกมา."
	new_stock.asset_type = "fish"
	new_stock.fish_speed = 0.3
	new_stock.fish_chance = 3
	new_stock.max_price = 20000
	new_stock.min_price = 15000
	new_stock.price = 10000
	new_stock.volatility = 3
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)
	
	new_stock = stock.new()
	new_stock.ticker = "BNBO"
	new_stock.s_name = "บอนโบ"
	new_stock.description = "นักท่องท่อระบายน้ำเสีย ยิ้มและขยิบตาให้."
	new_stock.asset_type = "fish"
	new_stock.fish_speed = 0.6
	new_stock.fish_chance = 10
	new_stock.max_price = 2000
	new_stock.min_price = 1000
	new_stock.price = 1500
	new_stock.volatility = 3
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "WLTH"
	new_stock.s_name = "ปลาร่ำรวย"
	new_stock.description = "ถือว่าเป็นสัญลักษณ์ความร่ำรวย แต่ไม่ค่อยมีราคาเท่าไหร่."
	new_stock.asset_type = "fish"
	new_stock.fish_speed = 0.7
	new_stock.fish_chance = 80
	new_stock.max_price = 600
	new_stock.min_price = 200
	new_stock.price = 300
	new_stock.volatility = 3
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "COIN"
	new_stock.s_name = "เหรียญ"
	new_stock.description = "หลบนักล่าโดยซ่อนในกองเหรียญ."
	new_stock.asset_type = "fish"
	new_stock.fish_speed = 0.7
	new_stock.fish_chance = 95
	new_stock.max_price = 1
	new_stock.min_price = 1
	new_stock.price = 1
	new_stock.volatility = 3
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)
	
	new_stock = stock.new()
	new_stock.ticker = "WOF "
	new_stock.s_name = "วงล้อโชคชะตา"
	new_stock.description = "สัญลักษณ์โชคดีปีศาจ."
	new_stock.asset_type = "fish"
	new_stock.fish_speed = 0.4
	new_stock.fish_chance = 0.5
	new_stock.max_price = 1000000
	new_stock.min_price = 1000000
	new_stock.price = 1000000
	new_stock.volatility = 0
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "PAIN"
	new_stock.s_name = "วงล้อความเจ็บปวด"
	new_stock.description = "สัญลักษณ์การลงโทษสวรรค์."
	new_stock.asset_type = "fish"
	new_stock.fish_hell = true
	new_stock.fish_night = true
	new_stock.fish_speed = 0.4
	new_stock.fish_chance = 0.5
	new_stock.max_price = 2000000
	new_stock.min_price = 2000000
	new_stock.price = 2000000
	new_stock.volatility = 0
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "ZIPP"
	new_stock.s_name = "Zippy 3000 (Broken)"
	new_stock.description = "ใกล้แล้ว."
	new_stock.asset_type = "fish"
	new_stock.fish_speed = 10.0
	new_stock.fish_chance = 0.5
	new_stock.max_price = 1
	new_stock.min_price = 1
	new_stock.price = 1
	new_stock.volatility = 0
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)



	new_stock = stock.new()
	new_stock.ticker = "AGON"
	new_stock.s_name = "Agon"
	new_stock.description = "ผู้หลับใหล."
	new_stock.asset_type = "fish"
	new_stock.fish_speed = 2.0
	new_stock.fish_chance = 40
	new_stock.max_price = 1500
	new_stock.min_price = 500
	new_stock.price = 1000
	new_stock.volatility = 0
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "BRRN"
	new_stock.s_name = "บอโรไรออน"
	new_stock.description = "สิ่งมีชีวิตดั้งเดิม."
	new_stock.asset_type = "fish"
	new_stock.fish_speed = 1.0
	new_stock.fish_chance = 20
	new_stock.max_price = 3000
	new_stock.min_price = 1000
	new_stock.price = 2000
	new_stock.volatility = 1
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "CREP"
	new_stock.s_name = "ครีป"
	new_stock.description = "มันจะไม่ทิ้งแกหรอก."
	new_stock.asset_type = "fish"
	new_stock.fish_speed = 0.5
	new_stock.fish_chance = 5
	new_stock.max_price = 5000
	new_stock.min_price = 3000
	new_stock.price = 4000
	new_stock.volatility = 1
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "DLTA"
	new_stock.s_name = "เดลต้าฟอร์ซ"
	new_stock.description = "ผู้รุกรานสวรรค์."
	new_stock.asset_type = "fish"
	new_stock.fish_speed = 0.3
	new_stock.fish_chance = 2.5
	new_stock.max_price = 110000
	new_stock.min_price = 90000
	new_stock.price = 100000
	new_stock.volatility = 1
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "ETRN"
	new_stock.s_name = "ดูดนิรันดร์"
	new_stock.description = "รูปแบบดั้งเดิมของดูดใต้ดิน."
	new_stock.asset_type = "fish"
	new_stock.fish_speed = 0.5
	new_stock.fish_chance = 5
	new_stock.max_price = 5000
	new_stock.min_price = 3000
	new_stock.price = 4000
	new_stock.volatility = 1
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "DOS "
	new_stock.s_name = "ปลาดอส"
	new_stock.description = "เครื่องโบราณที่แผ่ความรู้จากผู้เชี่ยวชาญตกปลาตำนาน."
	new_stock.asset_type = "fish"
	new_stock.fish_speed = 0.2
	new_stock.fish_chance = 1
	new_stock.max_price = 3500000
	new_stock.min_price = 2500000
	new_stock.price = 3000000
	new_stock.volatility = 1
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "MSTK"
	new_stock.s_name = "ความผิดพลาด"
	new_stock.description = "บางทีก็มีอะไรผิดพลาด."
	new_stock.asset_type = "fish"
	new_stock.fish_speed = 1.0
	new_stock.fish_chance = 30
	new_stock.max_price = 600
	new_stock.min_price = 300
	new_stock.price = 350
	new_stock.volatility = 10
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "SCCS"
	new_stock.s_name = "ความสำเร็จ"
	new_stock.description = "นี่แหละกูพูดถึง."
	new_stock.asset_type = "fish"
	new_stock.fish_speed = 0.2
	new_stock.fish_chance = 2
	new_stock.max_price = 120000
	new_stock.min_price = 90000
	new_stock.price = 100000
	new_stock.volatility = 1
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "SUN "
	new_stock.s_name = "ปลาตะวัน"
	new_stock.description = "สูญพันธุ์ไปตั้งแต่ศตวรรษที่ 20."
	new_stock.asset_type = "fish"
	new_stock.fish_speed = 2.0
	new_stock.fish_chance = 2
	new_stock.max_price = 12000
	new_stock.min_price = 4000
	new_stock.price = 10000
	new_stock.volatility = 10
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "CUBE"
	new_stock.s_name = "คิวเบิร์ต"
	new_stock.description = "ชีววิทยาเชิงคาดเดาที่รั่วออกมาจากหัว[ตัดออก]."
	new_stock.asset_type = "fish"
	new_stock.fish_speed = 1.0
	new_stock.fish_chance = 70
	new_stock.max_price = 700
	new_stock.min_price = 250
	new_stock.price = 500
	new_stock.volatility = 2
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "GLRM"
	new_stock.s_name = "กลัรม"
	new_stock.description = "เจริญในความมืดสนิท."
	new_stock.asset_type = "fish"
	new_stock.fish_speed = 0.5
	new_stock.fish_chance = 50
	new_stock.max_price = 1200
	new_stock.min_price = 800
	new_stock.price = 1000
	new_stock.volatility = 2
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)
	
	new_stock = stock.new()
	new_stock.ticker = "DFSH"
	new_stock.s_name = "ปลามืด"
	new_stock.description = "ปลาตัวนี้เป็นโรคหลงตัวเองร้ายแรง."
	new_stock.asset_type = "fish"
	new_stock.fish_speed = 0.6
	new_stock.fish_chance = 50
	new_stock.max_price = 700
	new_stock.min_price = 500
	new_stock.price = 600
	new_stock.volatility = 1
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "DSLR"
	new_stock.s_name = "ดูดมืด"
	new_stock.description = "มีวัสดุแตกตัว เหยื่อการจับเกินขนาด."
	new_stock.asset_type = "fish"
	new_stock.fish_speed = 0.3
	new_stock.fish_chance = 3
	new_stock.max_price = 100000
	new_stock.min_price = 90000
	new_stock.price = 95000
	new_stock.volatility = 1
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "DSCK"
	new_stock.s_name = "ดูดมืดสนิท"
	new_stock.description = "ความมืดทำให้ดูดช้าและทื่อ."
	new_stock.asset_type = "fish"
	new_stock.fish_speed = 2.0
	new_stock.fish_chance = 90
	new_stock.max_price = 200
	new_stock.min_price = 100
	new_stock.price = 152
	new_stock.volatility = 0.5
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "ICE "
	new_stock.s_name = "ปลาน้ำแข็ง"
	new_stock.description = "ปลาที่ปรับตัวได้ดีกับอุณหภูมิติดลบ."
	new_stock.asset_type = "fish"
	new_stock.max_price = 300
	new_stock.min_price = 132
	new_stock.price = 150
	new_stock.volatility = 1
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "ICBE"
	new_stock.s_name = "คิวเบิร์ตน้ำแข็ง"
	new_stock.description = "อุณหภูมิร่างกายเกือบ 0 เคลวิน."
	new_stock.asset_type = "fish"
	new_stock.fish_speed = 1.0
	new_stock.fish_chance = 50
	new_stock.max_price = 800
	new_stock.min_price = 300
	new_stock.price = 632
	new_stock.volatility = 1
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "BLSM"
	new_stock.s_name = "บลอสซัม"
	new_stock.description = "เติมความคิดมีความสุขให้หัวแก."
	new_stock.asset_type = "fish"
	new_stock.fish_speed = 0.6
	new_stock.fish_chance = 60
	new_stock.max_price = 2000
	new_stock.min_price = 1000
	new_stock.price = 1500
	new_stock.volatility = 0.5
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)
	
	new_stock = stock.new()
	new_stock.ticker = "CHTH"
	new_stock.s_name = "คทอนเนอร์"
	new_stock.description = "สัตว์ถ้ำทรานส์นิสเตีย กินพืช."
	new_stock.asset_type = "fish"
	new_stock.fish_speed = 0.5
	new_stock.fish_chance = 40
	new_stock.max_price = 2100
	new_stock.min_price = 1100
	new_stock.price = 1620
	new_stock.volatility = 0.5
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "HEAD"
	new_stock.s_name = "หัว"
	new_stock.description = "หัวใครบางคนที่ติดเชื้อปรสิตต่างดาว."
	new_stock.asset_type = "fish"
	new_stock.fish_speed = 0.4
	new_stock.fish_chance = 30
	new_stock.max_price = 2300
	new_stock.min_price = 1300
	new_stock.price = 1800
	new_stock.volatility = 0.5
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "POND"
	new_stock.s_name = "คนสระ"
	new_stock.description = "ทำให้นึกถึงเพื่อนที่จากไปนาน."
	new_stock.asset_type = "fish"
	new_stock.fish_speed = 0.4
	new_stock.fish_chance = 6
	new_stock.max_price = 4000
	new_stock.min_price = 3200
	new_stock.price = 3700
	new_stock.volatility = 0.5
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)
	
	new_stock = stock.new()
	new_stock.ticker = "HELI"
	new_stock.s_name = "เฮลิพอด"
	new_stock.description = "บินกินแมลงตลอดวัน ปกติจับได้แค่ตอนกลางคืน."
	new_stock.asset_type = "fish"
	new_stock.fish_speed = 0.35
	new_stock.fish_night = true
	new_stock.fish_chance = 50
	new_stock.max_price = 2000
	new_stock.min_price = 1000
	new_stock.price = 1200
	new_stock.volatility = 0.5
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "ENGN"
	new_stock.s_name = "เครื่องยนต์วุ่นวาย"
	new_stock.description = "หมุนและหมุนวนด้วยพลังน่ากลัวขณะที่แกพยายามทำความเข้าใจชีวิต."
	new_stock.asset_type = "fish"
	new_stock.fish_hell = true
	new_stock.fish_speed = 0.5
	new_stock.fish_chance = 10
	new_stock.max_price = 12000
	new_stock.min_price = 7000
	new_stock.price = 10000
	new_stock.volatility = 0.5
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "DEAD"
	new_stock.s_name = "ปลาตาย"
	new_stock.description = "มีชีวิตจากความเสียใจ."
	new_stock.asset_type = "fish"
	new_stock.fish_hell = true
	new_stock.max_price = 104
	new_stock.min_price = 25
	new_stock.price = 50
	new_stock.volatility = 0
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "TRNC"
	new_stock.s_name = "ทรานเซอร์"
	new_stock.description = "กลายพันธุ์จากคลื่นเสียงร้ายแรงและสารเคมีวิจัย."
	new_stock.asset_type = "fish"
	new_stock.max_price = 3000
	new_stock.min_price = 2000
	new_stock.fish_speed = 0.5
	new_stock.fish_chance = 10
	new_stock.price = 2500
	new_stock.volatility = 1
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)
	
	new_stock = stock.new()
	new_stock.ticker = "FUZZ"
	new_stock.s_name = "ฟัซซอยด์"
	new_stock.description = "อยู่ในขอบเขต ขีดจำกัด ขอบ นักฆ่าดั้งเดิม."
	new_stock.asset_type = "fish"
	new_stock.max_price = 30000
	new_stock.min_price = 20000
	new_stock.price = 25000
	new_stock.volatility = 3
	new_stock.fish_speed = 0.4
	new_stock.fish_chance = 10
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	new_stock = stock.new()
	new_stock.ticker = "SOUL"
	new_stock.s_name = "วิญญาณ"
	new_stock.description = "แกจับวิญญาณได้ มันรู้สึกเหนียวแปลกๆ."
	new_stock.asset_type = "fish"
	new_stock.fish_speed = 0.2
	new_stock.fish_chance = 0.5
	new_stock.max_price = 6500000
	new_stock.min_price = 4500000
	new_stock.price = 5000000
	new_stock.volatility = 1
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)
	
	new_stock = stock.new()
	new_stock.ticker = "BLLS"
	new_stock.s_name = "ปลาบอล"
	new_stock.description = "ตามคำเรียกร้อง เหมือนในทีวี."
	new_stock.asset_type = "fish"
	new_stock.fish_speed = 0.4
	new_stock.fish_chance = 0.5
	new_stock.max_price = 450
	new_stock.min_price = 40
	new_stock.price = 200
	new_stock.volatility = 1
	new_stock.trend = 0
	new_stock.starting_price = new_stock.price
	new_stock.starting_trend = new_stock.trend
	stocks.append(new_stock)

	load_stocks()

func _ready():
	timer = Timer.new()
	add_child(timer)
	timer.wait_time = 1
	timer.one_shot = false
	timer.connect("timeout", self, "stock_tick")
	timer.start()

func stock_tick():
	var asset_value = 0
	for stock in stocks:
		
			
		
		
		stock.last_price = stock.price
		var trend = stock.trend
		
		if Global.LEVELS_UNLOCKED == 6:
			if not weekday == 1:
				trend += 0.1
			else:
				trend -= 0.15
		if Global.LEVELS_UNLOCKED >= stock.price_action_day and stock.price < stock.max_price and stock.price > stock.min_price:
			trend += stock.price_action
		if Global.LEVELS_UNLOCKED == stock.extreme_action:
			trend += 1
		stock.price += sqrt(0.03333 * 0.5) * rng.randfn() * stock.volatility + trend
		if not stock.bankrupt:
			stock.price = clamp(stock.price, stock.min_price, stock.max_price)
		else:
			stock.price = clamp(stock.price, 0.87, 10000000)
		if stock.bankrupt < Global.LEVELS_UNLOCKED:
			stock.trend -= 0.01

		elif (stock.price <= stock.min_price + 5 and stock.trend < 0) or (stock.price >= stock.max_price - 5 and stock.trend > 0):
			stock.trend *= - 1
		if stock.min_price == stock.max_price:
			stock.price = stock.min_price
		stock.values.append(stock.price)
		if stock.values.size() > 100:
			stock.values.pop_front()
		asset_value += stock.price * stock.owned
		var color = Color(1, 0, 0)
		if stock.last_price <= stock.price:
			color = Color(0, 1, 0)
	total_assets = asset_value


func _physics_process(delta):
	if Global.implants.head_implant.market_enhancer:
		timer.wait_time = 0.1
	else:
		timer.wait_time = 1
	
		
	t += 1
		
	
	if fmod(t, 10) != 0:
			return
	


func stock_save() -> Dictionary:
	var stocks_dict: Dictionary
	for stock in stocks:
		
		stocks_dict[stock.ticker] = stock.get_data()
		stocks_dict["fish_found"] = FISH_FOUND
		stocks_dict["org_found"] = ORGANS_FOUND
	return stocks_dict

func save_stocks(path = "user://stocks.save") -> void :
	var st = File.new()
	st.open(path, File.WRITE)
	st.store_line(to_json(stock_save()))
	st.close()

func load_stocks() -> void :
	var stocks_save = File.new()
	if not stocks_save.file_exists("user://stocks.save"):
		save_stocks("user://stocks.save")
	
	
	
	

	
	

	
	
	stocks_save.open("user://stocks.save", File.READ)
	if stocks_save.get_len() < 2:
		stocks_save.close()
		if not stocks_save.file_exists("user://stock_backup.save"):
			save_stocks()
			stocks_save.open("user://stocks.save", File.READ)
		else:
			stocks_save.open("user://stock_backup.save", File.READ)
			if stocks_save.get_len() < 2:
				stocks_save.close()
				save_stocks()
				stocks_save.open("user://stocks.save", File.READ)
	
	var parsedJSON
	parsedJSON = parse_json(stocks_save.get_line())
	if typeof(parsedJSON) != TYPE_DICTIONARY:
		stocks_save.close()
		save_stocks("user://stocks.save")
		if stocks_save.file_exists("user://stock_backup.save"):
			stocks_save.open("user://stock_backup.save", File.READ)
			parsedJSON = parse_json(stocks_save.get_line())
	
	if typeof(parsedJSON) != TYPE_DICTIONARY:
		stocks_save.close()
		print("Failed to load stock market data.")
		return

	var fish_found = parsedJSON.get("fish_found")
	if fish_found != null:
		FISH_FOUND = fish_found
	var org_found = parsedJSON.get("org_found")
	if org_found != null:
		ORGANS_FOUND = org_found
	for stock in stocks:
		var stock_data = parsedJSON.get(stock.ticker)
		if stock_data:
			var price = stock_data["price"]
			stock.price = price
			var trend = stock_data["trend"]
			stock.trend = trend
			var owned = stock_data["owned"]
			stock.owned = owned
	stocks_save.close()



