package org.eclipselabs.scwork.template.generator.clientmobile

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.generator.ITextFileGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class MobileClientBuildPropertiesGenerator implements ITextFileGenerator {
	
	override shouldGenerate(InputParam param) {
		param.uirapIncluded
	}
	
	override provideFile(InputParam param) {
		param.clientmobileFile("build.properties")
	}
	
	override provideContent(InputParam param) 
'''
source.. = src/
output.. = bin/
bin.includes = META-INF/,\
               .,\
               plugin.xml
'''
}
