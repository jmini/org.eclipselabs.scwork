package org.eclipselabs.scwork.template.generator.uirap

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.generator.ITextFileGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class HtmlStylesCssGenerator implements ITextFileGenerator {
	
	override shouldGenerate(InputParam param) {
		param.uirapIncluded
	}
	
	override provideFile(InputParam param) {
		param.uirapFile(#["web-resources", "html-styles.css"])
	}
	
	override provideContent(InputParam param) 
'''
/**
 * CSS definitions used for the client-side generated html content (is directly included in the rwt-index.html)
 * <p>
 * Defines for example the default link color for inline html in table cells.
 */
a{color:#67a8ce;}
'''
}
