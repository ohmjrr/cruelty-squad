extends Node





var IMPLANTS: Array
var purchased_implants: Array
var head_implant: Implant
var torso_implant: Implant
var leg_implant: Implant
var arm_implant: Implant
var empty_implant: Implant

class Implant:
	var head: bool = false
	var torso: bool = false
	var legs: bool = false
	var arms: bool = false
	var price: int = 0
	var armor: float = 1
	var ricochet: bool = false
	var grav: bool = false
	var orbsuit: bool = false
	var speed_bonus: float = 0
	var ammo_bonus: int = 0
	var ski: bool = false
	var market_enhancer: bool = false
	var helmet: bool = false
	var nightvision: bool = false
	var jump_bonus: float = 0
	var terror = false
	var double_jump: float = 0
	var triple_jump: bool = false
	var jetpack: bool = false
	var throw_bonus: float = 0
	var zoom_bonus: float = 1
	var shrink: bool = false
	var slowfall: bool = false
	var healing: float = 0
	var sensor: bool = false
	var instadeath: bool = false
	var stealth: bool = false
	var climb: bool = false
	var explosive_shield: bool = false
	var nightmare: bool = false
	var holy: bool = false
	var fishing_bonus: bool = false
	var grapple: bool = false
	var radio: bool = false
	var cursed_torch: bool = false
	var regen_ammo: bool = false
	var chemical_shield: bool = false
	var bouncy: bool = false
	var thrust: bool = false
	var toxic_shield: bool = false
	var skullgun: bool = false
	var he_grenade: bool = false
	var camo: float = 0
	var kick_improvement = false
	var hidden: bool = false
	var flechette_grenade: bool = false
	var sleep_grenade: bool = false
	var i_name: String = "N/A"
	var explanation: String = ""
	var texture = load("res://Textures/Menu/Empty_Slot.png")
	

func _ready():
	empty_implant = Implant.new()
	leg_implant = empty_implant
	arm_implant = empty_implant
	torso_implant = empty_implant
	head_implant = empty_implant
	
	var new_implant = Implant.new()
	new_implant.i_name = "ต่อมเพิ่มความเร็ว"
	new_implant.explanation = "อวัยวะเทียมที่ปล่อยฮอร์โมนสังเคราะห์เพื่อกระตุ้นระบบประสาทและเมตาบอลิซึม ลดความสามารถในการฟื้นตัวจากความเสียหายและช็อก"
	new_implant.armor = 1.1
	new_implant.price = 1000
	new_implant.speed_bonus = 1
	new_implant.legs = true
	new_implant.texture = load("res://Textures/Menu/Implants/speed1.png")
	
	IMPLANTS.append(new_implant)
	
	new_implant = Implant.new()
	new_implant.i_name = "กลุ่มโหนดเพิ่มความเร็ว"
	new_implant.explanation = "แทนที่ระบบต่อมไร้ท่อส่วนใหญ่ด้วยระบบเทียม ความเร็วเพิ่มขึ้นอย่างมากแลกกับสุขภาพที่อ่อนแอลง"
	new_implant.armor = 1.5
	new_implant.price = 3000
	new_implant.speed_bonus = 2
	new_implant.legs = true
	new_implant.texture = load("res://Textures/Menu/Implants/speed2.png")
	
	IMPLANTS.append(new_implant)
	
	new_implant = Implant.new()
	new_implant.i_name = "แพ็คเกจอวัยวะเพิ่มความเร็วเต็มรูปแบบ"
	new_implant.explanation = "แทนที่อวัยวะมนุษย์ที่จำกัดความเร็วทั้งหมดด้วยผลิตภัณฑ์เชิงพาณิชย์ที่ปลดล็อคแล้วแต่เปราะบางกว่า สำหรับมือโปรเท่านั้น"
	new_implant.armor = 2.0
	new_implant.price = 6000
	new_implant.speed_bonus = 4
	new_implant.legs = true
	new_implant.texture = load("res://Textures/Menu/Implants/speed3.png")
	
	IMPLANTS.append(new_implant)
	

	
	new_implant = Implant.new()
	new_implant.i_name = "เกราะกาย CSIJ ระดับ II"
	new_implant.explanation = "เสื้อกันกระสุนเคฟลาร์ราคาถูก การป้องกันขั้นต่ำที่แนะนำ"
	new_implant.price = 1000
	new_implant.armor = 0.9
	new_implant.torso = true
	new_implant.texture = load("res://Textures/Menu/Implants/light_armor.png")
	
	IMPLANTS.append(new_implant)

	new_implant = Implant.new()
	new_implant.i_name = "เกราะกาย CSIJ ระดับ IIB"
	new_implant.explanation = "เกราะเบาปรับปรุงใหม่ใช้เทคโนโลยีวัสดุขั้นสูง"
	new_implant.price = 0
	new_implant.armor = 0.85
	new_implant.torso = true
	new_implant.hidden = true
	new_implant.texture = load("res://Textures/Menu/Implants/advanced_armor.png")
	
	IMPLANTS.append(new_implant)

	new_implant = Implant.new()
	new_implant.i_name = "เกราะกาย CSIJ ระดับ III"
	new_implant.explanation = "เคฟลาร์พร้อมแผ่นกันกระแทก UHMWPE แบบธรรมดา"
	new_implant.price = 3000
	new_implant.armor = 0.8
	new_implant.speed_bonus = - 1
	new_implant.torso = true
	new_implant.texture = load("res://Textures/Menu/Implants/medium_armor.png")
	
	IMPLANTS.append(new_implant)
	
	new_implant = Implant.new()
	new_implant.i_name = "เกราะกาย CSIJ ระดับ IV"
	new_implant.explanation = "เส้นใยแมงมุมชีวภาพพร้อมแผ่นกราฟีนหนาและหนัก"
	new_implant.price = 5000
	new_implant.armor = 0.5
	new_implant.speed_bonus = - 3
	new_implant.jump_bonus = - 5
	new_implant.torso = true
	new_implant.texture = load("res://Textures/Menu/Implants/heavy_armor.png")
	
	IMPLANTS.append(new_implant)
	
	new_implant = Implant.new()
	new_implant.i_name = "ชุดชีวภาพ CSIJ ระดับ V"
	new_implant.explanation = "ชุดเนื้อดิ้นรนที่ห่อหุ้มตัวและปิดผนึกแก ป้องกันดีเยี่ยมโดยไม่มีข้อเสียที่เห็นชัด"
	new_implant.price = 99999
	new_implant.armor = 0.6
	new_implant.terror = true
	new_implant.torso = true
	new_implant.toxic_shield = true
	new_implant.texture = load("res://Textures/Menu/Implants/ultra_armor.png")
	
	IMPLANTS.append(new_implant)

	new_implant = Implant.new()
	new_implant.i_name = "ระบบโกเลม CSIJ ระดับ VI"
	new_implant.explanation = "โครงกระดูกภายนอกน่าสะพรึงกลัวทำจากเมตาวัสดุไม่ทราบชนิด เดิมใช้โดยยามในโรงไฟฟ้านิวเคลียร์"
	new_implant.price = 0
	new_implant.orbsuit = true
	new_implant.torso = true
	new_implant.hidden = true
	new_implant.toxic_shield = true
	new_implant.armor = 0.6
	new_implant.texture = load("res://Textures/Menu/Implants/golem.png")
	
	IMPLANTS.append(new_implant)

	new_implant = Implant.new()
	new_implant.i_name = "โล่กันระเบิดแทคติค"
	new_implant.explanation = "ป้องกันวัตถุระเบิดสมบูรณ์ สามารถใช้เทคนิคทำลายขั้นสูงได้"
	new_implant.price = 6000
	new_implant.explosive_shield = true
	new_implant.torso = true
	new_implant.texture = load("res://Textures/Menu/Implants/blastshield.png")
	
	IMPLANTS.append(new_implant)
	
	new_implant = Implant.new()
	new_implant.i_name = "เสื้อกั๊กหนัก"
	new_implant.explanation = "แมกกระสุนเพิ่มขึ้นอีกหนึ่งสำหรับอาวุธทั้งสอง การออกแบบใหม่ทำให้ไม่ช้าลงเลย"
	new_implant.price = 1200
	new_implant.ammo_bonus = 1
	new_implant.torso = true
	new_implant.texture = load("res://Textures/Menu/Implants/lbv.png")
	
	IMPLANTS.append(new_implant)
	
	new_implant = Implant.new()
	new_implant.i_name = "ชุดป้องกันสารพิษ"
	new_implant.explanation = "ป้องกันอันตรายจากสารพิษ ดูตลกดี"
	new_implant.price = 0
	new_implant.toxic_shield = true
	new_implant.speed_bonus = 0
	new_implant.torso = true
	new_implant.hidden = true
	new_implant.texture = load("res://Textures/Menu/Implants/hazmat.png")
	
	IMPLANTS.append(new_implant)
	
	new_implant = Implant.new()
	new_implant.i_name = "ลายพรางทหาร"
	new_implant.explanation = "ทำให้สังเกตได้ยากขึ้น เพิ่มเวลาตอบสนองของศัตรู"
	new_implant.price = 1000
	new_implant.camo = 0.2
	new_implant.torso = true
	new_implant.texture = load("res://Textures/Menu/Implants/militarycamo.png")
	
	IMPLANTS.append(new_implant)
	
	new_implant = Implant.new()
	new_implant.i_name = "ชุดล่องหน"
	new_implant.explanation = "ใช้แบคทีเรียกิ้งก่าที่พัฒนาใหม่ทำให้ผู้สวมใสเกือบมองไม่เห็นในระยะ 20 หน่วยสากล มีกลิ่นรุนแรงจนหน่วยรบพิเศษที่ใช้มันถูกเรียกว่าพวกคนขี้"
	new_implant.price = 12000
	new_implant.stealth = true
	new_implant.torso = true
	new_implant.texture = load("res://Textures/Menu/Implants/stealth.png")
	
	IMPLANTS.append(new_implant)
	
	
	new_implant = Implant.new()
	new_implant.i_name = "ชุดเด้ง"
	new_implant.explanation = "ชุดพิเศษทำจากเมตาวัสดุพิสดารออกแบบมาสำหรับทหารกระโดดจากวงโคจรรุ่นต่อไป"
	new_implant.price = 0
	new_implant.bouncy = true
	new_implant.torso = true
	new_implant.hidden = true
	new_implant.texture = load("res://Textures/Menu/Implants/bouncy.png")
	
	IMPLANTS.append(new_implant)

	new_implant = Implant.new()
	new_implant.i_name = "ชุดหรูหรา"
	new_implant.explanation = "สำหรับโอกาสพิเศษเท่านั้น ไม่ป้องกันเลย"
	new_implant.price = 500000
	new_implant.instadeath = true
	new_implant.torso = true
	new_implant.texture = load("res://Textures/Menu/Implants/tux.png")
	
	IMPLANTS.append(new_implant)

	new_implant = Implant.new()
	new_implant.i_name = "จรวดชีวภาพ"
	new_implant.explanation = "ขับเคลื่อนตัวเองไปข้างหน้าด้วยกระแสของเหลวเหนียวจากรูที่หลัง แทนที่การเตะ"
	new_implant.price = 10000
	new_implant.thrust = true
	new_implant.torso = true
	new_implant.texture = load("res://Textures/Menu/Implants/biothruster.png")
	
	IMPLANTS.append(new_implant)

	new_implant = Implant.new()
	new_implant.i_name = "เจ็ตชีวภาพ"
	new_implant.explanation = "กระแสของเหลวอุ่นสม่ำเสมอยกตัวขึ้นและทำให้บินได้เหมือนนก แทนที่การเตะ"
	new_implant.price = 0
	new_implant.hidden = true
	new_implant.jetpack = true
	new_implant.torso = true
	new_implant.texture = load("res://Textures/Menu/Implants/jetpack.png")
	
	IMPLANTS.append(new_implant)

	new_implant = Implant.new()
	new_implant.i_name = "ระเบิดมือ HE"
	new_implant.explanation = "ระเบิดมือระเบิดแรงสูงธรรมดา สามารถใช้เบิกประตูล็อคบางบานได้"
	new_implant.price = 1000
	new_implant.speed_bonus = 0
	new_implant.arms = true
	new_implant.he_grenade = true
	new_implant.texture = load("res://Textures/Menu/Implants/he_grenade.png")
	
	IMPLANTS.append(new_implant)
	
	new_implant = Implant.new()
	new_implant.i_name = "ระเบิดเข็มหน้าไม้"
	new_implant.explanation = "เคลือบทุกอย่างใกล้เคียงด้วยเข็มหน้าไม้ทังสเตน"
	new_implant.price = 2000
	new_implant.speed_bonus = 0
	new_implant.arms = true
	new_implant.flechette_grenade = true
	new_implant.texture = load("res://Textures/Menu/Implants/flechette.png")
	
	IMPLANTS.append(new_implant)
	
	
	new_implant = Implant.new()
	new_implant.i_name = "ระเบิดยาสลบพิเศษ ZZzzz"
	new_implant.explanation = "ไม่ผลิตแล้วหลังจากรุ่นแรกส่วนใหญ่ไหลไปตลาดมืด เป็นที่ต้องการมากเพราะความสามารถในการทำให้เคลิ้มที่ว่ากันไม่เหมือนอะไร"
	new_implant.price = 1000
	new_implant.speed_bonus = 0
	new_implant.arms = true
	new_implant.sleep_grenade = true
	new_implant.texture = load("res://Textures/Menu/Implants/zzz.png")
	
	IMPLANTS.append(new_implant)
	
	new_implant = Implant.new()
	new_implant.i_name = "ชุดปฐมพยาบาล"
	new_implant.explanation = "ไอเท็มรักษาใช้ครั้งเดียว ดีที่มีติดตัวไว้ เคยเป็นนโยบายที่เก็บไว้ในห้องน้ำสำนักงานทุกแห่งแต่ถูกยกเลิกหลังจากพนักงานส่วนใหญ่ดูสุขภาพดีเกินไป"
	new_implant.price = 3000
	new_implant.speed_bonus = 0
	new_implant.arms = true
	new_implant.healing = 50
	new_implant.texture = load("res://Textures/Menu/Implants/medikit.png")
	
	IMPLANTS.append(new_implant)

	new_implant = Implant.new()
	new_implant.i_name = "เครื่องเล่นเทป Zomy X-200"
	new_implant.explanation = "เหมาะสำหรับฟังเพลงโปรดระหว่างเดินทาง"
	new_implant.price = 200
	new_implant.radio = true
	new_implant.speed_bonus = 0
	new_implant.arms = true
	
	new_implant.texture = load("res://Textures/Menu/Implants/radio.png")
	
	IMPLANTS.append(new_implant)

	new_implant = Implant.new()
	new_implant.i_name = "แขนเสริม"
	new_implant.explanation = "ขว้างของด้วยแรงมากขึ้น เหมาะสำหรับใช้หัวคนเป็นอาวุธยิง"
	new_implant.price = 1000
	new_implant.throw_bonus = 20
	new_implant.speed_bonus = 0
	new_implant.arms = true
	new_implant.texture = load("res://Textures/Menu/Implants/augarm.png")
	
	IMPLANTS.append(new_implant)
	
	new_implant = Implant.new()
	new_implant.i_name = "ผู้ทำลาย"
	new_implant.explanation = "สร้างฟองความเป็นจริงที่น้ำหนักของชีวิตที่ทนไม่ได้ถูกกลับด้าน"
	new_implant.price = 0
	new_implant.arms = true
	new_implant.speed_bonus = 0
	new_implant.grav = true
	new_implant.hidden = true
	new_implant.texture = load("res://Textures/Menu/Implants/abominator.png")
	
	IMPLANTS.append(new_implant)
	
	new_implant = Implant.new()
	new_implant.i_name = "ไส้เหนี่ยวเสริม"
	new_implant.explanation = "ลำไส้ภายนอกเพิ่มเติมสำหรับปีนและแกว่ง ลื่น เนียน และแข็งแรง มันเต้น"
	new_implant.price = 50000
	new_implant.grapple = true
	new_implant.speed_bonus = 0
	new_implant.arms = true
	new_implant.texture = load("res://Textures/Menu/Implants/grappendix.png")
	
	IMPLANTS.append(new_implant)

	new_implant = Implant.new()
	new_implant.i_name = "กระสุนเด้งแทคติค"
	new_implant.explanation = "เนื่องจากมาตรการความปลอดภัยเพิ่มขึ้น บางบริษัทเริ่มผลิตกระสุนที่เด้งโดยเจตนาสำหรับการยิงที่เป็นไปไม่ได้ ระวังเมื่อยิงตรงไปยังเป้าหมาย"
	new_implant.price = 1500
	new_implant.ricochet = true
	new_implant.arms = true
	new_implant.texture = load("res://Textures/Menu/Implants/angular.png")
	
	IMPLANTS.append(new_implant)

	new_implant = Implant.new()
	new_implant.i_name = "ต่อมผลิตกระสุน"
	new_implant.explanation = "อาวุธฟื้นตัวกระสุนอัตโนมัติแต่ไม่สามารถรีโหลดด้วยตัวเองได้อีก"
	new_implant.price = 10000
	new_implant.regen_ammo = true
	new_implant.arms = true
	new_implant.texture = load("res://Textures/Menu/Implants/ammogland.png")
	
	IMPLANTS.append(new_implant)
	
	new_implant = Implant.new()
	new_implant.i_name = "คบเพลิงสาป"
	new_implant.explanation = "อุปกรณ์ประหลาดที่มีออราสาปแช่ง แสงที่มันสาดรู้สึกผิด\n\n'มันเป็นไปได้ที่จะสร้างวัตถุที่แผ่ความตายบริสุทธิ์แรงกว่าดวงอาทิตย์ เราสามารถอธิษฐานได้เพียงว่าความรู้ดังกล่าวจะถูกซ่อนไว้อีกหลายยุค'\n-เฟอร์ดินันด์ ซอมเมอร์ ผู้อาวุโส"
	new_implant.price = 0
	new_implant.speed_bonus = 0
	new_implant.arms = true
	new_implant.cursed_torch = true
	new_implant.hidden = true
	new_implant.texture = load("res://Textures/Menu/Implants/cursed_torch.png")
	
	IMPLANTS.append(new_implant)
	

	new_implant = Implant.new()
	new_implant.i_name = "เวตแวร์ขาเอเลียน"
	new_implant.explanation = "อัพเกรดเวตแวร์ง่ายๆ ที่ปิดตัวจำกัดแรงเตะ บดขยี้เป้าหมายด้วยพลังมหาศาล"
	new_implant.price = 4000
	new_implant.kick_improvement = true
	new_implant.legs = true
	new_implant.texture = load("res://Textures/Menu/Implants/alienleg.png")
	
	IMPLANTS.append(new_implant)

	new_implant = Implant.new()
	new_implant.i_name = "ขานิวแมติก"
	new_implant.explanation = "เหมาะสำหรับกระโดดข้ามอุปสรรคและไปที่เข้าถึงยาก"
	new_implant.price = 3500
	new_implant.jump_bonus = 3
	new_implant.speed_bonus = 0
	new_implant.legs = true
	new_implant.texture = load("res://Textures/Menu/Implants/pneumalegs.png")
	
	IMPLANTS.append(new_implant)
	

	
	new_implant = Implant.new()
	new_implant.i_name = "อุปกรณ์เข้าแนวดิ่ง"
	new_implant.explanation = "เพิ่มพลังกระโดดอย่างมหาศาล ไม่ได้มีประโยชน์เสมอไป"
	new_implant.price = 7000
	new_implant.jump_bonus = 6
	new_implant.speed_bonus = 0
	new_implant.legs = true
	new_implant.texture = load("res://Textures/Menu/Implants/verticalentry.png")
	
	IMPLANTS.append(new_implant)

	new_implant = Implant.new()
	new_implant.i_name = "เครื่องจักรอิคารอส"
	new_implant.explanation = "ออกแบบมาสำหรับโครงการนักรบแห่งอนาคตเพื่อปรับโครงสร้างมิติเชิงเส้นตรงของสงคราม แต่ปลดประจำการหลังกองทหารเสริมเต็มรูปแบบทั้งกองร่วงดิ่งพื้น"
	new_implant.price = 0
	new_implant.jump_bonus = 20
	new_implant.speed_bonus = 0
	new_implant.legs = true
	new_implant.hidden = true
	new_implant.texture = load("res://Textures/Menu/Implants/icaros.png")
	
	IMPLANTS.append(new_implant)

	new_implant = Implant.new()
	new_implant.i_name = "จรวดเศษชีวภาพ"
	new_implant.explanation = "พุ่งตัวขึ้นกลางอากาศโดยปล่อยเศษชีวภาพต่างๆ สร้างความเลอะเทะมหาศาลที่ทำความสะอาดได้ไม่พอใจเลย"
	new_implant.price = 10000
	new_implant.double_jump = 1
	new_implant.legs = true
	new_implant.texture = load("res://Textures/Menu/Implants/gunkbooster.png")
	
	IMPLANTS.append(new_implant)

	new_implant = Implant.new()
	new_implant.i_name = "จรวดพุ่งคู่"
	new_implant.explanation = "เวอร์ชันอัพเกรดของจรวดเศษชีวภาพที่ให้พุ่งได้สองครั้ง ไม่ค่อยเป็นที่นิยมเพราะถุงเก็บขนาดใหญ่ที่ติดตั้งใต้ก้น"
	new_implant.price = 0
	new_implant.double_jump = 2
	new_implant.legs = true
	new_implant.hidden = true
	new_implant.texture = load("res://Textures/Menu/Implants/funkgrunters.png")
	
	IMPLANTS.append(new_implant)

	new_implant = Implant.new()
	new_implant.i_name = "ต่อมหลั่งน้ำมันจุลินทรีย์"
	new_implant.explanation = "พ่นน้ำมันจุลินทรีย์พิเศษที่ลดแรงเสียดทานทั้งหมดและทำให้ลื่นไปได้อย่างอิสระ กลิ่นหอมดีอย่างน่าประหลาดใจ"
	new_implant.price = 0
	new_implant.ski = true
	new_implant.speed_bonus = 0
	new_implant.legs = true
	new_implant.hidden = true
	
	new_implant.texture = load("res://Textures/Menu/Implants/oil.png")
	
	IMPLANTS.append(new_implant)

	new_implant = Implant.new()
	new_implant.i_name = "หมวกกันน็อคคอมโพสิต"
	new_implant.explanation = "หมวกกันน็อคธรรมดาที่ป้องกันได้จำกัด มีโอกาสสุ่มที่จะป้องกันการโจมตีหรือแตก"
	new_implant.price = 1000
	new_implant.head = true
	new_implant.helmet = true
	new_implant.texture = load("res://Textures/Menu/Implants/helmet.png")
	
	IMPLANTS.append(new_implant)

	new_implant = Implant.new()
	new_implant.i_name = "ตาชีวภาพซูมแอนโก"
	new_implant.explanation = "ด้วยเทคโนโลยีฝังดวงตาแบบปลั๊กแอนด์เพลย์ง่ายๆ แค่เอาออกใส่ได้เลย เพิ่มการเล็ง"
	new_implant.price = 1000
	new_implant.head = true
	new_implant.zoom_bonus = 0.5
	new_implant.texture = load("res://Textures/Menu/Implants/eyes1.png")
	
	IMPLANTS.append(new_implant)
	
	new_implant = Implant.new()
	new_implant.i_name = "เซ็นเซอร์ชีวิต"
	new_implant.explanation = "มักบอกว่าสามารถสัมผัสพลังชีวิตของสิ่งมีชีวิต แต่กลไกกลับกันจริงๆ ทำให้สัมผัสรูในเมทริกซ์ความตายพื้นหลัง"
	new_implant.price = 9000
	new_implant.head = true
	new_implant.sensor = true
	new_implant.texture = load("res://Textures/Menu/Implants/lifesensor.png")
	
	IMPLANTS.append(new_implant)
	
	new_implant = Implant.new()
	new_implant.i_name = "ปืนกระโหลก"
	new_implant.explanation = "เป็นที่นิยมในหมู่หุ่นยนต์บริษัทที่สมองตายแล้ว ต้องตักสมองออกนิดหน่อยเพื่อให้พอดี ยิงกระสุน HE จิ๋วสามนัด"
	new_implant.price = 12000
	new_implant.speed_bonus = 0
	new_implant.head = true
	new_implant.skullgun = true
	new_implant.texture = load("res://Textures/Menu/Implants/skullgun.png")
	
	IMPLANTS.append(new_implant)

	new_implant = Implant.new()
	new_implant.i_name = "โอเวอร์ไดรฟ์เมือก"
	new_implant.explanation = "แทนที่การผลิตฮอร์โมนตามธรรมชาติของต่อมใต้สมองทำให้เหงื่อกลายเป็นเมือกเหนียว ใช้โดยนักปีน"
	new_implant.price = 0
	new_implant.speed_bonus = 0
	new_implant.hidden = true
	new_implant.head = true
	new_implant.climb = true
	new_implant.texture = load("res://Textures/Menu/Implants/goo.png")
	
	IMPLANTS.append(new_implant)
	
	new_implant = Implant.new()
	new_implant.i_name = "ร่มชูตดอกไม้"
	new_implant.explanation = "ดอกไม้ต่างดาวที่ไม่ทราบที่มาปลูกบนหัวผู้ใช้ ทำงานเหมือนร่มชูชีพและเพิ่มทักษะทางปัญญา"
	new_implant.price = 0
	new_implant.slowfall = true
	new_implant.head = true
	new_implant.hidden = true
	new_implant.texture = load("res://Textures/Menu/Implants/flowerchute.png")
	
	IMPLANTS.append(new_implant)

	new_implant = Implant.new()
	new_implant.i_name = "ตัวย่อสมอง+"
	new_implant.explanation = "ให้ความสามารถทางจิตพันธุกรรมในการย่อร่างกายโดยอิทธิพลต่อค่าสเกล ติดตั้งในช่องเสริมหัว"
	new_implant.price = 0
	new_implant.speed_bonus = 0
	new_implant.head = true
	new_implant.hidden = true
	new_implant.shrink = true
	new_implant.texture = load("res://Textures/Menu/Implants/scaledown.png")
	
	IMPLANTS.append(new_implant)

	new_implant = Implant.new()
	new_implant.i_name = "หมวกกันฝนเก่าขาด"
	new_implant.explanation = "เก่าและสึกหรอ แกไม่เคยเห็นมาก่อนแต่รู้สึกคิดถึง"
	new_implant.price = 0
	new_implant.speed_bonus = 0
	new_implant.head = true
	new_implant.hidden = true
	new_implant.fishing_bonus = true
	new_implant.texture = load("res://Textures/Menu/Implants/fishinghat.png")
	
	IMPLANTS.append(new_implant)
	
	new_implant = Implant.new()
	new_implant.i_name = "ดวงตาหยั่งรู้บริษัท"
	new_implant.explanation = "หลอมรวมเข้ากับพลังโบราณของตลาด"
	new_implant.price = 250000
	new_implant.market_enhancer = true
	new_implant.speed_bonus = 0
	new_implant.head = true
	new_implant.texture = load("res://Textures/Menu/Implants/finance.png")
	
	IMPLANTS.append(new_implant)

	new_implant = Implant.new()
	new_implant.i_name = "แว่นตาฝันร้าย"
	new_implant.explanation = "มันส่งกลิ่นเหม็น ดูเหมือนไม่มีผลอะไร"
	new_implant.price = 10
	new_implant.speed_bonus = 0
	new_implant.head = true
	new_implant.nightmare = true
	new_implant.texture = load("res://Textures/Menu/Implants/nightmarescope.png")
	
	IMPLANTS.append(new_implant)

	new_implant = Implant.new()
	new_implant.i_name = "แว่นตามองกลางคืน"
	new_implant.explanation = "แว่นตามองกลางคืนธรรมดาที่ไวต่อกระแสเรขาคณิตของสสาร"
	new_implant.price = 0
	new_implant.speed_bonus = 0
	new_implant.head = true
	new_implant.hidden = true
	new_implant.nightvision = true
	new_implant.texture = load("res://Textures/Menu/Implants/nightvision.png")
	
	IMPLANTS.append(new_implant)

	new_implant = Implant.new()
	new_implant.i_name = "สโคปศักดิ์สิทธิ์"
	new_implant.explanation = "???"
	new_implant.price = 0
	new_implant.speed_bonus = 0
	new_implant.hidden = true
	new_implant.head = true
	new_implant.holy = true
	new_implant.texture = load("res://Textures/Menu/Implants/holyscope.png")
	
	IMPLANTS.append(new_implant)

	new_implant = Implant.new()
	new_implant.i_name = "บ้าน"
	new_implant.explanation = "บ้านชนบทของแกเองใกล้หมู่บ้านน่ารัก Lake Green"
	new_implant.price = 1000000
	new_implant.speed_bonus = 0
	new_implant.texture = load("res://Levels/Bonus5.png")
	
	IMPLANTS.append(new_implant)



