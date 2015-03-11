package org.eclipselabs.scwork.template.generator.clientmobile

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.generator.common.AbstractOrgEclipseJdtUiPrefsGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class MobileClientOrgEclipseJdtUiPrefsGenerator extends AbstractOrgEclipseJdtUiPrefsGenerator {
	
	override shouldGenerate(InputParam param) {
		param.uirapIncluded
	}
	
	override provideFile(InputParam param) {
		param.clientmobileFile(subFilePath())
	}
}
