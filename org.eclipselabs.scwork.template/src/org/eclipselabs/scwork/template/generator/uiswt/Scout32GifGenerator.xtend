package org.eclipselabs.scwork.template.generator.uiswt

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.generator.IBinFileGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class Scout32GifGenerator implements IBinFileGenerator {
	
	override shouldGenerate(InputParam param) {
		param.uiswtIncluded
	}
	
	override provideFile(InputParam param) {
		param.uiswtFile(#["resources", "icons", "eclipseScout32x32.gif"])
	}
	
	override provideResourceName() {
		"scout_32.gif"
	}
}
