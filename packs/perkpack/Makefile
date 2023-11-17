.PHONY: clean

datapacks/perkpack_extended_drawers.zip:
	cd datapacks/perkpack_extended_drawers && zip -r ../perkpack_extended_drawers .

prism-instance.zip:
	cd prism-instance && zip -r ../prism-instance . -i@manifest.txt

clean:
	-rm prism-instance.zip
