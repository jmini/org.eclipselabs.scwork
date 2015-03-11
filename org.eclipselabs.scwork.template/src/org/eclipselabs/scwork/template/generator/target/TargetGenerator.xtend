package org.eclipselabs.scwork.template.generator.target

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.generator.ITextFileGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class TargetGenerator implements ITextFileGenerator {
	
	override shouldGenerate(InputParam param) {
		true
	}
	
	override provideFile(InputParam param) {
		param.targetFile(param.projectAlias + ".target")
	}
	
	override provideContent(InputParam param) 
'''
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<?pde version="3.8"?><target name="«param.projectAlias»" sequenceNumber="1">
<locations>
<location path="${eclipse_home}\" type="Directory"/>
«IF(param.uirapIncluded)»<location path="${scout_rap_target}" type="Directory"/>«ENDIF»
</locations>
<launcherArgs>
<vmArgs>-Xms256m -Xmx512m </vmArgs>
</launcherArgs>
</target>
'''
}
