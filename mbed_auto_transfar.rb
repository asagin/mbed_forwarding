require "fileutils"

loop do

	binName = Array.new
	binName = Dir.glob("/Users/asagin/Downloads/*.bin") #Download Directory
	mbedDir = "/Volumes/ASAGIBED/" #your MBED
	count = binName.length
	count -= 1

	a = 1

	latestTime = File.mtime(binName[0])
	latestFile = binName[0]

	count.times do

		if latestTime < File.mtime(binName[a]) then
			latestTime = File.mtime(binName[a])
			latestFile = binName[a]
			a += 1
		elsif latestTime > File.mtime(binName[a]) then
			a += 1
		else 
			p "same."
		end
	end

	p latestTime
	p latestFile
	nowFile = 0
	if nowFile != latestFile then
		FileUtils.cp latestFile, mbedDir,{:preserve => true}
		nowFile = latestFile
	end 
	sleep(3)
end
