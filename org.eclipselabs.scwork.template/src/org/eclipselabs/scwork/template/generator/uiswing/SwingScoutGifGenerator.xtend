package org.eclipselabs.scwork.template.generator.uiswing

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.generator.IBinFileGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class SwingScoutGifGenerator implements IBinFileGenerator {
	
	override shouldGenerate(InputParam param) {
		param.uiswingIncluded
	}
	
	override provideFile(InputParam param) {
		param.uiswingFile(#["resources", "icons", "eclipse_scout.gif"])
	}
	
	override provideResourceName() {
		"scout_icon.gif"
	}
}
