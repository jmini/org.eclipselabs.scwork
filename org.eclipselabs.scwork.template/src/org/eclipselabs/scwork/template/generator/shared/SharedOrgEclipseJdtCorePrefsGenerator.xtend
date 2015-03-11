package org.eclipselabs.scwork.template.generator.shared

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.generator.common.AbstractOrgEclipseJdtCorePrefsGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class SharedOrgEclipseJdtCorePrefsGenerator extends AbstractOrgEclipseJdtCorePrefsGenerator {
	
	override shouldGenerate(InputParam param) {
		param.sharedIncluded
	}
	
	override provideFile(InputParam param) {
		param.sharedFile(subFilePath())
	}
}
