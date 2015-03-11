package org.eclipselabs.scwork.template.generator.clientmobile

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.generator.common.AbstractOrgEclipseJdtCorePrefsGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class MobileClientOrgEclipseJdtCorePrefsGenerator extends AbstractOrgEclipseJdtCorePrefsGenerator {
	
	override shouldGenerate(InputParam param) {
		param.uirapIncluded
	}
	
	override provideFile(InputParam param) {
		param.clientmobileFile(subFilePath())
	}
}
