package org.eclipselabs.scwork.template.generator.client

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.generator.ITextFileGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class ClientBuildPropertiesGenerator implements ITextFileGenerator {
	
	override shouldGenerate(InputParam param) {
		param.clientIncluded
	}
	
	override provideFile(InputParam param) {
		param.clientFile("build.properties")
	}
	
	override provideContent(InputParam param) 
'''
source.. = src/
output.. = bin/
bin.includes = META-INF/,\
               .,\
               resources/,\
               plugin.xml
'''
}
