package org.eclipselabs.scwork.template.generator.client

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.generator.IBinFileGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class EyePngGenerator implements IBinFileGenerator {
	
	override shouldGenerate(InputParam param) {
		param.clientIncluded
	}
	
	override provideFile(InputParam param) {
		param.clientFile(#["resources", "icons","eye.png"])
	}
	
	override provideResourceName() {
		"eye.png"
	}
}
