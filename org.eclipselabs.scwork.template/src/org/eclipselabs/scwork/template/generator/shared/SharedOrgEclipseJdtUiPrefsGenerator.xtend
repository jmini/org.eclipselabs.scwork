package org.eclipselabs.scwork.template.generator.shared

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.generator.common.AbstractOrgEclipseJdtUiPrefsGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class SharedOrgEclipseJdtUiPrefsGenerator extends AbstractOrgEclipseJdtUiPrefsGenerator {
	
	override shouldGenerate(InputParam param) {
		param.sharedIncluded
	}
	
	override provideFile(InputParam param) {
		param.sharedFile(subFilePath())
	}
}
