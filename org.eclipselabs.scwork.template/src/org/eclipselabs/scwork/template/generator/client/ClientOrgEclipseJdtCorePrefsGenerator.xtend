package org.eclipselabs.scwork.template.generator.client

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.generator.common.AbstractOrgEclipseJdtCorePrefsGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class ClientOrgEclipseJdtCorePrefsGenerator extends AbstractOrgEclipseJdtCorePrefsGenerator {
	
	override shouldGenerate(InputParam param) {
		param.clientIncluded
	}
	
	override provideFile(InputParam param) {
		param.clientFile(subFilePath())
	}
}
