package org.eclipselabs.scwork.template.generator.target

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.generator.ITextFileGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class TargetDotProjectGenerator implements ITextFileGenerator {
	
	override shouldGenerate(InputParam param) {
		true
	}
	
	override provideFile(InputParam param) {
		param.targetFile(".project")
	}
	
	override provideContent(InputParam param) 
'''
<?xml version="1.0" encoding="UTF-8"?>
<projectDescription>
	<name>«param.targetProjectName»</name>
	<comment></comment>
	<projects>
	</projects>
	<buildSpec>
	</buildSpec>
	<natures>
	</natures>
</projectDescription>
'''
}
