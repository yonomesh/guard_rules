.PHONY: adguardhome up stop
adguardhome:
	git clone  --depth=1 https://github.com/AdguardTeam/HostlistsRegistry.git
	- rm -rf ./rules/adguardhome/*
	bash -c 'mv ./HostlistsRegistry/{assets,filters} ./rules/adguardhome'
sing:
	git clone  --branch sing --depth=1 https://github.com/MetaCubeX/meta-rules-dat.git
	- rm -rf ./rules/sing/*
	find ./meta-rules-dat -name "*.srs" -type f -delete
	bash -c 'mv ./meta-rules-dat/* ./rules/sing'
anti-ad:
	git clone --depth=1 https://github.com/privacy-protection-tools/anti-AD.git
	- rm -rf anti-ad/*
	mv ./anti-AD/anti-ad-adguard.txt ./rules/anti-ad
clean:
	- rm -rf HostlistsRegistry
	- rm -rf meta-rules-dat
	- rm -rf anti-AD
	
push:
	git add --all
	git commit -m "update $(shell date +'%Y%m%d%H%M%S')"
