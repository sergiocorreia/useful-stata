cap pr drop UninstallAndInstall
program UninstallAndInstall
	args prog
	cap ado uninstall `prog'

	if ("`prog'"=="ftools") {
		loc cmd net install ftools, from("https://github.com/sergiocorreia/ftools/raw/master/src/")
	}
	else if ("`prog'"=="reghdfe") {
		loc cmd net install reghdfe, from("https://github.com/sergiocorreia/reghdfe/raw/master/src/")
	}
	else {
		loc cmd ssc install `prog'
	}
	di as text `"`cmd'"'
	`cmd'
end

adopath

* Merged into ftools
cap ado uninstall moresyntax

loc programs moremata boottest ivreg2 ftools reghdfe estout egenmore binscatter

foreach prog of loc programs {
	UninstallAndInstall `prog'
	di as text "----" _n _n
}

exit
