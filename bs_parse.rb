#--------------------------------------------------------------------------------------------------
#bs_parse - basestation format parser and logger
#Version 0.1
#bs_parse is free software licensed under GNU GPLv3
#Copyright (C) 2017 - Alexey V. Voronin @ FoxyLab
#Email:    support@foxylab.com
#Website:  https://acdc.foxylab.com
#
#CREDITS
#
#Rob Altenburg - icao_db: Sqlite3 database of icao mode_s codes, aircraft type, and tail numbers
#https://github.com/RobAltenburg/icao_db
#
#AeroTransport Data Bank - http://www.aerotransport.org/html/ICAO_hex_decode.html
#---------------------------------------------------------------------------------------------------
require 'socket' 
require 'date'
require 'colorize'     #gem install colorize
require 'csv'		

require 'country.rb'				

exit_requested = false
Kernel.trap( "INT" ) { exit_requested = true }

hostname = 'localhost' 			#local computer
port = 30003           			#basestation port (TCP BaseStation output listen port, --net-sbs-port xxxxx)

#Ruby represents each table row as an array
icao_tail = Hash.new("")
icao_type = Hash.new("")

CSV.foreach('icao.csv') do |row|   #353043 records
	icao_tail[row[0]] = row[1]
	icao_type[row[0]] = row[2]
end

sock = TCPSocket.open(hostname, port)

#hashes create
trk_cs = Hash.new("")				#callsign
trk_sq = Hash.new("")				#squawk
trk_alt = Hash.new("")				#altitude
trk_trk = Hash.new("")				#track
trk_gs = Hash.new("")				#ground speed
trk_lat = Hash.new("")				#latitude
trk_lng = Hash.new("")				#longitude
trk_start_date =  Hash.new("")		#start date
trk_start_time = Hash.new("")		#start time
trk_stop_date =  Hash.new("")		#stop date
trk_stop_time = Hash.new("")		#stop time
trk_tail =  Hash.new("")			#tail number
trk_type =  Hash.new("")			#type
trk_country = Hash.new("")			#country


while (line = sock.gets.chomp) &&  (!exit_requested)
#read next line from the socket - Ruby uses LF = \n to detect newline
#gets returns a string and a '\n' character, while chomp removes this '\n'
#gets returns nil at end of file.
#when a socket is closed, it sends eof to the other side.
#therefore gets() returns nil
	fields = line.split(",")
	#AC data init
	hexident = ""
	aircraftid = ""
	flightid = ""
	cs = ""
	alt = ""
	gs = ""
	trk = ""
	lat = ""
	lng = ""
	vr = ""
	sq = ""
	alrt = ""
	emer = ""
	spi = ""
	gnd = ""
	start_date = ""
	start_time = ""
	stop_date = ""
	stop_time = ""
	tail = ""
	type = ""
	country = ""

	#types
	case fields[0].to_s
	when "SEL"
		#SELECTION CHANGE MESSAGE 	
		#Generated when the user changes the selected aircraft in BaseStation
		print "SEL"
		print ":"
		if (trk_cs.has_key?(fields[4].to_s))
            hexident = fields[4].to_s
            cs = fields[10].to_s
            trk_cs[hexident] = cs
            print hexident
		end
		print "\r\n"
	when "ID"
		#NEW ID MESSAGE 	
		#Generated when an aircraft being tracked sets or changes its callsign
		print "ID"
		print ":"
		if (trk_cs.has_key?(fields[4].to_s))
            hexident = fields[4].to_s
            cs = fields[10].to_s
            trk_cs[hexident] = cs
            print hexident
		end
		print "\r\n"
	when "AIR"
		#NEW AIRCRAFT MESSAGE 	
		#Generated when the SBS picks up a signal for an aircraft that it isn't currently tracking
		print "AIR"
		print ":"
		hexident = fields[4].to_s
		start_date =  fields[6].to_s
		start_time = fields[7].to_s
		#start date/time
		trk_start_date[hexident] = start_date
		trk_start_time[hexident] = start_time
		#database search
		#tail number, aircraft type
		tail = ""
		type = ""
		if (icao_tail.has_key?(hexident))
			tail = icao_tail[hexident]
			type = icao_type[hexident]
		end
		trk_tail[hexident] = tail
		trk_type[hexident] = type
		#country
		hexnum = hexident.to_i(base=16)
		country = Country.hex2country(hexnum)
		trk_country[hexident] = country
		print hexident
		print ":"
		print country
		print ":"
		print tail
		print ":"
		print type
		print "\r\n"
		#key-value pairs init
		trk_cs[hexident] = ""
		trk_sq[hexident] = ""
		trk_alt[hexident] = ""
		trk_trk[hexident] = ""
		trk_gs[hexident] = ""
		trk_lat[hexident] = ""
		trk_lng[hexident] = ""
		trk_stop_date[hexident] = ""
		trk_stop_time[hexident] = ""
	when "STA"
		#STATUS CHANGE MESSAGE 	
		#Generated when an aircraft's status changes according to the time-out
		#values in the Data Settings menu.
		print "STA"
		print ":"
		if (trk_cs.has_key?(fields[4].to_s))
			hexident = fields[4].to_s
			print hexident
			print ":"
			print fields[10].to_s
			# STA message uses the callsign field to record status flags based on user time-out values.
			# Values are PL (Position Lost), SL (Signal Lost), RM (Remove), AD (Delete) and OK (used to reset time-outs if aircraft returns into cover)
			if (fields[10].to_s)=="RM"
				#stop date/time
				stop_date =  fields[6].to_s
				stop_time = fields[7].to_s
				trk_stop_date[hexident] = stop_date
				trk_stop_time[hexident] = stop_time
				#save last data to file
				filename = Time.now.utc.strftime("%Y%m%d")
				filename = 'bs_' + filename
				filename = filename + '.txt'
				print " >> "
				print filename
				File.open(filename,'ab') do |fo|
					fo.write hexident                #HEX  Aircraft Mode S hexadecimal code, given in upper case (military and civilian)
					fo.putc "\t"
					fo.write trk_country[hexident]	 #country
					fo.putc "\t"
					fo.write trk_tail[hexident]		 #tail number
					fo.putc "\t"
					fo.write trk_type[hexident]		 #aircraft type
					fo.putc "\t"
					fo.write trk_cs[hexident]        #CS   eight digit flight ID 
					fo.putc "\t"
					fo.write trk_sq[hexident]        #SQ    Assigned Mode A squawk code  (transponder Mode 3/A)  0000...7777
												 #4-digit octal identification code for the aircraft,
												 #assigned by the air traffic controller. (military and civilian)
												 #7700: General Emergency
												 #7600: Lost Communications
												 #7500: Unlawful Interference (Hijack)
					fo.putc "\t"
					fo.write trk_gs[hexident]        #GS	   Speed over ground (not indicated airspeed) in knots
					fo.putc "\t"
					fo.write trk_alt[hexident]       #ALT   Mode C altitude.   Height relative to 1013.2mb (Flight Level) (transponder Mode C)
												 #4-digit octal code for aircraft's pressure altitude. (military and civilian)
					fo.putc "\t"
					fo.write trk_trk[hexident]       #TRK   Track of aircraft (not heading), in degrees
					fo.putc "\t"
					fo.write trk_lat[hexident]       #LAT
					fo.putc "\t"
					fo.write trk_lng[hexident]       #LNG
					fo.putc "\t"
					fo.write trk_start_date[hexident]       #DMG  Generation time of the message
					fo.putc "\t"
					fo.write trk_start_time[hexident]       #TMG
					fo.putc "\t"
					fo.write trk_stop_date[hexident]       #DMG
					fo.putc "\t"
					fo.write trk_stop_time[hexident]       #TMG
					fo.putc "\r"
					fo.putc "\n"
				#the file is closed automatically
				end
				#key-value pairs delete
				trk_cs.delete(hexident)
				trk_sq.delete(hexident)
				trk_alt.delete(hexident)
				trk_trk.delete(hexident)
				trk_gs.delete(hexident)
				trk_lat.delete(hexident)
				trk_lng.delete(hexident)
				trk_start_date.delete(hexident)
				trk_start_time.delete(hexident)
				trk_stop_date.delete(hexident)
				trk_stop_time.delete(hexident)
				trk_tail.delete(hexident)
				trk_type.delete(hexident)
				trk_country.delete(hexident)
				hexident = ""
			end
		end
		print "\r\n"
	when "CLK"
		#CLICK MESSAGE
		#Generated when the user double-clicks (or presses return) on an aircraft
		print "CLK"
		print ":"
		print "\r\n"
	when "MSG"
		#TRANSMISSION MESSAGE
		#Generated by the aircraft. There are eight different MSG types
		print "MSG"
		print ":"
		if (trk_cs.has_key?(fields[4].to_s))
			hexident = fields[4].to_s
			#MSG sub types
			#BDS Y,Z ->  Y - BDS1 code; Z - BDS2 code
			#DF = Downlink Format, BDS = Binary Data Store
			if (fields[1].to_s)=="1"
				#ES Identification and Category
				#AC category and index information
				#DF17 BDS 0,8
				cs = fields[10].to_s
				trk_cs[hexident] = cs
				print hexident
				print ":"
				print "ES ID"
				print ":"
				print cs
			end
			if (fields[1].to_s)=="2"
				#ES Surface Position Message
				#information about position on ground
				#DF17 BDS 0,6
				#Triggered by nose gear squat switch
				lat = fields[14].to_s
				lng = fields[15].to_s
				trk_lat[hexident] = lat
				trk_lng[hexident] = lng
				alt = fields[11].to_s
				trk_alt[hexident] = alt
				gs = fields[12].to_s
				trk_gs[hexident] = gs
				trk = fields[13].to_s
				trk_trk[hexident] = trk
				print hexident
				print ":"
				print "ES POS SUR"
				print ":"
				print alt
				print ":"
				print gs
				print ":"
				print trk
				print ":"
				print lat
				print ":"
				print lng
			end
			if (fields[1].to_s)=="3"
				#ES Airborne Position Message
				#information about position in air
				#DF17 BDS 0,5
				lat = fields[14].to_s
				lng = fields[15].to_s
				trk_lat[hexident] = lat
				trk_lng[hexident] = lng
				alt = fields[11].to_s
				trk_alt[hexident] = alt
				print hexident
				print ":"
				print "ES POS AIR"
				print ":"
				print alt
				print ":"
				print lat
				print ":"
				print lng
			end
			if (fields[1].to_s)=="4"
				#ES Airborne Velocity Message
				#information about velocity in air 
				#DF17 BDS 0,9
				gs = fields[12].to_s
				trk_gs[hexident] = gs
				trk = fields[13].to_s
				trk_trk[hexident] = trk
				print hexident
				print ":"
				print "ES VEL AIR"
				print ":"
				print gs
				print ":"
				print trk
			end
			if (fields[1].to_s)=="5"
				#Surveillance Alt Message
				#DF4, DF20
				alt = fields[11].to_s
				trk_alt[hexident] = alt
				print hexident
				print ":"
				print "GND ALT"
				print ":"
				print alt
			end
			if (fields[1].to_s)=="6"
				#Surveillance ID Message
				#DF5, DF21
				sq = fields[17].to_s
				trk_sq[hexident] = sq
				alt = fields[11].to_s
				trk_alt[hexident] = alt
				print hexident
				print ":"
				print "GND ID"
				print ":"
				print alt
				print ":"
				print sq
			end
			if (fields[1].to_s)=="7"
				#Air To Air Message
				#DF16
				alt = fields[11].to_s
				trk_alt[hexident] = alt
				print hexident
				print ":"
				print "TCAS"
				print ":"
				print alt
			end
			if (fields[1].to_s)=="8"
				#All Call Reply
				#DF11
				print hexident
				print ":"
				print "GND ALL"
			end
		end
		print "\r\n"
	end

end
sock.close               # Close the socket when done