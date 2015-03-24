package org.eclipselabs.scwork.template.generator.shared

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.generator.common.AbstractJavaDotProjectGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class SharedDotProjectGenerator extends AbstractJavaDotProjectGenerator {
	
	override shouldGenerate(InputParam param) {
		param.sharedIncluded
	}
	
	override provideFile(InputParam param) {
		param.sharedFile(".project")
	}
	
	override provideProjectName(InputParam param) {
		param.sharedProjectName
	}
}
