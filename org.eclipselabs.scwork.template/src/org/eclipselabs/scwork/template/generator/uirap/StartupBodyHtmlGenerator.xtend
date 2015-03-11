package org.eclipselabs.scwork.template.generator.uirap

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.generator.ITextFileGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class StartupBodyHtmlGenerator implements ITextFileGenerator {
	
	override shouldGenerate(InputParam param) {
		param.uirapIncluded
	}
	
	override provideFile(InputParam param) {
		param.uirapFile(#["web-resources", "startup-body.html"])
	}
	
	override provideContent(InputParam param) 
'''
<div style="position: absolute; bottom: 0px; left: 0px; overflow: hidden; width: 100%;">
	<img src="res/eclipseScoutBackground.png" />
	<img src="res/loading.gif" style="position: absolute; left: 530px; top: 170px;" />
</div>
'''
}
