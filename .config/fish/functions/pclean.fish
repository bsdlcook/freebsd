function pclean
	doas pkg autoremove -y && doas pkg clean -ay
end
