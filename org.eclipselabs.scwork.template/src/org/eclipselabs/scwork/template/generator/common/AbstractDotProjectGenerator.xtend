package org.eclipselabs.scwork.template.generator.common

import java.util.List
import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.generator.ITextFileGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

abstract class AbstractDotProjectGenerator implements ITextFileGenerator {
	
	def subFilePath() {
		#[".project"]
	}
	
	override provideContent(InputParam param) 
'''
<?xml version="1.0" encoding="UTF-8"?>
<projectDescription>
	<name>«param.provideProjectName»</name>
	<comment></comment>
	<projects>
	</projects>
	<buildSpec>
		«FOR buildCommandName : param.provideBuildCommandName.notNull»
		<buildCommand>
			<name>«buildCommandName»</name>
			<arguments>
			</arguments>
		</buildCommand>
		«ENDFOR»
	</buildSpec>
	<natures>
		«FOR nature : param.provideNatures.notNull»
		<nature>«nature»</nature>
		«ENDFOR»
	</natures>
</projectDescription>
'''

	def abstract String provideProjectName(InputParam param)
	
	def abstract List<String> provideBuildCommandName(InputParam param)
	
	def abstract List<String> provideNatures(InputParam param)
}
