module Country
def Country.hex2country(hexnum)
	case hexnum
		when 0x098000 .. 0x0983FF
			country = "Djibouti"
		when 0x4A8000 .. 0x4AFFFF
			country = "Sweden"
		when 0x730000 .. 0x737FFF
			country = "Iran"
		when 0x004000 .. 0x0043FF
			country = "Zimbabwe"
		when 0x09A000 .. 0x09AFFF
			country = "Gambia"
		when 0x4B0000 .. 0x4B7FFF
			country = "Switzerland"
		when 0x738000 .. 0x73FFFF
			country = "Israel"
		when 0x006000 .. 0x006FFF
			country = "Mozambique"
		when 0x09C000 .. 0x09CFFF
			country = "Burkina Faso"
		when 0x4B8000 .. 0x4BFFFF
			country = "Turkey"
		when 0x740000 .. 0x747FFF
			country = "Jordan"
		when 0x008000 .. 0x00FFFF
			country = "South Africa"
		when 0x09E000 .. 0x09E3FF
			country = "Sao Tome"
		when 0x4C0000 .. 0x4C7FFF
			country = "Yugoslavia"
		when 0x748000 .. 0x74FFFF
			country = "Lebanon"
		when 0x010000 .. 0x017FFF
			country = "Egypt"
		when 0x0A0000 .. 0x0A7FFF
			country = "Algeria"
		when 0x4C8000 .. 0x4C83FF
			country = "Cyprus"
		when 0x750000 .. 0x757FFF
			country = "Malaysia"
		when 0x018000 .. 0x01FFFF
			country = "Libya"
		when 0x0A8000 .. 0x0A8FFF
			country = "Bahamas"
		when 0x4CA000 .. 0x4CAFFF
			country = "Ireland"
		when 0x758000 .. 0x75FFFF
			country = "Philippines"
		when 0x020000 .. 0x027FFF
			country = "Morocco"
		when 0x0AA000 .. 0x0AA3FF
			country = "Barbados"
		when 0x4CC000 .. 0x4CCFFF
			country = "Iceland"
		when 0x760000 .. 0x767FFF
			country = "Pakistan"
		when 0x028000 .. 0x02FFFF
			country = "Tunisia"
		when 0x0AB000 .. 0x0AB3FF
			country = "Belize"
		when 0x4D0000 .. 0x4D03FF
			country = "Luxembourg"
		when 0x768000 .. 0x76FFFF
			country = "Singapore"
		when 0x030000 .. 0x0303FF
			country = "Botswana"
		when 0x0AC000 .. 0x0ACFFF
			country = "Colombia"
		when 0x4D2000 .. 0x4D23FF
			country = "Malta"
		when 0x770000 .. 0x777FFF
			country = "Sri Lanka"
		when 0x032000 .. 0x032FFF
			country = "Burundi"
		when 0x0AE000 .. 0x0AEFFF
			country = "Costa Rica"
		when 0x4D4000 .. 0x4D43FF
			country = "Monaco"
		when 0x778000 .. 0x77FFFF
			country = "Syria"
		when 0x034000 .. 0x034FFF
			country = "Cameroon"
		when 0x0B0000 .. 0x0B0FFF
			country = "Cuba"
		when 0x500000 .. 0x5003FF
			country = "San Marino"
		when 0x780000 .. 0x7BFFFF
			country = "China"
		when 0x035000 .. 0x0353FF
			country = "Comoros"
		when 0x0B2000 .. 0x0B2FFF
			country = "El Salvador"
		when 0x7C0000 .. 0x7FFFFF
			country = "Australia"
		when 0x036000 .. 0x036FFF
			country = "Congo"
		when 0x0B4000 .. 0x0B4FFF
			country = "Guatemala"
		when 0x501000 .. 0x5013FF
			country = "Albania"
		when 0x800000 .. 0x83FFFF
			country = "India"
		when 0x038000 .. 0x038FFF
			country = "C&ocirc;te d Ivoire"
		when 0x0B6000 .. 0x0B6FFF
			country = "Guyana"
		when 0x501C00 .. 0x501FFF
			country = "Croatia"
		when 0x840000 .. 0x87FFFF
			country = "Japan"
		when 0x03E000 .. 0x03EFFF
			country = "Gabon"
		when 0x0B8000 .. 0x0B8FFF
			country = "Haiti"
		when 0x502C00 .. 0x502FFF
			country = "Latvia"
		when 0x880000 .. 0x887FFF
			country = "Thailand"
		when 0x040000 .. 0x040FFF
			country = "Ethiopia"
		when 0x0BA000 .. 0x0BAFFF
			country = "Honduras"
		when 0x503C00 .. 0x503FFF
			country = "Lithuania"
		when 0x888000 .. 0x88FFFF
			country = "Viet Nam"
		when 0x042000 .. 0x042FFF
			country = "Equatorial Guinea"
		when 0x0BC000 .. 0x0BC3FF
			country = "St.Vincent + Grenadines"
		when 0x504C00 .. 0x504FFF
			country = "Moldova"
		when 0x890000 .. 0x890FFF
			country = "Yemen"
		when 0x044000 .. 0x044FFF
			country = "Ghana"
		when 0x0BE000 .. 0x0BEFFF
			country = "Jamaica"
		when 0x505C00 .. 0x505FFF
			country = "Slovakia"
		when 0x894000 .. 0x894FFF
			country = "Bahrain"
		when 0x046000 .. 0x046FFF
			country = "Guinea"
		when 0x0C0000 .. 0x0C0FFF
			country = "Nicaragua"
		when 0x506C00 .. 0x506FFF
			country = "Slovenia"
		when 0x895000 .. 0x8953FF
			country = "Brunei"
		when 0x048000 .. 0x0483FF
			country = "Guinea-Bissau"
		when 0x0C2000 .. 0x0C2FFF
			country = "Panama"
		when 0x507C00 .. 0x507FFF
			country = "Uzbekistan"
		when 0x896000 .. 0x896FFF
			country = "United Arab Emirates"
		when 0x04A000 .. 0x04A3FF
			country = "Lesotho"
		when 0x0C4000 .. 0x0C4FFF
			country = "Dominican Republic"
		when 0x508000 .. 0x50FFFF
			country = "Ukraine"
		when 0x897000 .. 0x8973FF
			country = "Solomon Islands"
		when 0x04C000 .. 0x04CFFF
			country = "Kenya"
		when 0x0C6000 .. 0x0C6FFF
			country = "Trinidad and Tobago"
		when 0x510000 .. 0x5103FF
			country = "Belarus"
		when 0x898000 .. 0x898FFF
			country = "Papua New Guinea"
		when 0x050000 .. 0x050FFF
			country = "Liberia"
		when 0x0C8000 .. 0x0C8FFF
			country = "Suriname"
		when 0x511000 .. 0x5113FF
			country = "Estonia"
		when 0x899000 .. 0x8993FF
			country = "Taiwan (unofficial)"
		when 0x054000 .. 0x054FFF
			country = "Madagascar"
		when 0x0CA000 .. 0x0CA3FF
			country = "Antigua &amp; Barbuda"
		when 0x512000 .. 0x5123FF
			country = "Macedonia"
		when 0x8A0000 .. 0x8A7FFF
			country = "Indonesia"
		when 0x058000 .. 0x058FFF
			country = "Malawi"
		when 0x0CC000 .. 0x0CC3FF
			country = "Grenada"
		when 0x513000 .. 0x5133FF
			country = "Bosnia &amp; Herzegovina"
		when 0x05A000 .. 0x05A3FF
			country = "Maldives"
		when 0x0D0000 .. 0x0D7FFF
			country = "Mexico"
		when 0x514000 .. 0x5143FF
			country = "Georgia"
		when 0x900000 .. 0x9003FF
			country = "Marshall Islands"
		when 0x05C000 .. 0x05CFFF
			country = "Mali"
		when 0x0D8000 .. 0x0DFFFF
			country = "Venezuela"
		when 0x515000 .. 0x5153FF
			country = "Tajikistan"
		when 0x901000 .. 0x9013FF
			country = "Cook Islands"
		when 0x05E000 .. 0x05E3FF
			country = "Mauritania"
		when 0x100000 .. 0x1FFFFF
			country = "Russia"
		when 0x600000 .. 0x6003FF
			country = "Armenia"
		when 0x902000 .. 0x9023FF
			country = "Samoa"
		when 0x060000 .. 0x0603FF
			country = "Mauritius"
		when 0xA00000 .. 0xAFFFFF
			country = "United States"
		when 0x062000 .. 0x062FFF
			country = "Niger"
		when 0x201000 .. 0x2013FF
			country = "Namibia"
		when 0x600800 .. 0x600BFF
			country = "Azerbaijan"
		when 0xB00000 .. 0xBFFFFF
			country = "Nigeria"
		when 0x202000 .. 0x2023FF
			country = "Eritrea"
		when 0x601000 .. 0x6013FF
			country = "Kyrgyzstan"
		when 0xC00000 .. 0xC3FFFF
			country = "Canada"
		when 0x068000 .. 0x068FFF
			country = "Uganda"
		when 0x601800 .. 0x601BFF
			country = "Turkmenistan"
		when 0xC80000 .. 0xC87FFF
			country = "New Zealand"
		when 0x06A000 .. 0x06A3FF
			country = "Qatar"
		when 0x300000 .. 0x33FFFF
			country = "Italy"
		when 0xC88000 .. 0xC88FFF
			country = "Fiji"
		when 0x06C000 .. 0x06CFFF
			country = "Central African Republic"
		when 0x340000 .. 0x37FFFF
			country = "Spain"
		when 0x680000 .. 0x6803FF
			country = "Bhutan"
		when 0xC8A000 .. 0xC8A3FF
			country = "Nauru"
		when 0x06E000 .. 0x06EFFF
			country = "Rwanda"
		when 0x380000 .. 0x3BFFFF
			country = "France"
		when 0x681000 .. 0x6813FF
			country = "Micronesia"
		when 0xC8C000 .. 0xC8C3FF
			country = "Saint Lucia"
		when 0x070000 .. 0x070FFF
			country = "Senegal"
		when 0x3C0000 .. 0x3FFFFF
			country = "Germany"
		when 0x682000 .. 0x6823FF
			country = "Mongolia"
		when 0xC8D000 .. 0xC8D3FF
			country = "Tonga"
		when 0x074000 .. 0x0743FF
			country = "Seychelles"
		when 0x400000 .. 0x43FFFF
			country = "United Kingdom"
		when 0x683000 .. 0x6833FF
			country = "Kazakhstan"
		when 0xC8E000 .. 0xC8E3FF
			country = "Kiribati"
		when 0x076000 .. 0x0763FF
			country = "Sierra Leone"
		when 0x440000 .. 0x447FFF
			country = "Austria"
		when 0x684000 .. 0x6843FF
			country = "Palau"
		when 0xC90000 .. 0xC903FF
			country = "Vanuatu"
		when 0x078000 .. 0x078FFF
			country = "Somalia"
		when 0x448000 .. 0x44FFFF
			country = "Belgium"
		when 0x700000 .. 0x700FFF
			country = "Afghanistan"
		when 0x07A000 .. 0x07A3FF
			country = "Swaziland"
		when 0x450000 .. 0x457FFF
			country = "Bulgaria"
		when 0x702000 .. 0x702FFF
			country = "Bangladesh"
		when 0xE00000 .. 0xE3FFFF
			country = "Argentina"
		when 0x07C000 .. 0x07CFFF
			country = "Sudan"
		when 0x458000 .. 0x45FFFF
			country = "Denmark"
		when 0x704000 .. 0x704FFF
			country = "Myanmar"
		when 0xE40000 .. 0xE7FFFF
			country = "Brazil"
		when 0x080000 .. 0x080FFF
			country = "Tanzania"
		when 0x460000 .. 0x467FFF
			country = "Finland"
		when 0x706000 .. 0x706FFF
			country = "Kuwait"
		when 0xE80000 .. 0xE80FFF
			country = "Chile"
		when 0x084000 .. 0x084FFF
			country = "Chad"
		when 0x468000 .. 0x46FFFF
			country = "Greece"
		when 0x708000 .. 0x708FFF
			country = "Laos"
		when 0xE84000 .. 0xE84FFF
			country = "Ecuador"
		when 0x088000 .. 0x088FFF
			country = "Togo"
		when 0x470000 .. 0x477FFF
			country = "Hungary"
		when 0x70A000 .. 0x70AFFF
			country = "Nepal"
		when 0xE88000 .. 0xE88FFF
			country = "Paraguay"
		when 0x08A000 .. 0x08AFFF
			country = "Zambia"
		when 0x478000 .. 0x47FFFF
			country = "Norway"
		when 0x70C000 .. 0x70C3FF
			country = "Oman"
		when 0xE8C000 .. 0xE8CFFF
			country = "Peru"
		when 0x08C000 .. 0x08CFFF
			country = "D R Congo"
		when 0x480000 .. 0x487FFF
			country = "Netherlands"
		when 0x70E000 .. 0x70EFFF
			country = "Cambodia"
		when 0xE90000 .. 0xE90FFF
			country = "Uruguay"
		when 0x090000 .. 0x090FFF
			country = "Angola"
		when 0x488000 .. 0x48FFFF
			country = "Poland"
		when 0x710000 .. 0x717FFF
			country = "Saudi Arabia"
		when 0xE94000 .. 0xE94FFF
			country = "Bolivia"
		when 0x094000 .. 0x0943FF
			country = "Benin"
		when 0x490000 .. 0x497FFF
			country = "Portugal"
		when 0x718000 .. 0x71FFFF
			country = "Korea (South)"
		when 0x096000 .. 0x0963FF
			country = "Cape Verde"
		when 0x498000 .. 0x49FFFF
			country = "Czech Republic"
		when 0x720000 .. 0x727FFF
			country = "Korea (North)"
		when 0xF00000 .. 0xF07FFF
			country = "ICAO (1)"
		when 0x4A0000 .. 0x4A7FFF
			country = "Romania"
		when 0x728000 .. 0x72FFFF
			country = "Iraq"
		else
			country = ""
	end
   return country
end