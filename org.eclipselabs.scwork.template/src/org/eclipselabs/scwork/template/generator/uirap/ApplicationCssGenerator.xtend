package org.eclipselabs.scwork.template.generator.uirap

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.generator.ITextFileGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class ApplicationCssGenerator implements ITextFileGenerator {
	
	override shouldGenerate(InputParam param) {
		param.uirapIncluded
	}
	
	override provideFile(InputParam param) {
		param.uirapFile(#["theme", "application.css"])
	}
	
	override provideContent(InputParam param) 
'''
/***************************************************
 * This file extends 'org.eclipse.scout.rt.ui.rap/theme/scout.css'.
 * Existing and additional styles can be set here.
 **************************************************/
'''
}
