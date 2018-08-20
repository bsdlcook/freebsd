function pupdate
	doas portsnap fetch extract update && doas pkg clean
end
