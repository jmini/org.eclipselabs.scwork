package org.eclipselabs.scwork.template.generator.uirap

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.generator.IBinFileGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class ScoutBackgroundPngGenerator implements IBinFileGenerator {
	
	override shouldGenerate(InputParam param) {
		param.uirapIncluded
	}
	
	override provideFile(InputParam param) {
		param.uirapFile(#["web-resources", "eclipseScoutBackground.png"])
	}
	
	override provideResourceName() {
		"scout_banner.png"
	}
}
