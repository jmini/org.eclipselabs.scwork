package org.eclipselabs.scwork.template.generator.uirap

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.generator.ITextFileGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class RapBuildPropertiesGenerator implements ITextFileGenerator {
	
	override shouldGenerate(InputParam param) {
		param.uirapIncluded
	}
	
	override provideFile(InputParam param) {
		param.uirapFile("build.properties")
	}
	
	override provideContent(InputParam param) 
'''
source.. = src/
output.. = bin/
bin.includes = META-INF/,\
               .,\
               plugin.xml,\
               theme/,\
               web-resources/
'''
}
