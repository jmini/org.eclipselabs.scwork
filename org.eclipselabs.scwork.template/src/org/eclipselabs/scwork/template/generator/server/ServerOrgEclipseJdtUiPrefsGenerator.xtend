package org.eclipselabs.scwork.template.generator.server

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.generator.common.AbstractOrgEclipseJdtUiPrefsGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class ServerOrgEclipseJdtUiPrefsGenerator extends AbstractOrgEclipseJdtUiPrefsGenerator {
	
	override shouldGenerate(InputParam param) {
		param.serverIncluded
	}
	
	override provideFile(InputParam param) {
		param.serverFile(subFilePath())
	}
}
