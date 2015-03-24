package org.eclipselabs.scwork.template.generator.target

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.generator.common.AbstractDotProjectGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class TargetDotProjectGenerator extends AbstractDotProjectGenerator {
	
	override shouldGenerate(InputParam param) {
		true
	}
	
	override provideFile(InputParam param) {
		param.targetFile(subFilePath)
	}
	
	override provideProjectName(InputParam param) {
		param.targetProjectName
	}

	override provideBuildCommandName(InputParam param) {
	}
	
	override provideNatures(InputParam param) {
	}
}
