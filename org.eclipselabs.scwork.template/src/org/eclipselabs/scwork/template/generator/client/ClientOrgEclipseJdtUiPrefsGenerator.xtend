package org.eclipselabs.scwork.template.generator.client

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.generator.common.AbstractOrgEclipseJdtUiPrefsGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class ClientOrgEclipseJdtUiPrefsGenerator extends AbstractOrgEclipseJdtUiPrefsGenerator {
	
	override shouldGenerate(InputParam param) {
		param.clientIncluded
	}
	
	override provideFile(InputParam param) {
		param.clientFile(subFilePath())
	}
}
